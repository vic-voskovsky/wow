-- Display the fish you're catching and/or have caught in a live display

FishingBuddy.WatchFrame = {};

local MAX_FISHINGWATCH_LINES = 20;
local WATCHDRAGGER_SHOW_DELAY = 0.2;

local WATCHDRAGGER_FADE_TIME = 0.15;

local zmto = FishingBuddy.ZoneMarkerTo;
local zmex = FishingBuddy.ZoneMarkerEx;

local ZoneFishingTime;
local TotalTimeFishing;

local function PlaceDraggerFrame()
   local where = FishingBuddy.GetSetting("WatcherLocation");
   if ( not where ) then
      where = {};
      where.x = 0;
      where.y = -384;
   end
   FishingWatchDrag:ClearAllPoints();
   FishingWatchDrag:SetPoint("TOPLEFT", "UIParent", "TOPLEFT",
                                  where.x, where.y);
end

local function ShowDraggerFrame()
   if ( not FishingWatchDrag:IsVisible() ) then
      FishingWatchFrame:Show();
      local width = FishingWatchFrame:GetWidth();
      local height = FishingWatchFrame:GetHeight();
      FishingWatchDrag:SetHeight(height);
      FishingWatchDrag:SetWidth(width);
      FishingWatchTab:SetText(FBConstants.NAME);
      PanelTemplates_TabResize(10, FishingWatchTab);
      FishingWatchDrag:Show();
      FishingWatchTab:Show();
      UIFrameFadeIn(FishingWatchDrag, WATCHDRAGGER_FADE_TIME, 0, 0.15);
      UIFrameFadeIn(FishingWatchTab, WATCHDRAGGER_FADE_TIME, 0, 1.0);
      GameTooltip_AddNewbieTip(FBConstants.NAME, 1.0, 1.0, 1.0,
                               FBConstants.WATCHERCLICKHELP, 1);
   end
end

local function HideDraggerFrame(save)
   if ( FishingWatchDrag:IsVisible() ) then
      if ( save ) then
         FishingWatchFrame:Show();
         local qx = UIParent:GetLeft()
         local qy = UIParent:GetTop();
         local wx = FishingWatchDrag:GetLeft()
         local wy = FishingWatchDrag:GetTop();
         local where;
         if ( wx and wy ) then
            where = {};
            where.x = wx - qx;
            where.y = wy - qy;
         end
         FishingBuddy.SetSetting("WatcherLocation", where);
      end
      UIFrameFadeOut(FishingWatchDrag, WATCHDRAGGER_FADE_TIME, 0.15, 0);
      UIFrameFadeOut(FishingWatchTab, WATCHDRAGGER_FADE_TIME, 1.0, 0);
      FishingWatchDrag:Hide();
      FishingWatchTab:Hide();
      GameTooltip:Hide();
   end
end

local function ResetWatcherFrame(update)
   FishingWatchTab:Show();
   FishingWatchDrag:Show();
   FishingWatchDrag:ClearAllPoints();
   FishingWatchDrag:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
   HideDraggerFrame(true);
   if ( update ) then
      FishingBuddy.WatchUpdate();
   end
end

FishingBuddy.ShowDraggerFrame = ShowDraggerFrame;
FishingBuddy.HideDraggerFrame = HideDraggerFrame;
FishingBuddy.PlaceDraggerFrame = PlaceDraggerFrame;
FishingBuddy.ResetWatcherFrame = ResetWatcherFrame;

FishingBuddy.Commands[FBConstants.WATCHER] = {};
FishingBuddy.Commands[FBConstants.WATCHER].help = FBConstants.WATCHER_HELP;
FishingBuddy.Commands[FBConstants.WATCHER].func =
   function(what)
      if ( what and ( what == FBConstants.RESET ) ) then
         ResetWatcherFrame(true);
         return true;
      end
   end;

-- keep track of what's going on
local caughtSoFar = 0;
local lastSkillCheck = 0;
local WatchEvents = {};
WatchEvents["MINIMAP_ZONE_CHANGED"] = function()
   if ( not FishingBuddy.IsLoaded() ) then
      return;
   end
   FishingBuddy.currentFishies = {};
   FishingBuddy.WatchUpdate();
end

WatchEvents["SKILL_LINES_CHANGED"] = function()
   if ( FishingBuddy.GetSetting("WatchCurrentSkill") == 1 ) then
      FishingBuddy.WatchUpdate();
   end
