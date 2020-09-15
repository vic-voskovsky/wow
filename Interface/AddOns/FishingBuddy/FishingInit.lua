-- FishingBuddy
--
-- Everything you wanted support for in your fishing endeavors

local gotSetupDone = false;
local lastVersion;
local playerName;
local realmName;

local zmto = FishingBuddy.ZoneMarkerTo;
local zmex = FishingBuddy.ZoneMarkerEx;

local DEFAULT_MINIMAP_POSITION = 256;

local function tablecount(tab)
   local n = 0;
   for k,v in pairs(tab) do
      n = n + 1;
   end
   return n;
end
FishingBuddy.tablecount = tablecount;

FishingBuddy.IsLoaded = function()
   return gotSetupDone;
end

-- if the old information is still there, then we might not have per
-- character saved info, so let's save it away just in case. It'll go
-- away the second time we load the add-on
FishingBuddy.SavePlayerInfo = function()
   if ( FishingBuddy_Info[realmName] and
        FishingBuddy_Info[realmName]["Settings"] and
        FishingBuddy_Info[realmName]["Settings"][playerName] ) then
      local tabs = { "Settings", "Outfit", "WasWearing" };
      for _,tab in pairs(tabs) do
         for k,v in pairs(FishingBuddy_Player[tab]) do
            FishingBuddy_Info[realmName][tab][playerName][k] = v;
         end
      end
   end
end

local FishingInit = {};

-- Fill in the player name and realm
FishingInit.SetupNameInfo = function()
   playerName = UnitName("player");
   realmName = GetRealmName();
   return playerName, realmName;
end

FishingInit.CheckPlayerInfo = function()
   local tabs = { "Settings", "Outfit", "WasWearing" };
   if ( not FishingBuddy_Player ) then
      FishingBuddy_Player = {};
      for _,tab in pairs(tabs) do
         FishingBuddy_Player[tab] = { };
      end
      if ( FishingBuddy_Info[realmName] and
           FishingBuddy_Info[realmName]["Settings"] and
           FishingBuddy_Info[realmName]["Settings"][playerName] ) then
         for _,tab in pairs(tabs) do
            if ( FishingBuddy_Info[realmName][tab] and
                 FishingBuddy_Info[realmName][tab][playerName] ) then
               for k,v in pairs(FishingBuddy_Info[realmName][tab][playerName]) do
                  FishingBuddy_Player[tab][k] = v;
               end
            end
         end
      end
   elseif ( FishingBuddy_Info[realmName] and
           FishingBuddy_Info[realmName]["Settings"] ) then
      -- the saved information is there, kill the old stuff
      for _,tab in pairs(tabs) do
         if ( FishingBuddy_Info[realmName][tab] ) then
            FishingBuddy_Info[realmName][tab][playerName] = nil;
            -- Duh, table.getn doesn't work because there
            -- aren't any integer keys in this table
            if ( next(FishingBuddy_Info[realmName][tab]) == nil ) then
               FishingBuddy_Info[realmName][tab] = nil;
            end
         end
      end
      if ( next(FishingBuddy_Info[realmName]) == nil ) then
         FishingBuddy_Info[realmName] = nil;
      end
   end
end

FishingInit.CheckPlayerSetting = function(setting, defaultvalue)
   if ( not FishingBuddy_Player["Settings"] ) then
      FishingBuddy_Player["Settings"] = { };
   end
   if ( not FishingBuddy_Player["Settings"][setting] ) then
      FishingBuddy_Player["Settings"][setting] = defaultvalue;
   end
end

FishingInit.CheckGlobalSetting = function(setting, defaultvalue)
   if ( not FishingBuddy_Info[setting] ) then
      if ( not defaultvalue ) then
         FishingBuddy_Info[setting] = {};
      else
         FishingBuddy_Info[setting] = defaultvalue;
      end
   end
end

FishingInit.CheckRealm = function()
   local tabs = { "Settings", "Outfit", "WasWearing" };
   for _,tab in pairs(tabs) do
      if ( FishingBuddy_Info[tab] ) then
         local old = FishingBuddy_Info[tab][playerName];
         if ( old ) then
            if ( not FishingBuddy_Info[realmName] ) then
               FishingBuddy_Info[realmName] = { };
               for _,tab in pairs(tabs) do
                  FishingBuddy_Info[realmName][tab] = { };
               end
            end

            FishingBuddy_Info[realmName][tab][playerName] = { };
            for k, v in pairs(old) do
               FishingBuddy_Info[realmName][tab][playerName][k] = v;
            end
            FishingBuddy_Info[tab][playerName] = nil;
         end

         -- clean out cruft, if we have some
         FishingBuddy_Info[tab][UNKNOWNOBJECT] = nil;
         FishingBuddy_Info[tab][UKNOWNBEING] = nil;

         -- Duh, table.getn doesn't work because there
         -- aren't any integer keys in this table
         if ( next(FishingBuddy_Info[tab]) == nil ) then
            FishingBuddy_Info[tab] = nil;
         end
      end
   end
