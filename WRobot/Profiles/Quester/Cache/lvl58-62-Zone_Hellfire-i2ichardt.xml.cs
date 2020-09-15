
using System.Linq;
using robotManager.Helpful;
using wManager.Wow.Class;
using wManager.Wow.Enums;
using wManager.Wow.Helpers;
using wManager.Wow.ObjectManager;
using System.Collections.Generic;
using System.Threading;
using wManager.Wow.Bot.Tasks;


public class MyCustomScript
{
    static MyCustomScript()
    {
        // You can put here code to run when bot start, you can also add methods and classes.
    }
}



public sealed class Grindto60 : QuestGrinderClass
{
    public Grindto60()
    {
        Name = "Grind to 60";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 59;
        RequiredQuest = 0;

        EntryTarget.Add(16863);
HotSpots.Add(new Vector3(118.2188 , 2906.661 , 34.67052 , "None"));
HotSpots.Add(new Vector3(417.6133 , 3014.662 , 19.15768 , "None"));
HotSpots.Add(new Vector3(479.3516 , 3087.096 , 23.18512 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class Grindto61 : QuestGrinderClass
{
    public Grindto61()
    {
        Name = "Grind to 61";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 60;
        RequiredQuest = 0;

        EntryTarget.Add(16973);
HotSpots.Add(new Vector3(-423.3281 , 4026.098 , 76.41388 , "None"));
HotSpots.Add(new Vector3(-380.5504 , 4016.189 , 88.86263 , "None"));
HotSpots.Add(new Vector3(-100.9727 , 4166.152 , 82.42751 , "None"));
HotSpots.Add(new Vector3(-113.9883 , 4217.8 , 85.64073 , "None"));
HotSpots.Add(new Vector3(-76.85742 , 4280.743 , 82.11513 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class JourneytoThrallmar : QuestInteractWithClass
{
    public JourneytoThrallmar()
    {
        Name = "Journey to Thrallmar";

        QuestId.AddRange(new[] { 10289 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(19255);
HotSpots.Add(new Vector3(197.1354 , 2645.865 , 88.34054 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class ReporttoNazgrel : QuestInteractWithClass
{
    public ReporttoNazgrel()
    {
        Name = "Report to Nazgrel";

        QuestId.AddRange(new[] { 10291 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class IWorkFortheHorde : QuestGathererClass
{
    public IWorkFortheHorde()
    {
        Name = "I Work... For the Horde!";

        QuestId.AddRange(new[] { 10086 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(182937);
EntryIdObjects.Add(182936);
HotSpots.Add(new Vector3(-100.9947 , 2618.545 , 51.53895 , "None"));
HotSpots.Add(new Vector3(-123.1531 , 2512.76 , 46.88673 , "None"));
HotSpots.Add(new Vector3(-120.6177 , 2440.545 , 49.70097 , "None"));

    }

        









}


public sealed class BonechewerBlood : QuestGrinderClass
{
    public BonechewerBlood()
    {
        Name = "Bonechewer Blood";

        QuestId.AddRange(new[] { 10450 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(18952);
EntryTarget.Add(19701);
EntryTarget.Add(16876);
HotSpots.Add(new Vector3(-138.3151 , 2608.784 , 44.6641 , "None"));

    }

        









}


public sealed class FelsparkRavine : QuestGrinderClass
{
    public FelsparkRavine()
    {
        Name = "Felspark Ravine";

        QuestId.AddRange(new[] { 10123 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(19434);
EntryTarget.Add(19261);
EntryTarget.Add(18978);
EntryTarget.Add(19136);
HotSpots.Add(new Vector3(163.7436 , 2293.026 , 49.92958 , "None"));

    }

        









}


public sealed class ApothecaryZelana : QuestInteractWithClass
{
    public ApothecaryZelana()
    {
        Name = "Apothecary Zelana";

        QuestId.AddRange(new[] { 10449 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(21257);
HotSpots.Add(new Vector3(25.5503 , 2131.128 , 124.7147 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class BurnItUpFortheHorde : QuestUseItemOnClass
{
    public BurnItUpFortheHorde()
    {
        Name = "Burn It Up... For the Horde!";

        QuestId.AddRange(new[] { 10087 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        HotSpots.Add(new Vector3(-313.4174 , 2368.704 , 47.43579 , "None"));
HotSpots.Add(new Vector3(-363.8861 , 2682.033 , 38.8404 , "None"));
HotSpots.Add(new Vector3(-327.3076 , 2413.995 , 42.2376 , "None"));
ItemId = 27479;
Range = 10f;

    }

        









}


public sealed class EradicatetheBurningLegion : QuestInteractWithClass
{
    public EradicatetheBurningLegion()
    {
        Name = "Eradicate the Burning Legion";

        QuestId.AddRange(new[] { 10121 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(19256);
HotSpots.Add(new Vector3(55.19464 , 2546.07 , 64.73735 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class ForwardBaseReaversFall : QuestUseScriptOnClass
{
    public ForwardBaseReaversFall()
    {
        Name = "Forward Base: Reaver's Fall";

        QuestId.AddRange(new[] { 10124 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(19273);
HotSpots.Add(new Vector3(-18.61825 , 2155.438 , 112.9312 , "None"));
Script = @"";
Range = 4.5f;
IsCSharpCode = false;

    }

        









}


public sealed class DisruptTheirReinforcements : QuestGathererClass
{
    public DisruptTheirReinforcements()
    {
        Name = "Disrupt Their Reinforcements";

        QuestId.AddRange(new[] { 10208 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(184290);
EntryIdObjects.Add(184289);
HotSpots.Add(new Vector3(-85.43979 , 1882.145 , 74.89944 , "None"));
HotSpots.Add(new Vector3(148.1122 , 1718.355 , 38.25842 , "None"));
HotSpots.Add(new Vector3(-102.1744 , 1891.464 , 77.81989 , "None"));
HotSpots.Add(new Vector3(-66.03076 , 1869.001 , 69.49477 , "None"));
HotSpots.Add(new Vector3(126.237 , 1718.841 , 40.94676 , "None"));
HotSpots.Add(new Vector3(171.3775 , 1719.232 , 34.76689 , "None"));

    }

        









}


public sealed class ScriptedDisruptTheirReinforcements : QuestUseScriptOnClass
{
    public ScriptedDisruptTheirReinforcements()
    {
        Name = "Scripted: Disrupt Their Reinforcements";

        QuestId.AddRange(new[] { 10208 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        HotSpots.Add(new Vector3(-102.8597 , 1893.18 , 77.99164 , "None"));
HotSpots.Add(new Vector3(-84.65293 , 1881.608 , 74.71461 , "None"));
HotSpots.Add(new Vector3(-66.63309 , 1869.771 , 69.67554 , "None"));
HotSpots.Add(new Vector3(127.2037 , 1718.052 , 40.73657 , "None"));
HotSpots.Add(new Vector3(146 , 1717.427 , 38.36948 , "None"));
HotSpots.Add(new Vector3(168.5028 , 1718.565 , 34.82639 , "None"));
Script = @"

//Portal Xilus ID:#184290
//Portal Kruul ID:#184289

//Demonic Rune Stone ID:#28513
//Need 4 for each portal, can only have 4 at a time.

//-------------------------------------------------------------------------------------
//Variables
//-------------------------------------------------------------------------------------
var posPortalXilus = new Vector3(-84.86414f, 1881.495f, 74.7514f);
var posPortalKruul = new Vector3(147.8284f, 1717.506f, 38.15772f);

int clickonPortalXilus = 184290; // the object ID
int clickonPortalKruul = 184289; // the object ID


//-------------------------------------------------------------------------------------
//Quest Objective 1:
//-------------------------------------------------------------------------------------
        
if (!Quest.IsObjectiveComplete(1, 10208) && ItemsManager.GetItemCountById(28513) == 4)
  {

   wManager.Wow.Bot.Tasks.GoToTask.ToPosition(new Vector3(posPortalXilus));
if(ObjectManager.Me.HaveBuff(""Travel Form""))
                    {
                        Lua.LuaDoString(""CastSpellByName('Travel Form')"");
                    }
                    else
                    {
                        wManager.Wow.Bot.Tasks.MountTask.DismountMount(false, false, 100);
                    }
   wManager.Wow.Bot.Tasks.GoToTask.ToPositionAndIntecractWithGameObject(posPortalXilus, clickonPortalXilus);
            
   Thread.Sleep(Usefuls.Latency + 10000);
  }

  
//-------------------------------------------------------------------------------------
//Quest Objective 2:
//-------------------------------------------------------------------------------------

if (!Quest.IsObjectiveComplete(2, 10208) && ItemsManager.GetItemCountById(28513) == 4)
  {
  
   wManager.Wow.Bot.Tasks.GoToTask.ToPosition(new Vector3(posPortalKruul));
if(ObjectManager.Me.HaveBuff(""Travel Form""))
                    {
                        Lua.LuaDoString(""CastSpellByName('Travel Form')"");
                    }
                    else
                    {
                        wManager.Wow.Bot.Tasks.MountTask.DismountMount(false, false, 100);
                    }
   wManager.Wow.Bot.Tasks.GoToTask.ToPositionAndIntecractWithGameObject(posPortalKruul, clickonPortalKruul);
            
   Thread.Sleep(Usefuls.Latency + 10000);
  }



//Move to Postion
//GoToTask.ToPosition(posPortalXilus);
";
Range = 4.5f;
IsCSharpCode = true;

    }

        









}


public sealed class SpinebreakerPost : QuestInteractWithClass
{
    public SpinebreakerPost()
    {
        Name = "Spinebreaker Post";

        QuestId.AddRange(new[] { 10242 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(21279);
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class BoilingBlood : QuestUseItemOnClass
{
    public BoilingBlood()
    {
        Name = "Boiling Blood";

        QuestId.AddRange(new[] { 10538 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        ItemId = 0;
Range = 4.5f;

    }

        









}


public sealed class PreparingtheSalve : QuestGathererClass
{
    public PreparingtheSalve()
    {
        Name = "Preparing the Salve";

        QuestId.AddRange(new[] { 9345 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(181372);
HotSpots.Add(new Vector3(-818.4084 , 1848.338 , 83.19079 , "None"));
HotSpots.Add(new Vector3(-870.2181 , 1860.746 , 80.03081 , "None"));
HotSpots.Add(new Vector3(-838.0729 , 1921.019 , 55.99269 , "None"));
HotSpots.Add(new Vector3(-843.5336 , 1935.637 , 62.65492 , "None"));
HotSpots.Add(new Vector3(-833.6459 , 1954.506 , 47.38749 , "None"));
HotSpots.Add(new Vector3(-858.9622 , 2057.045 , 32.19617 , "None"));
HotSpots.Add(new Vector3(-882.5767 , 2107.821 , 21.00573 , "None"));
HotSpots.Add(new Vector3(-937.6838 , 2103.967 , 24.80919 , "None"));
HotSpots.Add(new Vector3(-1138.487 , 2196.247 , 42.63736 , "None"));
HotSpots.Add(new Vector3(-976.527 , 2142.204 , 24.89244 , "None"));
HotSpots.Add(new Vector3(-856.3907 , 2222.701 , 6.833404 , "None"));

    }

        









}


public sealed class MakeThemListen : QuestGrinderClass
{
    public MakeThemListen()
    {
        Name = "Make Them Listen";

        QuestId.AddRange(new[] { 10220 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16904);
EntryTarget.Add(16906);
EntryTarget.Add(16905);
HotSpots.Add(new Vector3(-1226.81 , 2517.43 , 45.61232 , "None"));
HotSpots.Add(new Vector3(-1193.39 , 2514.13 , 52.14977 , "None"));
HotSpots.Add(new Vector3(-1157.93 , 2530.1 , 50.01173 , "None"));
HotSpots.Add(new Vector3(-1096.672 , 2593.555 , 33.85858 , "None"));
HotSpots.Add(new Vector3(-1206.211 , 2639.025 , 13.10317 , "None"));
HotSpots.Add(new Vector3(-1265.766 , 2685.92 , -1.044153 , "None"));
HotSpots.Add(new Vector3(-1269.75 , 2737.23 , -16.502 , "None"));

    }

        









}


public sealed class TheWarpRifts : QuestUseItemOnClass
{
    public TheWarpRifts()
    {
        Name = "The Warp Rifts";

        QuestId.AddRange(new[] { 10278 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        HotSpots.Add(new Vector3(-1338.978 , 2974.755 , 0.9672689 , "None"));
ItemId = 29027;
Range = 4.5f;

    }

        









}


public sealed class WANTEDWorgMasterKruush : QuestGrinderClass
{
    public WANTEDWorgMasterKruush()
    {
        Name = "WANTED: Worg Master Kruush";

        QuestId.AddRange(new[] { 10809 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(19442);
HotSpots.Add(new Vector3(-1053.803 , 2003.713 , 66.98293 , "None"));

    }

        









}


public sealed class DeciphertheTome : QuestGrinderClass
{
    public DeciphertheTome()
    {
        Name = "Decipher the Tome";

        QuestId.AddRange(new[] { 10229 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = true;
        PickUpQuestOnItemID = 28552;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        
    }

        






public override bool HasQuest() { return true; }


}


public sealed class VoidRidge : QuestGrinderClass
{
    public VoidRidge()
    {
        Name = "Void Ridge";

        QuestId.AddRange(new[] { 10294 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(17014);
EntryTarget.Add(19527);
HotSpots.Add(new Vector3(-218.4921 , 1870.192 , 92.77525 , "None"));
HotSpots.Add(new Vector3(-211.9949 , 1732.484 , 62.92722 , "None"));
HotSpots.Add(new Vector3(-245.3423 , 1701.667 , 59.34311 , "None"));
HotSpots.Add(new Vector3(-362.3737 , 1691.066 , 53.46455 , "None"));
HotSpots.Add(new Vector3(-719.6586 , 1604.347 , 48.72932 , "None"));
HotSpots.Add(new Vector3(-793.5376 , 1598.959 , 54.95137 , "None"));
HotSpots.Add(new Vector3(-827.1836 , 1523.837 , 39.87483 , "None"));
HotSpots.Add(new Vector3(-913.5695 , 1518.018 , 39.04425 , "None"));
HotSpots.Add(new Vector3(-1014.174 , 1513.215 , 44.52707 , "None"));
HotSpots.Add(new Vector3(-1089.042 , 1475.188 , 34.40025 , "None"));
HotSpots.Add(new Vector3(-1177.737 , 1458.034 , 35.68676 , "None"));
HotSpots.Add(new Vector3(-754.9137 , 1522.079 , 30.23741 , "None"));

    }

        









}


public sealed class TheBattleHorn : QuestGrinderClass
{
    public TheBattleHorn()
    {
        Name = "The Battle Horn";

        QuestId.AddRange(new[] { 10230 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16978);
HotSpots.Add(new Vector3(-1402.63 , 2710.049 , -28.0866 , "None"));

    }

        









}


public sealed class BloodyVengeance : QuestUseItemOnClass
{
    public BloodyVengeance()
    {
        Name = "Bloody Vengeance";

        QuestId.AddRange(new[] { 10250 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        HotSpots.Add(new Vector3(-1193.206 , 2263.733 , 47.07055 , "None"));
ItemId = 28651;
Range = 4.5f;

    }

        









}


public sealed class HonortheFallen : QuestInteractWithClass
{
    public HonortheFallen()
    {
        Name = "Honor the Fallen";

        QuestId.AddRange(new[] { 10258 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(19937);
HotSpots.Add(new Vector3(-1183.11 , 2599.94 , 30.58841 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class OutlandSucks : QuestGathererClass
{
    public OutlandSucks()
    {
        Name = "Outland Sucks!";

        QuestId.AddRange(new[] { 10236 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(183934);
HotSpots.Add(new Vector3(265.9751 , 3016.146 , -0.5709587 , "None"));
HotSpots.Add(new Vector3(184.8069 , 3005.599 , -1.191356 , "None"));
HotSpots.Add(new Vector3(193.0672 , 3061.873 , 0.3844434 , "None"));
HotSpots.Add(new Vector3(171.0747 , 3039.399 , -1.220388 , "None"));
HotSpots.Add(new Vector3(101.1299 , 3041.062 , -1.222534 , "None"));
HotSpots.Add(new Vector3(74.77003 , 3040.887 , -0.6228713 , "None"));
HotSpots.Add(new Vector3(47.62961 , 3079.156 , -1.221513 , "None"));
HotSpots.Add(new Vector3(27.31066 , 3129.391 , -0.373929 , "None"));
HotSpots.Add(new Vector3(21.95596 , 3099.604 , -1.104926 , "None"));
HotSpots.Add(new Vector3(20.43595 , 3075.409 , -1.18825 , "None"));
HotSpots.Add(new Vector3(-14.03745 , 3096.323 , -0.1325505 , "None"));

    }

        









}


public sealed class HowtoServeGoblins : QuestGathererClass
{
    public HowtoServeGoblins()
    {
        Name = "How to Serve Goblins";

        QuestId.AddRange(new[] { 10238 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(183941);
EntryIdObjects.Add(183940);
EntryIdObjects.Add(183936);
HotSpots.Add(new Vector3(-68.8173 , 3145.55 , -4.574891 , "None"));
HotSpots.Add(new Vector3(-121.322 , 3084.839 , 2.564393 , "None"));
HotSpots.Add(new Vector3(76.084 , 3204.25 , 32.107 , "None"));

    }

        









}


public sealed class FalconWatch : QuestInteractWithClass
{
    public FalconWatch()
    {
        Name = "Falcon Watch";

        QuestId.AddRange(new[] { 9499 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        HotSpots.Add(new Vector3(-593.242 , 4068.19 , 143.2581 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class TheAssassin : QuestInteractWithClass
{
    public TheAssassin()
    {
        Name = "The Assassin";

        QuestId.AddRange(new[] { 9400 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(17062);
HotSpots.Add(new Vector3(-17.7019 , 3803.48 , 94.07992 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class WeakentheRamparts : QuestClass
{
    public WeakentheRamparts()
    {
        Name = "Weaken the Ramparts";

        QuestId.AddRange(new[] { 9572 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class MissionGatewaysMurkethandShaadraz : QuestUseItemOnClass
{
    public MissionGatewaysMurkethandShaadraz()
    {
        Name = "Mission: Gateways Murketh and Shaadraz";

        QuestId.AddRange(new[] { 10129 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(183350);
EntryIdTarget.Add(183351);
HotSpots.Add(new Vector3(-300.8439 , 1525.554 , 37.56489 , "None"));
HotSpots.Add(new Vector3(-148.7876 , 1512.847 , 33.4298 , "None"));
ItemId = 28038;
Range = 20f;

    }

        









}


public sealed class MissionTheAbyssalShelf : QuestClass
{
    public MissionTheAbyssalShelf()
    {
        Name = "Mission: The Abyssal Shelf";

        QuestId.AddRange(new[] { 10162 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, true, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class ReturntoThrallmar : QuestInteractWithClass
{
    public ReturntoThrallmar()
    {
        Name = "Return to Thrallmar";

        QuestId.AddRange(new[] { 10388 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class ForgeCampMageddon : QuestGrinderClass
{
    public ForgeCampMageddon()
    {
        Name = "Forge Camp: Mageddon";

        QuestId.AddRange(new[] { 10390 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(20798);
EntryTarget.Add(16947);
HotSpots.Add(new Vector3(413.1046 , 2244.887 , 116.054 , "None"));
HotSpots.Add(new Vector3(371.994 , 2232.774 , 119.1736 , "None"));
HotSpots.Add(new Vector3(437.1106 , 2198.932 , 116.2531 , "None"));
HotSpots.Add(new Vector3(459.99 , 2159.648 , 119.1589 , "None"));
HotSpots.Add(new Vector3(390.643 , 2147.72 , 117.7376 , "None"));
HotSpots.Add(new Vector3(195.305 , 2438.884 , 56.78323 , "None"));
HotSpots.Add(new Vector3(304.0083 , 2329.124 , 70.09366 , "None"));
HotSpots.Add(new Vector3(349.9452 , 2295.513 , 84.05926 , "None"));
HotSpots.Add(new Vector3(427.467 , 2281.83 , 113.4672 , "None"));

    }

        









}


public sealed class VilePlans : QuestClass
{
    public VilePlans()
    {
        Name = "Vile Plans";

        QuestId.AddRange(new[] { 10393 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = true;
        PickUpQuestOnItemID = 29590;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class CannonsofRage : QuestGrinderClass
{
    public CannonsofRage()
    {
        Name = "Cannons of Rage";

        QuestId.AddRange(new[] { 10391 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(22461);
HotSpots.Add(new Vector3(362.32 , 2264.65 , 119.0113 , "None"));
HotSpots.Add(new Vector3(411.781 , 2259.49 , 116.7841 , "None"));
HotSpots.Add(new Vector3(328.385 , 2229.36 , 117.9964 , "None"));
HotSpots.Add(new Vector3(377.161 , 2102.73 , 117.6375 , "None"));

    }

        









}


public sealed class DoorwaytotheAbyss : QuestClass
{
    public DoorwaytotheAbyss()
    {
        Name = "Doorway to the Abyss";

        QuestId.AddRange(new[] { 10392 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class WANTEDBlacktalontheSavage : QuestClass
{
    public WANTEDBlacktalontheSavage()
    {
        Name = "WANTED: Blacktalon the Savage";

        QuestId.AddRange(new[] { 9466 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class TrueflightArrows : QuestGrinderClass
{
    public TrueflightArrows()
    {
        Name = "Trueflight Arrows";

        QuestId.AddRange(new[] { 9381 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16973);
HotSpots.Add(new Vector3(-444.8264 , 4048.175 , 69.26781 , "None"));
HotSpots.Add(new Vector3(-375.3535 , 3980.35 , 85.86674 , "None"));
HotSpots.Add(new Vector3(-118.0996 , 4154.7 , 83.65742 , "None"));
HotSpots.Add(new Vector3(-118.7682 , 4189.861 , 84.21933 , "None"));
HotSpots.Add(new Vector3(-102.3418 , 4268.268 , 80.7505 , "None"));

    }

        









}


public sealed class HelpingtheCenarionPost : QuestInteractWithClass
{
    public HelpingtheCenarionPost()
    {
        Name = "Helping the Cenarion Post";

        QuestId.AddRange(new[] { 10442 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(16991);
HotSpots.Add(new Vector3(-312.485 , 4728.77 , 17.22927 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class TheGreatFissure : QuestGrinderClass
{
    public TheGreatFissure()
    {
        Name = "The Great Fissure";

        QuestId.AddRange(new[] { 9340 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16927);
EntryTarget.Add(16929);
HotSpots.Add(new Vector3(-697.4063 , 4022.244 , 29.72522 , "None"));
HotSpots.Add(new Vector3(-586.1094 , 3988.334 , 29.91968 , "None"));
HotSpots.Add(new Vector3(-645.0879 , 3922.593 , 30.28462 , "None"));
HotSpots.Add(new Vector3(-605.7751 , 3790.824 , 29.95924 , "None"));
HotSpots.Add(new Vector3(-722.017 , 3782.26 , 21.684 , "None"));
HotSpots.Add(new Vector3(-693.0337 , 3666.455 , 29.09658 , "None"));
HotSpots.Add(new Vector3(-721.0643 , 3797.855 , 22.78712 , "None"));
HotSpots.Add(new Vector3(-556.4512 , 3850.687 , 29.37318 , "None"));
HotSpots.Add(new Vector3(-610.0176 , 3752.214 , 37.69862 , "None"));
HotSpots.Add(new Vector3(-562.2688 , 3669.927 , 38.54173 , "None"));

    }

        









}


public sealed class ReporttoZurai : QuestClass
{
    public ReporttoZurai()
    {
        Name = "Report to Zurai";

        QuestId.AddRange(new[] { 10103 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class MagicoftheArakkoa : QuestGrinderClass
{
    public MagicoftheArakkoa()
    {
        Name = "Magic of the Arakkoa";

        QuestId.AddRange(new[] { 9396 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16967);
EntryTarget.Add(16966);
HotSpots.Add(new Vector3(-951.6719 , 4205.719 , 28.77454 , "None"));
HotSpots.Add(new Vector3(-1068.621 , 4199.881 , 15.99877 , "None"));
HotSpots.Add(new Vector3(-1119.372 , 4260.127 , 14.20109 , "None"));
HotSpots.Add(new Vector3(-1216.711 , 4192.294 , 36.98224 , "None"));
HotSpots.Add(new Vector3(-1248.313 , 4125.047 , 65.03671 , "None"));

    }

        









}


public sealed class InNeedofFelblood : QuestGrinderClass
{
    public InNeedofFelblood()
    {
        Name = "In Need of Felblood";

        QuestId.AddRange(new[] { 9366 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16951);
HotSpots.Add(new Vector3(48.03349 , 3481.967 , 60.04325 , "None"));
HotSpots.Add(new Vector3(110.8388 , 3524.939 , 60.7696 , "None"));
HotSpots.Add(new Vector3(209.4588 , 3432.25 , 65.04462 , "None"));
HotSpots.Add(new Vector3(284.1719 , 3491.85 , 65.16171 , "None"));
HotSpots.Add(new Vector3(285.2149 , 3428.235 , 66.92659 , "None"));
HotSpots.Add(new Vector3(120.0784 , 3621.809 , 77.09269 , "None"));

    }

        









}


public sealed class SourceoftheCorruption : QuestGrinderClass
{
    public SourceoftheCorruption()
    {
        Name = "Source of the Corruption";

        QuestId.AddRange(new[] { 9387 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(17058);
HotSpots.Add(new Vector3(-448.2129 , 4754.59 , 20.54354 , "None"));
HotSpots.Add(new Vector3(-492.5605 , 4773.941 , 27.89871 , "None"));
HotSpots.Add(new Vector3(-496.1016 , 4829.561 , 30.95596 , "None"));
HotSpots.Add(new Vector3(-451.3764 , 4877.24 , 31.36236 , "None"));
HotSpots.Add(new Vector3(-519.6738 , 4867.475 , 33.6277 , "None"));

    }

        









}


public sealed class ArelionsJournal : QuestGathererClass
{
    public ArelionsJournal()
    {
        Name = "Arelion's Journal";

        QuestId.AddRange(new[] { 9374 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(184115);
HotSpots.Add(new Vector3(199.5733 , 3472.166 , 63.51281 , "None"));

    }

        









}


public sealed class FalconWatch9498 : QuestInteractWithClass
{
    public FalconWatch9498()
    {
        Name = "Falcon Watch9498";

        QuestId.AddRange(new[] { 9498 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(16789);
HotSpots.Add(new Vector3(-593.242 , 4068.19 , 143.2581 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class MarkingthePath : QuestGathererClass
{
    public MarkingthePath()
    {
        Name = "Marking the Path";

        QuestId.AddRange(new[] { 9391 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, true, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(181581);
EntryIdObjects.Add(181580);
EntryIdObjects.Add(181579);
HotSpots.Add(new Vector3(-606.6406 , 3992.082 , 32.15828 , "None"));
HotSpots.Add(new Vector3(-584.1521 , 3782.212 , 31.51426 , "None"));
HotSpots.Add(new Vector3(-767.1508 , 3675.651 , 30.10864 , "None"));

    }

        









}


public sealed class AStrangeWeapon : QuestClass
{
    public AStrangeWeapon()
    {
        Name = "A Strange Weapon";

        QuestId.AddRange(new[] { 9401 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;


    }

        









}


public sealed class BirdsofaFeather : QuestGathererClass
{
    public BirdsofaFeather()
    {
        Name = "Birds of a Feather";

        QuestId.AddRange(new[] { 9397 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(181582);
HotSpots.Add(new Vector3(-1112.506 , 4185.527 , 17.86664 , "None"));
HotSpots.Add(new Vector3(-1099.129 , 4251.727 , 16.51554 , "None"));
HotSpots.Add(new Vector3(-1151.635 , 4264.056 , 13.91021 , "None"));
HotSpots.Add(new Vector3(-1139.285 , 4242.991 , 14.22002 , "None"));

    }

        









}


public sealed class TheWarchiefsMandate : QuestInteractWithClass
{
    public TheWarchiefsMandate()
    {
        Name = "The Warchief's Mandate";

        QuestId.AddRange(new[] { 9405 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(16574);
HotSpots.Add(new Vector3(176.157 , 2738.78 , 88.21333 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class FromtheAbyss : QuestUseItemOnClass
{
    public FromtheAbyss()
    {
        Name = "From the Abyss";

        QuestId.AddRange(new[] { 10295 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        HotSpots.Add(new Vector3(-1235.799 , 1358.134 , 5.980601 , "None"));
ItemId = 29226;
Range = 4.5f;

    }

        









}


public sealed class InvestigatetheCrash : QuestInteractWithClass
{
    public InvestigatetheCrash()
    {
        Name = "Investigate the Crash";

        QuestId.AddRange(new[] { 10213 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(19367);
HotSpots.Add(new Vector3(-1096.86 , 3001.19 , 8.195005 , "None"));
GossipOptionNpcInteractWith = 1;
Macro = "";
IgnoreIfDead = false;
Range = 4.5f;

    }

        









}


public sealed class InCaseofEmergency : QuestGathererClass
{
    public InCaseofEmergency()
    {
        Name = "In Case of Emergency...";

        QuestId.AddRange(new[] { 10161 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(183396);
EntryIdObjects.Add(183397);
EntryIdObjects.Add(183395);
EntryIdObjects.Add(183394);
HotSpots.Add(new Vector3(-994.322 , 3024.671 , 13.93005 , "None"));
HotSpots.Add(new Vector3(-1051.937 , 2748.235 , -6.352261 , "None"));
HotSpots.Add(new Vector3(-1053.089 , 2711.336 , -2.466748 , "None"));
HotSpots.Add(new Vector3(-1050.069 , 2683.371 , -0.531018 , "None"));
HotSpots.Add(new Vector3(-1044.139 , 2671.813 , -0.08748128 , "None"));
HotSpots.Add(new Vector3(-1053.522 , 2587.648 , 8.676241 , "None"));
HotSpots.Add(new Vector3(-1047.276 , 2551.632 , 10.9238 , "None"));
HotSpots.Add(new Vector3(-980.0681 , 2524.902 , 5.740068 , "None"));
HotSpots.Add(new Vector3(-961.3254 , 2494.386 , 6.144765 , "None"));
HotSpots.Add(new Vector3(-955.8597 , 2445.312 , 1.763149 , "None"));

    }

        









}


public sealed class RavagerEggRoundup : QuestGathererClass
{
    public RavagerEggRoundup()
    {
        Name = "Ravager Egg Roundup";

        QuestId.AddRange(new[] { 9349 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdObjects.Add(181385);
HotSpots.Add(new Vector3(-1457.864 , 3412.906 , 33.46923 , "None"));
HotSpots.Add(new Vector3(-1486.627 , 3446.044 , 30.534 , "None"));
HotSpots.Add(new Vector3(-1516.836 , 3456.204 , 24.68869 , "None"));
HotSpots.Add(new Vector3(-1541.934 , 3486.226 , 25.09703 , "None"));
HotSpots.Add(new Vector3(-1510.191 , 3522.091 , 44.33512 , "None"));
HotSpots.Add(new Vector3(-1520.251 , 3578.008 , 41.76892 , "None"));
HotSpots.Add(new Vector3(-1576.059 , 3559.038 , 29.00991 , "None"));
HotSpots.Add(new Vector3(-1569.057 , 3604.767 , 34.6235 , "None"));
HotSpots.Add(new Vector3(-1586.504 , 3688.406 , 39.31123 , "None"));
HotSpots.Add(new Vector3(-1627.097 , 3791.023 , 36.01436 , "None"));

    }

        









}


public sealed class VoidwalkersGoneWild : QuestGrinderClass
{
    public VoidwalkersGoneWild()
    {
        Name = "Voidwalkers Gone Wild";

        QuestId.AddRange(new[] { 9351 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16975);
EntryTarget.Add(16974);
HotSpots.Add(new Vector3(-1378.686 , 3145.804 , 25.87823 , "None"));
HotSpots.Add(new Vector3(-1401.129 , 3199.592 , 27.05815 , "None"));
HotSpots.Add(new Vector3(-1317.324 , 3139.006 , 34.09731 , "None"));
HotSpots.Add(new Vector3(-1442.906 , 3145.744 , 4.351669 , "None"));
HotSpots.Add(new Vector3(-1376.65 , 3275.06 , 40.9655 , "None"));

    }

        









}


public sealed class HelboartheOtherWhiteMeat : QuestGrinderClass
{
    public HelboartheOtherWhiteMeat()
    {
        Name = "Helboar, the Other White Meat";

        QuestId.AddRange(new[] { 9361 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16863);
HotSpots.Add(new Vector3(-1074.568 , 2916.562 , -1.391823 , "None"));
HotSpots.Add(new Vector3(-1003.994 , 2916.477 , 1.582464 , "None"));
HotSpots.Add(new Vector3(-1130.715 , 2924.355 , -1.816062 , "None"));
HotSpots.Add(new Vector3(-916.1719 , 2952.171 , 9.402352 , "None"));
HotSpots.Add(new Vector3(-848.7191 , 2892.995 , 9.093739 , "None"));

    }

        









}


public sealed class SmoothasButter : QuestGrinderClass
{
    public SmoothasButter()
    {
        Name = "Smooth as Butter";

        QuestId.AddRange(new[] { 9356 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16972);
HotSpots.Add(new Vector3(-989.5001 , 2614.863 , 6.184697 , "None"));
HotSpots.Add(new Vector3(-973.1517 , 2546.581 , 3.596622 , "None"));
HotSpots.Add(new Vector3(-911.6401 , 2484.138 , 4.607645 , "None"));
HotSpots.Add(new Vector3(-851.2324 , 2521.626 , 23.74182 , "None"));
HotSpots.Add(new Vector3(-904.4199 , 2447.763 , 1.114102 , "None"));
HotSpots.Add(new Vector3(-852.176 , 2384.703 , -4.533514 , "None"));
HotSpots.Add(new Vector3(-789.0156 , 2362.466 , 13.59538 , "None"));

    }

        









}


public sealed class DemonicContamination : QuestGrinderClass
{
    public DemonicContamination()
    {
        Name = "Demonic Contamination";

        QuestId.AddRange(new[] { 9372 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(16880);
HotSpots.Add(new Vector3(-347.2734 , 4648.743 , 27.79439 , "None"));
HotSpots.Add(new Vector3(-444.9609 , 4606.332 , 41.203 , "None"));
HotSpots.Add(new Vector3(-406.2746 , 4565.548 , 39.8581 , "None"));
HotSpots.Add(new Vector3(-471.1335 , 4442.64 , 42.94997 , "None"));
HotSpots.Add(new Vector3(-514.1738 , 4385.517 , 50.35246 , "None"));

    }

        









}


public sealed class KeepThornfangHillClear : QuestGrinderClass
{
    public KeepThornfangHillClear()
    {
        Name = "Keep Thornfang Hill Clear!";

        QuestId.AddRange(new[] { 10159 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, true, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(19350);
EntryTarget.Add(19349);
HotSpots.Add(new Vector3(-314.1621 , 4891.054 , 34.5866 , "None"));
HotSpots.Add(new Vector3(-353.0234 , 4859.684 , 24.6407 , "None"));
HotSpots.Add(new Vector3(-287.3533 , 4946.361 , 47.96798 , "None"));
HotSpots.Add(new Vector3(-177.2383 , 4919.199 , 53.21458 , "None"));
HotSpots.Add(new Vector3(-328.0605 , 5011.014 , 59.54294 , "None"));
HotSpots.Add(new Vector3(-391.4297 , 4978.76 , 42.20881 , "None"));
HotSpots.Add(new Vector3(-302.918 , 5085.534 , 78.72873 , "None"));
HotSpots.Add(new Vector3(-210.9102 , 5053.654 , 77.86748 , "None"));

    }

        









}


public sealed class TestingtheAntidote : QuestUseItemOnClass
{
    public TestingtheAntidote()
    {
        Name = "Testing the Antidote";

        QuestId.AddRange(new[] { 10255 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { true, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryIdTarget.Add(16880);
HotSpots.Add(new Vector3(-308.3286 , 4668.839 , 21.57917 , "None"));
HotSpots.Add(new Vector3(-374.523 , 4642.555 , 30.49949 , "None"));
HotSpots.Add(new Vector3(-399.3284 , 4512.363 , 50.18412 , "None"));
HotSpots.Add(new Vector3(-473.748 , 4498.242 , 49.15799 , "None"));
ItemId = 23337;
Range = 1f;

    }

        









}

