--[[
	Auctioneer Advanced - Search UI - Filter IgnoreTimeLeft
	Version: 5.0.0 (BillyGoat)
	Revision: $Id: FilterTimeLeft.lua 3277 2008-07-28 12:04:47Z Norganna $
	URL: http://auctioneeraddon.com/

	This is a plugin module for the SearchUI that assists in searching by refined paramaters

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
--]]
-- Create a new instance of our lib with our parent
local lib, parent, private = AucSearchUI.NewFilter("TimeLeft")
if not lib then return end
local print,decode,_,_,replicate,empty,_,_,_,debugPrint,fill = AucAdvanced.GetModuleLocals()
local get,set,default,Const = AucSearchUI.GetSearchLocals()
lib.tabname = "Timeleft"
-- Set our defaults
default("ignoretimeleft.enable", false)
default("ignoretimeleft.maxtime", 2)

-- This function is automatically called when we need to create our search parameters
function lib:MakeGuiConfig(gui)
	-- Get our tab and populate it with our controls
	local id = gui:AddTab(lib.tabname, "Filters")
	gui:MakeScrollable(id)

	gui:AddControl(id, "Header",     0,      "TimeLeft Filter Criteria")
	
	local last = gui:GetLast(id)
	gui:AddControl(id, "Checkbox",    0, 1,  "ignoretimeleft.enable", "Enable time-left filtering")
	gui:AddControl(id, "Checkbox",    0, 2,  "ignoretimeleft.onlyonbids", "Only filter for bids")
	gui:AddControl(id, "Subhead",     0,     "Filter if more than")
	gui:AddControl(id, "Selectbox",   0, 2, {
			{1, "less than 30 min"},
			{2, "2 hours"},
			{3, "12 hours"},
		}, "ignoretimeleft.maxtime", "Max time left")
	
	gui:SetLast(id, last)
	gui:AddControl(id, "Subhead",     .5, "Filter for:")
	for name, searcher in pairs(AucSearchUI.Searchers) do
		if searcher and searcher.Search then
			gui:AddControl(id, "Checkbox", 0.5, 1, "ignoretimeleft.filter."..name, name)
			gui:AddTip(id, "Filter Time-left when searching with "..name)
			default("ignoretimeleft.filter."..name, false)
		end
	end
end

--lib.Filter(item, searcher)
--This function will return true if the item is to be filtered
--Item is the itemtable, and searcher is the name of the searcher being called. If searcher is not given, it will assume you want it active.
function lib.Filter(item, searcher)
	if (not get("ignoretimeleft.enable"))
			or (get("ignoretimeleft.onlyonbids"))
			or (searcher and (not get("ignoretimeleft.filter."..searcher))) then
		return
	end
	local maxtime = get("ignoretimeleft.maxtime")
	--now to check the time left on the auction
	local tleft = item[Const.TLEFT]
	if tleft > maxtime then
		return true, "Time left too high"
	end
	return false
end

--PostFilter is only needed when we're restricting to bids
function lib.PostFilter(item, searcher, buyorbid)
	if (not get("ignoretimeleft.enable"))
			or (not get("ignoretimeleft.onlyonbids"))
			or (buyorbid ~= "bid")
			or (searcher and (not get("ignoretimeleft.filter."..searcher))) then
		return
	end
	local maxtime = get("ignoretimeleft.maxtime")
	--now to check the time left on the auction
	local tleft = item[Const.TLEFT]
	if tleft > maxtime then
		return true, "Time left too high"
	end
	return false
end

AucAdvanced.RegisterRevision("$URL: http://svn.norganna.org/auctioneer/branches/RC_5.0/Auc-Util-SearchUI/FilterTimeLeft.lua $", "$Rev: 3277 $")
