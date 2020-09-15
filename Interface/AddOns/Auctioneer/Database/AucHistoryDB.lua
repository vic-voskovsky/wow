﻿--[[
	Auctioneer Addon for World of Warcraft(tm).
	Version: 5.0.0 (BillyGoat)
	Revision: $Id: AucHistoryDB.lua 2469 2007-11-14 06:08:37Z jslagle $

	HistoryDB - the AH history database

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
		since that is it's designated purpose as per:
		http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
--]]

Auctioneer_RegisterRevision("$URL: http://svn.norganna.org/auctioneer/branches/RC_5.0/Auctioneer/Database/AucHistoryDB.lua $", "$Rev: 2469 $")

-------------------------------------------------------------------------------
-- Function Imports
-------------------------------------------------------------------------------
local tonumber = tonumber;

local chatPrint = Auctioneer.Util.ChatPrint;
local stringFromBoolean = Auctioneer.Database.StringFromBoolean;
local booleanFromString = Auctioneer.Database.BooleanFromString;
local stringFromNumber = Auctioneer.Database.StringFromNumber;
local nilSafeStringFromString = Auctioneer.Database.NilSafeStringFromString;
local stringFromNilSafeString = Auctioneer.Database.StringFromNilSafeString;

-------------------------------------------------------------------------------
-- Function Prototypes
-------------------------------------------------------------------------------
local load;

local loadDatabase;
local createDatabase;
local createDatabaseFrom3x;
local createAHDatabase;
local upgradeAHDatabase;
local getAHDatabase;
local clear;

local getItemTotals;
local updateItemTotals;
local packItemTotals;
local unpackItemTotals;

local getMedianBuyoutPriceList;
local updateMedianBuyoutPriceList;
local packPriceList;
local unpackPriceList;

local onAuctionAdded;
local onAuctionUpdated;
local onAuctionRemoved;

local createItemKeyFromLink;
local breakItemKey;

local debugPrint

local DebugLib = Auctioneer.Util.DebugLib

-------------------------------------------------------------------------------
-- Data Members
-------------------------------------------------------------------------------

-- The Auctioneer history database saved on disk. Nobody should access this
-- variable outside of the loadDatabase() method. Instead the LoadedHistoryDB
-- variable should be used.
AuctioneerHistoryDB = nil;

-- The current Auctioneer history database as determined in the load() method.
-- This is either the database on disk or a temporary database if the user
-- chose not to upgrade their database.
local LoadedHistoryDB;

-- Most recently accessed item totals. This is cached for improved performance.
local cachedItemTotals;
local cachedItemTotalsItemKey;
local cachedItemTotalsAhKey;

-- Most recently accessed median buyout price list. This is cached for
-- improved performance.
local cachedMedianBuyoutPriceList;
local cachedMedianBuyoutPriceListItemKey;
local cachedMedianBuyoutPriceListAhKey;

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------

-- The version of the history database first released in Auctioneer 4.0. This
-- number should NEVER change. Upgrades from Auctioneer 3.x are first upgraded
-- to this version of the database.
local BASE_HISTORYDB_VERSION = 1;

-- The current version of the history database. This number must be incremented
-- anytime a change is made to the database schema.
local CURRENT_HISTORYDB_VERSION = 1;

-- Schema for records in the totals table of the history database.
local ItemTotalsMetaData = {
	{
		fieldName = "seenCount";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	},
	{
		fieldName = "minCount";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	},
	{
		fieldName = "minPrice";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	},
	{
		fieldName = "bidCount";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	},
	{
		fieldName = "bidPrice";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	},
	{
		fieldName = "buyoutCount";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	},
	{
		fieldName = "buyoutPrice";
		fromStringFunc = tonumber;
		toStringFunc = stringFromNumber;
	}
};

