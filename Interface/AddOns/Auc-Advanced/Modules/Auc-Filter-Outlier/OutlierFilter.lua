--[[
	Auctioneer Advanced - Outlier Filter
	Version: 5.0.0 (BillyGoat)
	Revision: $Id: OutlierFilter.lua 3540 2008-10-02 03:41:29Z Nechckn $
	URL: http://auctioneeraddon.com/

	This is an addon for World of Warcraft that adds statistical history to the auction data that is collected
	when the auction is scanned, so that you can easily determine what price
	you will be able to sell an item for at auction or at a vendor whenever you
	mouse-over an item in the game

	License:
		This program is free software; you can redistribute it and/or
		modify it under the terms of the GNU General Public License
		as published by the Free Software Foundation; either version 2
		of the License, or (at your option) any later version.

		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with this program(see GPL.txt); if not, write to the Free Software
		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

	Note:
		This AddOn's source code is specifically designed to work with
		World of Warcraft's interpreted AddOn system.
		You have an implicit licence to use this AddOn with these facilities
		since that is its designated purpose as per:
		http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
]]

local libType, libName = "Filter", "Outlier"
local lib,parent,private = AucAdvanced.NewModule(libType, libName)
if not lib then return end
local print,decode,_,_,replicate,empty,get,set,default,debugPrint,fill = AucAdvanced.GetModuleLocals()

local data

local reset = true
local cache, model, minseen, levels

function lib.Processor(callbackType, ...)
	if callbackType == "config" then
		private.SetupConfigGui(...)
	elseif callbackType == "scanstats" then
		reset = true
	end
end

function lib.AuctionFilter(operation, itemData)
	if reset then
		model = get("filter.outlier.model")
		if model ~= "market" and not AucAdvanced.API.IsValidAlgorithm(model) then
			model = "market"
		end
		minseen = get("filter.outlier.minseen")
		cache = {}
		levels = {}
		if get("filter.outlier.poor.enabled") then levels[0] = get("filter.outlier.poor.level")/100 end
		if get("filter.outlier.common.enabled") then levels[1] = get("filter.outlier.common.level")/100 end
		if get("filter.outlier.uncommon.enabled") then levels[2] = get("filter.outlier.uncommon.level")/100 end
		if get("filter.outlier.rare.enabled") then levels[3] = get("filter.outlier.rare.level")/100 end
		if get("filter.outlier.epic.enabled") then levels[4] = get("filter.outlier.epic.level")/100 end
		if get("filter.outlier.legendary.enabled") then levels[5] = get("filter.outlier.legendary.level")/100 end
		if get("filter.outlier.artifact.enabled") then levels[6] = get("filter.outlier.artifact.level")/100 end
		reset = false
	end

	local quality = itemData.quality
	-- If we're not allowed to filter this quality of item
	if not levels[quality] then return false end

	local link = itemData.link
	local value = cache[link]
	if not value then
		local seen
		if model == "market" then
			value, seen = AucAdvanced.API.GetMarketValue(link)
		else
			value, seen = AucAdvanced.API.GetAlgorithmValue(model, link)
		end

		if not value or not seen or seen < minseen then
			value = 0
		end
		cache[link] = value
	end
	
	-- If there's no value then we can't filter it
	if value == 0 then return false end

	-- Check to see if the item price is below the price
	local price = itemData.buyoutPrice or itemData.price
	local level = levels[quality]
	local maxcap = value * level

	-- If the price is acceptible then allow it
	if itemData.stackSize > 1 then price = math.floor(price / itemData.stackSize) end
	if price < maxcap then return false end

	-- Otherwise this item needs to be filtered
	-- We need to see if this auction is to be ignored or not.
	if nLog then
		nLog.AddMessage(
			"auc-"..libType.."-"..libName,
			"AuctionFilter",
			N_INFO,
			"Filtered Data",
			"Auction Filter Removed Data for ", itemData.itemName,
			" from ", (itemData.sellerName or "UNKNOWN"),
			", quality ", tostring(quality or 0),
			", item level ", tostring(itemData.itemLevel or 0),
			".\n",
			"Price ", price, " > Cap ", maxcap
		)
	end
	return true
end