end

FishingInit.SetupZoneMapping = function()
   local continentNames = { GetMapContinents() };
   if ( not FishingBuddy_Info["ZoneIndex"] ) then
      FishingBuddy_Info["ZoneIndex"] = {};
   end
   if ( not FishingBuddy_Info["SubZones"] ) then
            FishingBuddy_Info["SubZones"] = {};
   end
end

FishingInit.UpdateFishingDB = function()
   local version = FishingBuddy_Info["Version"];
   if ( not version ) then
      version = 8700; -- be really old
   end

   if ( version < 8900 and FishingBuddy_Info["FishTracking"] ) then
      for idx,how in pairs({ "HOURLY", "WEEKLY" }) do
         for id,info in pairs(FishingBuddy_Info["FishTracking"][how]) do
            if ( info.name == FBConstants.FISH.." ("..id..")" ) then
               info.name = nil;
            end
         end
      end
   end

   if ( version < 8901 ) then
      local clickToSwitch;
      for idx,click in pairs({ "Titan", "Fubar", "InfoBar" }) do
         local setting = click.."ClickToSwitch";
         local s = FishingBuddy_Player["Settings"][setting];
         if ( s ~= nil ) then
            clickToSwitch = s;
         end
         FishingBuddy_Player["Settings"][setting] = nil;
      end
      FishingBuddy_Player["Settings"]["ClickToSwitch"] = clickToSwitch;
   end

   if ( version < 8904 ) then
      local loc = GetLocale();
      for id,info in pairs(FishingBuddy_Info["Fishies"]) do
         if ( not info.name ) then
            if ( FishingBuddy.QuestItems[id] ) then
               local name = FishingBuddy.QuestItems[id][loc];
               if ( not name ) then
                  name = FishingBuddy.QuestItems[id]["enUS"];
               end
               FishingBuddy_Info["Fishies"][id].name = name;
            end
         end
      end
   end

   if ( version < 8909 ) then
      -- clean out old options that no longer apply
      FishingBuddy.SetSetting("SuitUpFirst", nil);
      FishingBuddy.SetSetting("SuitUpKeys", nil);
      FishingBuddy.SetSetting("SingleCast", nil);
      FishingBuddy.SetSetting("UseGatherer", nil);
      FishingBuddy.SetSetting("UseButtonHole", nil);
   end

   if ( version < 9302 ) then
      local map = {};
      map["EnhanceSoundMusicVolume"] = "EnhanceSound_MasterVolume";
      map["EnhanceSoundAmbienceVolume"] = "EnhanceSound_AmbienceVolume";
      map["EnhanceSoundSoundVolume"] = "EnhanceSound_SFXVolume";
      map["EnhanceSoundMapWaterSounds"] = "EnhanceMapWaterSounds";
      for old,new in pairs(map) do
         local setting = FishingBuddy.GetSetting(old);
         FishingBuddy.SetSetting(new, setting);
         FishingBuddy.SetSetting(old, nil);
      end
   end
   
   -- save this for other pieces that might need to update
   lastVersion = version;

   FishingBuddy_Info["Version"] = FBConstants.CURRENTVERSION;
end

FishingBuddy.GetLastVersion = function()
   return lastVersion;
end

-- Based on code in QuickMountEquip
FishingInit.HookFunction = function(func, newfunc)
   local oldValue = getglobal(func);
   if ( oldValue ~= getglobal(newfunc) ) then
      setglobal(func, getglobal(newfunc));
      return true;
   end
   return false;
end

-- set up alternate view of fish data. do this as startup to
-- lower overall dynamic hit when loading the window
FishingInit.SetupByFishie = function()
   if ( not FishingBuddy.ByFishie ) then
      local fh = FishingBuddy_Info["FishingHoles"];
      local ff = FishingBuddy_Info["Fishies"];
      FishingBuddy.ByFishie = { };
      FishingBuddy.SortedFishies = { };
      for idx,info in pairs(fh) do
         for id,quantity in pairs(info) do
            if ( not FishingBuddy.ByFishie[id] ) then
               FishingBuddy.ByFishie[id] = { };
               if ( ff[id] ) then
                  tinsert(FishingBuddy.SortedFishies,
                          { text = ff[id].name, id = id });
               end
            end
            if ( not FishingBuddy.ByFishie[id][idx] ) then
               FishingBuddy.ByFishie[id][idx] = quantity;
            else
               FishingBuddy.ByFishie[id][idx] = FishingBuddy.ByFishie[id][idx] + quantity;
            end
         end
      end
      FishingBuddy.FishSort(FishingBuddy.SortedFishies, true);
   end