-------------------------------------------------------------------------------
-- Loads this module.
-------------------------------------------------------------------------------
function load(usePersistentDatabase)
	-- Register for events.
	Auctioneer.EventManager.RegisterEvent("AUCTIONEER_AUCTION_ADDED", onAuctionAdded);
	Auctioneer.EventManager.RegisterEvent("AUCTIONEER_AUCTION_UPDATED", onAuctionUpdated);
	Auctioneer.EventManager.RegisterEvent("AUCTIONEER_AUCTION_REMOVED", onAuctionRemoved);

	-- Decide what database to use. If the user has an older database and they
	-- choose not to upgrade, we cannot use it. Insetad we'll use a temporary
	-- empty database that will not be saved.
	if (usePersistentDatabase) then
		loadDatabase();
	else
		debugPrint("Using temporary AuctioneerHistoryDB", DebugLib.Level.Notice)
		LoadedHistoryDB = createDatabase();
	end
end

--=============================================================================
-- Database management functions
--=============================================================================

-------------------------------------------------------------------------------
-- Loads and upgrades the AuctioneerHistoryDB database. If the table does not
-- exist it creates a new one.
-------------------------------------------------------------------------------
function loadDatabase()
	-- If the Auctioneer database is older than 4.0, upgrade to 4.0 first.
	if (AuctionConfig.version < 40000) then
		debugPrint("Creating AuctioneerHistoryDB database from 3.x AuctionConfig", DebugLib.Level.Info)
		AuctioneerHistoryDB = createDatabaseFrom3x();
	end

	-- Ensure that AuctioneerHistoryDB exists.
	if (not AuctioneerHistoryDB) then
		debugPrint("Creating new AuctioneerHistoryDB database", DebugLib.Level.Info)
		AuctioneerHistoryDB = createDatabase();
	end

	-- Upgrade each realm-faction database (if needed).
	for ahKey in pairs(AuctioneerHistoryDB) do
		if (not upgradeAHDatabase(AuctioneerHistoryDB[ahKey], CURRENT_HISTORYDB_VERSION)) then
			debugPrint("WARNING: History database corrupted for "..ahKey.."! Creating new database.", DebugLib.Level.Warning)
			AuctioneerHistoryDB[ahKey] = createAHDatabase(ahKey);
		end
	end

	-- Make AuctioneerHistoryDB the loaded database!
	LoadedHistoryDB = AuctioneerHistoryDB;
end

-------------------------------------------------------------------------------
-- Creates a new database.
-------------------------------------------------------------------------------
function createDatabase()
	return {};
end

-------------------------------------------------------------------------------
-- Creates a new database from a Auctioneer 3.x AuctionConfig table.
-------------------------------------------------------------------------------
function createDatabaseFrom3x()
	local db = {};
	if (AuctionConfig.data) then
		for ahKey, ahData in pairs(AuctionConfig.data) do
			local newAhKey = ahKey:lower();
			local ah = db[newAhKey] or createAHDatabase(newAhKey, BASE_HISTORYDB_VERSION);
			db[newAhKey] = ah;
			for itemKey, itemData in pairs(ahData) do
				local totals, buyoutPrices = strsplit("|", itemData);
				ah.totals[itemKey] = totals:gsub(":", ";");
				ah.buyoutPrices[itemKey] = buyoutPrices;
			end
		end
	end
	return db;
end

-------------------------------------------------------------------------------
-- Create a new table for the specified auction house key (realm-faction).
-------------------------------------------------------------------------------
function createAHDatabase(ahKey, version)
	-- If no version was specified, assume the current version.
	version = version or CURRENT_HISTORYDB_VERSION;

	-- Create the original version of the database.
	local ah = {
		version = BASE_HISTORYDB_VERSION;
		ahKey = ahKey;
		totals = {};
		buyoutPrices = {};
	};

	-- Upgrade the table to the requested version of auctioneer.
	if (ah.version ~= version) then
		upgradeAHDatabase(ah, version);
	end

	return ah;
end

-------------------------------------------------------------------------------
-- Upgrades the specified AH database. Returns true if the database was
-- upgraded successfully.
-------------------------------------------------------------------------------
function upgradeAHDatabase(ah, version)
	-- Check that we have a valid database.
	if (not (ah.version and ah.ahKey)) then
		return false
	end

	-- Check if we need upgrading.
	if (ah.version == version) then
		return true;
	end

	-- Future DB upgrade code goes here...
	debugPrint("Upgrading history database for "..ah.ahKey.." to version "..version, DebugLib.Level.Notice)

	-- Return the result of the upgrade!
	return (ah.version == version);
