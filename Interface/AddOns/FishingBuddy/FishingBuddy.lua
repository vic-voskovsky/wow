-- FishingBuddy
--
-- Everything you wanted support for in your fishing endeavors

-- Information for the stylin' fisherman
local POLES = {
   ["Fishing Pole"] = "6256:0:0:0",
   ["Strong Fishing Pole"] = "6365:0:0:0",
   ["Darkwood Fishing Pole"] = "6366:0:0:0",
   ["Big Iron Fishing Pole"] = "6367:0:0:0",
   ["Blump Family Fishing Pole"] = "12225:0:0:0",
   ["Nat Pagle's Extreme Angler FC-5000"] = "19022:0:0:0",
   ["Arcanite Fishing Pole"] = "19970:0:0:0",
   -- yeah, so you can't really use these (for now :-)
   ["Dwarven Fishing Pole"] = "3567:0:0:0",
   ["Goblin Fishing Pole"] = "4598:0:0:0",
}

local FISHINGLURES = {
   [34861] = {
      ["n"] = "Sharpened Fish Hook",              -- 100 for 10 minutes
      ["b"] = 100,
      ["s"] = 100,
      ["d"] = 10,
   },
   [6533] = {
      ["n"] = "Aquadynamic Fish Attractor",       -- 100 for 10 minutes
      ["b"] = 100,
      ["s"] = 100,
      ["d"] = 10,
   },
   [33820] = {
      ["n"] = "Weather-Beaten Fishing Hat",       -- 75 for 10 minutes
      ["b"] = 75,
      ["s"] = 1,
      ["d"] = 10,
      ["w"] = 1,
   },
   [7307] = {
      ["n"] = "Flesh Eating Worm",                -- 75 for 10 mins
      ["b"] = 75,
      ["s"] = 100,
      ["d"] = 10,
   },
   [6532] = {
      ["n"] = "Bright Baubles",                   -- 75 for 10 mins
      ["b"] = 75,
      ["s"] = 100,
      ["d"] = 10,
   },
   [6811] = {
      ["n"] = "Aquadynamic Fish Lens",            -- 50 for 10 mins
      ["b"] = 50,
      ["s"] = 50,
      ["d"] = 10,
   },
   [6530] = {
      ["n"] = "Nightcrawlers",                    -- 50 for 10 mins
      ["b"] = 50,
      ["s"] = 50,
      ["d"] = 10,
   },
   [6529] = {
      ["n"] = "Shiny Bauble",                     -- 25 for 10 mins
      ["b"] = 25,
      ["s"] = 1,
      ["d"] = 10,
   },
}

FishingBuddy.OPTIONS = {
   ["ShowNewFishies"] = {
      ["text"] = FBConstants.CONFIG_SHOWNEWFISHIES_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_SHOWNEWFISHIES_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 1 },
   ["WatchFishies"] = {
      ["text"] = FBConstants.CONFIG_FISHWATCH_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_FISHWATCH_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 1 },
   ["WatchElapsedTime"] = {
      ["text"] = FBConstants.CONFIG_FISHWATCHTIME_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_FISHWATCHTIME_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0,
      ["deps"] = { ["WatchFishies"] = "d" } },
   ["WatchCurrentSkill"] = {
      ["text"] = FBConstants.CONFIG_FISHWATCHSKILL_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_FISHWATCHSKILL_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 1,
      ["deps"] = { ["WatchFishies"] = "d" } },
   ["WatchCurrentZone"] = {
      ["text"] = FBConstants.CONFIG_FISHWATCHZONE_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_FISHWATCHZONE_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0,
      ["deps"] = { ["WatchFishies"] = "d" } },
   ["WatchOnlyWhenFishing"] = {
      ["text"] = FBConstants.CONFIG_FISHWATCHONLY_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_FISHWATCHONLY_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 1,
      ["deps"] = { ["WatchFishies"] = "d" } },
   ["WatchFishPercent"] = {
      ["text"] = FBConstants.CONFIG_FISHWATCHPERCENT_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_FISHWATCHPERCENT_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 1,
      ["deps"] = { ["WatchFishies"] = "d" } },
   ["SortByPercent"] = {
      ["text"] = FBConstants.CONFIG_SORTBYPERCENT_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_SORTBYPERCENT_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 1 },
   ["EasyCast"] = {
      ["text"] = FBConstants.CONFIG_EASYCAST_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_EASYCAST_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0 },
   ["EasyLures"] = {
      ["text"] = FBConstants.CONFIG_EASYLURES_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_EASYLURES_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["deps"] = { ["EasyCast"] = "d" },
      ["default"] = 0 },
   ["AlwaysLure"] = {
      ["text"] = FBConstants.CONFIG_ALWAYSLURE_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_ALWAYSLURE_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["deps"] = { ["EasyLures"] = "d" },
      ["default"] = 0 },
   ["AutoLoot"] = {
      ["text"] = FBConstants.CONFIG_AUTOLOOT_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_AUTOLOOT_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["deps"] = { ["EasyCast"] = "d" },
      ["default"] = 0 },
   ["UseAction"] = {
      ["text"] = FBConstants.CONFIG_USEACTION_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_USEACTION_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["deps"] = { ["EasyCast"] = "d" },
      ["default"] = 0 },
   ["TurnOffPVP"] = {
      ["text"] = FBConstants.CONFIG_TURNOFFPVP_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_TURNOFFPVP_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0 },
   ["STVTimer"] = {
      ["text"] = FBConstants.CONFIG_STVTIMER_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_STVTIMER_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0 },
   ["TooltipInfo"] = {
      ["text"] = FBConstants.CONFIG_TOOLTIPS_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_TOOLTIPS_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0 },
   ["STVPoolsOnly"] = {
      ["text"] = FBConstants.CONFIG_STVPOOLSONLY_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_STVPOOLSONLY_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0,
      ["deps"] = { ["STVTimer"] = "d", ["EasyCast"] = "d" } },
   ["MinimapButtonVisible"] = {
      ["tooltip"] = FBConstants.CONFIG_MINIMAPBUTTON_INFO,
      ["v"] = 1,
      ["default"] = 1,
      ["update"] = function(checked)
                      local b = FishingBuddyOption_MinimapButtonVisible;
                      if ( b:GetChecked() ) then
                         b.text = "";
                      else
                         b.text = FBConstants.CONFIG_MINIMAPBUTTON_ONOFF;
                      end
                      FishingBuddyOption_MinimapButtonVisibleText:SetText(b.text);
                   end,
   },
   ["EnhanceFishingSounds"] = {
      ["text"] = FBConstants.CONFIG_ENHANCESOUNDS_ONOFF,
      ["tooltip"] = FBConstants.CONFIG_ENHANCESOUNDS_INFO,
      ["v"] = 1,
      ["m"] = 1,
      ["default"] = 0 },
   -- options not in a menu
   ["ShowLocationZones"] = {
      ["default"] = 1,
   },
   ["GroupByLocation"] = {
      ["default"] = 1,
   },
   -- bar switching
   ["ClickToSwitch"] = {
      ["default"] = 1,
   },
   ["MinimapClickToSwitch"] = {
      ["default"] = 0,
   },
   ["EasyCastKeys"] = {
      ["default"] = FBConstants.KEYS_NONE,
      ["deps"] = { ["EasyCast"] = "h" },
   },
   ["EnhanceSound_SFXVolume"] = {
      ["default"] = 1.0,
   },
   ["EnhanceSound_MasterVolume"] = {
      ["default"] = 1.0,
   },
   ["EnhanceSound_MusicVolume"] = {
      ["default"] = 0.0,
   },
   ["EnhanceSound_AmbienceVolume"] = {
      ["default"] = 0.0,
   },
   ["EnhanceMapWaterSounds"] = {
      ["default"] = 0,
   },
   ["MinimapButtonPosition"] = {
      ["default"] = FBConstants.DEFAULT_MINIMAP_POSITION,
   },
   ["MinimapPosSlider"] = {
      ["deps"] = { ["MinimapButtonVisible"] = "h", },
   },
   ["ClockOffset"] = {
      ["default"] = 0,
      ["deps"] = { ["STVTimer"] = "h" },
      ["visible"] = function()
                       if ( FBConstants.ClockOffsets ) then
                          return 1;
                       else
                          return 0;
                       end;
                    end,
   },
   ["OutfitManager"] = {
      ["default"] = "OutfitDisplayFrame",
   },
   ["CaughtSoFar"] = {
      ["default"] = 0,
   },
   ["TotalTimeFishing"] = {
      ["default"] = 0,
   },
}

FishingBuddy.ByFishie = nil;
FishingBuddy.SortedFishies = nil;

