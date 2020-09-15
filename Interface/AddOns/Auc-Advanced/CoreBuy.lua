--[[
	Auctioneer Advanced
	Version: 5.0.0 (BillyGoat)
	Revision: $Id: CoreBuy.lua 3528 2008-09-26 15:57:33Z Norganna $
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
--]]

--[[
	Auctioneer Purchasing Engine.

	This code helps modules that need to purchase things to do so in an extremely easy and
	queueable fashion.
]]

if (not AucAdvanced) then AucAdvanced = {} end
if (not AucAdvanced.Buy) then AucAdvanced.Buy = {} end

local lib = AucAdvanced.Buy
local private = {}
lib.Private = private

local print,decode,_,_,replicate,empty,get,set,default,debugPrint,fill = AucAdvanced.GetModuleLocals()
local Const = AucAdvanced.Const
local _
lib.Print = print

private.BuyRequests = {}
private.CurAuction = {}
private.PendingBids = {}

--[[
	to add an auction to the Queue:
	AucAdvanced.Buy.QueueBuy(link, seller, count, minbid, buyout, price)
	price = price to pay
	AucAdv will buy the first auction it sees fitting the specifics at price.
	If item cannot be found in current scandata, entry is removed.
]]
function lib.QueueBuy(link, seller, count, minbid, buyout, price, reason)
	local canbuy, problem = lib.CanBuy(price, seller)
	if not canbuy then
		print("AucAdv: Can't buy "..link.." : "..problem)
		return
	end

	table.insert(private.BuyRequests, {link, seller, count, minbid, buyout, price, reason})
end

--[[
	This function will return false, reason if an auction by seller at price cannot be bought
	Else it will return true.
	Note that this will not catch all, but if it says you can't, you can't
]]
function lib.CanBuy(price, seller)
	local money = GetMoney()
	local realm = GetRealmName()
	if seller and AucAdvancedConfig["users."..realm.."."..seller] then
		return false, "own auction"
	elseif price and (money < price) then
		return false, "not enough money"
	end
	return true
end

function lib.PushSearch()
	private.CurAuction["link"] = private.BuyRequests[1][1]
	private.CurAuction["sellername"] = private.BuyRequests[1][2]
	private.CurAuction["count"] = private.BuyRequests[1][3]
	private.CurAuction["minbid"] = private.BuyRequests[1][4]
	private.CurAuction["buyout"] = private.BuyRequests[1][5]
	private.CurAuction["price"] = private.BuyRequests[1][6]
	if (private.CurAuction["buyout"] > 0) and (private.CurAuction["price"] > private.CurAuction["buyout"]) then
		private.CurAuction["price"] = private.CurAuction["buyout"]
	end
	private.CurAuction["reason"] = private.BuyRequests[1][7] or ""
	table.remove(private.BuyRequests, 1)
	local canbuy, reason = lib.CanBuy(private.CurAuction["price"], private.CurAuction["sellername"])
	if not canbuy then
		print("AucAdv: Can't buy "..private.CurAuction["link"].." : "..reason)
		private.CurAuction = {}
		return
	end

	local minlevel, equiploc, itemType, itemSubType, stack, rarity, TypeID, SubTypeID
	private.CurAuction["itemname"], _, rarity, _, minlevel, itemType, itemSubType, stack, equiploc = GetItemInfo(private.CurAuction["link"])
	for catId, catName in pairs(AucAdvanced.Const.CLASSES) do
		if catName == itemType then
			TypeID = catId
			for subId, subName in pairs(AucAdvanced.Const.SUBCLASSES[TypeID]) do
				if subName == itemSubType then
					SubTypeID = subId
					break
				end
			end
			break
		end
	end
	if equiploc == "" then
		equiploc = nil
	end
	AucAdvanced.Scan.PushScan()
	AucAdvanced.Scan.StartScan(private.CurAuction["itemname"], minlevel, minlevel, equiploc, TypeID, SubTypeID, nil, rarity)
end

function lib.FinishedSearch(query)
	if private.CurAuction["link"] then
		local _, _, rarity, _, minlevel, _, _, _, equiploc = GetItemInfo(private.CurAuction["link"])
		if minlevel == 0 then
			minlevel = nil
		end
		if equiploc == "" then
			equiploc = nil
		end
		if (rarity == query.quality) and (minlevel == query.minUseLevel) and (equiploc == query.invType)
		and (private.CurAuction["itemname"] == query.name) then
			print("AucAdv: Auction for "..private.CurAuction["link"].." no longer exists")
			empty(private.CurAuction)
		end
	end
end