end

WatchEvents["SPELLCAST_STOP"] = function()
   if ( FishingWatchFrame:IsVisible() ) then
      -- update the skill line if we have one
      if ( FishingBuddy.GetSetting("WatchCurrentSkill") == 1 ) then
         FishingBuddy.WatchUpdate();
      end
   end
end

WatchEvents[FBConstants.ADD_FISHIE_EVT] = function()
   if ( FishingWatchFrame:IsVisible() ) then
      caughtSoFar = caughtSoFar + 1;
      FishingBuddy.WatchUpdate();
   end
end

WatchEvents["VARIABLES_LOADED"] = function()
   if (not TotalTimeFishing) then
      caughtSoFar = FishingBuddy.GetSetting("CaughtSoFar");
      TotalTimeFishing = FishingBuddy.GetSetting("TotalTimeFishing");
      ZoneFishingTime = 0;
   end
   local skill, mods = FishingBuddy.GetCurrentSkill();
   lastSkillCheck = skill;
end

WatchEvents[FBConstants.FISHING_DISABLED_EVT] = function(started)
   ZoneFishingTime = ZoneFishingTime + GetTime() - started;
end

WatchEvents["ZONE_CHANGED_NEW_AREA"] = function()
   TotalTimeFishing = TotalTimeFishing + ZoneFishingTime;
   ZoneFishingTime = 0;
end

WatchEvents[FBConstants.LOGOUT_EVT] = function()
   FishingBuddy.SetSetting("CaughtSoFar", caughtSoFar);
   FishingBuddy.SetSetting("TotalTimeFishing", TotalTimeFishing + ZoneFishingTime);
end

-- fix old data
local function UpdateUnknownZone(zone, subzone, zidx, sidx)
   local uzidx = FishingBuddy.GetZoneIndex(FBConstants.UNKNOWN);
   if ( uzidx ) then
      local fh = FishingBuddy_Info["FishingHoles"];
      local uidx = zmto(uzidx,0);
      local count = FishingBuddy_Info["SubZones"][uidx];
      for s=1,count,1 do
         uidx = zmto(uzidx, s);
         if ( fh[uidx] ) then
            local uszone = FishingBuddy_Info["SubZones"][uidx];
            if ( uszone == subzone ) then
               for k,v in pairs(fh[uidx]) do
                  if ( fh[idx][k] ) then
                     fh[idx][k] = fh[idx][k] + v;
                  else
                     fh[idx][k] = v;
                  end
               end
               for k,_ in pairs(fh[uidx]) do
                  fh[uidx][k] = nil;
               end
            end
         end
      end
   end
end

local function Fix0(i)
   local str = "";
   if ( i < 10 ) then
      str = "0";
   end
   return str..i;
end

local function DisplayedTime(elapsed)
   local t = math.floor(elapsed);
   local mod = math.fmod;
   local seconds = mod(t, 60);
   t = math.floor(t / 60);
   local minutes = mod(t, 60);
   local hours = math.floor(t / 60);
   return Fix0(hours)..":"..Fix0(minutes)..":"..Fix0(seconds);
end