end

-------------------------------------------------------------------------------
-- Gets the Auctioneer history database for the specified auction house.
-------------------------------------------------------------------------------
function getAHDatabase(ahKey, create)
	-- If no auction house key was provided use the default key for the
	-- current zone.
	ahKey = ahKey or Auctioneer.Util.GetAuctionKey();
	local ah = LoadedHistoryDB[ahKey];
	if ((not ah) and (create)) then
		ah = createAHDatabase(ahKey);
		LoadedHistoryDB[ahKey] = ah;
		debugPrint("Created AuctioneerHistoryDB["..ahKey.."]", DebugLib.Level.Info)
	end
	return ah;
end

-------------------------------------------------------------------------------
-- Removes the specified item from the database. Removes all items if itemKey
-- is nil.
-------------------------------------------------------------------------------
function clear(itemKey, ahKey)
	local ah = getAHDatabase(ahKey, false);
	if (ah) then
		if (itemKey) then
			-- Remove the specified item from the database.
			ah.totals[itemKey] = nil;
			ah.buyoutPrices[itemKey] = nil;
			debugPrint("Removed "..itemKey.." from history database "..ah.ahKey, DebugLib.Level.Info)
		else
			-- Toss the entire database by recreating it.
			LoadedHistoryDB[ah.ahKey] = createAHDatabase(ah.ahKey);
			debugPrint("Cleared history database for "..ah.ahKey, DebugLib.Level.Info)
		end

		-- Clear any cached values.
		cachedItemTotals = nil;
		cachedItemTotalsItemKey = nil;
		cachedItemTotalsAhKey = nil;
		cachedMedianBuyoutPriceList = nil;
		cachedMedianBuyoutPriceListItemKey = nil;
		cachedMedianBuyoutPriceListAhKey = nil;
	end
end

--=============================================================================
-- Item total functions
--=============================================================================

-------------------------------------------------------------------------------
-- Gets the totals for an item.
-------------------------------------------------------------------------------
function getItemTotals(itemKey, ahKey, create)
	-- Use the default auction house for the zone if none was provided.
	ahKey = ahKey or Auctioneer.Util.GetAuctionKey();

	-- Check if we've cached the totals for this item.
	if (ahKey == cachedItemTotalsAhKey and itemKey == cachedItemTotalsItemKey) then
		return cachedItemTotals;
	end

	-- Get or create a new item totals.
	local itemTotals;
	local ah = getAHDatabase(ahKey, create);
	if (ah) then
		local packedItemTotals = ah.totals[itemKey];
		if (packedItemTotals) then
			itemTotals = unpackItemTotals(packedItemTotals);
		elseif (create) then
			itemTotals = {
				seenCount = 0;
				minCount = 0;
				minPrice = 0;
				bidCount = 0;
				bidPrice = 0;
				buyoutCount = 0;
				buyoutPrice = 0;
			};
		end
	end

	-- Cache the totals
	if (itemTotals) then
		cachedItemTotalsAhKey = ahKey;
		cachedItemTotalsItemKey = itemKey;
		cachedItemTotals = itemTotals;
	end

	return itemTotals;
end

-------------------------------------------------------------------------------
-- Updates the totals for an item.
-------------------------------------------------------------------------------
function updateItemTotals(itemKey, ahKey, itemTotals)
	local packedItemTotals = packItemTotals(itemTotals);
	local ah = getAHDatabase(ahKey, true);
	ah.totals[itemKey] = packedItemTotals;

	-- Cache the totals.
	cachedItemTotalsAhKey = ahKey;
	cachedItemTotalsItemKey = itemKey;
	cachedItemTotals = itemTotals;
end

-------------------------------------------------------------------------------
-- Converts an auction into a ';' delimited string.
-------------------------------------------------------------------------------
function packItemTotals(itemTotals)
	return Auctioneer.Database.PackRecord(itemTotals, ItemTotalsMetaData);