local ActionStartTime = 0;
local ActionDoubleTime = 0;
local ACTIONMINWAIT = 0.05;
local ACTIONDOWNWAIT = 0.2;
local ACTIONDOUBLEWAIT = 0.4;
local MINACTIONDOUBLECLICK = 0.05;
local SavedAddMessage = nil;

FishingBuddy.SavedToggleMinimap = nil;

FishingBuddy.StartedFishing = nil;

local CastingNow = false;
local IsLooting = false;
local OverrideOn = false;

local TestingLures = false;
local AddingLure = false;
local LureState = 0;
local DoEscaped = nil;
local DoLure = nil;
local LastLure = nil;


local FishingSpellID = nil;
local FishingSkillName = nil;
local FishingActionBarID = nil;

local gotSetupDone = false;
local playerName = nil;
local realmName = nil;
local schooltipText = nil;

FishingBuddy.currentFishies = {};

local DEFAULT_MINIMAP_POSITION = 256;

local function GetDefault(setting)
   local opt = FishingBuddy.OPTIONS[setting];
   if ( opt ) then
      if ( opt.check and opt.checkfail ) then
         if ( not opt.check() ) then
            return opt.checkfail;
         end
      end
      return opt.default;
   end
end
FishingBuddy.GetDefault = GetDefault;

local function GetSetting(setting)
   if ( not FishingBuddy_Player or
        not FishingBuddy_Player["Settings"] ) then
      return;
   end
   local val = FishingBuddy_Player["Settings"][setting];
   if ( val == nil ) then
      val = GetDefault(setting);
   end
   return val;
end
FishingBuddy.GetSetting = GetSetting;

local function SetSetting(setting, value)
   if ( FishingBuddy_Player and setting ) then
      local val = GetDefault(setting);
      if ( val == value ) then
         FishingBuddy_Player["Settings"][setting] = nil;
      else
         FishingBuddy_Player["Settings"][setting] = value;
      end
   end
end
FishingBuddy.SetSetting = SetSetting;

local function GetKey()
   local key = FishingBuddy_Info["FishingBuddyKey"];
   if ( not key ) then
      math.randomseed(time());
      -- generate a random key to identify this instance of the plugin
      local n = 16 + random(4) + random(4);
      key = "";
      for idx=1,n do
         key = key .. string.char(64+math.random(26));
      end
      FishingBuddy_Info["FishingBuddyKey"] = key;
   end
   return key;
end
FishingBuddy.API.GetKey = GetKey;

local function ResetKey()
   FishingBuddy_Info["FishingBuddyKey"] = nil;
   return GetKey();
end
FishingBuddy.ResetKey = ResetKey;

local function SetClockOffset(offset)
   if ( not FishingBuddy_Info["ClockOffsets"] ) then
      FishingBuddy_Info["ClockOffsets"] = {};
   end
   if ( offset == 0 ) then
      FishingBuddy_Info["ClockOffsets"][realmName] = nil;
   else
      FishingBuddy_Info["ClockOffsets"][realmName] = offset;
   end
end
FishingBuddy.SetClockOffset = SetClockOffset;

local function GetClockOffset()
   if ( not FishingBuddy_Info["ClockOffsets"] or
        not FishingBuddy_Info["ClockOffsets"][realmName] ) then
      return 0;
   end
   return FishingBuddy_Info["ClockOffsets"][realmName];
end
FishingBuddy.GetClockOffset = GetClockOffset;

-- handle zone markers
local function zmto(zidx, sidx)
   if ( not zidx ) then
      return 0;
   end
   if ( not sidx ) then
      sidx = 0;
   end
   return zidx*1000 + sidx;
end
FishingBuddy.ZoneMarkerTo = zmto;

local function zmex(packed)
   local sidx = math.fmod(packed, 1000);
   return math.floor(packed/1000), sidx;
end
FishingBuddy.ZoneMarkerEx = zmex;

-- We have to do this at PLAYER_ENTERING_WORLD or PLAYER_LOGIN
-- GetGameTime isn't correct at VARIABLES_LOADED
local function CheckClockOffset()
   local hour,minute = GetGameTime();
   local lhour = date("%H");
   local lminute = date("%M");
   local houroff;
   houroff = hour - lhour;
   if ( houroff ~= 0 ) then
      local houroff24;
      if ( houroff < 0 ) then
         houroff24 = 24 + houroff;
      else
         houroff24 = houroff - 24;
      end
      local offsets = { houroff, houroff24 };
      FBConstants.ClockOffsets = offsets;
      local current = GetClockOffset();
      -- don't change it if we've already got a good value
      if ( current ~= houroff and current ~= houroff24 ) then
         SetClockOffset(houroff);
      end
   else
      FBConstants.ClockOffsets = nil;
      SetClockOffset(0);
   end
   -- Set up the menu and such
   FishingBuddy.OptionsFrame.SetClockValues(GetClockOffset());
end

local function SplitColor(color)
   if ( color ) then
      if ( type(color) == "table" ) then
         for i,c in pairs(color) do
            color[i] = SplitColor(c);
         end
      elseif ( type(color) == "string" ) then
         local a = tonumber(string.sub(color,1,2),16);
         local r = tonumber(string.sub(color,3,4),16);
         local g = tonumber(string.sub(color,5,6),16);
         local b = tonumber(string.sub(color,7,8),16);
         color = { a = a, r = r, g = g, b = b };
      end
   end
   return color;
end
FishingBuddy.SplitColor = SplitColor;

-- Something else that should be in a library
local function SplitLink(link)
   if ( link ) then
      local _,_, color, item, name = string.find(link, "|c(%x+)|Hitem:(%d+:%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+)|h%[(.-)%]|h|r");
      return color, item, name;
   end
end
FishingBuddy.SplitLink = SplitLink;

local function SplitFishLink(link)
   if ( link ) then
      local _,_, color, id, name = string.find(link, "|c(%x+)|Hitem:(%d+):%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+|h%[(.-)%]|h|r");
      return color, tonumber(id), name;
   end
end
FishingBuddy.SplitFishLink = SplitFishLink;

local function _GetItemInfo(link)
   local maj,min,dot = FishingBuddy.WOWVersion();
-- name, link, rarity, itemlevel, minlevel, itemtype
-- subtype, stackcount, equiploc, texture
   local nm,li,ra,il,ml,it,st,sc,el,tx;
   if ( maj > 1 ) then
      nm,li,ra,il,ml,it,st,sc,el,tx = GetItemInfo(link);
   else
      nm,li,ra,ml,it,st,sc,el,tx = GetItemInfo(link);
   end
   return nm,li,ra,ml,it,st,sc,el,tx,il;
end

local function IsLinkableItem(item)
   local link = "item:"..item;
   local n,l,_,_,_,_,_,_ = _GetItemInfo(link);
   return ( n and l );
end
FishingBuddy.IsLinkableItem = IsLinkableItem;

-- event handling
local function IsFakeEvent(evt)
   return FBConstants.FBEvents[evt];
end

local reg_events = {};
local event_handlers = {};
local function RegisterHandlers(handlers)
   for evt,info in pairs(handlers) do
      local func, fake;
      if ( not event_handlers[evt] ) then
         event_handlers[evt] = {};
      end
      if ( type(info) == "function" ) then
         func = info;
         fake = IsFakeEvent(evt);
      else
         func = info.func;
         fake = info.fake;
      end
      if ( FBConstants.FBEvents[evt] ) then
         fake = true;
      end
      tinsert(event_handlers[evt], func);
      if ( not fake ) then
         -- register the event, if we haven't already
         if ( FishingBuddy.StartedFishing and not reg_events[evt] ) then
            FishingBuddyFrame:RegisterEvent(evt);
         end
         reg_events[evt] = 1;
      end
   end
end
FishingBuddy.API.RegisterHandlers = RegisterHandlers;
FishingBuddy.API.GetHandlers = function(what) return event_handlers[what]; end;

local function RunHandlers(what, ...)
   local eh = FishingBuddy.API.GetHandlers(what);
   if ( eh ) then
      for idx,func in pairs(eh) do
         func(...);
      end
   end
end
FishingBuddy.RunHandlers = RunHandlers;

-- look at tooltips
local function GetTooltipText()
   if ( GameTooltip:IsVisible() ) then
      local text = getglobal("GameTooltipTextLeft1");
      if ( text ) then
         return text:GetText();
      end
   end
   return nil;
end
FishingBuddy.GetTooltipText = GetTooltipText;

local function LastTooltipText()
   return schooltipText;
end
FishingBuddy.LastTooltipText = LastTooltipText;

local function ClearTooltipText()
   schooltipText = nil;
end
FishingBuddy.ClearTooltipText = ClearTooltipText; 