function lib.OnLoad(addon)
	AucAdvanced.Settings.SetDefault("filter.outlier.activated", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.model", "market")
	AucAdvanced.Settings.SetDefault("filter.outlier.minseen", 10)
	AucAdvanced.Settings.SetDefault("filter.outlier.poor.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.common.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.uncommon.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.rare.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.epic.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.legendary.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.artifact.enabled", true)
	AucAdvanced.Settings.SetDefault("filter.outlier.poor.level", 200)
	AucAdvanced.Settings.SetDefault("filter.outlier.common.level", 200)
	AucAdvanced.Settings.SetDefault("filter.outlier.uncommon.level", 200)
	AucAdvanced.Settings.SetDefault("filter.outlier.rare.level", 250)
	AucAdvanced.Settings.SetDefault("filter.outlier.epic.level", 300)
	AucAdvanced.Settings.SetDefault("filter.outlier.legendary.level", 300)
	AucAdvanced.Settings.SetDefault("filter.outlier.artifact.level", 300)
end

function private.GetPriceModels()
	if not private.scanValueNames then private.scanValueNames = {} end
	for i = 1, #private.scanValueNames do
		private.scanValueNames[i] = nil
	end

	table.insert(private.scanValueNames,{"market", "Market value"})
	local algoList = AucAdvanced.API.GetAlgorithms()
	for pos, name in ipairs(algoList) do
		table.insert(private.scanValueNames,{name, "Stats: "..name})
	end
	return private.scanValueNames
end

function private.SetupConfigGui(gui)
	-- The defaults for the following settings are set in the lib.OnLoad function
	local id = gui:AddTab(libName, libType.." Modules")

	gui:AddHelp(id, "what outlier filter",
		"What is this Outlier Filter?",
		"When you get auctions that are posted up, many of the more common ones can become prey to people listing auctions for many times the \"real worth\" of the actual item.\n"..
		"This filter detects such outliers and prevents them from being entered into the data stream if it's value exceeds a specified percentage of the normal value of the item. While still allowing for normal fluctuations in the prices of the items from day to day.")

	gui:AddHelp(id, "can retroactive",
		"Can it remove old outliers?",
		"The simple answer is no, it only works from this point on. Any settings you apply are applied from here on in, and any current stats are left alone.\n"..
		"The complex answer? Well, you see there's this bowl of soup...")

	gui:AddControl(id, "Header",     0,    libName.." options")
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.activated", "Enable use of the outlier filter")
	gui:AddTip(id, "Ticking this box will enable the outlier filter to perform filtering of your auction scans")

	gui:AddControl(id, "Subhead",    0,    "Price valuation method:")
	gui:AddControl(id, "Selectbox",  0, 1, private.GetPriceModels, "filter.outlier.model", "Pricing model to use for the valuation")
	gui:AddTip(id, "The pricing model that will be used to determine the base pricing level")

	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.minseen", 1, 50, 1, "Minimum seen: %d")
	gui:AddTip(id, "If an item has been seen less than this many times, it will not be filtered")

	gui:AddControl(id, "Subhead",    0,    "Settings per quality:")

	local _,_,_, hex = GetItemQualityColor(0)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.poor.enabled", "Enable filtering "..hex.."poor|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on poor quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.poor.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

	local _,_,_, hex = GetItemQualityColor(1)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.common.enabled", "Enable filtering "..hex.."common|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on common quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.common.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

	local _,_,_, hex = GetItemQualityColor(2)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.uncommon.enabled", "Enable filtering "..hex.."uncommon|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on uncommon quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.uncommon.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

	local _,_,_, hex = GetItemQualityColor(3)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.rare.enabled", "Enable filtering "..hex.."rare|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on rare quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.rare.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

	local _,_,_, hex = GetItemQualityColor(4)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.epic.enabled", "Enable filtering "..hex.."epic|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on epic quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.epic.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

	local _,_,_, hex = GetItemQualityColor(5)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.legendary.enabled", "Enable filtering "..hex.."legendary|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on legendary quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.legendary.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

	local _,_,_, hex = GetItemQualityColor(6)
	gui:AddControl(id, "Checkbox",   0, 1, "filter.outlier.artifact.enabled", "Enable filtering "..hex.."artifact|r quality items")
	gui:AddTip(id, "Ticking this box will enable outlier filtering on artifact quality items")
	gui:AddControl(id, "WideSlider", 0, 1, "filter.outlier.artifact.level", 100, 5000, 25, "Cap growth to: %d%%")
	gui:AddTip(id, "Set the maximum percentage that an item's price can grow before being filtered")

end

AucAdvanced.RegisterRevision("$URL: http://svn.norganna.org/auctioneer/branches/RC_5.0/Auc-Filter-Outlier/OutlierFilter.lua $", "$Rev: 3540 $")