end

-------------------------------------------------------------------------------
-- Converts a ';' delimited string into an auction using the AuctionMetaData
-- table.
-------------------------------------------------------------------------------
function unpackItemTotals(packedItemTotals)
	return Auctioneer.Database.UnpackRecord(packedItemTotals, ItemTotalsMetaData);
end

--=============================================================================
-- Median price list functions
--=============================================================================

-------------------------------------------------------------------------------
-- Gets the list of median buyout prices for the item.
-------------------------------------------------------------------------------
function getMedianBuyoutPriceList(itemKey, ahKey, create)
	-- Use the default auction house for the zone if none was provided.
	ahKey = ahKey or Auctioneer.Util.GetAuctionKey();

	-- Check if we've cached the list.
	if (ahKey == cachedMedianBuyoutPriceListAhKey and itemKey == cachedMedianBuyoutPriceListItemKey) then
		return cachedMedianBuyoutPriceList;
	end

	-- Nope, get the list from the database.
	local list;
	local ah = getAHDatabase(ahKey, create);
	if (ah) then
		local packedBuyoutPrices = ah.buyoutPrices[itemKey];
		if (packedBuyoutPrices) then
			list = unpackPriceList(packedBuyoutPrices);
		elseif (create) then
			local buyoutPrices = {};
			ah.buyoutPrices[itemKey] = buyoutPrices;
			list = buyoutPrices;
		end
	end

	-- Cache the list.
	if (list) then
		cachedMedianBuyoutPriceListAhKey = ahKey;
		cachedMedianBuyoutPriceListItemKey = itemKey;
		cachedMedianBuyoutPriceList = list;
	end

	return list;
end

-------------------------------------------------------------------------------
-- Updates the list of median buyout prices for the item.
-------------------------------------------------------------------------------
function updateMedianBuyoutPriceList(itemKey, ahKey, medianBuyoutPriceList)
	-- Use the default auction house for the zone if none was provided.
	ahKey = ahKey or Auctioneer.Util.GetAuctionKey();
	local ah = getAHDatabase(ahKey, true);

	-- Update the list.
	local packedBuyoutPrices = packPriceList(medianBuyoutPriceList);
	ah.buyoutPrices[itemKey] = packedBuyoutPrices;

	-- Cache the list.
	cachedMedianBuyoutPriceListAhKey = ahKey;
	cachedMedianBuyoutPriceListItemKey = itemKey;
	cachedMedianBuyoutPriceList = medianBuyoutPriceList;
end

-------------------------------------------------------------------------------
-- Converts a list of values into a string of packed values.
-------------------------------------------------------------------------------
function packPriceList(list)
	return Auctioneer.Database.PackNumericList(list);
end

-------------------------------------------------------------------------------
-- Converts a string of packed values into a list.
-------------------------------------------------------------------------------
function unpackPriceList(str)
	return Auctioneer.Database.UnpackNumericList(str);
end

--=============================================================================
-- Event listeners for updating the database.
--=============================================================================