-- Fish watcher functions
local function WatchUpdate(justTime)
   if ( not justTime and FishingWatchFrame:IsVisible() ) then
      HideDraggerFrame();
      FishingWatchFrame:Hide();
      for i=1, MAX_FISHINGWATCH_LINES, 1 do
         local line = getglobal("FishingWatchLine"..i);
         line:Hide();
      end
      FishingBuddy_WatchTimeFrame:Hide();
   end

   local reset = FishingBuddy.GetSetting("ResetWatcher");
   if ( not reset or reset < 1 ) then
      ResetWatcherFrame(false);
      FishingBuddy.SetSetting("ResetWatcher", 1);
   end

   local zone, subzone = FishingBuddy.GetZoneInfo();
   local zidx, sidx = FishingBuddy.GetZoneIndex(zone, subzone);

   UpdateUnknownZone(zone, subzone, zidx, sidx);

   if ( FishingBuddy.GetSetting("WatchFishies") == 0 ) then
      return;
   end

   if ( FishingBuddy.GetSetting("WatchOnlyWhenFishing") == 1 and
       not FishingBuddy.API.IsFishingPole() ) then
      return;
   end

   local idx = zmto(zidx, sidx);
   local fz = FishingBuddy_Info["FishingHoles"];
   local current = FishingBuddy.currentFishies;
   local ff = FishingBuddy_Info["Fishies"];
   local fishingWatchMaxWidth = 0;
   local tempWidth;
   local index = 1;
   local start = 1;
   local dopercent = FishingBuddy.GetSetting("WatchFishPercent");

   if ( FishingBuddy.GetSetting("WatchElapsedTime") == 1 ) then
      local elapsed = nil;
      local StartedFishing = FishingBuddy.StartedFishing;
      if ( StartedFishing ) then
         local elapsed = ZoneFishingTime + GetTime() - StartedFishing;
         local text = "Elapsed: "..DisplayedTime(elapsed).."/"..DisplayedTime(elapsed + TotalTimeFishing);
         local entry = getglobal("FishingWatchLine"..index);
         entry:SetText(text);
         local tempWidth = entry:GetWidth();
         if ( tempWidth > fishingWatchMaxWidth ) then
            fishingWatchMaxWidth = tempWidth;
         end
         entry:Show();
         FishingBuddy_WatchTimeFrame:Show();
         if ( justTime ) then
            return;
         end
         index = index + 1;
      end
   else
      FishingBuddy_WatchTimeFrame:Hide();
   end
   
   if ( FishingBuddy.GetSetting("WatchCurrentZone") == 1 ) then
      local entry = getglobal("FishingWatchLine"..index);
      local line = zone.." : "..subzone;
      entry:SetText(line);
      local tempWidth = entry:GetWidth();
      if ( tempWidth > fishingWatchMaxWidth ) then
         fishingWatchMaxWidth = tempWidth;
      end
      entry:Show();
      index = index + 1;
   end
   if ( FishingBuddy.GetSetting("WatchCurrentSkill") == 1 ) then
      local entry = getglobal("FishingWatchLine"..index);
      local skill, mods = FishingBuddy.GetCurrentSkill();
      local totskill = skill + mods;
      local line = "Skill: |cff00ff00"..skill.."+"..mods.."|r |cffc7c7cf["..totskill.."]|r";
      if ( skill < 375 ) then
         local needed = math.floor((skill - 75) / 25);
         if ( needed < 1 ) then
            needed = 1;
         end
         if ( lastSkillCheck ~= skill ) then
            caughtSoFar = 0;
            lastSkillCheck = skill;
         end
         line = line.." ("..caughtSoFar.."/~"..needed..")";
      end
      entry:SetText(line);
      local tempWidth = entry:GetWidth();
      if ( tempWidth > fishingWatchMaxWidth ) then
         fishingWatchMaxWidth = tempWidth;
      end
      entry:Show();
      index = index + 1;
   end
   
   local fishsort = {};
   local totalCount = 0;
   local totalCurrent = 0;
   local gotDiffs = false;

   if ( fz and fz[idx] ) then
      for fishid in pairs(fz[idx]) do
         local info = {};
         if ( not FishingBuddy_Info["HiddenFishies"][fishid] ) then
            info.text = ff[fishid].name;
         end
         info.count = fz[idx][fishid];
         totalCount = totalCount + info.count;
         if ( current[idx] ) then
            info.current = current[idx][fishid] or 0;
         else
            info.current = 0;
         end
         if ( info.current > 0 and info.current ~= info.count ) then
            gotDiffs = true;
         end
         totalCurrent = totalCurrent + info.current;
         tinsert(fishsort, info);
      end

--   if ( totalCount == 0 and totalCurrent == 0 ) then
--      return;
--   end

      FishingBuddy.FishSort(fishsort);
   end

   for j=1,table.getn(fishsort),1 do
      local info = fishsort[j];
      if( index <= MAX_FISHINGWATCH_LINES ) then
         local entry = getglobal("FishingWatchLine"..index);
         local fishie = info.text;
         if ( fishie ) then
            fishie = FishingBuddy.StripRaw(fishie);
            local amount = info.count;
            local fishietext = fishie.." ("..amount;
            if ( dopercent == 1 ) then
               local percent = format("%.1f", ( amount / totalCount ) * 100);
               fishietext = fishietext.." : "..percent.."%";
            end
            if ( gotDiffs ) then
               amount = info.current;
               local color;
               fishietext = fishietext..", |c"..FBConstants.Colors.GREEN..amount;
               if ( dopercent == 1 ) then
                  local percent = format("%.1f", ( amount / totalCurrent ) * 100);
                  fishietext = fishietext.." : "..percent.."%";
               end
               fishietext = fishietext.."|r";
            end
            fishietext = fishietext..")";
            entry:SetText(fishietext);
            tempWidth = entry:GetWidth();
            entry:Show();
            if ( tempWidth > fishingWatchMaxWidth ) then
               fishingWatchMaxWidth = tempWidth;
            end
            index = index + 1;
         end
      end
   end

   FishingWatchFrame:SetHeight((index - 1) * 13);
   FishingWatchFrame:SetWidth(fishingWatchMaxWidth + 10);
   ShowDraggerFrame();
   PlaceDraggerFrame();
   FishingWatchFrame:Show();