function private.PromptPurchase()
	if type(private.CurAuction["price"])~="number" then
		AucAdvanced.Print("Cancelling bid: invalid price: "..type(private.CurAuction["price"])..":"..tostring(private.CurAuction["price"]))
		private.CurAuction = {}
		return
	elseif type(private.CurAuction["index"]) ~= "number" then
		AucAdvanced.Print("Cancelling bid: invalid index: "..type(private.CurAuction["index"])..":"..tostring(private.CurAuction["index"]))
		private.CurAuction = {}
		return
	end
	AucAdvanced.Scan.SetPaused(true)
	private.Prompt:Show()
	if (private.CurAuction["price"] < private.CurAuction["buyout"]) or (private.CurAuction["buyout"] == 0) then
		private.Prompt.Text:SetText("Are you sure you want to bid on")
	else
		private.Prompt.Text:SetText("Are you sure you want to buyout")
	end
	private.Prompt.Value:SetText(private.CurAuction["link"].." for "..EnhTooltip.GetTextGSC(private.CurAuction["price"],true).."?")
	private.Prompt.Item.tex:SetTexture(private.CurAuction["texture"])
	private.Prompt.Reason:SetText(private.CurAuction["reason"])
	local width = private.Prompt.Value:GetStringWidth() or 0
	private.Prompt:SetWidth(math.max((width + 70), 400))
end

function lib.ScanPage()
	if not private.CurAuction["link"] then
		return
	end
	local batch = GetNumAuctionItems("list")
	for i = 1, batch do
		local link = GetAuctionItemLink("list", i)
		if link == private.CurAuction["link"] then
			local price = private.CurAuction["price"]
			local buy = private.CurAuction["buyout"]
			local name, texture, count, _, _, _, minBid, minIncrement, buyout, curBid, ishigh, owner = GetAuctionItemInfo("list", i)
			if ishigh and ((not buy) or (buy <= 0) or (price < buy)) then
				print("Unable to bid on "..link..". Already highest bidder")
				private.CurAuction = {}
			else
				ishigh = false --we're buying, not bidding, so being high bidder doesn't matter
			end
			if ((not owner) or (not private.CurAuction["sellername"]) or (private.CurAuction["sellername"] == "") or (owner == private.CurAuction["sellername"])) 
			and (not ishigh)
			and (count == private.CurAuction["count"]) and (minBid == private.CurAuction["minbid"]) 
			and (buyout == private.CurAuction["buyout"]) then --found the auction we were looking for
				if (private.CurAuction["price"] >= (curBid + minIncrement)) or (private.CurAuction["price"] >= buyout) then
					private.CurAuction["index"] = i
					private.CurAuction["texture"] = texture
					private.PromptPurchase()
					return
				else
					print("Unable to bid on "..link..". Price invalid")
					private.CurAuction = {}
				end
			end
		end
	end
end