-------------------------------------------------------------------------------
-- Called when an auction is added to the snapshot.
-------------------------------------------------------------------------------
function onAuctionAdded(event, auction)
	local itemKey = Auctioneer.ItemDB.CreateItemKeyFromAuction(auction);

	-- Normalize the auction data for a count of one.
	local minPriceForOne = math.floor(auction.minBid / auction.count);
	local bidPriceForOne;
	if (auction.bidAmount and auction.bidAmount > 0) then
		bidPriceForOne = math.floor(auction.bidAmount / auction.count);
	end
	local buyoutPriceForOne;
	if (auction.buyoutPrice and auction.buyoutPrice > 0) then
		buyoutPriceForOne = math.floor(auction.buyoutPrice / auction.count);
	end

	-- Update the median buyout price list if there is a buyout.
	if (buyoutPriceForOne) then
		local medianBuyoutPriceList = getMedianBuyoutPriceList(itemKey, auction.ahKey, true);
		local medianBuyoutPriceBalancedList = Auctioneer.BalancedList.NewBalancedList(Auctioneer.Core.Constants.MaxBuyoutHistorySize);
		medianBuyoutPriceBalancedList.setList(medianBuyoutPriceList);
		medianBuyoutPriceBalancedList.insert(buyoutPriceForOne);
		medianBuyoutPriceList = medianBuyoutPriceBalancedList.getList();
		updateMedianBuyoutPriceList(itemKey, auction.ahKey, medianBuyoutPriceList);
	end

	-- Update the item totals.
	local itemTotals = getItemTotals(itemKey, auction.ahKey, true);
	itemTotals.seenCount = itemTotals.seenCount + 1;
	itemTotals.minCount = itemTotals.minCount + 1;
	itemTotals.minPrice = itemTotals.minPrice + minPriceForOne;
	if (bidPriceForOne) then
		itemTotals.bidCount = itemTotals.bidCount + 1;
		itemTotals.bidPrice = itemTotals.bidPrice + bidPriceForOne;
	end
	if (buyoutPriceForOne) then
		itemTotals.buyoutCount = itemTotals.buyoutCount + 1;
		itemTotals.buyoutPrice = itemTotals.buyoutPrice + buyoutPriceForOne;
	end
	updateItemTotals(itemKey, auction.ahKey, itemTotals);
end

-------------------------------------------------------------------------------
-- Called when an auction is updated in the snapshot.
-------------------------------------------------------------------------------
function onAuctionUpdated(event, newAuction, oldAuction)
	local itemKey = Auctioneer.ItemDB.CreateItemKeyFromAuction(newAuction);

	-- If there's a bid on the auction, update the item totals.
	if (newAuction.bidAmount and newAuction.bidAmount > 0) then
		local itemTotals = getItemTotals(itemKey, newAuction.ahKey, true);
		local newBidPriceForOne = math.floor(newAuction.bidAmount / newAuction.count);
		if (oldAuction.bidAmount and oldAuction.bidAmount > 0) then
			local oldBidPriceForOne = math.floor(oldAuction.bidAmount / oldAuction.count);
			itemTotals.bidPrice = itemTotals.bidPrice + newBidPriceForOne - oldBidPriceForOne;
		else
			itemTotals.bidCount = itemTotals.bidCount + 1;
			itemTotals.bidPrice = itemTotals.bidPrice + newBidPriceForOne;
		end
		updateItemTotals(itemKey, newAuction.ahKey, itemTotals);
	end
end

-------------------------------------------------------------------------------
-- Called when an auction is removed from the snapshot.
-------------------------------------------------------------------------------
function onAuctionRemoved(event, auction)
end

-------------------------------------------------------------------------------
-- Prints the specified message to nLog.
--
-- syntax:
--    errorCode, message = debugPrint([message][, title][, errorCode][, level])
--
-- parameters:
--    message   - (string) the error message
--                nil, no error message specified
--    title     - (string) the title for the debug message
--                nil, no title specified
--    errorCode - (number) the error code
--                nil, no error code specified
--    level     - (string) nLog message level
--                         Any nLog.levels string is valid.
--                nil, no level specified
--
-- returns:
--    errorCode - (number) errorCode, if one is specified
--                nil, otherwise
--    message   - (string) message, if one is specified
--                nil, otherwise
-------------------------------------------------------------------------------
function debugPrint(message, title, errorCode, level)
	return Auctioneer.Util.DebugPrint(message, "AucHistoryDB", title, errorCode, level)
end

--=============================================================================
-- Initialization
--=============================================================================
if (Auctioneer.HistoryDB) then return end;

-------------------------------------------------------------------------------
-- Public API
-------------------------------------------------------------------------------
Auctioneer.HistoryDB = {
	Load = load;
	GetItemTotals = getItemTotals;
	GetMedianBuyoutPriceList = getMedianBuyoutPriceList;
	Clear = clear;
};

-------------------------------------------------------------------------------
-- Create an empty database to use before any upgrading is performed.
-------------------------------------------------------------------------------
AuctioneerHistoryDB = createDatabase();
LoadedHistoryDB = AuctioneerHistoryDB;