end

FishingInit.InitSortHelpers = function()
   local fh = FishingBuddy_Info["FishingHoles"];
   FishingBuddy.SortedZones = {};
   FishingBuddy.SortedByZone = {};
   FishingBuddy.SortedSubZones = {};
   FishingBuddy.UniqueSubZones = {};
   FishingBuddy.SubZoneMap = {};
   for zidx,zone in ipairs(FishingBuddy_Info["ZoneIndex"]) do
      tinsert(FishingBuddy.SortedZones, zone);
      FishingBuddy.SortedByZone[zone] = {};
      local idx = zmto(zidx, 0);
      local count = FishingBuddy_Info["SubZones"][idx];
      if ( count ) then
         for s=1,count,1 do
            idx = zmto(zidx,s);
            local subzone = FishingBuddy_Info["SubZones"][idx];
            tinsert(FishingBuddy.SortedByZone[zone], subzone);
            FishingBuddy.UniqueSubZones[subzone] = 1;
            if ( not FishingBuddy.SubZoneMap[subzone] ) then
               FishingBuddy.SubZoneMap[subzone] = {};
            end
            FishingBuddy.SubZoneMap[subzone][idx] = 1;
         end
         table.sort(FishingBuddy.SortedByZone[zone]);
      end
   end
   table.sort(FishingBuddy.SortedZones);
   for subzone,_ in pairs(FishingBuddy.UniqueSubZones) do
      tinsert(FishingBuddy.SortedSubZones, subzone);
   end
   table.sort(FishingBuddy.SortedSubZones);
end

FishingInit.FixupZones = function()
   local fixupzones = false;
   for idx,zone in pairs(FishingBuddy_Info["ZoneIndex"]) do
      if ( type(zone) ~= "string" ) then
         fixupzones = true;
         break;
      end
   end
   if ( not fixupzones and FishingBuddy_Info["FishingHoles"] ) then
      for zone,info in pairs(FishingBuddy_Info["FishingHoles"]) do
         if ( type(zone) == "string" ) then
            fixupzones = true;
            break;
         end
      end
   end
   if ( not fixupzones and FishingBuddy_Info["FishingSkill"] ) then
      for zone,info in pairs(FishingBuddy_Info["FishingSkill"]) do
         if ( type(zone) == "string" ) then
            fixupzones = true;
            break;
         end
      end
   end

   if ( fixupzones ) then
      local newholes = {};
      for zone,info in pairs(FishingBuddy_Info["FishingHoles"]) do
         if ( type(zone) == "string" ) then
            if ( not newholes[zone] ) then
               newholes[zone] = info;
            else
               newholes[zone] = {};
               for subzone,fish in pairs(info) do
                  if ( not newholes[zone][subzone] ) then
                     newholes[zone][subzone] = fish;
                  else
                     newholes[zone][subzone] = {};
                     for fishid,count in pairs(fish) do
                        newholes[zone][subzone][fishid] = count;
                     end
                  end
               end
            end
         else
             local zint,_ = zmex(zone);
             local z = FishingBuddy_Info["ZoneIndex"][zint];
             local s = FishingBuddy_Info["SubZones"][zone];
             if ( not newholes[z] ) then
                newholes[z] = {};
             end
             if ( not newholes[z][s] ) then
                newholes[z][s] = {};
             end
             for fishid,count in pairs(info) do
                newholes[z][s][fishid] = count;
             end
         end
      end

      local newskills = {};
      for zone,info in pairs(FishingBuddy_Info["FishingSkill"]) do
         if ( type(zone) == "string" ) then
            if ( not newskills[zone] ) then
               newskills[zone] = info;
            else
               newskills[zone] = {};
               for subzone,skill in pairs(info) do
                  newskills[zone][subzone] = skill;
               end
            end
         else
             local zint,_ = zmex(zone);
             local z = FishingBuddy_Info["ZoneIndex"][zint];
             local s = FishingBuddy_Info["SubZones"][zone];
             if ( not newskills[z] ) then
                newskills[z] = {};
             end
             newskills[z][s] = info;
         end
      end

      local azi = FishingBuddy.AddZoneIndex;
      FishingBuddy_Info["ZoneIndex"] = {};
      FishingBuddy_Info["SubZones"] = {};

      FishingBuddy.SortedZones = {};
      FishingBuddy.SortedByZone = {};
      FishingBuddy.SortedSubZones = {};
      FishingBuddy.UniqueSubZones = {};
      FishingBuddy.SubZoneMap = {};

      local ft = {};
      local fh = {};
      for zone,info in pairs(newholes) do
         local zidx = azi(zone);
         for subzone,stuff in pairs(info) do
            local zidx,sidx = azi(zone,subzone);
            local zidm = zmto(zidx,0);
            local sidm = zmto(zidx,sidx);
            if ( not fh[sidm] ) then
               fh[sidm] = {};
            end
            local fh = fh[sidm];
            for fishid,count in pairs(stuff) do
               if ( fh[fishid] ) then
                  fh[fishid] = fh[fishid] + count;
               else
                  fh[fishid] = count;
               end
               if ( ft[zidm] ) then
                  ft[zidm] = ft[zidm] + count;
               else
                  ft[zidm] = count;
               end
               if ( ft[sidm] ) then
                  ft[sidm] = ft[sidm] + count;
               else
                  ft[sidm] = count;
               end
            end
         end
      end
      FishingBuddy_Info["FishingHoles"] = fh;
      FishingBuddy_Info["FishTotals"] = ft;

      local fs = {};
      for zone,info in pairs(newskills) do
         for subzone,skill in pairs(info) do
            local zidx,sidx = azi(zone,subzone);
            local zidm = zmto(zidx,0);
            local sidm = zmto(zidx,sidx);
            if ( not fs[sidm] or fs[sidm] > skill ) then
               fs[sidm] = skill;
            end
            if ( not fs[zidm] or fs[zidm] > skill ) then
               fs[zidm] = skill;
            end
         end
      end
      FishingBuddy_Info["FishingSkill"] = fs;

   end