function private.PerformPurchase()
	if type(private.CurAuction["price"])~="number" then
		AucAdvanced.Print("Cancelling bid: invalid price: "..type(private.CurAuction["price"])..":"..tostring(private.CurAuction["price"]))
		private.CurAuction = {}
		private.Prompt:Hide()
		AucAdvanced.Scan.SetPaused(false)
		return
	elseif type(private.CurAuction["index"]) ~= "number" then
		AucAdvanced.Print("Cancelling bid: invalid index: "..type(private.CurAuction["index"])..":"..tostring(private.CurAuction["index"]))
		private.CurAuction = {}
		private.Prompt:Hide()
		AucAdvanced.Scan.SetPaused(false)
		return
	end

	PlaceAuctionBid("list", private.CurAuction["index"], private.CurAuction["price"])
	
	private.CurAuction["reason"] = private.Prompt.Reason:GetText()
	--Add bid to list of bids we're watching for
	local pendingBid = replicate(private.CurAuction)
	table.insert(private.PendingBids, pendingBid)
	--register for the Response events if this is the first pending bid
	if (#private.PendingBids == 1) then
		Stubby.RegisterEventHook("CHAT_MSG_SYSTEM", "AucAdv_CoreBuy", private.onEventHookBid)
		Stubby.RegisterEventHook("UI_ERROR_MESSAGE", "AucAdv_CoreBuy", private.onEventHookBid)
	end
	
	--get ready for next bid action
	private.CurAuction = {}
	private.Prompt:Hide()
	AucAdvanced.Scan.SetPaused(false)
end

function private.removePendingBid()
	if (#private.PendingBids > 0) then
		table.remove(private.PendingBids, 1)
		
		--Unregister events if no more bids pending
		if (#private.PendingBids == 0) then
			Stubby.UnregisterEventHook("CHAT_MSG_SYSTEM", "AucAdv_CoreBuy", private.onEventHookBid)
			Stubby.UnregisterEventHook("UI_ERROR_MESSAGE", "AucAdv_CoreBuy", private.onEventHookBid)
		end
	end
end

function private.CancelPurchase()
	private.CurAuction = {}
	private.Prompt:Hide()
	AucAdvanced.Scan.SetPaused(false)
end

function private.onEventHookBid(_, event, arg1)
	if (event == "CHAT_MSG_SYSTEM" and arg1) then
		if (arg1 == ERR_AUCTION_BID_PLACED) then
		 	private.onBidAccepted()
		end
	elseif (event == "UI_ERROR_MESSAGE" and arg1) then
		if (arg1 == ERR_ITEM_NOT_FOUND or
			arg1 == ERR_NOT_ENOUGH_MONEY or
			arg1 == ERR_AUCTION_BID_OWN or
			arg1 == ERR_AUCTION_HIGHER_BID or 
			arg1 == ERR_ITEM_MAX_COUNT) then
			private.onBidFailed(arg1)
		end
	end
end

function private.onBidAccepted()
	--"itemlink;seller;count;buyout;price;reason"
	local bid = private.PendingBids[1]
	local CallBackString = string.join(";", tostring(bid["link"]), tostring(bid["sellername"]), tostring(bid["count"]), tostring(bid["buyout"]), tostring(bid["price"]), tostring(bid["reason"]))
	AucAdvanced.SendProcessorMessage("bidplaced", CallBackString)
	private.removePendingBid()
end

--private.onBidFailed(arg1)
--This function is called when a bid fails
--purpose is to output to chat the reason for the failure, and then pass the Bid on to private.removePendingBid()
--The output may duplicate some client output.  If so, those lines need to be removed.
function private.onBidFailed(arg1)
	if arg1 == ERR_ITEM_NOT_FOUND then
		print("Bid Failed: Item not found")
	elseif arg1 == ERR_NOT_ENOUGH_MONEY then
		print("Bid Failed: Not enough money")
	elseif arg1 == ERR_AUCTION_BID_OWN then
		print("Bid Failed: Can't bid on own auction")
	elseif arg1 == ERR_AUCTION_HIGHER_BID then
		print("Bid Failed: Auction already has higher bid")
	elseif arg1 == ERR_ITEM_MAX_COUNT then
		print("Bid Failed: You already have too many of that item")
	end
	private.removePendingBid()
end

function private.OnUpdate()
	if AuctionFrame and AuctionFrame:IsVisible() then
		if (not private.CurAuction["link"])
				and (not AucAdvanced.Scan.IsPaused())
				and (#private.BuyRequests > 0) then
			lib.PushSearch()
		end
	elseif private.CurAuction["link"] then --AH was closed, so reinsert current request back into the queue
		table.insert(private.BuyRequests, 1, {
			private.CurAuction["link"], 
			private.CurAuction["sellername"],
			private.CurAuction["count"],
			private.CurAuction["minbid"],
			private.CurAuction["buyout"],
			private.CurAuction["price"]
		})
		empty(private.CurAuction)--clear the CurAuction table so that we know to start a new search again
	end
end

--[[
    Our frames for feeding event functions
]]

function private.OnEvent(...)
	if (event == "AUCTION_ITEM_LIST_UPDATE") then
		lib.ScanPage()
	end
end

function private.ShowTooltip()
	GameTooltip:SetOwner(AuctionFrameCloseButton, "ANCHOR_NONE")
	GameTooltip:SetHyperlink(private.CurAuction["link"])
	EnhTooltip.TooltipCall(GameTooltip, private.CurAuction["itemname"], private.CurAuction["link"], -1, private.CurAuction["count"], private.CurAuction["price"])
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("TOPRIGHT", private.Prompt.Item, "TOPLEFT", -10, -20)
end

function private.HideTooltip()
	GameTooltip:Hide()
end

-- Simple timer to keep actions up-to-date even if an event misfires
private.updateFrame = CreateFrame("frame", nil, UIParent)
private.updateFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
private.updateFrame:SetScript("OnUpdate", private.OnUpdate)
private.updateFrame:SetScript("OnEvent", private.OnEvent)

private.Prompt = CreateFrame("frame", "AucAdvancedBuyPrompt", UIParent)
private.Prompt:Hide()
private.Prompt:SetPoint("TOP", "UIParent", "TOP", 0, -100)
private.Prompt:SetFrameStrata("DIALOG")
private.Prompt:SetHeight(120)
private.Prompt:SetWidth(400)
private.Prompt:SetBackdrop({
	bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
	tile = true, tileSize = 32, edgeSize = 32,
	insets = { left = 9, right = 9, top = 9, bottom = 9 }
})
private.Prompt:SetBackdropColor(0,0,0,0.8)
private.Prompt:SetMovable(true)
private.Prompt:SetClampedToScreen(true)

private.Prompt.Item = CreateFrame("Button", "AucAdvancedBuyPromptItem", private.Prompt)
private.Prompt.Item:SetNormalTexture("Interface\\Buttons\\UI-Slot-Background")
private.Prompt.Item:GetNormalTexture():SetTexCoord(0,0.640625, 0, 0.640625)
private.Prompt.Item:SetPoint("TOPLEFT", private.Prompt, "TOPLEFT", 15, -15)
private.Prompt.Item:SetHeight(37)
private.Prompt.Item:SetWidth(37)
private.Prompt.Item:SetScript("OnEnter", private.ShowTooltip)
private.Prompt.Item:SetScript("OnLeave", private.HideTooltip)
private.Prompt.Item.tex = private.Prompt.Item:CreateTexture(nil, "OVERLAY")
private.Prompt.Item.tex:SetPoint("TOPLEFT", private.Prompt.Item, "TOPLEFT", 0, 0)
private.Prompt.Item.tex:SetPoint("BOTTOMRIGHT", private.Prompt.Item, "BOTTOMRIGHT", 0, 0)

private.Prompt.Text = private.Prompt:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
private.Prompt.Text:SetPoint("TOPLEFT", private.Prompt, "TOPLEFT", 52, -20)
private.Prompt.Text:SetPoint("TOPRIGHT", private.Prompt, "TOPRIGHT", -15, -20)
private.Prompt.Text:SetJustifyH("CENTER")

private.Prompt.Value = private.Prompt:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
private.Prompt.Value:SetPoint("TOP", private.Prompt.Text, "BOTTOM", -3)

private.Prompt.Reason = CreateFrame("EditBox", "AucAdvancedBuyPromptReason", private.Prompt, "InputBoxTemplate")
private.Prompt.Reason:SetPoint("TOPLEFT", private.Prompt, "TOPLEFT", 150, -55)
private.Prompt.Reason:SetPoint("TOPRIGHT", private.Prompt, "TOPRIGHT", -30, -55)
private.Prompt.Reason:SetHeight(20)
private.Prompt.Reason:SetAutoFocus(false)
private.Prompt.Reason:SetScript("OnEnterPressed", function()
	private.Prompt.Reason:ClearFocus()
	end)
private.Prompt.Reason:SetText("")

private.Prompt.Reason.Label = private.Prompt.Reason:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
private.Prompt.Reason.Label:SetPoint("TOPRIGHT", private.Prompt.Reason, "TOPLEFT", 0, 0)
private.Prompt.Reason.Label:SetPoint("TOPLEFT", private.Prompt, "TOPLEFT", 52, -55)
private.Prompt.Reason.Label:SetText("Reason:")
private.Prompt.Reason.Label:SetHeight(15)

private.Prompt.Yes = CreateFrame("Button", "AucAdvancedBuyPromptYes", private.Prompt, "OptionsButtonTemplate")
private.Prompt.Yes:SetText("Yes")
private.Prompt.Yes:SetPoint("BOTTOMRIGHT", private.Prompt, "BOTTOMRIGHT", -10, 10)
private.Prompt.Yes:SetScript("OnClick", private.PerformPurchase)

private.Prompt.No = CreateFrame("Button", "AucAdvancedBuyPromptNo", private.Prompt, "OptionsButtonTemplate")
private.Prompt.No:SetText("Cancel")
private.Prompt.No:SetPoint("BOTTOMRIGHT", private.Prompt.Yes, "BOTTOMLEFT", -20, 0)
private.Prompt.No:SetScript("OnClick", private.CancelPurchase)

private.Prompt.DragTop = CreateFrame("Button", nil, private.Prompt)
private.Prompt.DragTop:SetPoint("TOPLEFT", private.Prompt, "TOPLEFT", 10, -5)
private.Prompt.DragTop:SetPoint("TOPRIGHT", private.Prompt, "TOPRIGHT", -10, -5)
private.Prompt.DragTop:SetHeight(6)
private.Prompt.DragTop:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
private.Prompt.DragTop:SetScript("OnMouseDown", function() private.Prompt:StartMoving() end)
private.Prompt.DragTop:SetScript("OnMouseUp", function() private.Prompt:StopMovingOrSizing() end)

private.Prompt.DragBottom = CreateFrame("Button", nil, private.Prompt)
private.Prompt.DragBottom:SetPoint("BOTTOMLEFT", private.Prompt, "BOTTOMLEFT", 10, 5)
private.Prompt.DragBottom:SetPoint("BOTTOMRIGHT", private.Prompt, "BOTTOMRIGHT", -10, 5)
private.Prompt.DragBottom:SetHeight(6)
private.Prompt.DragBottom:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
private.Prompt.DragBottom:SetScript("OnMouseDown", function() private.Prompt:StartMoving() end)
private.Prompt.DragBottom:SetScript("OnMouseUp", function() private.Prompt:StopMovingOrSizing() end)

AucAdvanced.RegisterRevision("$URL: http://svn.norganna.org/auctioneer/branches/RC_5.0/Auc-Advanced/CoreBuy.lua $", "$Rev: 3528 $")