local function OnFishingBobber()
   local text = GetTooltipText();
   if ( text ) then
         -- let a partial match work (for translations)
         return ( text and string.find(text, FBConstants.BOBBER_NAME ) );
   end
   return false;
end

-- build a list of zones where a given fish can be found
local function FishZoneList(fishid)
   if ( FishingBuddy.ByFishie[fishid] ) then
      local slist = {};
      for idx,count in pairs(FishingBuddy.ByFishie[fishid]) do
         local zidx, sidx = zmex(idx);
         if ( sidx > 0 ) then
            slist[idx] = 1;
         end
      end
      local names = {};
      for idx,_ in pairs(slist) do
         tinsert(names, FishingBuddy_Info["SubZones"][idx]);
      end
      table.sort(names);
      return FishingBuddy.EnglishList(names);
   end
   -- return nil;
end

-- find an action bar with the Fishing skill in it
local function UpdateFishingActionBarID()
   if ( FishingActionBarID == nil ) then
      for slot=1,72 do
         if ( HasAction(slot) and not IsAttackAction(slot) ) then
            local t,i,s = GetActionInfo(slot);
            if ( t == "spell" ) then
               local tex = GetActionTexture(slot);
               if ( tex and tex == FBConstants.FISHINGTEXTURE ) then
                  FishingActionBarID = slot;
                  break;
               end
            end
         end
      end
   end
end

-- support finding the fishing skill
local function FindSpellID(thisone)
   local id = 1;
   local spellTexture = GetSpellTexture(id, BOOKTYPE_SPELL);
   while (spellTexture) do
      if (spellTexture and spellTexture == thisone) then
                return id;
      end
      id = id + 1;
      spellTexture = GetSpellTexture(id, BOOKTYPE_SPELL);
   end
   return nil;
end

local function GetFishingSpellID()
   if ( not FishingSpellID or not FishingSkillName) then
      FishingSpellID = FindSpellID(FBConstants.FISHINGTEXTURE);
   end
   if ( FishingSpellID and not FishingSkillName ) then
      FishingSkillName = GetSpellName(FishingSpellID, BOOKTYPE_SPELL);
   end
   UpdateFishingActionBarID();
   return FishingSpellID, FishingSkillName;
end

local function GetFishingSkillName()
   GetFishingSpellID();
   if ( not FishingSkillName ) then
      return FBConstants.FISHINGSKILL;
   else
      return FishingSkillName;
   end
end
FishingBuddy.GetFishingSkillName = GetFishingSkillName;

-- handle option keys for enabling casting
local key_actions = {
   [FBConstants.KEYS_NONE] = function() return true; end,
   [FBConstants.KEYS_SHIFT] = function() return IsShiftKeyDown(); end,
   [FBConstants.KEYS_CTRL] = function() return IsControlKeyDown(); end,
   [FBConstants.KEYS_ALT] = function() return IsAltKeyDown(); end,
}
local function CastingKeys()
   local setting = GetSetting("EasyCastKeys");
   if ( setting and key_actions[setting] ) then
      return key_actions[setting]();
   else
      return true;
   end
end

-- get our current fishing skill level
local lastSkillIndex = nil;
local function GetCurrentSkill()
   if ( lastSkillIndex ) then
      local name, _, _, rank, _, modifier = GetSkillLineInfo(lastSkillIndex);
      if ( name == GetFishingSkillName() )then
         return rank, modifier;
      end
   end
   local n = GetNumSkillLines();
   for i=1,n do
      local name, _, _, rank, _, modifier = GetSkillLineInfo(i);
      if ( name == GetFishingSkillName() ) then
         lastSkillIndex = i;
         return rank, modifier;
      end
   end
   return 0, 0;
end
FishingBuddy.GetCurrentSkill = GetCurrentSkill;

-- handle dynamic event registration
local function EventRegistration(frame, reg)
   for evt,t in pairs(reg_events) do
      if ( reg ) then
         frame:RegisterEvent(evt);
      else
         frame:UnregisterEvent(evt);
      end
   end
end

-- handle the vagaries of zones and subzones
local function GetZoneInfo()
   local zone = GetRealZoneText();
   local subzone = GetSubZoneText();
   if ( not zone or zone == "" ) then
      zone = FBConstants.UNKNOWN;
   end
   if ( not subzone or subzone == "" ) then
      subzone = zone;
   end
   return zone, subzone;
end
FishingBuddy.GetZoneInfo = GetZoneInfo;

local zonemapping;
local subzonemapping;

local function DumpMappings(both)
   FishingBuddy.Debug("Zone mapping");
   FishingBuddy.Dump(zonemapping);
   if ( both ) then
      FishingBuddy.Debug("SubZone mapping");
      FishingBuddy.Dump(subzonemapping);
   end
end
FishingBuddy.DumpMappings = DumpMappings;

local function initmappings()
   if ( not zonemapping ) then
      zonemapping = {};
      subzonemapping = {};
      for zidx,z in pairs(FishingBuddy_Info["ZoneIndex"]) do
         zonemapping[z] = zidx;
         local zidm = zmto(zidx,0);
         local count = FishingBuddy_Info["SubZones"][zidm];
         if ( count and count > 0 ) then
            subzonemapping[zidx] = {};
            for s=1,count,1 do
               zidm = zmto(zidx, s);
               local sz = FishingBuddy_Info["SubZones"][zidm];
               subzonemapping[zidx][sz] = s;
            end
         end
      end
   end
end

local function GetZoneIndex(zone, subzone, marker)
   initmappings();
   if ( not zone ) then
      zone, subzone = GetZoneInfo();
   end
   local zidx = zonemapping[zone];
   if ( not zidx ) then
      return;
   end
   if ( not subzonemapping[zidx] ) then
      subzonemapping[zidx] = {};
   end
   if ( not subzone or not subzonemapping[zidx][subzone] ) then
      if ( marker ) then
         return zmto(zidx, 0);
      else
         return zidx;
      end
   end
   if ( marker ) then
      return zmto(zidx, subzonemapping[zidx][subzone]);
   else
      return zidx, subzonemapping[zidx][subzone];
   end
end
FishingBuddy.GetZoneIndex = GetZoneIndex;

local function AddZoneIndex(zone, subzone, marker)
   if ( not zone ) then
      zone, subzone = GetZoneInfo();
   end
   if ( type(zone) ~= "string" ) then
      FishingBuddy.Debug("AddZoneIndex "..zone);
   end
   local zidx, sidx = GetZoneIndex(zone, subzone);
   if ( not zidx ) then
      tinsert(FishingBuddy_Info["ZoneIndex"], zone);
      zidx = table.getn(FishingBuddy_Info["ZoneIndex"]);
      zonemapping[zone] = zidx;
      -- keep sort helpers up to date
      if ( FishingBuddy.SortedZones ) then
         tinsert(FishingBuddy.SortedZones, zone);
         table.sort(FishingBuddy.SortedZones);
      end
   end
   local zidm = zmto(zidx, 0);
   if ( not subzone ) then
      if ( marker ) then
         return zidm;
      else
         return zidx;
      end
   end
   if ( not subzonemapping[zidx] ) then
      subzonemapping[zidx] = {};
   end
   local newsubzone = false;
   if ( not subzonemapping[zidx][subzone] ) then
      newsubzone = true;
      sidx = FishingBuddy_Info["SubZones"][zidm];
      if ( not sidx ) then
         sidx = 1;
      else
         sidx = sidx + 1;
      end
      FishingBuddy_Info["SubZones"][zidm] = sidx;
      local sidm = zmto(zidx, sidx);
      FishingBuddy_Info["SubZones"][sidm] = subzone;
      subzonemapping[zidx][subzone] = sidx;
   end
   -- keep sort helpers up to date
   if ( newsubzone ) then
      if ( not FishingBuddy.SortedByZone[zone] ) then
         FishingBuddy.SortedByZone[zone] = {};
      end
      tinsert(FishingBuddy.SortedByZone[zone], subzone);
      table.sort(FishingBuddy.SortedByZone[zone]);

      if ( not FishingBuddy.UniqueSubZones[subzone] ) then
         FishingBuddy.UniqueSubZones[subzone] = 1;
         tinsert(FishingBuddy.SortedSubZones, subzone);
         table.sort(FishingBuddy.SortedSubZones);
      end

      if ( not FishingBuddy.SubZoneMap[subzone] ) then
         FishingBuddy.SubZoneMap[subzone] = {};
      end
      local sidm = zmto(zidx, sidx);
      FishingBuddy.SubZoneMap[subzone][sidm] = 1;
   end
   if ( marker ) then
      return zmto(zidx, subzonemapping[zidx][subzone]);
   else
      return zidx, subzonemapping[zidx][subzone];
   end
