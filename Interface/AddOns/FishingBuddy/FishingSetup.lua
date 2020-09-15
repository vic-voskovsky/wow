-- FishingSetup
--
-- Load out translation strings and such

FBConstants = {};

FBConstants.CURRENTVERSION = 9302;

FBConstants.Colors = {};
FBConstants.Colors.RED   = "ffff0000";
FBConstants.Colors.GREEN = "ff00ff00";
FBConstants.Colors.BLUE  = "ff0000ff";
FBConstants.Colors.YELLOW  = "ff00ffff";
FBConstants.Colors.PURPLE = "ffff00ff";
FBConstants.Colors.WHITE = "ffffffff";

FBConstants.DEFAULT_MINIMAP_POSITION = 256;

-- don't override debugging code, if it loaded
if ( not FishingBuddy ) then
   FishingBuddy = {};
   FishingBuddy.API = {};
   FishingBuddy.Commands = {};

   FishingBuddy.printable = function(foo)
      if ( foo ) then
	 if ( type(foo) == "table" ) then
	    return "table";
	 elseif ( type(foo) == "boolean" ) then
	    if ( foo ) then
	       return "true";
	    else
	       return "false";
	    end
	 else
	    return foo;
	 end
      else
	 return "nil";
      end
   end
   
   FishingBuddy.Debug = function(msg, fixlinks)
   end

   FishingBuddy.DebugVars = function()
   end

   FishingBuddy.Dump = function(thing)
   end
end

local WOW = {};
FishingBuddy.WOWVersion = function()
   return WOW.major, WOW.minor, WOW.dot;
end

if ( GetBuildInfo ) then
   local v, b, d = GetBuildInfo();
   WOW.build = b;
   WOW.date = d;
   local s,e,maj,min,dot = string.find(v, "(%d+).(%d+).(%d+)");
   WOW.major = tonumber(maj);
   WOW.minor = tonumber(min);
   WOW.dot = tonumber(dot);
else
   FBConstants.Is10900 = true;
end

FishingBuddy.Output = function(msg, r, g, b)
   if ( DEFAULT_CHAT_FRAME ) then
      if ( not r ) then
	 DEFAULT_CHAT_FRAME:AddMessage(msg);
      else
	 DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b);
      end
   end
end

FishingBuddy.Message = function(msg, r, g, b)
   FishingBuddy.Output(FBConstants.NAME..": "..msg, r, g, b);
end

local function Color(color, text)
   local c = FBConstants.Colors[color];
   if ( c ) then
      return "|c"..c..text.."|r";
   else
      return text;
   end
end
FishingBuddy.Color = Color;

FishingBuddy.Error = function(msg)
   FishingBuddy.Output(FBConstants.NAME..": "..msg, 1.0, 0, 0);
end

for color,val in pairs(FBConstants.Colors) do
   local colorfunc = "function(text) return Color(\""..color.."\", text); end";
   local func, err = loadstring("return "..colorfunc);
   if ( func ) then
      FishingBuddy.API[color] = func;
   end
end

local printfunc;
if ( WOW.major > 1 ) then
   printfunc = "function(...) FishingBuddy.Message(string.format(...)); end;";
else
   printfunc = "function(...) FishingBuddy.Message(string.format(unpack(arg))); end;";
end
local func, err = loadstring("return "..printfunc);
if ( func ) then
   FishingBuddy.Print = func();
else
   FishingBuddy.DebugOutput("Print function failed "..err);
end

local Setup = {};
Setup.FixupThis = function(target, tag, what)
   if ( type(what) == "table" ) then
      for idx,str in pairs(what) do
         what[idx] = Setup.FixupThis(target, tag, str);
      end
      return what;
   elseif ( type(what) == "string" ) then
      local pattern = "#([A-Z0-9_]+)#";
      local s,e,w = string.find(what, pattern);
      while ( w ) do
         if ( type(target[w]) == "string" ) then
            local s1 = strsub(what, 1, s-1);
            local s2 = strsub(what, e+1);
            what = s1..target[w]..s2;
            s,e,w = string.find(what, pattern);
         elseif ( FBConstants.Colors and FBConstants.Colors[w] ) then
            local s1 = strsub(what, 1, s-1);
            local s2 = strsub(what, e+1);
            what = s1..FBConstants.Colors[w]..s2;
            s,e,w = string.find(what, pattern);
         else
            -- stop if we can't find something to replace it with
            w = nil;
         end
      end
      return what;
   else
      FishingBuddy.Debug("tag "..tag.." type "..type(what));
      FishingBuddy.Dump(what);
   end