end
FishingBuddy.WatchUpdate = WatchUpdate;

FishingBuddy.WatchFrame.OnLoad = function()
   this:ClearAllPoints();
   this:SetPoint("TOPLEFT", "FishingWatchDrag", "TOPLEFT", 0, 0);

   -- Make everything draw at least once
   FishingWatchDrag:Show();
   FishingWatchTab:Show();
   FishingWatchDrag:Hide();
   FishingWatchTab:Hide();

   FishingBuddy.API.RegisterHandlers(WatchEvents);
end

local hover;
FishingBuddy.WatchFrame.OnUpdate = function(elapsed)
   if ( FishingWatchFrame:IsVisible() ) then
      if ( MouseIsOver(FishingWatchFrame) or
          ( FishingWatchTab:IsVisible() and MouseIsOver(FishingWatchTab) ) ) then
         local xPos, yPos = GetCursorPosition();
         if ( hover ) then
            if ( hover.xPos == xPos and hover.yPos == yPos ) then
               hover.hoverTime = hover.hoverTime + elapsed;
            else
               hover.hoverTime = 0;
               hover.xPos = xPos;
               hover.yPos = yPos;
            end
         else
            hover = {};
            hover.hoverTime = 0;
            hover.xPos = xPos;
            hover.yPos = yPos;
         end
         if ( hover.hoverTime > WATCHDRAGGER_SHOW_DELAY ) then
            ShowDraggerFrame();
         end
      else
         HideDraggerFrame(true);
         hover = nil;
      end
   elseif ( hover ) then
      HideDraggerFrame(true);
      hover = nil;
   end
end

FishingBuddy.WatchFrame.OnMouseDown = function()
   if ( arg1 == "LeftButton" ) then
      FishingWatchDrag:StartMoving();
   end
end

FishingBuddy.WatchFrame.OnMouseUp = function()
   if ( arg1 == "LeftButton" ) then
      FishingWatchDrag:StopMovingOrSizing();
   end
end

local function HiddenFishToggle(id)
   if ( FishingBuddy_Info["HiddenFishies"][id] ) then
      FishingBuddy_Info["HiddenFishies"][id] = nil;
   else
      FishingBuddy_Info["HiddenFishies"][id] = true;
   end;
   FishingBuddy.WatchUpdate();
end

-- save some memory by keeping one copy of each one
local WatcherToggleFunctions = {};
-- let's use closures
local function WatcherMakeToggle(fishid)
   if ( not WatcherToggleFunctions[fishid] ) then
      local id = fishid;
      WatcherToggleFunctions[fishid] = function() HiddenFishToggle(id); end;
   end
   return WatcherToggleFunctions[fishid];
end
FishingBuddy.WatchFrame.MakeToggle = WatcherMakeToggle;

local function WatchMenu_Initialize()
   local zidx, sidx = FishingBuddy.GetZoneIndex();
   local fz = FishingBuddy_Info["FishingHoles"][zidx];
   if ( fz and fz[sidx] ) then
      local ff = FishingBuddy_Info["Fishies"];
      for fishid in pairs(fz[sidx]) do
         info = {};
         info.text = ff[fishid].name;
         info.func = WatcherMakeToggle(fishid);
         info.checked = ( not FishingBuddy_Info["HiddenFishies"][fishid] );
         info.keepShownOnClick = 1;
         UIDropDownMenu_AddButton(info);
      end
   end
end

FishingBuddy.WatchFrame.OnClick = function()
   if ( arg1 == "RightButton" ) then
      local menu = getglobal("FishingBuddyWatcherMenu");
      UIDropDownMenu_Initialize(menu, WatchMenu_Initialize, "MENU");
      ToggleDropDownMenu(1, nil, menu, "FishingWatchDrag", 0, 0);
   end
end