end
FishingBuddy.AddZoneIndex = AddZoneIndex;

local function SetZoneLevel(zone, subzone, fishid)
   local skill, mods = GetCurrentSkill();
   local idx = GetZoneIndex(zone, subzone, true);
   local fs = FishingBuddy_Info["FishingSkill"];
   if ( not fs[idx] ) then
      fs[idx] = 0;
   end
   local skillcheck = skill + mods;
   if ( skillcheck > 0 ) then
      if ( not fs[idx] or skillcheck < fs[idx] ) then
         fs[idx] = skillcheck;
      end
      if ( fishid ) then
         if ( not FishingBuddy_Info["Fishies"][fishid].level or
              skillcheck < FishingBuddy_Info["Fishies"][fishid].level ) then
            FishingBuddy_Info["Fishies"][fishid].level = skillcheck;
            FishingBuddy_Info["Fishies"][fishid].skill = skill;
            FishingBuddy_Info["Fishies"][fishid].mods = mods;
         end
      end
   end
   return skill + mods;
end
FishingBuddy.SetZoneLevel = SetZoneLevel;

local function AddFishie(color, id, name, zone, subzone, texture, quantity, quality, level)
   if ( id and not FishingBuddy_Info["Fishies"][id] ) then
      if ( not color ) then
         local _,_,_,hex = GetItemQualityColor(quality);
         _,_,color = string.find(hex, "|c(%a+)");
      end
      FishingBuddy_Info["Fishies"][id] = { };
      FishingBuddy_Info["Fishies"][id].name = name;
      FishingBuddy_Info["Fishies"][id].texture = texture;
      FishingBuddy_Info["Fishies"][id].quality = quality;
      if ( color ~= "ffffffff" ) then
         FishingBuddy_Info["Fishies"][id].color = color;
      end
      if ( FishingBuddy.SortedFishies ) then
         tinsert(FishingBuddy.SortedFishies, { text = name, id = id });
         FishingBuddy.FishSort(FishingBuddy.SortedFishies, true);
      end
   end
   if ( name and not FishingBuddy_Info["Fishies"][id].name ) then
      FishingBuddy_Info["Fishies"][id].name = name;
   end

   if ( not zone ) then
      zone = FBConstants.UNKNOWN;
   end
   if ( not subzone ) then
      subzone = zone;
   end
   local zidx, sidx = AddZoneIndex(zone, subzone);
   local idx = zmto(zidx, sidx);

   local ft = FishingBuddy_Info["FishTotals"];
   local totidx = zmto(zidx, 0);
   if( not ft[totidx] ) then
      ft[totidx] = quantity;
   else
      ft[totidx] = ft[totidx] + quantity;
   end
   if( not ft[idx] ) then
      ft[idx] = quantity;
   else
      ft[idx] = ft[idx] + quantity;
   end

   if ( not FishingBuddy.currentFishies[idx] ) then
      FishingBuddy.currentFishies[idx] = {};
   end
   if ( not FishingBuddy.currentFishies[idx][id] ) then
      FishingBuddy.currentFishies[idx][id] = quantity;
   else
      FishingBuddy.currentFishies[idx][id] = FishingBuddy.currentFishies[idx][id] + quantity;
   end

   local fh = FishingBuddy_Info["FishingHoles"];
   if ( not fh[idx] ) then
      fh[idx] = {};
   end
   if ( not fh[idx][id] ) then
      fh[idx][id] = quantity;
      if ( GetSetting("ShowNewFishies") == 1 ) then
         FishingBuddy.Print(FBConstants.ADDFISHIEMSG, name, subzone);
      end
   else
      fh[idx][id] = fh[idx][id] + quantity;
   end

   if ( FishingBuddy.ByFishie ) then
      if ( not FishingBuddy.ByFishie[id] ) then
         FishingBuddy.ByFishie[id] = {};
      end
      if ( not FishingBuddy.ByFishie[id][idx] ) then
         FishingBuddy.ByFishie[id][idx] = quantity;
      else
         FishingBuddy.ByFishie[id][idx] = FishingBuddy.ByFishie[id][idx] + quantity;
      end
   end

   if ( level ) then
      if ( not FishingBuddy_Info["Fishies"][id].level or
              level < FishingBuddy_Info["Fishies"][id].level ) then
         FishingBuddy_Info["Fishies"][id].level = level;
      else
         level = FishingBuddy_Info["Fishies"][id].level;
      end
   end
   RunHandlers(FBConstants.ADD_FISHIE_EVT, id, name, zone, subzone, texture, quantity, quality, level, idx);
end
FishingBuddy.AddFishie = AddFishie;

local function IsFishingPole()
   -- Get the main hand item texture
   local slot = GetInventorySlotInfo("MainHandSlot");
   local itemTexture = GetInventoryItemTexture("player", slot);
   -- If there is infact an item in the main hand, and it's texture
   -- that matches the fishing pole texture, then we have a fishing pole
   if ( itemTexture and string.find(itemTexture, "INV_Fishingpole") ) then
      local link = GetInventoryItemLink("player", slot);
      local _, id, _ = SplitLink(link);
      -- Make sure it's not "Nat Pagle's Fish Terminator"
      if ( not string.find(id, "^19944") ) then
         return true;
      end
   end
   return false;
end
FishingBuddy.API.IsFishingPole = IsFishingPole;

local function IsWorn(itemid)
   for slot=1,19 do
      local link = GetInventoryItemLink("player", slot);
      if ( link ) then
         local _, id, _ = SplitFishLink(link);
         if ( itemid == id ) then
            return true;
         end
      end
   end
   -- return nil
end

-- Get an array of all the lures we have in our inventory, sorted by
-- cost, then bonus
-- We'll want to use the cheapest ones we can until our fish don't get
-- away from us

local lureinventory = {};
local function InventoryLures()
   local rawskill, mods = GetCurrentSkill();
   --local hmhe,_,_,_,_,_ = GetWeaponEnchantInfo();
   --if ( IsFishingPole() and hmhe and LastLure ) then
   --   mods = mods - FISHINGLURES[LastLure].b;
   --end
   lureinventory  = {};
   for id,lure in pairs(FISHINGLURES) do
      local count = GetItemCount(id);
      -- does this lure have to be "worn"
      if ( lure.w and not IsWorn(id)) then
          count = 0;
      end
      if ( count > 0 and lure.s <= rawskill ) then
         tinsert(lureinventory, id);
         -- get the name so we can check enchants
         FISHINGLURES[id].n,_,_,_,_,_,_,_,_,_ = GetItemInfo(id);
      end
   end
   
end