end

Setup.FixupStrings = function(source, locale, target)
   local translation = source["enUS"];
   for tag,_ in pairs(translation) do
      target[tag] = Setup.FixupThis(target, tag, target[tag]);
   end
end

Setup.FixupBindings = function(source, target)
   local translation = source["enUS"];
   for tag,str in pairs(translation) do      
      if ( string.find(tag, "^BINDING") ) then
         setglobal(tag, target[tag]);
	 target[tag] = nil;
      end
   end
end

local missing = {};
Setup.LoadTranslation = function(source, lang, target, record)
   local translation = source[lang];
   if ( translation ) then
      for tag,value in pairs(translation) do
         if ( not target[tag] ) then
            target[tag] = value;
            if ( record ) then
               missing[tag] = 1;
            end
         end
      end
   end
end

Setup.Translate = function(addon, source, target)
   local locale = GetLocale();
   --locale = "deDE";
   target.VERSION = GetAddOnMetadata(addon, "Version");
   Setup.LoadTranslation(source, locale, target);
   if ( locale ~= "enUS" ) then
      Setup.LoadTranslation(source, "enUS", target);
   end
   Setup.FixupStrings(source, locale, target);
   Setup.FixupBindings(source, target);
end

Setup.Translate("FishingBuddy", FishingTranslations, FBConstants);

-- Let the plugins use this
FishingBuddy.Setup = Setup;

-- dump the memory we've allocated for all the translations
FishingTranslations = nil;

FBConstants.KEYS_NONE = 0;
FBConstants.KEYS_SHIFT = 1;
FBConstants.KEYS_CTRL = 2;
FBConstants.KEYS_ALT = 3;
FBConstants.Keys = {};
FBConstants.Keys[FBConstants.KEYS_NONE] = FBConstants.KEYS_NONE_TEXT;
FBConstants.Keys[FBConstants.KEYS_SHIFT] = FBConstants.KEYS_SHIFT_TEXT;
FBConstants.Keys[FBConstants.KEYS_CTRL] = FBConstants.KEYS_CTRL_TEXT;
FBConstants.Keys[FBConstants.KEYS_ALT] = FBConstants.KEYS_ALT_TEXT;

FBConstants.SCHOOL_FISH = 0;
FBConstants.SCHOOL_WRECKAGE = 1;
FBConstants.SCHOOL_DEBRIS = 2;
FBConstants.SCHOOL_WATER = 3;
FBConstants.SCHOOL_TASTY = 4;
FBConstants.SCHOOL_OIL = 5;

FBConstants.WILDCARD_EVT = "*";
FBConstants.ADD_FISHIE_EVT = "ADD_FISHIE";
FBConstants.ADD_SCHOOL_EVT = "ADD_SCHOOL";

FBConstants.FISHING_ENABLED_EVT = "FISHING_ENABLED";
FBConstants.FISHING_DISABLED_EVT = "FISHING_DISABLED";

FBConstants.LOGIN_EVT = "LOGIN";
FBConstants.LOGOUT_EVT = "LOGOUT";

FBConstants.FBEvents = {};
-- FB will call your routine for every event it receives
FBConstants.FBEvents[FBConstants.WILDCARD_EVT] = 1;
-- FB will call your function when a fish is caught
FBConstants.FBEvents[FBConstants.ADD_FISHIE_EVT] = 1;
-- FB will call your function when a school is added
FBConstants.FBEvents[FBConstants.ADD_SCHOOL_EVT] = 1;
-- FB will call your function after the player is fully logged in
FBConstants.FBEvents[FBConstants.LOGIN_EVT] = 1;
-- FB will call your function when the user is logging out
FBConstants.FBEvents[FBConstants.LOGOUT_EVT] = 1;
-- FB will call your function when the user starts fishing (equips a pole)
FBConstants.FBEvents[FBConstants.FISHING_ENABLED_EVT] = 1;
-- FB will call your function when the user stops fishing (unequips a pole)
FBConstants.FBEvents[FBConstants.FISHING_DISABLED_EVT] = 1;