end

FishingInit.InitSettings = function()
   if( not FishingBuddy_Info ) then
      FishingBuddy_Info = { };
   end
   -- global stuff
   FishingInit.SetupZoneMapping();
   FishingInit.CheckRealm();

   FishingInit.CheckGlobalSetting("ImppDBLoaded", 0);
   FishingInit.CheckGlobalSetting("FishInfo2", 0);
   FishingInit.CheckGlobalSetting("DataFish", 0);
   FishingInit.CheckGlobalSetting("FishTotals");
   FishingInit.CheckGlobalSetting("FishingHoles");
   FishingInit.CheckGlobalSetting("FishingSkill");
   FishingInit.CheckGlobalSetting("Fishies");
   FishingInit.CheckGlobalSetting("HiddenFishies");

   FishingInit.CheckPlayerInfo();

   -- per user stuff
   if ( not FishingBuddy_Player["Settings"] ) then
      FishingBuddy_Player["Settings"] = { };
   end
   FishingInit.FixupZones();
   FishingInit.SetupByFishie();
   FishingInit.UpdateFishingDB();
   FishingInit.InitSortHelpers();
end

FishingInit.RegisterMyAddOn = function()
   -- Register the addon in myAddOns
   if (myAddOnsFrame_Register) then
      local details = {
         name = FBConstants.ID,
         description = FBConstants.DESCRIPTION,
         version = FBConstants.VERSION,
         releaseDate = 'July 21, 2005',
         author = 'Sutorix',
         email = 'Windrunner',
         category = MYADDONS_CATEGORY_PROFESSIONS,
         frame = "FishingBuddy",
         optionsframe = "FishingBuddyFrame",
      };
      local help = "";
      for _,line in pairs(FBConstants.HELPMSG) do
         if ( type(line) == "table" ) then
            for _,l in pairs(line) do
               help = help.."\n"..l;
            end
         else
            help = help.."\n"..line;
         end
      end
      myAddOnsFrame_Register(details, { help });
   end
end

FishingInit.RegisterFunctionTraps = function()
   temp = ToggleMinimap;
   if ( FishingInit.HookFunction("ToggleMinimap", "FishingBuddy_ToggleMinimap") ) then
      FishingBuddy.SavedToggleMinimap = temp;
   end
   FishingBuddy.TrapWorldMouse()
   FishingBuddy.TrapUIErrors();
end

FishingBuddy.Initialize = function()
   -- Set everything up, then dump the code we don't need anymore
   playerName, realmName = FishingInit.SetupNameInfo();
   if ( FishingInit ) then
      FishingInit.RegisterFunctionTraps();
      FishingInit.InitSettings();
      -- register with myAddOn
      FishingInit.RegisterMyAddOn();
      -- clean out some beta trash
      FishingBuddy.SetSetting("ClockOffset", nil);

      FishingBuddy.Schools.Init();

      gotSetupDone = true;
      FishingBuddy.WatchUpdate();
      -- debugging state
      FishingBuddy.Debugging = FishingBuddy.GetSetting("FishDebug");
      -- we don't need these functions anymore, gc 'em
      FishingInit = nil;
   end
end