FishingBuddy.DumpLures = function()
   FishingBuddy.Debug("LureInventory: "..#lureinventory);
   local n = table.getn(lureinventory);
   for s=1,n,1 do
      FishingBuddy.Debug("  "..lureinventory[s]);
   end
   local FL = FISHINGLURES;
   FishingBuddy.Debug("FISHINGLURES: "..#FL);
   n = table.getn(lureinventory);
   for s=1,n,1 do
      FishingBuddy.Debug("  "..FL[s]);
   end
end

local function GetThisLure(lureid)
   -- check for "item" lures
   for slot=1,15 do
      local link = GetInventoryItemLink("player", slot);
      if ( link ) then
         local _, id, n = SplitFishLink(link);
         if ( lureid == id ) then
            return nil, slot, FISHINGLURES[id].n;
         end
      end
   end
   -- check each of the bags on the player
   for bag=0, NUM_BAG_FRAMES do
      -- get the number of slots in the bag (0 if no bag)
      local numSlots = GetContainerNumSlots(bag);
      if (numSlots > 0) then
         -- check each slot in the bag
         for slot=1, numSlots do
            local link = GetContainerItemLink (bag, slot);
            if ( link ) then
               local _, id, n = SplitFishLink(link);
               if ( lureid == id ) then
                  if ( FISHINGLURES[id].w ~= 1) then
                     return bag, slot, FISHINGLURES[id].n;
                  end
               end
            end
         end
      end
   end
   -- return nil, nil;
end

-- look for double clicks
local lastClickTime = nil;
local function CheckForDoubleClick()
   if ( lastClickTime ) then
      local pressTime = GetTime();
      local doubleTime = pressTime - lastClickTime;
      if ( doubleTime < ACTIONDOUBLEWAIT and doubleTime > MINACTIONDOUBLECLICK ) then
         return true;
      end
   end
   lastClickTime = GetTime();
   return false;
end

local function ExtendDoubleClick()
   if ( lastClickTime ) then
      lastClickTime = lastClickTime + ACTIONDOUBLEWAIT/2;
   end
end

local function ResetFBButton()
   if (OverrideOn) then
      FB_FishingButton:Hide();
      ClearOverrideBindings(FB_FishingButton);
      OverrideOn = false;
   end
end

local function PostCastUpdate()
   local stop = true;
   if ( not InCombatLockdown() ) then
      ResetFBButton();
      if ( AddingLure ) then
         local sp, rk, dn, ic, st, et = UnitCastingInfo("player");
         if ( not sp or (dn and dn ~= FISHINGLURES[LastLure].n) ) then
            AddingLure = false;
            InventoryLures();
         else
            stop = false;
         end
      end
      if ( stop ) then
         FishingBuddy_PostCastUpdateFrame:Hide();
      end
   end
end
FishingBuddy.PostCastUpdate = PostCastUpdate;

local function HideAwayAll(self, button, down)
   if ( OverrideOn ) then
      FishingBuddy_PostCastUpdateFrame:Show();
   end
end

-- create a secure button to activate fishing
local function CreateFishingButton()
   local btn = CreateFrame("Button", "FB_FishingButton", UIParent, "SecureActionButtonTemplate");
   btn:SetPoint("LEFT", UIParent, "RIGHT", 10000, 0);
   btn:SetFrameStrata("LOW");
   btn:EnableMouse(true);
   btn:RegisterForClicks("RightButtonUp");
   btn:Hide();
   btn:SetScript("PostClick", HideAwayAll);
end

local function InvokeFishing()
   GetFishingSpellID();
   if ( GetSetting("UseAction") == 0 or FishingActionBarID == nil ) then
     FB_FishingButton:SetAttribute("type", "spell");
     FB_FishingButton:SetAttribute("spell", FishingSkillName);
     FB_FishingButton:SetAttribute("action", nil);
   else
     FB_FishingButton:SetAttribute("type", "action");
     FB_FishingButton:SetAttribute("action", FishingActionBarID);
     FB_FishingButton:SetAttribute("spell", nil);
   end
   FB_FishingButton:SetAttribute("item", nil);
   FB_FishingButton:SetAttribute("target-slot", nil);
end

local function InvokeLuring(id)
   FB_FishingButton:SetAttribute("type", "item");
   FB_FishingButton:SetAttribute("item", "item:"..id);
   local slot = GetInventorySlotInfo("MainHandSlot");
   FB_FishingButton:SetAttribute("target-slot", slot);
   FB_FishingButton:SetAttribute("spell", nil);
   FB_FishingButton:SetAttribute("action", nil);
end

local function FindNextLure(b, state)
   local n = table.getn(lureinventory);
   local FL = FISHINGLURES;
   for s=state+1,n,1 do
      if ( lureinventory[s] and FL[lureinventory[s]] ) then
         if ( not b or FL[lureinventory[s]].b > b ) then
            return s;
         end
      end
   end
   -- return nil;
end

local function UpdateLure()
   local hmhe,_,_,_,_,_ = GetWeaponEnchantInfo();
   if ( DoEscaped ) then
      -- if no lure now, apply this one
      -- if we applied one, apply the next biggest one, or stop if there
      -- is nothing better
      if ( table.getn(lureinventory) > 0 ) then
         if ( LastLure and hmhe ) then
            local b = FISHINGLURES[LastLure].b;
            LureState = FindNextLure(b, LureState);
            if ( LureState ) then
               DoLure = lureinventory[LureState];
            else
               LureState = 0;
            end
         else
            LureState = 1;
            DoLure = lureinventory[LureState];
         end
      end
      DoEscaped = nil;
   elseif ( GetSetting("AlwaysLure") == 1 ) then
      if ( not hmhe ) then
         LureState = FindNextLure(b, LureState);
         if ( LureState ) then
            DoLure = lureinventory[LureState];
         else
            LureState = 0;
         end
      end
   end
   if ( DoLure ) then
      -- if the pole has an enchantment, we can assume it's got a lure on it (so far, anyway)
      -- remove the main hand enchantment (since it's a fishing pole, we know what it is)
      InvokeLuring(DoLure);
      AddingLure = true;
      LastLure = DoLure;
      DoLure = nil;
      return true;
   end
   return false;
end

local CaptureEvents = {};
CaptureEvents["LOOT_OPENED"] = function()
   IsLooting = true;
   if ( IsFishingLoot()) then
      local zone, subzone = GetZoneInfo();
      for index = 1, GetNumLootItems(), 1 do
         if (LootSlotIsItem(index)) then
            local texture, fishie, quantity, quality = GetLootSlotInfo(index);
            local link = GetLootSlotLink(index);
            local color, id, name = SplitFishLink(link);
            AddFishie(color, id, name, zone, subzone, texture, quantity, quality);
            SetZoneLevel(zone, subzone, id);
         end
      end
      ClearTooltipText();
      ExtendDoubleClick();
      LureState = 0;
   end
end

CaptureEvents["LOOT_CLOSED"] = function()
   IsLooting = false;
end

StatusEvents = {};
StatusEvents["SPELLS_CHANGED"] = function()
   -- Fishing might have moved, go look again
   FishingSpellID = nil;
   InventoryLures();
end

StatusEvents["SKILL_LINES_CHANGED"] = function()
   InventoryLures();
end

StatusEvents["ACTIONBAR_SLOT_CHANGED"] = function()
   FishingActionBarID = nil
end

-- See if this fixes the "combat while fishing" bug
StatusEvents["PLAYER_REGEN_DISABLED"] = function()
   ResetFBButton();
end

StatusEvents["PLAYER_REGEN_ENABLED"] = function()
   ResetFBButton();
end

-- override the error message method (need an object as the first arg)
local function UIError_AddMessage( o, msg, a, r, g, b, hold )
   -- If we should be hiding the can't use item error, then do so
   if ( TestingLures and msg == ERR_CANT_USE_ITEM  ) then
      -- We have the can't use item error, so abort
      return;
   end
   -- if the fish gets away, try adding a lure
   if (  GetSetting("EasyLures") == 1 ) then
      if ( msg == ERR_FISH_ESCAPED ) then
         DoEscaped = 1;
      elseif ( msg == SPELL_FAILED_LOW_CASTLEVEL ) then
      -- put on the biggest lure we can find
         LureState = table.getn(lureinventory);
         DoLure = lureinventory[LureState];
      end
   end
   --Call the original
   local obj = SavedAddMessage.obj;
   local method = SavedAddMessage.method;
   return method( obj, msg, a, r, g, b, hold );
end
FishingBuddy.AddMessage = UIError_AddMessage;

local function NormalHijackCheck()
   if ( not IsLooting and not AddingLure and not InCombatLockdown() and GetSetting("EasyCast") == 1 and
       CastingKeys() and IsFishingPole() ) then
      return true;
   end
end
FishingBuddy.NormalHijackCheck = NormalHijackCheck;

local HijackCheck = NormalHijackCheck;
local function SetHijackCheck(func)
   if ( not func ) then
      func = NormalHijackCheck;
   end
   HijackCheck = func;
end
FishingBuddy.SetHijackCheck = SetHijackCheck;

local SavedWFOnMouseDown;

-- handle mouse up and mouse down in the WorldFrame so that we can steal
-- the hardware events to implement 'Easy Cast'
-- Thanks to the Cosmos team for figuring this one out -- I didn't realize
-- that the mouse handler in the WorldFrame got everything first!
local function WF_OnMouseDown(...)
   -- Only steal 'right clicks' (self is arg #1!)
   local button = select(2, ...);
   if ( button == "RightButton" and HijackCheck() ) then
      if ( CheckForDoubleClick() ) then
          -- We're stealing the mouse-up event, make sure we exit MouseLook
         if ( IsMouselooking() ) then
            MouselookStop();
         end
         -- put on a lure if we need to
         if ( not UpdateLure() ) then
            if ( not schooltipText or not OnFishingBobber() ) then
               -- watch for fishing holes
               schooltipText = GetTooltipText();
            end
            InvokeFishing();
         end
         SetOverrideBindingClick(FB_FishingButton, true, "BUTTON2", "FB_FishingButton");
         OverrideOn = true;
      end
   end
end

local function SafeHookMethod(object, method, newmethod)
   local oldValue = object[method];
   if ( oldValue ~= getglobal(newmethod) ) then
      object[method] = newmethod;
      return true;
   end
   return false;
end

local function SafeHookScript(frame, handlername, newscript)
   local oldValue = frame:GetScript(handlername);
   frame:SetScript(handlername, newscript);
   return oldValue;
end

FishingBuddy.GetFishie = function(fishid)
   if( FishingBuddy_Info["Fishies"][fishid] ) then
      return string.format("%d:0:0:0:0:0:0:0", fishid),
      FishingBuddy_Info["Fishies"][fishid].texture,
      FishingBuddy_Info["Fishies"][fishid].color,
      FishingBuddy_Info["Fishies"][fishid].quantity,
      FishingBuddy_Info["Fishies"][fishid].quality,
      FishingBuddy_Info["Fishies"][fishid].name;
   end
end

-- do everything we think is necessary when we start fishing
-- even if we didn't do the switch to a fishing pole
local resetClickToMove = nil;
local resetAutoLoot = nil;
local resetPVP = nil;
local function StartFishingMode()
   if ( not FishingBuddy.StartedFishing ) then
      -- Disable Click-to-Move if we're fishing
      if ( GetCVar("autointeract") == "1" ) then
         resetClickToMove = true;
         SetCVar("autointeract", "0");
      end
      if ( GetSetting("AutoLoot") == 1 ) then
         if ( not GetAutoLootDefault() ) then
            resetAutoLoot = true;
            SetAutoLootDefault(true);
         end
      end
      if ( GetSetting("TurnOffPVP") == 1 ) then
         if (1 == GetPVPDesired() ) then
            resetPVP = true;
            SetPVP(0);
         end
      end
      FishingBuddy.EnhanceFishingSounds(true);
      FishingBuddy.WatchUpdate();
      EventRegistration(FishingBuddyRoot, true);
      LureState = 0;   -- start with the cheapest lure
      FishingBuddy.StartedFishing = GetTime();
      RunHandlers(FBConstants.FISHING_ENABLED_EVT);
   end
   -- we get invoked when items get equipped as well
   InventoryLures();
end

local function StopFishingMode()
   if ( FishingBuddy.StartedFishing ) then
      FishingBuddy.EnhanceFishingSounds(false);
      FishingBuddy.WatchUpdate();
      EventRegistration(FishingBuddyRoot, false);
      RunHandlers(FBConstants.FISHING_DISABLED_EVT, FishingBuddy.StartedFishing);
      FishingBuddy.StartedFishing = nil;
   end
   if ( resetClickToMove ) then
      -- Re-enable Click-to-Move if we changed it
      SetCVar("autointeract", "1");
      resetClickToMove = nil;
   end
   if ( resetAutoLoot ) then
      SetAutoLootDefault(false);
      resetAutoLoot = nil;
   end
   if ( resetPVP ) then
      SetPVP(1);
      resetPVP = nil;
   end
end

local function FishingMode()
   if ( IsFishingPole() ) then
      StartFishingMode();
   else
      StopFishingMode();
   end
end
FishingBuddy.API.FishingMode = FishingMode;

FishingBuddy.IsSwitchClick = function(setting)
   if ( not setting ) then
      setting = "ClickToSwitch";
   end
   local a = IsShiftKeyDown();
   local b = (FishingBuddy.GetSetting(setting) == 1);
   return ( (a and (not b)) or ((not a) and b) );
end

FishingBuddy.TrapUIErrors = function()
   local temp = {};
   temp.obj= UIErrorsFrame;
   temp.method = UIErrorsFrame["AddMessage"];
   if ( SafeHookMethod(UIErrorsFrame, "AddMessage", FishingBuddy.AddMessage) ) then
      SavedAddMessage = temp;
   end
end

local function TrapWorldMouse()
   if ( WorldFrame.OnMouseDown ) then
      hooksecurefunc(WorldFrame, "OnMouseDown", WF_OnMouseDown) 
   else
      SavedWFOnMouseDown = SafeHookScript(WorldFrame, "OnMouseDown", WF_OnMouseDown);
   end
end
FishingBuddy.TrapWorldMouse = TrapWorldMouse;

local function OptionsUpdate()
   FishingBuddy.WatchUpdate();
   FishingBuddy.UpdateMinimap();
end
FishingBuddy.OptionsUpdate = OptionsUpdate;

-- we should collect these, but then they would be in the cache
local QuestItems = {};
QuestItems[6717] = {
   ["enUS"] = "Gaffer Jack",
   ["deDE"] = "Klemm-Muffen",
   ["esES"] = "Mecanismo eléctrico",
   ["frFR"] = "Rouage électrique",
};
QuestItems[6718] = {
   ["enUS"] = "Electropeller",
   ["deDE"] = "Elektropeller",
   ["esES"] = "Electromuelle",
   ["frFR"] = "Electropeller",
};
QuestItems[16970] = {
   ["enUS"] = "Misty Reed Mahi Mahi",
   ["deDE"] = "Nebelschilf-Mahi-Mahi",
   ["frFR"] = "Mahi Mahi de Brumejonc",
};
QuestItems[16968] = {
   ["enUS"] = "Sar'theris Striker",
   ["deDE"] = "Sar'theris-Barsch",
   ["frFR"] = "Frappeur Sar'theris",
};
QuestItems[16969] = {
   ["enUS"] = "Savage Coast Blue Sailfin",
   ["deDE"] = "Blauwimpel von der ungezähmten Küste",
   ["frFR"] = "Sailfin bleu de la Côte sauvage",
};
QuestItems[16967] = {
   ["enUS"] = "Feralas Ahi",
   ["frFR"] = "Ahi de Feralas",
};

FishingBuddy.QuestItems = QuestItems;

-- User interface handling
local function IsRareFish(id, forced)
   -- always skip extravaganza fish
   if ( FishingBuddy.Extravaganza.Fish[id] ) then
      return true;
   end
   return ( not forced and QuestItems[id] );
end

FishingBuddy.Commands[FBConstants.UPDATEDB] = {};
FishingBuddy.Commands[FBConstants.UPDATEDB].help = FBConstants.UPDATEDB_HELP;
FishingBuddy.Commands[FBConstants.UPDATEDB].func =
   function(what)
      local ff = FishingBuddy_Info["Fishies"];
      local forced;
      if ( what and what == FBConstants.FORCE ) then
         forced = true;
      end
      FishingOutfitTooltip:SetOwner(FishingBuddyFrame, "ANCHOR_RIGHT");
      FishingOutfitTooltip:Show();
      local count = 0;
      for id,info in pairs(ff) do
         local item = id..":0:0:0";
         if ( not IsLinkableItem(item) or not info.name ) then
            if ( not IsRareFish(id, forced) ) then
               local link = "item:"..item;
               -- fetch the data (may disconnect)
               FishingBuddy.Debug(link);
               FishingOutfitTooltip:SetHyperlink(link);
               -- now that we have it in our cache, get the name
               local n,_,_,_,_,_,_,_ = _GetItemInfo(link);
               if ( n ) then
                  count = count + 1;
                     FishingBuddy_Info["Fishies"][id].name = n;
                  end
            end
         end
      end
      FishingBuddy.Print(FBConstants.UPDATEDB_MSG, count);
      return true;
   end;

FishingBuddy.Commands[FBConstants.CURRENT] = {};
FishingBuddy.Commands[FBConstants.CURRENT].help = FBConstants.CURRENT_HELP;
FishingBuddy.Commands[FBConstants.CURRENT].func =
   function(what)
      if ( what and what == FBConstants.RESET) then
         FishingBuddy.currentFishies = {};
         FishingMode();
         return true;
      end
   end;
FishingBuddy.Commands[FBConstants.CLEANUP] = {};
FishingBuddy.Commands[FBConstants.CLEANUP].help = FBConstants.CLEANUP_HELP;
FishingBuddy.Commands[FBConstants.CLEANUP].func =
   function(what)
      local tabs = { "Settings", "Outfit", "WasWearing" };
      local rnames = {};
      local onames = {};
      if ( not what or what == FBConstants.CHECK ) then
         if ( FishingBuddy_Info["Settings"] ) then
            for name in pairs(FishingBuddy_Info["Settings"]) do
               tinsert(onames, name);
            end
         end
         if ( FishingBuddy_Info[realmName] ) then
            local fs = FishingBuddy_Info[realmName]["Settings"];
            if ( fs ) then
               for name,info in pairs(fs) do
                  tinsert(rnames, name);
               end
            end
         end
         if ( next(rnames) or next(onames) ) then
            if ( next(rnames) ) then
               FishingBuddy.Print(FBConstants.CLEANUP_WILLMSG, realmName,
                                  FishingBuddy.EnglishList(rnames));
            end
            if ( next(onames) ) then
               FishingBuddy.Print(FBConstants.CLEANUP_WILLMSG,
                                  FBConstants.NOREALM,
                                  FishingBuddy.EnglishList(onames));
            end
         else
            FishingBuddy.Message(FBConstants.CLEANUP_NONEMSG);
         end
         return true;
      else
         if ( what == FBConstants.NOW ) then
            if ( FishingBuddy_Info["Settings"] ) then
               for name in pairs(FishingBuddy_Info["Settings"]) do
                  tinsert(onames, name);
               end
            end
            if ( FishingBuddy_Info[realmName] ) then
               local fs = FishingBuddy_Info[realmName]["Settings"];
               if ( fs ) then
                  for name,info in pairs(fs) do
                     tinsert(rnames, name);
                  end
               end
            end
         else
            if ( FishingBuddy_Info["Settings"] and FishingBuddy_Info["Settings"][what] ) then
               tinsert(onames, what);
            elseif ( FishingBuddy_Info[realmName] and
                     FishingBuddy_Info[realmName]["Settings"] and
                     FishingBuddy_Info[realmName]["Settings"][what] ) then
               tinsert(rnames, what);
            else
               FishingBuddy.Print(FBConstants.CLEANUP_NOOLDMSG, what);
               return true;
            end
         end
         if ( next(rnames) or next(onames) ) then
            if ( next(rnames) ) then
               for _,name in pairs(rnames) do
                  for _,tab in pairs(tabs) do
                     if ( FishingBuddy_Info[realmName] and FishingBuddy_Info[realmName][tab] ) then
                        FishingBuddy_Info[realmName][tab][name] = nil;
                        if ( next(FishingBuddy_Info[realmName][tab]) == nil ) then
                           FishingBuddy_Info[realmName][tab] = nil;
                        end
                     end
                  end
               end
               if ( FishingBuddy_Info[realmName] and next(FishingBuddy_Info[realmName]) == nil ) then
                  FishingBuddy_Info[realmName] = nil;
               end
               FishingBuddy.Print(FBConstants.CLEANUP_DONEMSG, realmName,
                                  FishingBuddy.EnglishList(rnames));
            end
            if ( next(onames) ) then
               for _,name in pairs(onames) do
                  for _,tab in pairs(tabs) do
                     if ( FishingBuddy_Info[tab] ) then
                        FishingBuddy_Info[tab][name] = nil;
                        if ( next(FishingBuddy_Info[tab]) ) then
                           FishingBuddy_Info[tab] = nil;
                        end
                     end
                  end
               end
               FishingBuddy.Print(FBConstants.CLEANUP_DONEMSG,
                                  FBConstants.NOREALM,
                                  FishingBuddy.EnglishList(onames));
            end
         else
            FishingBuddy.Message(FBConstants.CLEANUP_NONEMSG);
         end
         return true;
      end
   end;

local function nextarg(msg, pattern)
   if ( not msg or not pattern ) then
      return nil, nil;
   end
   local s,e = string.find(msg, pattern);
   if ( s ) then
      local word = strsub(msg, s, e);
      msg = strsub(msg, e+1);
      return word, msg;
   end
   return nil, msg;
end

FishingBuddy.Command = function(msg)
   if ( not msg ) then
      return;
   end
   if ( FishingBuddy.IsLoaded() ) then
      -- collect arguments (whee, lua string manipulation)
      local cmd;
      cmd, msg = nextarg(msg, "[%w]+");

      -- the empty string gives us no args at all
      if ( not cmd ) then
         -- toggle window
         if ( FishingBuddyFrame:IsVisible() ) then
            HideUIPanel(FishingBuddyFrame);
         else
            ShowUIPanel(FishingBuddyFrame);
         end
      elseif ( cmd == FBConstants.HELP or cmd == "help" ) then
         FishingBuddy.Output(FBConstants.WINDOW_TITLE);
         FishingBuddy.PrintHelp(FBConstants.HELPMSG);
      else
         local command = FishingBuddy.Commands[cmd];
         if ( command ) then
            local args = {};
            local goodargs = true;
            if ( command.args ) then
               for _,pat in pairs(command.args) do
                  local w, msg = nextarg(msg, pat);
                  if ( not w ) then
                     goodargs = false;
                     break;
                  end
                  tinsert(args, w);
               end
            else
               local a;
               while ( msg ) do
                  a, msg = nextarg(msg, "[%w]+");
                  if ( not a ) then
                     break;
                  end
                  tinsert(args, a);
               end
            end
            if ( not goodargs or not command.func(unpack(args)) ) then
               if ( command.help ) then
                  FishingBuddy.PrintHelp(command.help);
               else
                  FishingBuddy.Debug("command failed");
               end
            end
         else
            FishingBuddy.Command("help");
         end
      end
   else
      FishingBuddy.Error(FBConstants.FAILEDINIT);
   end
end

FishingBuddy.TooltipBody = function(hintcheck)
   local text = FBConstants.DESCRIPTION1.."\n"..FBConstants.DESCRIPTION2;
   if ( hintcheck ) then
      local hint = FBConstants.TOOLTIP_HINT.." ";
      if (FishingBuddy.GetSetting(hintcheck) == 1) then
         hint = hint..FBConstants.TOOLTIP_HINTSWITCH;
      else
         hint = hint..FBConstants.TOOLTIP_HINTTOGGLE;
      end
      text = text.."\n"..FishingBuddy.Color("GREEN", hint);
   end
   return text;
end

local IsZoning;
local ZoneEvents;
local function TrackZoneEvents(evt)
   if ( IsZoning ) then
      if ( not ZoneEvents ) then
         ZoneEvents = {};
      end
      if ( ZoneEvents[evt] ) then
         ZoneEvents[evt] = ZoneEvents[evt] + 1;
      else
         ZoneEvents[evt] = 1;
      end
   end
end

local function DumpZoneEvents()
   FishingBuddy.Dump(ZoneEvents);
   ZoneEvents = nil;
end

FishingBuddy.OnEvent = function(self, event, ...)
--   local line = event;
--   for idx=1,select("#",...) do
--      line = line.." '"..select(idx,...).."'";
--   end
--   FishingBuddy.Debug(line);

-- TrackZoneEvents(event);
   if ( event == "ITEM_LOCK_CHANGED" ) then
      FishingMode();
   elseif ( event == "PLAYER_LOGIN" ) then
      -- set up outfit stuff
      playerName = UnitName("player");
      realmName = GetRealmName();
      CheckClockOffset();
      FishingMode();
      CreateFishingButton();
      RunHandlers(FBConstants.LOGIN_EVT);
   elseif ( event == "PLAYER_LOGOUT" ) then
      -- reset the fishing sounds, if we need to
      RunHandlers(FBConstants.LOGOUT_EVT);
      StopFishingMode();
      FishingBuddy.SavePlayerInfo();
   elseif ( event == "ADDON_LOADED" ) then
      FishingBuddy.Initialize();
      table.sort(FISHINGLURES, function(a,b) return a.b < b.b; end);
      this:UnregisterEvent("ADDON_LOADED");
   elseif ( event == "VARIABLES_LOADED" ) then
      FishingBuddy.OutfitManager.Initialize();
      this:UnregisterEvent("VARIABLES_LOADED");
   elseif ( event == "PLAYER_ENTERING_WORLD" ) then
      IsZoning = nil;
--    DumpZoneEvents();
      EventRegistration(this, true);
      this:RegisterEvent("ITEM_LOCK_CHANGED");
   elseif ( event == "PLAYER_LEAVING_WORLD") then
      IsZoning = 1;
      EventRegistration(this, false);
      this:UnregisterEvent("ITEM_LOCK_CHANGED");
   end
   FishingBuddy.Extravaganza.IsTime(true);

-- Run the handlers *after* we've processed it (e.g. VARIABLES_LOADED)
   RunHandlers(event, ...);
   RunHandlers("*", ...);
end

FishingBuddy.OnLoad = function()
   this:RegisterEvent("PLAYER_ENTERING_WORLD");
   this:RegisterEvent("PLAYER_LEAVING_WORLD");

   this:RegisterEvent("PLAYER_LOGIN");
   this:RegisterEvent("PLAYER_LOGOUT");
   this:RegisterEvent("ADDON_LOADED");
   this:RegisterEvent("VARIABLES_LOADED");

   this:SetScript("OnEvent", FishingBuddy.OnEvent);

   RegisterHandlers(CaptureEvents);
   RegisterHandlers(StatusEvents);

   -- Set up command
   SlashCmdList["fishingbuddy"] = FishingBuddy.Command;
   SLASH_fishingbuddy1 = "/fishingbuddy";
   SLASH_fishingbuddy2 = "/fb";
   
   FishingBuddy.Output(FBConstants.WINDOW_TITLE.." loaded");
end


FishingBuddy.PrintHelp = function(tab)
   if ( tab ) then
      if ( type(tab) == "table" ) then
         for _,line in pairs(tab) do
            FishingBuddy.PrintHelp(line);
         end
      else
         -- check for a reference to another help item
         local _,_,w = string.find(tab, "^@([A-Z0-9_]+)$");
         if ( w ) then
            FishingBuddy.PrintHelp(FBConstants[w]);
         else
            FishingBuddy.Output(tab);
         end
      end
   end
end

local efsv = nil;
FishingBuddy.EnhanceFishingSounds = function(enhance)
   if ( GetSetting("EnhanceFishingSounds") == 1 ) then
      if ( enhance ) then
         local mv = tonumber(GetCVar("Sound_MasterVolume"));
         local mu = tonumber(GetCVar("Sound_MusicVolume"));
         local av = tonumber(GetCVar("Sound_AmbienceVolume"));
         local sv = tonumber(GetCVar("Sound_SFXVolume"));
         local ws = tonumber(GetCVar("MapWaterSounds"));
         if ( not efsv ) then
         -- collect the current value
            efsv = {};
            efsv["Sound_MasterVolume"] = mv;
            efsv["Sound_MusicVolume"] = mu;
            efsv["Sound_AmbienceVolume"] = av;
            efsv["Sound_SFXVolume"] = sv;
            efsv["MapWaterSounds"] = ws;
         -- turn 'em off!
            for setting in pairs(efsv) do
               local value = GetSetting("Enhance"..setting);
               SetCVar(setting, value);
            end
         end
      else
         if ( efsv ) then
            for setting, value in pairs(efsv) do
               SetCVar(setting, value);
            end
            efsv = nil;
         end
      end
   end
end

-- Drop-down menu support
local function ToggleSetting(setting)
   local value = GetSetting(setting);
   if ( not value ) then
      value = 0;
   end
   SetSetting(setting, 1 - value);
   FishingBuddy.WatchUpdate();
   FishingBuddy.UpdateMinimap();
end
FishingBuddy.ToggleSetting = ToggleSetting;

-- save some memory by keeping one copy of each one
local ToggleFunctions = {};
-- let's use closures
local function MakeToggle(name)
   if ( not ToggleFunctions[name] ) then
      local n = name;
      ToggleFunctions[name] = function() ToggleSetting(n) end;
   end
   return ToggleFunctions[name];
end
FishingBuddy.MakeToggle = MakeToggle;

FishingBuddy.MakeDropDown = function(switchItem, switchSetting)
   local info;
   -- If no outfit frame, we can't switch outfits...
   if ( FishingBuddy.OutfitManager.HasManager() ) then
      info = {};
      info.text = switchItem;
      info.func = MakeToggle(switchSetting);
      info.checked = (GetSetting(switchSetting) == 1);
      info.keepShownOnClick = 1;
      UIDropDownMenu_AddButton(info);
      info = {};
      info.disabled = 1;
      UIDropDownMenu_AddButton(info);
   end

   for name,option in pairs(FishingBuddy.OPTIONS) do
      if ( option.m ) then
         local addthis = true;
         if ( option.check ) then
            addthis = option.check();
         end
         if ( addthis ) then
            info = {};
            info.text = option.text;
            info.func = MakeToggle(name);
            info.checked = (GetSetting(name) == 1);
            info.keepShownOnClick = 1;
            UIDropDownMenu_AddButton(info);
         end
      end
   end
end

-- utility functions
local function AddTooltipLine(l)
   if ( type(l) == "table" ) then
      -- either { t, c } or {{t1, c1}, {t2, c2}}
      if ( type(l[1]) == "table" ) then
         local c1 = SplitColor(l[1][2]) or {};
         local c2 = SplitColor(l[2][2]) or {};
         GameTooltip:AddDoubleLine(l[1][1], l[2][1],
                                   c1.r, c1.g, c1.b,
                                   c2.r, c2.g, c2.b);
      else
         local c = SplitColor(l[2]) or {};
         GameTooltip:AddLine(l[1], c.r, c.g, c.b, 1);
      end
   else
      GameTooltip:AddLine(l,nil,nil,nil,1);
   end
end
FishingBuddy.AddTooltipLine = AddTooltipLine;

FishingBuddy.AddTooltip = function(text)
   local c = color or {{}, {}};
   if ( text ) then
      if ( type(text) == "table" ) then
         for _,l in pairs(text) do
            AddTooltipLine(l);
         end
      else
         -- AddTooltipLine(text, color);
         GameTooltip:AddLine(text,nil,nil,nil,1);
      end
   end
end

FishingBuddy.ChatLink = function(item, name, color)
   if( item and name and ChatFrameEditBox:IsVisible() ) then
      if ( not color ) then
         color = FBConstants.Colors.WHITE;
      end
      local link = "|c"..color.."|Hitem:"..item.."|h["..name.."]|h|r";
      ChatFrameEditBox:Insert(link);
   end
end

FishingBuddy.FishSort = function(tab, forcename)
   if ( forcename or GetSetting("SortByPercent") == 0 ) then
      table.sort(tab, function(a,b) return (a.index and b.index and a.index<b.index) or
                                           (a.text and b.text and a.text<b.text); end);
   else
      table.sort(tab, function(a,b) return a.count and b.count and b.count<a.count; end);
   end
end

FishingBuddy.StripRaw = function(fishie)
   if ( fishie ) then
      local s,e = string.find(fishie, FBConstants.RAW.." ");
      if ( s ) then
         if ( s > 1 ) then
            fishie = string.sub(fishie, 1, s-1)..string.sub(fishie, e+1);
         else
            fishie = string.sub(fishie, e+1);
         end
      else
         s,e = string.find(fishie, " "..FBConstants.RAW);
         if ( s ) then
            fishie = string.sub(fishie, 1, s-1)..string.sub(fishie, e+1);
         end
      end
      return fishie;
   end
   -- this means an import failed somewhere
   return FBConstants.UNKNOWN;
end

FishingBuddy.ToggleDropDownMenu = function(level, value, menu, anchor, xOffset, yOffset)
   ToggleDropDownMenu(level, value, menu, anchor, xOffset, yOffset);
   if (not level) then
      level = 1;
   end
   local anchorName;
   if ( type(anchor) == "string" ) then
      anchorName = anchor;
   else
      anchorName = anchor:GetName();
   end
   local frame = getglobal("DropDownList"..level);
   local uiScale = UIParent:GetScale()
   if ( frame:GetRight() > ( GetScreenWidth()*uiScale ) ) then
      if ( anchorName == "cursor" ) then
         if ( not xOffset ) then
            xOffset = 0;
         end
         if ( not yOffset ) then
            yOffset = 0;
         end
         local cursorX, cursorY = GetCursorPosition();
         xOffset = -cursorX + xOffset;
         yOffset = cursorY + yOffset;
      else
         if ( not xOffset or not yOffset ) then
            xOffset = 8;
            yOffset = 22;
         end
      end
      frame:ClearAllPoints();
      frame:SetPoint("TOPRIGHT", anchorName, "BOTTOMLEFT", -xOffset, yOffset);
   end
   if ( frame:GetBottom() < 0 ) then
      frame:ClearAllPoints();
      frame:SetPoint("BOTTOMRIGHT", anchorName, "BOTTOMLEFT", -xOffset, yOffset);
   end
end

FishingBuddy.EnglishList = function(list, conjunction)
   if ( list ) then
      local n = table.getn(list);
      local str = "";
      for idx=1,n do
         local name = list[idx];
         if ( idx == 1 ) then
            str = name;
         elseif ( idx == n ) then
            str = str .. ", ";
            if ( conjunction ) then
               str = str .. conjunction;
            else
               str = str .. "and";
            end
               str = str .. " " .. name;
         else
            str = str .. ", " .. name;
         end
      end
      return str;
   end
end

FishingBuddy.UIError = function(msg)
   -- Okay, this check is probably not necessary...
   if ( UIErrorsFrame ) then
      UIErrorsFrame:AddMessage(msg, 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
   else
      FishingBuddy.Error(msg);
   end
end

FishingBuddy.Testing = function(line)
   if ( not FishingBuddy_Info["Testing"] ) then
      FishingBuddy_Info["Testing"] = {};
   end
   tinsert(FishingBuddy_Info["Testing"], line);
end

FishingBuddy.CheckBuffs = function()
   local buffs, i = { }, 1;
   local buff = UnitBuff("player", i);
   while buff do
      buffs[#buffs + 1] = buff;
      i = i + 1;
      buff = UnitBuff("player", i);
   end;
   if #buffs < 1 then
      buffs = "You have no buffs";
   else
      buffs[1] = "You're buffed with: "..buffs[1];
      buffs = table.concat(buffs, ", ");
   end;
   DEFAULT_CHAT_FRAME:AddMessage(buffs);
end
