
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



public sealed class darkshirespidersskeles : QuestGrinderClass
{
    public darkshirespidersskeles()
    {
        Name = "darkshire_spiders_skeles";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 28;
        RequiredQuest = 0;

        EntryTarget.Add(930);
HotSpots.Add(new Vector3(-10350.97 , 16.19474 , 50.57254 , "None"));
HotSpots.Add(new Vector3(-10297.64 , -51.88548 , 43.88946 , "None"));
HotSpots.Add(new Vector3(-10334.49 , -72.01735 , 42.37318 , "None"));
HotSpots.Add(new Vector3(-10389.03 , -59.70493 , 46.24067 , "None"));
HotSpots.Add(new Vector3(-10456.06 , -59.88282 , 46.3323 , "None"));
HotSpots.Add(new Vector3(-10524.83 , -69.6918 , 44.34787 , "None"));
HotSpots.Add(new Vector3(-10615.24 , -86.72056 , 34.30585 , "None"));
HotSpots.Add(new Vector3(-10662.34 , -117.864 , 35.70493 , "None"));
HotSpots.Add(new Vector3(-10687.67 , -117.7636 , 34.48111 , "None"));
HotSpots.Add(new Vector3(-10701.36 , -82.10216 , 36.75344 , "None"));
HotSpots.Add(new Vector3(-10705.19 , -38.26086 , 31.58284 , "None"));
HotSpots.Add(new Vector3(-10698.74 , 11.74263 , 33.87239 , "None"));
HotSpots.Add(new Vector3(-10669.44 , 53.26159 , 35.57802 , "None"));
HotSpots.Add(new Vector3(-10643.51 , 91.78423 , 39.67519 , "None"));
HotSpots.Add(new Vector3(-10632.19 , 136.9341 , 34.15717 , "None"));
HotSpots.Add(new Vector3(-10600.59 , 145.2662 , 31.14252 , "None"));
HotSpots.Add(new Vector3(-10553.29 , 138.4739 , 28.85534 , "None"));
HotSpots.Add(new Vector3(-10497.15 , 121.8469 , 35.7118 , "None"));
HotSpots.Add(new Vector3(-10440.88 , 95.77333 , 37.80006 , "None"));
HotSpots.Add(new Vector3(-10326.57 , 55.64011 , 47.66709 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class Darkshirewerewolves : QuestGrinderClass
{
    public Darkshirewerewolves()
    {
        Name = "Darkshire_werewolves";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 31;
        RequiredQuest = 0;

        EntryTarget.Add(923);
EntryTarget.Add(205);
EntryTarget.Add(898);
EntryTarget.Add(533);
HotSpots.Add(new Vector3(-10393.55 , -1201.676 , 39.97529 , "None"));
HotSpots.Add(new Vector3(-10376.91 , -1221.227 , 37.94438 , "None"));
HotSpots.Add(new Vector3(-10399.47 , -1242.564 , 40.89073 , "None"));
HotSpots.Add(new Vector3(-10382.94 , -1270.641 , 35.90012 , "None"));
HotSpots.Add(new Vector3(-10339.97 , -1285.446 , 35.40496 , "None"));
HotSpots.Add(new Vector3(-10291.74 , -1273.495 , 40.04891 , "None"));
HotSpots.Add(new Vector3(-10250.83 , -1237.969 , 34.50375 , "None"));
HotSpots.Add(new Vector3(-10238.68 , -1200.463 , 30.40526 , "None"));
HotSpots.Add(new Vector3(-10216.56 , -1180.051 , 21.06289 , "None"));
HotSpots.Add(new Vector3(-10201.14 , -1075.804 , 32.65822 , "None"));
HotSpots.Add(new Vector3(-10223.65 , -1057.134 , 32.70919 , "None"));
HotSpots.Add(new Vector3(-10338.9 , -932.9467 , 44.40469 , "None"));
HotSpots.Add(new Vector3(-10399.3 , -852.6154 , 50.48919 , "None"));
HotSpots.Add(new Vector3(-10426.61 , -847.5273 , 47.67394 , "None"));
HotSpots.Add(new Vector3(-10567.83 , -938.9751 , 49.83339 , "None"));
HotSpots.Add(new Vector3(-10539.87 , -960.2871 , 46.15324 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class DuskwoodOgres : QuestGrinderClass
{
    public DuskwoodOgres()
    {
        Name = "Duskwood Ogres";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 30;
        RequiredQuest = 0;

        EntryTarget.Add(892);
EntryTarget.Add(891);
EntryTarget.Add(1251);
EntryTarget.Add(212);
HotSpots.Add(new Vector3(-11016.91 , -155.7313 , 14.30222 , "None"));
HotSpots.Add(new Vector3(-10985.39 , -114.3153 , 14.4418 , "None"));
HotSpots.Add(new Vector3(-10945.21 , -76.57906 , 13.78472 , "None"));
HotSpots.Add(new Vector3(-10949.82 , -33.99481 , 14.01667 , "None"));
HotSpots.Add(new Vector3(-10979.01 , -36.32685 , 14.29009 , "None"));
HotSpots.Add(new Vector3(-10999.09 , -33.88914 , 13.40465 , "None"));
HotSpots.Add(new Vector3(-11068.96 , -65.29239 , 15.1883 , "None"));
HotSpots.Add(new Vector3(-11083.26 , -84.34 , 17.13504 , "None"));
HotSpots.Add(new Vector3(-11066.1 , -107.9217 , 14.96066 , "None"));
HotSpots.Add(new Vector3(-11064.71 , -180.799 , 21.74707 , "None"));
HotSpots.Add(new Vector3(-11048.84 , -241.8551 , 13.87072 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class DuskwoodAddlesStead : QuestGrinderClass
{
    public DuskwoodAddlesStead()
    {
        Name = "Duskwood_Addles_Stead";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 27;
        RequiredQuest = 0;

        EntryTarget.Add(923);
EntryTarget.Add(569);
EntryTarget.Add(533);
HotSpots.Add(new Vector3(-11002.79 , 350.3672 , 32.41972 , "None"));
HotSpots.Add(new Vector3(-11126.43 , 243.6924 , 33.40337 , "None"));
HotSpots.Add(new Vector3(-11141.44 , 189.2277 , 33.78656 , "None"));
HotSpots.Add(new Vector3(-11079.3 , 82.02975 , 37.00561 , "None"));
HotSpots.Add(new Vector3(-10968.94 , 108.4472 , 38.63549 , "None"));
HotSpots.Add(new Vector3(-10886.41 , 105.835 , 39.8114 , "None"));
HotSpots.Add(new Vector3(-10871.55 , 111.2365 , 43.35385 , "None"));
HotSpots.Add(new Vector3(-10865.31 , 127.295 , 42.6744 , "None"));
HotSpots.Add(new Vector3(-10852.47 , 257.5832 , 34.23754 , "None"));
HotSpots.Add(new Vector3(-10877.36 , 315.2562 , 34.27019 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Duskwooddarkenedbank : QuestGrinderClass
{
    public Duskwooddarkenedbank()
    {
        Name = "Duskwood_darkened_bank";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 24;
        RequiredQuest = 0;

        EntryTarget.Add(213);
EntryTarget.Add(539);
EntryTarget.Add(569);
EntryTarget.Add(565);
EntryTarget.Add(217);
HotSpots.Add(new Vector3(-10058.68 , -1169.438 , 31.89118 , "None"));
HotSpots.Add(new Vector3(-10064.57 , -1085.604 , 26.41427 , "None"));
HotSpots.Add(new Vector3(-10055.29 , -790.2465 , 35.44889 , "None"));
HotSpots.Add(new Vector3(-10083.53 , -854.6196 , 36.95524 , "None"));
HotSpots.Add(new Vector3(-10035.93 , -460.767 , 42.09797 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Elwynboarsspiders : QuestGrinderClass
{
    public Elwynboarsspiders()
    {
        Name = "Elwyn boars spiders";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 7;
        RequiredQuest = 0;

        EntryTarget.Add(113);
EntryTarget.Add(30);
EntryTarget.Add(525);
HotSpots.Add(new Vector3(-9565.15 , 32.81761 , 61.1464 , "None"));
HotSpots.Add(new Vector3(-9596.062 , 58.17923 , 60.8599 , "None"));
HotSpots.Add(new Vector3(-9596.973 , 59.38602 , 60.93768 , "None"));
HotSpots.Add(new Vector3(-9631.2 , 56.79557 , 60.25002 , "None"));
HotSpots.Add(new Vector3(-9627.935 , 73.57288 , 62.19668 , "None"));
HotSpots.Add(new Vector3(-9609.758 , 81.69825 , 61.4892 , "None"));
HotSpots.Add(new Vector3(-9601.539 , 115.7123 , 59.61987 , "None"));
HotSpots.Add(new Vector3(-9582.871 , 145.1052 , 59.63624 , "None"));
HotSpots.Add(new Vector3(-9569.829 , 167.4001 , 60.74474 , "None"));
HotSpots.Add(new Vector3(-9554.619 , 155.0164 , 59.62121 , "None"));
HotSpots.Add(new Vector3(-9540.119 , 171.0696 , 57.34896 , "None"));
HotSpots.Add(new Vector3(-9528.894 , 187.7106 , 57.80713 , "None"));
HotSpots.Add(new Vector3(-9508.465 , 154.5013 , 59.20286 , "None"));
HotSpots.Add(new Vector3(-9546.833 , 113.0111 , 58.96421 , "None"));
HotSpots.Add(new Vector3(-9544.941 , 94.43929 , 58.91402 , "None"));
HotSpots.Add(new Vector3(-9547.725 , 79.02999 , 59.0184 , "None"));
HotSpots.Add(new Vector3(-9558.682 , 36.21148 , 59.90009 , "None"));
HotSpots.Add(new Vector3(-9543.332 , 7.90313 , 60.66079 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Elwynnboarsandbears : QuestGrinderClass
{
    public Elwynnboarsandbears()
    {
        Name = "Elwynn boars and bears";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 10;
        RequiredQuest = 0;

        EntryTarget.Add(524);
EntryTarget.Add(822);
HotSpots.Add(new Vector3(-9833.995 , -785.707 , 37.17522 , "None"));
HotSpots.Add(new Vector3(-9767.765 , -760.5701 , 40.88631 , "None"));
HotSpots.Add(new Vector3(-9750.953 , -648.1012 , 41.99654 , "None"));
HotSpots.Add(new Vector3(-9807.778 , -557.9768 , 30.23533 , "None"));
HotSpots.Add(new Vector3(-9808.94 , -477.447 , 33.45127 , "None"));
HotSpots.Add(new Vector3(-9876.13 , -351.713 , 34.10389 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class ElwynnProwlersandbears : QuestGrinderClass
{
    public ElwynnProwlersandbears()
    {
        Name = "Elwynn Prowlers and bears";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 9;
        MaxLevel = 13;
        RequiredQuest = 0;

        EntryTarget.Add(52);
EntryTarget.Add(118);
HotSpots.Add(new Vector3(-9383.503 , -1266.601 , 56.01397 , "None"));
HotSpots.Add(new Vector3(-9369.228 , -1282.957 , 59.19213 , "None"));
HotSpots.Add(new Vector3(-9312.999 , -1280.522 , 68.65992 , "None"));
HotSpots.Add(new Vector3(-9320.191 , -1392.527 , 66.97066 , "None"));
HotSpots.Add(new Vector3(-9342.902 , -1423.399 , 64.55126 , "None"));
HotSpots.Add(new Vector3(-9387.378 , -1213.871 , 61.43647 , "None"));
HotSpots.Add(new Vector3(-9391.241 , -1167.837 , 62.88463 , "None"));
HotSpots.Add(new Vector3(-9418.066 , -1132.936 , 58.3703 , "None"));
HotSpots.Add(new Vector3(-9775.315 , -1283.852 , 42.1242 , "None"));
HotSpots.Add(new Vector3(-9845.503 , -1284.913 , 36.0565 , "None"));
HotSpots.Add(new Vector3(-9900.437 , -1359.947 , 33.54579 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class grind : QuestGrinderClass
{
    public grind()
    {
        Name = "grind";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 5;
        MaxLevel = 7;
        RequiredQuest = 0;

        EntryTarget.Add(525);
EntryTarget.Add(94);
HotSpots.Add(new Vector3(-9337.452 , 44.83712 , 59.99128 , "None"));
HotSpots.Add(new Vector3(-9252.036 , -15.63547 , 72.5553 , "None"));
HotSpots.Add(new Vector3(-9215.211 , 21.90724 , 76.29792 , "None"));
HotSpots.Add(new Vector3(-9109.983 , 6.700748 , 87.9873 , "None"));
HotSpots.Add(new Vector3(-9179.104 , 35.38412 , 77.66484 , "None"));
HotSpots.Add(new Vector3(-9143.423 , 52.95192 , 77.87651 , "None"));
HotSpots.Add(new Vector3(-9121.143 , 49.49805 , 81.23927 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class NorthshireBandits : QuestGrinderClass
{
    public NorthshireBandits()
    {
        Name = "Northshire Bandits";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 5;
        RequiredQuest = 0;

        EntryTarget.Add(38);
HotSpots.Add(new Vector3(-9062.588 , -245.5656 , 72.63518 , "None"));
HotSpots.Add(new Vector3(-9112.625 , -244.7354 , 75.47231 , "None"));
HotSpots.Add(new Vector3(-9131.1 , -323.678 , 72.83135 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class NorthshireKobalds : QuestGrinderClass
{
    public NorthshireKobalds()
    {
        Name = "Northshire Kobalds";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 3;
        RequiredQuest = 0;

        EntryTarget.Add(257);
EntryTarget.Add(6);
HotSpots.Add(new Vector3(-8712.35 , -91.1773 , 89.33823 , "None"));
HotSpots.Add(new Vector3(-8762.556 , -159.332 , 82.9978 , "None"));
HotSpots.Add(new Vector3(-8765.521 , -209.4004 , 85.74258 , "None"));
HotSpots.Add(new Vector3(-8779.674 , -255.4895 , 82.11939 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class NorthshireWolves : QuestGrinderClass
{
    public NorthshireWolves()
    {
        Name = "Northshire Wolves";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 2;
        RequiredQuest = 0;

        EntryTarget.Add(69);
HotSpots.Add(new Vector3(-8815.753 , -181.396 , 82.13153 , "None"));
HotSpots.Add(new Vector3(-8873.065 , -113.5043 , 80.79158 , "None"));
HotSpots.Add(new Vector3(-8831.85 , -100.4428 , 84.38408 , "None"));
HotSpots.Add(new Vector3(-8794.057 , -118.5907 , 83.47424 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Redridgecauseway : QuestGrinderClass
{
    public Redridgecauseway()
    {
        Name = "Redridge_causeway";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 21;
        RequiredQuest = 0;

        EntryTarget.Add(428);
EntryTarget.Add(547);
EntryTarget.Add(424);
EntryTarget.Add(423);
EntryTarget.Add(441);
EntryTarget.Add(712);
HotSpots.Add(new Vector3(-9556.815 , -2319.884 , 65.83706 , "None"));
HotSpots.Add(new Vector3(-9628.641 , -2383.589 , 60.62828 , "None"));
HotSpots.Add(new Vector3(-9632.619 , -2414.463 , 62.53286 , "None"));
HotSpots.Add(new Vector3(-9655.525 , -2539.798 , 56.42816 , "None"));
HotSpots.Add(new Vector3(-9625.766 , -2704.194 , 56.75629 , "None"));
HotSpots.Add(new Vector3(-9672.1 , -2805.373 , 52.37142 , "None"));
HotSpots.Add(new Vector3(-9662.536 , -2894.624 , 50.722 , "None"));
HotSpots.Add(new Vector3(-9702.135 , -2622.787 , 63.62779 , "None"));
HotSpots.Add(new Vector3(-9743.442 , -2192.083 , 58.60957 , "None"));
HotSpots.Add(new Vector3(-9677.526 , -2121.4 , 59.65692 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Redridgelowergrind : QuestGrinderClass
{
    public Redridgelowergrind()
    {
        Name = "Redridge_lower_grind";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 20;
        RequiredQuest = 0;

        EntryTarget.Add(547);
EntryTarget.Add(441);
HotSpots.Add(new Vector3(-9639.653 , -1759.553 , 55.01263 , "None"));
HotSpots.Add(new Vector3(-9590.591 , -1981.076 , 66.72691 , "None"));
HotSpots.Add(new Vector3(-9629.328 , -2146.926 , 66.01714 , "None"));
HotSpots.Add(new Vector3(-9673.338 , -2048.504 , 71.561 , "None"));
HotSpots.Add(new Vector3(-9687.77 , -1907.587 , 56.95449 , "None"));
HotSpots.Add(new Vector3(-9753.209 , -1863.079 , 47.80183 , "None"));
HotSpots.Add(new Vector3(-9741.321 , -1803.208 , 49.52971 , "None"));
HotSpots.Add(new Vector3(-9675.357 , -2237.591 , 61.7799 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class STVBegin : QuestGrinderClass
{
    public STVBegin()
    {
        Name = "STV_Begin";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 34;
        RequiredQuest = 0;

        EntryTarget.Add(683);
EntryTarget.Add(1150);
EntryTarget.Add(681);
EntryTarget.Add(1108);
HotSpots.Add(new Vector3(-11590.09 , -430.901 , 15.39846 , "None"));
HotSpots.Add(new Vector3(-11646.86 , -512.2261 , 20.48176 , "None"));
HotSpots.Add(new Vector3(-11728.32 , -460.9688 , 21.75262 , "None"));
HotSpots.Add(new Vector3(-11742.01 , -376.0345 , 11.22843 , "None"));
HotSpots.Add(new Vector3(-11780.28 , -307.5483 , 14.33652 , "None"));
HotSpots.Add(new Vector3(-11887.09 , -260.9586 , 15.71009 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class STVISAIDS : QuestGrinderClass
{
    public STVISAIDS()
    {
        Name = "STV_IS_AIDS";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 35;
        RequiredQuest = 0;

        EntryTarget.Add(736);
EntryTarget.Add(685);
EntryTarget.Add(682);
EntryTarget.Add(702);
HotSpots.Add(new Vector3(-11858.7 , 317.857 , 20.57926 , "None"));
HotSpots.Add(new Vector3(-11883.37 , 484.8089 , 43.3209 , "None"));
HotSpots.Add(new Vector3(-11859.96 , 536.0484 , 47.34438 , "None"));
HotSpots.Add(new Vector3(-11844.04 , 532.4552 , 46.73326 , "None"));
HotSpots.Add(new Vector3(-11785.66 , 473.7874 , 45.68882 , "None"));
HotSpots.Add(new Vector3(-11705.71 , 419.989 , 47.32699 , "None"));
HotSpots.Add(new Vector3(-11646.05 , 414.4132 , 43.73692 , "None"));
HotSpots.Add(new Vector3(-11578.81 , 330.6475 , 44.12474 , "None"));
HotSpots.Add(new Vector3(-11673.13 , 224.5515 , 39.87225 , "None"));
HotSpots.Add(new Vector3(-11768.54 , 122.2811 , 18.1573 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Swampbeastgrind : QuestGrinderClass
{
    public Swampbeastgrind()
    {
        Name = "Swamp_beast_grind";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 40;
        RequiredQuest = 0;

        EntryTarget.Add(767);
EntryTarget.Add(858);
EntryTarget.Add(1084);
HotSpots.Add(new Vector3(-10230.04 , -2750.815 , 22.91085 , "None"));
HotSpots.Add(new Vector3(-10136.8 , -2909.347 , 22.21055 , "None"));
HotSpots.Add(new Vector3(-10312.44 , -2761.954 , 19.95518 , "None"));
IsGrinderNotQuest = true;

    }

        









}


public sealed class SwampMurksorrow : QuestGrinderClass
{
    public SwampMurksorrow()
    {
        Name = "Swamp_Murksorrow";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 100;
        RequiredQuest = 0;

        EntryTarget.Add(1082);
EntryTarget.Add(766);
EntryTarget.Add(768);
EntryTarget.Add(1087);
EntryTarget.Add(862);
HotSpots.Add(new Vector3(-10078.15 , -3653.25 , 21.41872 , "None"));
HotSpots.Add(new Vector3(-10033.17 , -3790.37 , 22.46593 , "None"));
HotSpots.Add(new Vector3(-9914.652 , -3951.595 , 17.40152 , "None"));
HotSpots.Add(new Vector3(-9848.005 , -4011.129 , 19.87768 , "None"));
HotSpots.Add(new Vector3(-10024.65 , -4156.489 , 21.13035 , "None"));
HotSpots.Add(new Vector3(-10178.25 , -4184.797 , 22.68451 , "None"));
HotSpots.Add(new Vector3(-10135.12 , -3858.599 , 21.58621 , "None"));
HotSpots.Add(new Vector3(-10109.25 , -3795.118 , 18.506 , "None"));
HotSpots.Add(new Vector3(-10081.85 , -3751.076 , 22.45379 , "None"));
HotSpots.Add(new Vector3(-10081.61 , -3658.716 , 22.29815 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class WestfallLongshore : QuestGrinderClass
{
    public WestfallLongshore()
    {
        Name = "Westfall Longshore";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 15;
        RequiredQuest = 0;

        EntryTarget.Add(830);
EntryTarget.Add(515);
HotSpots.Add(new Vector3(-9625.887 , 1327.959 , 3.079101 , "None"));
HotSpots.Add(new Vector3(-9639.119 , 1262.688 , 3.193765 , "None"));
HotSpots.Add(new Vector3(-9626.4 , 1214.644 , 4.895471 , "None"));
HotSpots.Add(new Vector3(-9630.749 , 1195.098 , 6.971467 , "None"));
HotSpots.Add(new Vector3(-9637.173 , 1190.391 , 6.773903 , "None"));
HotSpots.Add(new Vector3(-9647.89 , 1193.384 , 8.822766 , "None"));
HotSpots.Add(new Vector3(-9657.273 , 1217.457 , 9.490225 , "None"));
HotSpots.Add(new Vector3(-9660.209 , 1255.146 , 7.564721 , "None"));
HotSpots.Add(new Vector3(-9661.32 , 1297.699 , 8.472908 , "None"));
HotSpots.Add(new Vector3(-9654.462 , 1351.606 , 11.72199 , "None"));
HotSpots.Add(new Vector3(-9631.204 , 1426.548 , 11.20964 , "None"));
HotSpots.Add(new Vector3(-9622.666 , 1485.459 , 10.30197 , "None"));
HotSpots.Add(new Vector3(-9612.128 , 1478.531 , 8.261155 , "None"));
HotSpots.Add(new Vector3(-9613.39 , 1450.141 , 8.403517 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Westfalllowbieloop : QuestGrinderClass
{
    public Westfalllowbieloop()
    {
        Name = "Westfall lowbie loop";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 14;
        RequiredQuest = 0;

        EntryTarget.Add(834);
EntryTarget.Add(199);
EntryTarget.Add(833);
EntryTarget.Add(454);
EntryTarget.Add(480);
EntryTarget.Add(36);
HotSpots.Add(new Vector3(-9822.578 , 897.2963 , 29.96526 , "None"));
HotSpots.Add(new Vector3(-9759.349 , 934.0012 , 29.48291 , "None"));
HotSpots.Add(new Vector3(-9730.44 , 962.9957 , 33.5965 , "None"));
HotSpots.Add(new Vector3(-9759.054 , 1005.557 , 32.86989 , "None"));
HotSpots.Add(new Vector3(-9772.552 , 1050.018 , 28.45144 , "None"));
HotSpots.Add(new Vector3(-9781.615 , 1093.976 , 22.48202 , "None"));
HotSpots.Add(new Vector3(-9789.345 , 1131.464 , 32.9582 , "None"));
HotSpots.Add(new Vector3(-9790.164 , 1171.803 , 42.05415 , "None"));
HotSpots.Add(new Vector3(-9792.552 , 1210.311 , 40.45375 , "None"));
HotSpots.Add(new Vector3(-9795.185 , 1254.179 , 41.40313 , "None"));
HotSpots.Add(new Vector3(-9801.421 , 1289.843 , 41.02993 , "None"));
HotSpots.Add(new Vector3(-9809.911 , 1314.959 , 41.24231 , "None"));
HotSpots.Add(new Vector3(-9818.592 , 1344.285 , 44.91269 , "None"));
HotSpots.Add(new Vector3(-9824.599 , 1367.384 , 44.18043 , "None"));
HotSpots.Add(new Vector3(-9830.692 , 1390.819 , 47.03286 , "None"));
HotSpots.Add(new Vector3(-9837.827 , 1418.257 , 52.45859 , "None"));
HotSpots.Add(new Vector3(-9844.662 , 1444.542 , 56.61669 , "None"));
HotSpots.Add(new Vector3(-9857.084 , 1466.904 , 57.83773 , "None"));
HotSpots.Add(new Vector3(-9894.05 , 1492.958 , 62.11112 , "None"));
HotSpots.Add(new Vector3(-9939.098 , 1524.325 , 45.33115 , "None"));
HotSpots.Add(new Vector3(-9976.397 , 1535.679 , 42.30409 , "None"));
HotSpots.Add(new Vector3(-10019.79 , 1540.334 , 42.13766 , "None"));
HotSpots.Add(new Vector3(-10055.76 , 1539.994 , 47.21533 , "None"));
HotSpots.Add(new Vector3(-10089.43 , 1549.794 , 41.26094 , "None"));
HotSpots.Add(new Vector3(-10144.33 , 1546.187 , 43.29404 , "None"));
HotSpots.Add(new Vector3(-10191.67 , 1514.959 , 42.52101 , "None"));
HotSpots.Add(new Vector3(-10151.98 , 1476.904 , 41.69556 , "None"));
HotSpots.Add(new Vector3(-10128.23 , 1431.574 , 42.15988 , "None"));
HotSpots.Add(new Vector3(-10119.89 , 1378.217 , 40.6074 , "None"));
HotSpots.Add(new Vector3(-10126.96 , 1330.544 , 40.42905 , "None"));
HotSpots.Add(new Vector3(-10151.16 , 1270.839 , 38.77245 , "None"));
HotSpots.Add(new Vector3(-10180.89 , 1232.801 , 35.60665 , "None"));
HotSpots.Add(new Vector3(-10211.82 , 1193.108 , 38.3839 , "None"));
HotSpots.Add(new Vector3(-10233.4 , 1154.902 , 34.19578 , "None"));
HotSpots.Add(new Vector3(-10249.48 , 1118.323 , 36.683 , "None"));
HotSpots.Add(new Vector3(-10254.3 , 1087.515 , 39.34609 , "None"));
HotSpots.Add(new Vector3(-10264.76 , 1046.222 , 40.76031 , "None"));
HotSpots.Add(new Vector3(-10263.39 , 1007.769 , 36.77375 , "None"));
HotSpots.Add(new Vector3(-10252.53 , 961.7028 , 36.73125 , "None"));
HotSpots.Add(new Vector3(-10239.93 , 932.6965 , 44.37289 , "None"));
HotSpots.Add(new Vector3(-10207.92 , 924.6671 , 39.3058 , "None"));
HotSpots.Add(new Vector3(-10175.74 , 914.9877 , 38.74865 , "None"));
HotSpots.Add(new Vector3(-10154.4 , 900.1019 , 38.84264 , "None"));
HotSpots.Add(new Vector3(-10133.72 , 886.5713 , 33.94843 , "None"));
HotSpots.Add(new Vector3(-10111.77 , 875.7582 , 31.08417 , "None"));
HotSpots.Add(new Vector3(-10083.1 , 862.764 , 33.31622 , "None"));
HotSpots.Add(new Vector3(-10054.73 , 851.4335 , 33.62959 , "None"));
HotSpots.Add(new Vector3(-9997.934 , 833.5876 , 33.26068 , "None"));
HotSpots.Add(new Vector3(-9950.981 , 854.9409 , 32.23665 , "None"));
HotSpots.Add(new Vector3(-9927.234 , 867.1938 , 33.05429 , "None"));
HotSpots.Add(new Vector3(-9872.646 , 899.4903 , 32.27443 , "None"));
HotSpots.Add(new Vector3(-9841.313 , 911.5099 , 30.64702 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}


public sealed class Westfallsentinelhillloop : QuestGrinderClass
{
    public Westfallsentinelhillloop()
    {
        Name = "Westfall_sentinel_hill_loop";

        QuestId.AddRange(new[] { 0 });

        Step = new List<int> { 0, 0, 0, 0, 0 };

        StepAutoDetect = new[] { false, false, false, false, false };

        PickUpQuestOnItem = false;
        PickUpQuestOnItemID = 0;

        GossipOptionItem = 1;

        WoWClass = wManager.Wow.Enums.WoWClass.None;
        MinLevel = 0;
        MaxLevel = 18;
        RequiredQuest = 0;

        EntryTarget.Add(454);
EntryTarget.Add(157);
EntryTarget.Add(1109);
EntryTarget.Add(547);
EntryTarget.Add(154);
EntryTarget.Add(832);
EntryTarget.Add(533);
EntryTarget.Add(898);
EntryTarget.Add(205);
HotSpots.Add(new Vector3(-10345.3 , 1116.925 , 37.58374 , "None"));
HotSpots.Add(new Vector3(-10347.84 , 1127.337 , 36.66179 , "None"));
HotSpots.Add(new Vector3(-10349.97 , 1137.614 , 35.0749 , "None"));
HotSpots.Add(new Vector3(-10352.4 , 1147.695 , 35.1596 , "None"));
HotSpots.Add(new Vector3(-10356.58 , 1157.447 , 35.78918 , "None"));
HotSpots.Add(new Vector3(-10360.53 , 1167.166 , 36.7293 , "None"));
HotSpots.Add(new Vector3(-10364.28 , 1176.973 , 38.0699 , "None"));
HotSpots.Add(new Vector3(-10367.93 , 1186.813 , 39.71219 , "None"));
HotSpots.Add(new Vector3(-10370.88 , 1196.889 , 40.86306 , "None"));
HotSpots.Add(new Vector3(-10374.56 , 1206.798 , 42.3074 , "None"));
HotSpots.Add(new Vector3(-10380.6 , 1215.118 , 43.18911 , "None"));
HotSpots.Add(new Vector3(-10384.81 , 1224.848 , 46.72039 , "None"));
HotSpots.Add(new Vector3(-10389.28 , 1234.345 , 51.75371 , "None"));
HotSpots.Add(new Vector3(-10393.8 , 1243.82 , 53.78613 , "None"));
HotSpots.Add(new Vector3(-10395.7 , 1254.084 , 53.69973 , "None"));
HotSpots.Add(new Vector3(-10395.63 , 1264.564 , 50.75648 , "None"));
HotSpots.Add(new Vector3(-10395.23 , 1275.168 , 47.12009 , "None"));
HotSpots.Add(new Vector3(-10395.2 , 1285.667 , 43.81427 , "None"));
HotSpots.Add(new Vector3(-10395.45 , 1296.164 , 40.46404 , "None"));
HotSpots.Add(new Vector3(-10395.73 , 1306.66 , 40.6655 , "None"));
HotSpots.Add(new Vector3(-10395.98 , 1313.326 , 41.62156 , "None"));
HotSpots.Add(new Vector3(-10395.98 , 1313.326 , 41.62156 , "None"));
HotSpots.Add(new Vector3(-10395.26 , 1335.555 , 49.21541 , "None"));
HotSpots.Add(new Vector3(-10395.72 , 1356.526 , 56.81409 , "None"));
HotSpots.Add(new Vector3(-10401.01 , 1377.427 , 58.68695 , "None"));
HotSpots.Add(new Vector3(-10404.68 , 1398.16 , 49.46196 , "None"));
HotSpots.Add(new Vector3(-10414.24 , 1416.734 , 44.04874 , "None"));
HotSpots.Add(new Vector3(-10428.16 , 1432.096 , 44.73888 , "None"));
HotSpots.Add(new Vector3(-10445.22 , 1444.349 , 48.63386 , "None"));
HotSpots.Add(new Vector3(-10459.45 , 1451.515 , 48.14362 , "None"));
HotSpots.Add(new Vector3(-10464.21 , 1450.811 , 47.81923 , "None"));
HotSpots.Add(new Vector3(-10466.04 , 1450.54 , 47.65557 , "None"));
HotSpots.Add(new Vector3(-10467.78 , 1450.284 , 47.55448 , "None"));
HotSpots.Add(new Vector3(-10471.24 , 1449.773 , 47.35129 , "None"));
HotSpots.Add(new Vector3(-10474.7 , 1449.261 , 47.2522 , "None"));
HotSpots.Add(new Vector3(-10478.16 , 1448.75 , 47.18997 , "None"));
HotSpots.Add(new Vector3(-10481.63 , 1448.238 , 47.14607 , "None"));
HotSpots.Add(new Vector3(-10486.82 , 1447.471 , 47.16493 , "None"));
HotSpots.Add(new Vector3(-10488.55 , 1447.215 , 47.24068 , "None"));
HotSpots.Add(new Vector3(-10492.01 , 1446.704 , 47.39042 , "None"));
HotSpots.Add(new Vector3(-10495.47 , 1446.192 , 47.61766 , "None"));
HotSpots.Add(new Vector3(-10498.93 , 1445.68 , 48.16009 , "None"));
HotSpots.Add(new Vector3(-10502.4 , 1445.169 , 48.86063 , "None"));
HotSpots.Add(new Vector3(-10507.49 , 1444.417 , 49.86713 , "None"));
HotSpots.Add(new Vector3(-10509.22 , 1444.161 , 50.082 , "None"));
HotSpots.Add(new Vector3(-10512.79 , 1443.634 , 50.2811 , "None"));
HotSpots.Add(new Vector3(-10516.25 , 1443.123 , 50.03605 , "None"));
HotSpots.Add(new Vector3(-10519.71 , 1442.611 , 49.43059 , "None"));
HotSpots.Add(new Vector3(-10523.17 , 1442.099 , 48.5941 , "None"));
HotSpots.Add(new Vector3(-10526.75 , 1441.571 , 47.67646 , "None"));
HotSpots.Add(new Vector3(-10528.37 , 1441.332 , 47.25513 , "None"));
HotSpots.Add(new Vector3(-10530.32 , 1441.043 , 46.82249 , "None"));
HotSpots.Add(new Vector3(-10533.78 , 1440.532 , 46.14507 , "None"));
HotSpots.Add(new Vector3(-10537.24 , 1440.02 , 45.67047 , "None"));
HotSpots.Add(new Vector3(-10544.06 , 1439.014 , 45.05616 , "None"));
HotSpots.Add(new Vector3(-10547.52 , 1438.502 , 44.68507 , "None"));
HotSpots.Add(new Vector3(-10549.25 , 1438.246 , 44.46378 , "None"));
HotSpots.Add(new Vector3(-10550.98 , 1437.99 , 44.20835 , "None"));
HotSpots.Add(new Vector3(-10554.56 , 1437.462 , 43.63789 , "None"));
HotSpots.Add(new Vector3(-10558.02 , 1436.951 , 43.07583 , "None"));
HotSpots.Add(new Vector3(-10561.48 , 1436.439 , 42.5466 , "None"));
HotSpots.Add(new Vector3(-10564.94 , 1435.928 , 42.0952 , "None"));
HotSpots.Add(new Vector3(-10568.41 , 1435.416 , 41.70541 , "None"));
HotSpots.Add(new Vector3(-10570.03 , 1435.177 , 41.5471 , "None"));
HotSpots.Add(new Vector3(-10575.33 , 1434.393 , 41.08788 , "None"));
HotSpots.Add(new Vector3(-10578.79 , 1433.881 , 40.84906 , "None"));
HotSpots.Add(new Vector3(-10582.25 , 1433.37 , 40.65971 , "None"));
HotSpots.Add(new Vector3(-10585.82 , 1432.843 , 40.50149 , "None"));
HotSpots.Add(new Vector3(-10589.28 , 1432.331 , 40.37234 , "None"));
HotSpots.Add(new Vector3(-10590.8 , 1432.107 , 40.32568 , "None"));
HotSpots.Add(new Vector3(-10592.75 , 1431.82 , 40.26442 , "None"));
HotSpots.Add(new Vector3(-10596.21 , 1431.308 , 40.17381 , "None"));
HotSpots.Add(new Vector3(-10603.13 , 1430.285 , 40.00463 , "None"));
HotSpots.Add(new Vector3(-10606.71 , 1429.757 , 39.95228 , "None"));
HotSpots.Add(new Vector3(-10611.68 , 1429.021 , 39.95327 , "None"));
HotSpots.Add(new Vector3(-10613.52 , 1428.75 , 40.01098 , "None"));
HotSpots.Add(new Vector3(-10617.09 , 1428.222 , 40.21227 , "None"));
HotSpots.Add(new Vector3(-10620.67 , 1427.694 , 40.56444 , "None"));
HotSpots.Add(new Vector3(-10627.59 , 1426.671 , 41.46822 , "None"));
HotSpots.Add(new Vector3(-10632.56 , 1425.937 , 42.19419 , "None"));
HotSpots.Add(new Vector3(-10634.52 , 1425.648 , 42.46331 , "None"));
HotSpots.Add(new Vector3(-10637.98 , 1425.136 , 42.8812 , "None"));
HotSpots.Add(new Vector3(-10641.54 , 1424.609 , 43.24978 , "None"));
HotSpots.Add(new Vector3(-10648.47 , 1423.586 , 43.69353 , "None"));
HotSpots.Add(new Vector3(-10653.23 , 1422.881 , 43.74939 , "None"));
HotSpots.Add(new Vector3(-10655.31 , 1422.226 , 43.67384 , "None"));
HotSpots.Add(new Vector3(-10661.14 , 1418.649 , 43.08522 , "None"));
HotSpots.Add(new Vector3(-10663.74 , 1416.157 , 42.63768 , "None"));
HotSpots.Add(new Vector3(-10666.27 , 1413.738 , 42.16712 , "None"));
HotSpots.Add(new Vector3(-10668.8 , 1411.318 , 41.71032 , "None"));
HotSpots.Add(new Vector3(-10669.75 , 1410.409 , 41.55305 , "None"));
HotSpots.Add(new Vector3(-10671.33 , 1408.899 , 41.31928 , "None"));
HotSpots.Add(new Vector3(-10673.94 , 1406.402 , 41.11338 , "None"));
HotSpots.Add(new Vector3(-10676.47 , 1403.983 , 40.98872 , "None"));
HotSpots.Add(new Vector3(-10678.99 , 1401.554 , 41.00569 , "None"));
HotSpots.Add(new Vector3(-10683.26 , 1396.021 , 40.92806 , "None"));
HotSpots.Add(new Vector3(-10683.98 , 1395.05 , 40.88555 , "None"));
HotSpots.Add(new Vector3(-10685.33 , 1393.193 , 40.79359 , "None"));
HotSpots.Add(new Vector3(-10687.31 , 1390.186 , 40.56463 , "None"));
HotSpots.Add(new Vector3(-10689.12 , 1387.186 , 40.21742 , "None"));
HotSpots.Add(new Vector3(-10690.55 , 1383.993 , 39.77159 , "None"));
HotSpots.Add(new Vector3(-10691.94 , 1380.785 , 39.2492 , "None"));
HotSpots.Add(new Vector3(-10693.34 , 1377.576 , 38.66657 , "None"));
HotSpots.Add(new Vector3(-10693.78 , 1376.569 , 38.47739 , "None"));
HotSpots.Add(new Vector3(-10694.74 , 1374.368 , 38.05819 , "None"));
HotSpots.Add(new Vector3(-10696.14 , 1371.159 , 37.45621 , "None"));
HotSpots.Add(new Vector3(-10697.54 , 1367.95 , 36.92273 , "None"));
HotSpots.Add(new Vector3(-10698.94 , 1364.742 , 36.51424 , "None"));
HotSpots.Add(new Vector3(-10700.33 , 1361.533 , 36.30286 , "None"));
HotSpots.Add(new Vector3(-10701.73 , 1358.325 , 36.24968 , "None"));
HotSpots.Add(new Vector3(-10702.21 , 1357.221 , 36.25545 , "None"));
HotSpots.Add(new Vector3(-10703.17 , 1355.013 , 36.2682 , "None"));
HotSpots.Add(new Vector3(-10705.93 , 1348.7 , 36.42587 , "None"));
HotSpots.Add(new Vector3(-10707.37 , 1345.389 , 36.76352 , "None"));
HotSpots.Add(new Vector3(-10708.77 , 1342.18 , 37.33784 , "None"));
HotSpots.Add(new Vector3(-10710.17 , 1338.972 , 38.04172 , "None"));
HotSpots.Add(new Vector3(-10710.6 , 1337.971 , 38.27357 , "None"));
HotSpots.Add(new Vector3(-10711.56 , 1335.763 , 38.8258 , "None"));
HotSpots.Add(new Vector3(-10712.96 , 1332.555 , 39.73187 , "None"));
HotSpots.Add(new Vector3(-10714.36 , 1329.346 , 40.8027 , "None"));
HotSpots.Add(new Vector3(-10715.28 , 1327.241 , 41.54214 , "None"));
HotSpots.Add(new Vector3(-10716.98 , 1324.185 , 42.68941 , "None"));
HotSpots.Add(new Vector3(-10717.13 , 1323.893 , 42.79614 , "None"));
HotSpots.Add(new Vector3(-10718.58 , 1321.077 , 43.74804 , "None"));
HotSpots.Add(new Vector3(-10718.74 , 1320.785 , 43.83433 , "None"));
HotSpots.Add(new Vector3(-10720.19 , 1317.969 , 44.5593 , "None"));
HotSpots.Add(new Vector3(-10720.34 , 1317.676 , 44.62917 , "None"));
HotSpots.Add(new Vector3(-10720.6 , 1317.191 , 44.7446 , "None"));
HotSpots.Add(new Vector3(-10721.8 , 1314.86 , 45.1969 , "None"));
HotSpots.Add(new Vector3(-10721.95 , 1314.568 , 45.2503 , "None"));
HotSpots.Add(new Vector3(-10723.41 , 1311.752 , 45.60594 , "None"));
HotSpots.Add(new Vector3(-10723.56 , 1311.46 , 45.64013 , "None"));
HotSpots.Add(new Vector3(-10725.02 , 1308.644 , 45.86109 , "None"));
HotSpots.Add(new Vector3(-10725.17 , 1308.352 , 45.87188 , "None"));
HotSpots.Add(new Vector3(-10726.78 , 1305.244 , 45.87818 , "None"));
HotSpots.Add(new Vector3(-10727.33 , 1304.174 , 45.80026 , "None"));
HotSpots.Add(new Vector3(-10726.84 , 1300.995 , 46.04537 , "None"));
HotSpots.Add(new Vector3(-10728.23 , 1297.903 , 45.92943 , "None"));
HotSpots.Add(new Vector3(-10728.51 , 1297.317 , 45.90083 , "None"));
HotSpots.Add(new Vector3(-10729.75 , 1294.751 , 45.76891 , "None"));
HotSpots.Add(new Vector3(-10729.8 , 1294.657 , 45.76427 , "None"));
HotSpots.Add(new Vector3(-10731.27 , 1291.6 , 45.58273 , "None"));
HotSpots.Add(new Vector3(-10731.32 , 1291.506 , 45.57644 , "None"));
HotSpots.Add(new Vector3(-10732.76 , 1288.431 , 45.40627 , "None"));
HotSpots.Add(new Vector3(-10732.8 , 1288.335 , 45.40094 , "None"));
HotSpots.Add(new Vector3(-10734.22 , 1285.134 , 45.21838 , "None"));
HotSpots.Add(new Vector3(-10735.57 , 1282.022 , 45.00599 , "None"));
HotSpots.Add(new Vector3(-10735.62 , 1281.926 , 44.99877 , "None"));
HotSpots.Add(new Vector3(-10736.97 , 1278.813 , 44.77357 , "None"));
HotSpots.Add(new Vector3(-10737.28 , 1278.114 , 44.72667 , "None"));
HotSpots.Add(new Vector3(-10738.37 , 1275.605 , 44.53068 , "None"));
HotSpots.Add(new Vector3(-10738.41 , 1275.508 , 44.52153 , "None"));
HotSpots.Add(new Vector3(-10739.77 , 1272.396 , 44.2912 , "None"));
HotSpots.Add(new Vector3(-10739.81 , 1272.3 , 44.2849 , "None"));
HotSpots.Add(new Vector3(-10741.17 , 1269.187 , 44.09377 , "None"));
HotSpots.Add(new Vector3(-10741.21 , 1269.091 , 44.08853 , "None"));
HotSpots.Add(new Vector3(-10742.56 , 1265.979 , 43.92156 , "None"));
HotSpots.Add(new Vector3(-10742.61 , 1265.883 , 43.91771 , "None"));
HotSpots.Add(new Vector3(-10744 , 1262.674 , 43.80038 , "None"));
HotSpots.Add(new Vector3(-10744 , 1262.674 , 43.80038 , "None"));
HotSpots.Add(new Vector3(-10745.62 , 1258.965 , 43.74036 , "None"));
HotSpots.Add(new Vector3(-10746.8 , 1256.257 , 43.73339 , "None"));
HotSpots.Add(new Vector3(-10746.8 , 1256.257 , 43.73339 , "None"));
HotSpots.Add(new Vector3(-10748.2 , 1253.048 , 43.78594 , "None"));
HotSpots.Add(new Vector3(-10748.2 , 1253.048 , 43.78594 , "None"));
HotSpots.Add(new Vector3(-10749.6 , 1249.839 , 43.93257 , "None"));
HotSpots.Add(new Vector3(-10749.6 , 1249.839 , 43.93257 , "None"));
HotSpots.Add(new Vector3(-10751 , 1246.631 , 44.16896 , "None"));
HotSpots.Add(new Vector3(-10751 , 1246.631 , 44.16896 , "None"));
HotSpots.Add(new Vector3(-10752.39 , 1243.427 , 44.45167 , "None"));
HotSpots.Add(new Vector3(-10752.39 , 1243.427 , 44.45167 , "None"));
HotSpots.Add(new Vector3(-10753.79 , 1240.219 , 44.77606 , "None"));
HotSpots.Add(new Vector3(-10753.79 , 1240.219 , 44.77606 , "None"));
HotSpots.Add(new Vector3(-10754.05 , 1239.615 , 44.84309 , "None"));
HotSpots.Add(new Vector3(-10755.19 , 1237.01 , 45.13477 , "None"));
HotSpots.Add(new Vector3(-10755.19 , 1237.01 , 45.13477 , "None"));
HotSpots.Add(new Vector3(-10756.59 , 1233.802 , 45.52421 , "None"));
HotSpots.Add(new Vector3(-10756.59 , 1233.802 , 45.52421 , "None"));
HotSpots.Add(new Vector3(-10757.98 , 1230.593 , 45.93696 , "None"));
HotSpots.Add(new Vector3(-10758.03 , 1230.49 , 45.95069 , "None"));
HotSpots.Add(new Vector3(-10759.43 , 1227.282 , 46.37432 , "None"));
HotSpots.Add(new Vector3(-10759.43 , 1227.282 , 46.37432 , "None"));
HotSpots.Add(new Vector3(-10760.83 , 1224.073 , 46.80595 , "None"));
HotSpots.Add(new Vector3(-10760.83 , 1224.073 , 46.80595 , "None"));
HotSpots.Add(new Vector3(-10762.23 , 1220.867 , 47.24452 , "None"));
HotSpots.Add(new Vector3(-10762.23 , 1220.867 , 47.24452 , "None"));
HotSpots.Add(new Vector3(-10762.45 , 1220.367 , 47.30619 , "None"));
HotSpots.Add(new Vector3(-10763.7 , 1217.692 , 47.64813 , "None"));
HotSpots.Add(new Vector3(-10763.7 , 1217.692 , 47.64813 , "None"));
HotSpots.Add(new Vector3(-10765.25 , 1214.553 , 47.97261 , "None"));
HotSpots.Add(new Vector3(-10765.25 , 1214.553 , 47.97261 , "None"));
HotSpots.Add(new Vector3(-10766.8 , 1211.413 , 48.14466 , "None"));
HotSpots.Add(new Vector3(-10766.8 , 1211.413 , 48.14466 , "None"));
HotSpots.Add(new Vector3(-10768.34 , 1208.274 , 48.27291 , "None"));
HotSpots.Add(new Vector3(-10768.34 , 1208.274 , 48.27291 , "None"));
HotSpots.Add(new Vector3(-10769.89 , 1205.135 , 48.30629 , "None"));
HotSpots.Add(new Vector3(-10769.89 , 1205.135 , 48.30629 , "None"));
HotSpots.Add(new Vector3(-10771.68 , 1201.506 , 48.27896 , "None"));
HotSpots.Add(new Vector3(-10772.99 , 1198.857 , 48.20198 , "None"));
HotSpots.Add(new Vector3(-10772.99 , 1198.857 , 48.20198 , "None"));
HotSpots.Add(new Vector3(-10774.58 , 1195.623 , 48.01384 , "None"));
HotSpots.Add(new Vector3(-10774.58 , 1195.623 , 48.01384 , "None"));
HotSpots.Add(new Vector3(-10776.13 , 1192.484 , 47.80838 , "None"));
HotSpots.Add(new Vector3(-10776.18 , 1192.384 , 47.80341 , "None"));
HotSpots.Add(new Vector3(-10777.68 , 1189.345 , 47.58028 , "None"));
HotSpots.Add(new Vector3(-10777.73 , 1189.245 , 47.57293 , "None"));
HotSpots.Add(new Vector3(-10779.23 , 1186.084 , 47.31291 , "None"));
HotSpots.Add(new Vector3(-10779.23 , 1186.084 , 47.31291 , "None"));
HotSpots.Add(new Vector3(-10780.66 , 1182.411 , 47.03797 , "None"));
HotSpots.Add(new Vector3(-10781.51 , 1179.593 , 46.83208 , "None"));
HotSpots.Add(new Vector3(-10781.53 , 1179.483 , 46.82598 , "None"));
HotSpots.Add(new Vector3(-10782.26 , 1176.061 , 46.58092 , "None"));
HotSpots.Add(new Vector3(-10782.26 , 1176.061 , 46.58092 , "None"));
HotSpots.Add(new Vector3(-10782.99 , 1172.638 , 46.27807 , "None"));
HotSpots.Add(new Vector3(-10783.02 , 1172.528 , 46.26896 , "None"));
HotSpots.Add(new Vector3(-10783.72 , 1169.215 , 45.9521 , "None"));
HotSpots.Add(new Vector3(-10783.75 , 1169.105 , 45.94186 , "None"));
HotSpots.Add(new Vector3(-10784.13 , 1165.634 , 45.63652 , "None"));
HotSpots.Add(new Vector3(-10784.13 , 1165.634 , 45.63652 , "None"));
HotSpots.Add(new Vector3(-10784.3 , 1162.138 , 45.32608 , "None"));
HotSpots.Add(new Vector3(-10784.3 , 1162.138 , 45.32608 , "None"));
HotSpots.Add(new Vector3(-10784.31 , 1161.921 , 45.30887 , "None"));
HotSpots.Add(new Vector3(-10784.73 , 1155.263 , 44.6502 , "None"));
HotSpots.Add(new Vector3(-10784.74 , 1155.151 , 44.63864 , "None"));
HotSpots.Add(new Vector3(-10784.96 , 1151.659 , 44.28286 , "None"));
HotSpots.Add(new Vector3(-10784.96 , 1151.659 , 44.28286 , "None"));
HotSpots.Add(new Vector3(-10785.19 , 1148.166 , 43.88811 , "None"));
HotSpots.Add(new Vector3(-10785.19 , 1148.166 , 43.88811 , "None"));
HotSpots.Add(new Vector3(-10785.65 , 1141.181 , 42.87582 , "None"));
HotSpots.Add(new Vector3(-10785.65 , 1141.181 , 42.87582 , "None"));
HotSpots.Add(new Vector3(-10785.67 , 1140.853 , 42.81535 , "None"));
HotSpots.Add(new Vector3(-10786.1 , 1134.308 , 41.45269 , "None"));
HotSpots.Add(new Vector3(-10786.1 , 1134.308 , 41.45269 , "None"));
HotSpots.Add(new Vector3(-10786.34 , 1130.704 , 40.65431 , "None"));
HotSpots.Add(new Vector3(-10786.34 , 1130.704 , 40.65431 , "None"));
HotSpots.Add(new Vector3(-10786.79 , 1123.83 , 39.40499 , "None"));
HotSpots.Add(new Vector3(-10786.79 , 1123.719 , 39.39112 , "None"));
HotSpots.Add(new Vector3(-10787.02 , 1120.226 , 38.98626 , "None"));
HotSpots.Add(new Vector3(-10787.02 , 1120.226 , 38.98626 , "None"));
HotSpots.Add(new Vector3(-10787.04 , 1119.898 , 38.96637 , "None"));
HotSpots.Add(new Vector3(-10787.25 , 1116.734 , 38.77637 , "None"));
HotSpots.Add(new Vector3(-10787.26 , 1116.629 , 38.77466 , "None"));
HotSpots.Add(new Vector3(-10787.49 , 1113.136 , 38.82133 , "None"));
HotSpots.Add(new Vector3(-10787.49 , 1113.136 , 38.82133 , "None"));
HotSpots.Add(new Vector3(-10787.61 , 1109.64 , 39.0913 , "None"));
HotSpots.Add(new Vector3(-10787.61 , 1109.528 , 39.10146 , "None"));
HotSpots.Add(new Vector3(-10787.28 , 1106.045 , 39.50346 , "None"));
HotSpots.Add(new Vector3(-10787.28 , 1106.045 , 39.50346 , "None"));
HotSpots.Add(new Vector3(-10786.9 , 1102.565 , 39.93276 , "None"));
HotSpots.Add(new Vector3(-10786.9 , 1102.565 , 39.93276 , "None"));
HotSpots.Add(new Vector3(-10786.56 , 1099.082 , 40.22554 , "None"));
HotSpots.Add(new Vector3(-10786.56 , 1099.082 , 40.22554 , "None"));
HotSpots.Add(new Vector3(-10786.56 , 1099.082 , 40.22554 , "None"));
HotSpots.Add(new Vector3(-10786.37 , 1095.587 , 40.34512 , "None"));
HotSpots.Add(new Vector3(-10786.37 , 1095.587 , 40.34512 , "None"));
HotSpots.Add(new Vector3(-10786.2 , 1092.091 , 40.43882 , "None"));
HotSpots.Add(new Vector3(-10786.19 , 1091.98 , 40.43882 , "None"));
HotSpots.Add(new Vector3(-10786.02 , 1088.484 , 40.51056 , "None"));
HotSpots.Add(new Vector3(-10786.02 , 1088.484 , 40.51056 , "None"));
HotSpots.Add(new Vector3(-10785.85 , 1084.883 , 40.45046 , "None"));
HotSpots.Add(new Vector3(-10785.85 , 1084.883 , 40.45046 , "None"));
HotSpots.Add(new Vector3(-10785.51 , 1077.996 , 39.98694 , "None"));
HotSpots.Add(new Vector3(-10785.51 , 1077.996 , 39.98694 , "None"));
HotSpots.Add(new Vector3(-10785.51 , 1077.996 , 39.98694 , "None"));
HotSpots.Add(new Vector3(-10785.23 , 1074.512 , 39.48117 , "None"));
HotSpots.Add(new Vector3(-10785.21 , 1074.409 , 39.46384 , "None"));
HotSpots.Add(new Vector3(-10784.07 , 1071.105 , 38.74329 , "None"));
HotSpots.Add(new Vector3(-10784.07 , 1071.105 , 38.74329 , "None"));
HotSpots.Add(new Vector3(-10782.79 , 1067.847 , 38.13495 , "None"));
HotSpots.Add(new Vector3(-10782.79 , 1067.847 , 38.13495 , "None"));
HotSpots.Add(new Vector3(-10781.51 , 1064.59 , 37.75798 , "None"));
HotSpots.Add(new Vector3(-10781.51 , 1064.59 , 37.75798 , "None"));
HotSpots.Add(new Vector3(-10780.23 , 1061.332 , 37.66346 , "None"));
HotSpots.Add(new Vector3(-10780.19 , 1061.228 , 37.65768 , "None"));
HotSpots.Add(new Vector3(-10778.9 , 1057.973 , 37.5207 , "None"));
HotSpots.Add(new Vector3(-10778.9 , 1057.973 , 37.5207 , "None"));
HotSpots.Add(new Vector3(-10778.87 , 1057.875 , 37.51612 , "None"));
HotSpots.Add(new Vector3(-10777.58 , 1054.735 , 37.38746 , "None"));
HotSpots.Add(new Vector3(-10777.54 , 1054.638 , 37.38557 , "None"));
HotSpots.Add(new Vector3(-10774.64 , 1048.381 , 37.55708 , "None"));
HotSpots.Add(new Vector3(-10774.64 , 1048.381 , 37.55708 , "None"));
HotSpots.Add(new Vector3(-10771.63 , 1042.061 , 37.4524 , "None"));
HotSpots.Add(new Vector3(-10771.63 , 1042.061 , 37.4524 , "None"));
HotSpots.Add(new Vector3(-10770.04 , 1038.951 , 37.30756 , "None"));
HotSpots.Add(new Vector3(-10767.98 , 1036.121 , 37.21215 , "None"));
HotSpots.Add(new Vector3(-10767.98 , 1036.121 , 37.21215 , "None"));
HotSpots.Add(new Vector3(-10763.12 , 1030.936 , 36.69185 , "None"));
HotSpots.Add(new Vector3(-10763.12 , 1030.936 , 36.69185 , "None"));
HotSpots.Add(new Vector3(-10758.2 , 1026.107 , 34.94908 , "None"));
HotSpots.Add(new Vector3(-10758.2 , 1026.107 , 34.94908 , "None"));
HotSpots.Add(new Vector3(-10755.71 , 1023.651 , 33.62302 , "None"));
HotSpots.Add(new Vector3(-10755.71 , 1023.651 , 33.62302 , "None"));
HotSpots.Add(new Vector3(-10755.63 , 1023.577 , 33.58212 , "None"));
HotSpots.Add(new Vector3(-10753.27 , 1021.14 , 32.94486 , "None"));
HotSpots.Add(new Vector3(-10753.2 , 1021.064 , 32.93714 , "None"));
HotSpots.Add(new Vector3(-10750.85 , 1018.613 , 33.0402 , "None"));
HotSpots.Add(new Vector3(-10748.45 , 1016.061 , 33.21471 , "None"));
HotSpots.Add(new Vector3(-10748.45 , 1016.061 , 33.21471 , "None"));
HotSpots.Add(new Vector3(-10746.15 , 1013.429 , 33.49364 , "None"));
HotSpots.Add(new Vector3(-10746.08 , 1013.35 , 33.50525 , "None"));
HotSpots.Add(new Vector3(-10743.84 , 1010.798 , 35.01917 , "None"));
HotSpots.Add(new Vector3(-10743.77 , 1010.719 , 35.07953 , "None"));
HotSpots.Add(new Vector3(-10741.46 , 1008.088 , 37.02009 , "None"));
HotSpots.Add(new Vector3(-10741.46 , 1008.088 , 37.02009 , "None"));
HotSpots.Add(new Vector3(-10741.46 , 1008.088 , 37.02009 , "None"));
HotSpots.Add(new Vector3(-10739.15 , 1005.456 , 38.53327 , "None"));
HotSpots.Add(new Vector3(-10739.15 , 1005.456 , 38.53327 , "None"));
HotSpots.Add(new Vector3(-10736.85 , 1002.825 , 39.68711 , "None"));
HotSpots.Add(new Vector3(-10736.77 , 1002.741 , 39.72038 , "None"));
HotSpots.Add(new Vector3(-10734.46 , 1000.11 , 40.66141 , "None"));
HotSpots.Add(new Vector3(-10734.46 , 1000.11 , 40.66141 , "None"));
HotSpots.Add(new Vector3(-10729.92 , 994.9289 , 41.98633 , "None"));
HotSpots.Add(new Vector3(-10729.85 , 994.8422 , 41.98898 , "None"));
HotSpots.Add(new Vector3(-10728.04 , 991.9872 , 42.08613 , "None"));
HotSpots.Add(new Vector3(-10726.24 , 988.982 , 41.54138 , "None"));
HotSpots.Add(new Vector3(-10726.24 , 988.982 , 41.54138 , "None"));
HotSpots.Add(new Vector3(-10724.47 , 985.9627 , 40.89786 , "None"));
HotSpots.Add(new Vector3(-10724.47 , 985.9627 , 40.89786 , "None"));
HotSpots.Add(new Vector3(-10722.71 , 982.9355 , 40.21709 , "None"));
HotSpots.Add(new Vector3(-10722.71 , 982.9355 , 40.21709 , "None"));
HotSpots.Add(new Vector3(-10720.96 , 979.9046 , 39.83929 , "None"));
HotSpots.Add(new Vector3(-10720.96 , 979.9046 , 39.83929 , "None"));
HotSpots.Add(new Vector3(-10719.21 , 976.8737 , 39.97571 , "None"));
HotSpots.Add(new Vector3(-10719.21 , 976.8737 , 39.97571 , "None"));
HotSpots.Add(new Vector3(-10717.46 , 973.8427 , 40.59027 , "None"));
HotSpots.Add(new Vector3(-10717.46 , 973.8427 , 40.59027 , "None"));
HotSpots.Add(new Vector3(-10717.46 , 973.8427 , 40.59027 , "None"));
HotSpots.Add(new Vector3(-10715.99 , 970.6882 , 41.65002 , "None"));
HotSpots.Add(new Vector3(-10715.99 , 970.6882 , 41.65002 , "None"));
HotSpots.Add(new Vector3(-10714.85 , 967.3785 , 42.91033 , "None"));
HotSpots.Add(new Vector3(-10714.85 , 967.3785 , 42.91033 , "None"));
HotSpots.Add(new Vector3(-10713.7 , 964.0714 , 43.71557 , "None"));
HotSpots.Add(new Vector3(-10713.7 , 964.0714 , 43.71557 , "None"));
HotSpots.Add(new Vector3(-10712.54 , 960.7708 , 43.84388 , "None"));
HotSpots.Add(new Vector3(-10712.54 , 960.7708 , 43.84388 , "None"));
HotSpots.Add(new Vector3(-10711.38 , 957.47 , 43.6231 , "None"));
HotSpots.Add(new Vector3(-10711.38 , 957.47 , 43.6231 , "None"));
HotSpots.Add(new Vector3(-10710.17 , 954.0639 , 43.04905 , "None"));
HotSpots.Add(new Vector3(-10710.17 , 954.0639 , 43.04905 , "None"));
HotSpots.Add(new Vector3(-10710.17 , 954.0639 , 43.04905 , "None"));
HotSpots.Add(new Vector3(-10708.98 , 950.774 , 42.07753 , "None"));
HotSpots.Add(new Vector3(-10708.98 , 950.774 , 42.07753 , "None"));
HotSpots.Add(new Vector3(-10707.76 , 947.4936 , 40.83663 , "None"));
HotSpots.Add(new Vector3(-10707.72 , 947.389 , 40.79678 , "None"));
HotSpots.Add(new Vector3(-10706.47 , 944.2386 , 39.56656 , "None"));
HotSpots.Add(new Vector3(-10706.43 , 944.1346 , 39.52449 , "None"));
HotSpots.Add(new Vector3(-10704.95 , 940.9684 , 38.3354 , "None"));
HotSpots.Add(new Vector3(-10704.95 , 940.9684 , 38.3354 , "None"));
HotSpots.Add(new Vector3(-10702.57 , 938.4464 , 37.58685 , "None"));
HotSpots.Add(new Vector3(-10702.57 , 938.4464 , 37.58685 , "None"));
HotSpots.Add(new Vector3(-10699.81 , 936.2942 , 37.20553 , "None"));
HotSpots.Add(new Vector3(-10699.81 , 936.2942 , 37.20553 , "None"));
HotSpots.Add(new Vector3(-10699.64 , 936.1607 , 37.19077 , "None"));
HotSpots.Add(new Vector3(-10697.05 , 934.1419 , 37.00568 , "None"));
HotSpots.Add(new Vector3(-10697.05 , 934.1419 , 37.00568 , "None"));
HotSpots.Add(new Vector3(-10694.29 , 931.9938 , 36.93239 , "None"));
HotSpots.Add(new Vector3(-10694.29 , 931.9938 , 36.93239 , "None"));
HotSpots.Add(new Vector3(-10688.43 , 928.1854 , 37.09335 , "None"));
HotSpots.Add(new Vector3(-10688.43 , 928.1854 , 37.09335 , "None"));
HotSpots.Add(new Vector3(-10685.41 , 926.412 , 37.20799 , "None"));
HotSpots.Add(new Vector3(-10685.23 , 926.2996 , 37.21482 , "None"));
HotSpots.Add(new Vector3(-10682.42 , 924.2026 , 37.28698 , "None"));
HotSpots.Add(new Vector3(-10682.42 , 924.2026 , 37.28698 , "None"));
HotSpots.Add(new Vector3(-10682.34 , 924.1345 , 37.28792 , "None"));
HotSpots.Add(new Vector3(-10676.99 , 919.7955 , 37.472 , "None"));
HotSpots.Add(new Vector3(-10676.99 , 919.7955 , 37.472 , "None"));
HotSpots.Add(new Vector3(-10674.48 , 917.3543 , 37.65466 , "None"));
HotSpots.Add(new Vector3(-10674.48 , 917.3543 , 37.65466 , "None"));
HotSpots.Add(new Vector3(-10672.01 , 914.8792 , 37.86096 , "None"));
HotSpots.Add(new Vector3(-10672.01 , 914.8792 , 37.86096 , "None"));
HotSpots.Add(new Vector3(-10669.6 , 912.3419 , 38.12347 , "None"));
HotSpots.Add(new Vector3(-10669.6 , 912.3419 , 38.12347 , "None"));
HotSpots.Add(new Vector3(-10667.26 , 909.7391 , 38.32141 , "None"));
HotSpots.Add(new Vector3(-10667.26 , 909.7391 , 38.32141 , "None"));
HotSpots.Add(new Vector3(-10667.26 , 909.7391 , 38.32141 , "None"));
HotSpots.Add(new Vector3(-10664.92 , 907.1352 , 38.48346 , "None"));
HotSpots.Add(new Vector3(-10664.85 , 907.0519 , 38.48748 , "None"));
HotSpots.Add(new Vector3(-10662.58 , 904.5374 , 38.60005 , "None"));
HotSpots.Add(new Vector3(-10659.81 , 902.4363 , 38.79799 , "None"));
HotSpots.Add(new Vector3(-10656.63 , 901.0481 , 39.08274 , "None"));
HotSpots.Add(new Vector3(-10653.22 , 900.2357 , 39.42324 , "None"));
HotSpots.Add(new Vector3(-10653.22 , 900.2357 , 39.42324 , "None"));
HotSpots.Add(new Vector3(-10649.82 , 899.4367 , 39.77549 , "None"));
HotSpots.Add(new Vector3(-10649.71 , 899.4116 , 39.78677 , "None"));
HotSpots.Add(new Vector3(-10646.3 , 898.6209 , 40.13048 , "None"));
HotSpots.Add(new Vector3(-10646.3 , 898.6209 , 40.13048 , "None"));
HotSpots.Add(new Vector3(-10646.3 , 898.6209 , 40.13048 , "None"));
HotSpots.Add(new Vector3(-10639.47 , 897.062 , 40.7673 , "None"));
HotSpots.Add(new Vector3(-10639.47 , 897.062 , 40.7673 , "None"));
HotSpots.Add(new Vector3(-10636.03 , 896.4379 , 41.06469 , "None"));
HotSpots.Add(new Vector3(-10636.03 , 896.4379 , 41.06469 , "None"));
HotSpots.Add(new Vector3(-10632.57 , 895.9058 , 41.34731 , "None"));
HotSpots.Add(new Vector3(-10632.57 , 895.9058 , 41.34731 , "None"));
HotSpots.Add(new Vector3(-10629.11 , 895.3771 , 41.5998 , "None"));
HotSpots.Add(new Vector3(-10629.11 , 895.3771 , 41.5998 , "None"));
HotSpots.Add(new Vector3(-10625.65 , 894.8615 , 41.75677 , "None"));
HotSpots.Add(new Vector3(-10625.65 , 894.8615 , 41.75677 , "None"));
HotSpots.Add(new Vector3(-10625.54 , 894.8459 , 41.7579 , "None"));
HotSpots.Add(new Vector3(-10622.19 , 894.3458 , 41.80665 , "None"));
HotSpots.Add(new Vector3(-10622.08 , 894.3304 , 41.8029 , "None"));
HotSpots.Add(new Vector3(-10618.62 , 893.8148 , 41.72551 , "None"));
HotSpots.Add(new Vector3(-10615.16 , 893.2991 , 41.49349 , "None"));
HotSpots.Add(new Vector3(-10615.16 , 893.2991 , 41.49349 , "None"));
HotSpots.Add(new Vector3(-10611.7 , 892.7835 , 41.18452 , "None"));
HotSpots.Add(new Vector3(-10611.7 , 892.7835 , 41.18452 , "None"));
HotSpots.Add(new Vector3(-10608.24 , 892.2679 , 40.79601 , "None"));
HotSpots.Add(new Vector3(-10608.24 , 892.2679 , 40.79601 , "None"));
HotSpots.Add(new Vector3(-10604.77 , 891.7523 , 40.33307 , "None"));
HotSpots.Add(new Vector3(-10604.77 , 891.7523 , 40.33307 , "None"));
HotSpots.Add(new Vector3(-10604.66 , 891.7358 , 40.31765 , "None"));
HotSpots.Add(new Vector3(-10601.31 , 891.2367 , 39.80136 , "None"));
HotSpots.Add(new Vector3(-10601.31 , 891.2367 , 39.80136 , "None"));
HotSpots.Add(new Vector3(-10597.85 , 890.7211 , 39.19389 , "None"));
HotSpots.Add(new Vector3(-10597.85 , 890.7211 , 39.19389 , "None"));
HotSpots.Add(new Vector3(-10594.39 , 890.2054 , 38.49747 , "None"));
HotSpots.Add(new Vector3(-10594.28 , 890.189 , 38.47563 , "None"));
HotSpots.Add(new Vector3(-10590.82 , 889.6733 , 37.74195 , "None"));
HotSpots.Add(new Vector3(-10590.82 , 889.6733 , 37.74195 , "None"));
HotSpots.Add(new Vector3(-10587.35 , 889.1577 , 36.94033 , "None"));
HotSpots.Add(new Vector3(-10587.35 , 889.1577 , 36.94033 , "None"));
HotSpots.Add(new Vector3(-10583.88 , 888.9265 , 36.29501 , "None"));
HotSpots.Add(new Vector3(-10583.88 , 888.9265 , 36.29501 , "None"));
HotSpots.Add(new Vector3(-10583.77 , 888.9357 , 36.28426 , "None"));
HotSpots.Add(new Vector3(-10580.42 , 889.4562 , 35.79353 , "None"));
HotSpots.Add(new Vector3(-10580.42 , 889.4562 , 35.79353 , "None"));
HotSpots.Add(new Vector3(-10576.97 , 890.0385 , 35.4165 , "None"));
HotSpots.Add(new Vector3(-10576.97 , 890.0385 , 35.4165 , "None"));
HotSpots.Add(new Vector3(-10576.43 , 890.131 , 35.39772 , "None"));
HotSpots.Add(new Vector3(-10572.07 , 890.4932 , 35.19827 , "None"));
HotSpots.Add(new Vector3(-10570 , 890.684 , 35.07667 , "None"));
HotSpots.Add(new Vector3(-10570 , 890.684 , 35.07667 , "None"));
HotSpots.Add(new Vector3(-10568.59 , 890.7766 , 34.98099 , "None"));
HotSpots.Add(new Vector3(-10563.17 , 890.0997 , 34.91813 , "None"));
HotSpots.Add(new Vector3(-10563.06 , 890.0832 , 34.92389 , "None"));
HotSpots.Add(new Vector3(-10563.06 , 890.0832 , 34.92389 , "None"));
HotSpots.Add(new Vector3(-10561.66 , 889.8738 , 35.00631 , "None"));
HotSpots.Add(new Vector3(-10559.6 , 889.5676 , 35.16967 , "None"));
HotSpots.Add(new Vector3(-10559.6 , 889.5676 , 35.16967 , "None"));
HotSpots.Add(new Vector3(-10558.19 , 889.3582 , 35.32634 , "None"));
HotSpots.Add(new Vector3(-10556.14 , 889.0519 , 35.58984 , "None"));
HotSpots.Add(new Vector3(-10556.14 , 889.0519 , 35.58984 , "None"));
HotSpots.Add(new Vector3(-10554.72 , 888.9402 , 35.79105 , "None"));
HotSpots.Add(new Vector3(-10549.68 , 891.5139 , 35.72918 , "None"));
HotSpots.Add(new Vector3(-10549.68 , 891.5139 , 35.72918 , "None"));
HotSpots.Add(new Vector3(-10548.54 , 892.1577 , 35.69925 , "None"));
HotSpots.Add(new Vector3(-10545.49 , 893.8792 , 35.55242 , "None"));
HotSpots.Add(new Vector3(-10543.5 , 894.3572 , 35.55721 , "None"));
HotSpots.Add(new Vector3(-10543.39 , 894.3708 , 35.5653 , "None"));
HotSpots.Add(new Vector3(-10539.93 , 894.9244 , 35.93095 , "None"));
HotSpots.Add(new Vector3(-10539.93 , 894.9244 , 35.93095 , "None"));
HotSpots.Add(new Vector3(-10539.93 , 894.9244 , 35.93095 , "None"));
HotSpots.Add(new Vector3(-10538.64 , 895.1492 , 36.04207 , "None"));
HotSpots.Add(new Vector3(-10536.48 , 895.5255 , 36.2919 , "None"));
HotSpots.Add(new Vector3(-10536.48 , 895.5255 , 36.2919 , "None"));
HotSpots.Add(new Vector3(-10533.04 , 896.1259 , 36.66165 , "None"));
HotSpots.Add(new Vector3(-10532.94 , 896.1439 , 36.67215 , "None"));
HotSpots.Add(new Vector3(-10531.75 , 896.3506 , 36.7921 , "None"));
HotSpots.Add(new Vector3(-10529.49 , 896.7449 , 36.97011 , "None"));
HotSpots.Add(new Vector3(-10529.49 , 896.7449 , 36.97011 , "None"));
HotSpots.Add(new Vector3(-10528.3 , 896.9512 , 37.05246 , "None"));
HotSpots.Add(new Vector3(-10524.86 , 897.5522 , 36.91331 , "None"));
HotSpots.Add(new Vector3(-10522.59 , 897.9465 , 36.95799 , "None"));
HotSpots.Add(new Vector3(-10522.59 , 897.9465 , 36.95799 , "None"));
HotSpots.Add(new Vector3(-10521.41 , 898.1533 , 36.74223 , "None"));
HotSpots.Add(new Vector3(-10519.25 , 898.5295 , 36.57885 , "None"));
HotSpots.Add(new Vector3(-10517.96 , 898.7543 , 36.54529 , "None"));
HotSpots.Add(new Vector3(-10515.7 , 899.1486 , 36.30665 , "None"));
HotSpots.Add(new Vector3(-10515.7 , 899.1486 , 36.30665 , "None"));
HotSpots.Add(new Vector3(-10514.51 , 899.3553 , 36.26468 , "None"));
HotSpots.Add(new Vector3(-10512.25 , 899.7496 , 36.1727 , "None"));
HotSpots.Add(new Vector3(-10512.25 , 899.7496 , 36.1727 , "None"));
HotSpots.Add(new Vector3(-10511.06 , 899.9564 , 36.14245 , "None"));
HotSpots.Add(new Vector3(-10508.69 , 900.3699 , 36.07174 , "None"));
HotSpots.Add(new Vector3(-10508.69 , 900.3699 , 36.07174 , "None"));
HotSpots.Add(new Vector3(-10507.62 , 900.5574 , 36.05624 , "None"));
HotSpots.Add(new Vector3(-10504.17 , 901.1585 , 36.10837 , "None"));
HotSpots.Add(new Vector3(-10502.06 , 902.0055 , 36.01036 , "None"));
HotSpots.Add(new Vector3(-10501.97 , 902.063 , 36.01036 , "None"));
HotSpots.Add(new Vector3(-10499.06 , 903.8054 , 36.00349 , "None"));
HotSpots.Add(new Vector3(-10499.06 , 903.8054 , 36.00349 , "None"));
HotSpots.Add(new Vector3(-10498.12 , 904.3706 , 36.014 , "None"));
HotSpots.Add(new Vector3(-10496.06 , 905.6053 , 36.10382 , "None"));
HotSpots.Add(new Vector3(-10495.96 , 905.6629 , 36.10862 , "None"));
HotSpots.Add(new Vector3(-10495.03 , 906.2245 , 36.1358 , "None"));
HotSpots.Add(new Vector3(-10492.02 , 908.0244 , 36.16734 , "None"));
HotSpots.Add(new Vector3(-10491.18 , 908.532 , 36.22593 , "None"));
IsGrinderNotQuest = true;

    }

        






public override bool HasQuest() { return true; }


}

