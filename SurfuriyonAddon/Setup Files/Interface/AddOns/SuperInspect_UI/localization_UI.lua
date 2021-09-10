SI_IB_CATEGORIES = {'ATT', 'BON', 'SBON', 'RES', 'SKILL', 'OBON', 'COH'};
SI_IB_YELLOW = "|cffffff00";
--Language Localization-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

--English--------------------------------------------------
-----------------------------------------------------------
if (GetLocale() == "enUS") then
	SI_DURABILITY = "Durability";

	SI_COMPARE_TOOLTIP = "Click to copy this item bonus\nto the compare window to\ncompare with another player";

	-- general
	SI_IB_TEXT = "Item Bonuses";

	SI_IB_CAT_ATT = "Attributes";
	SI_IB_CAT_RES = "Resistance";
	SI_IB_CAT_SKILL = "Skills";
	SI_IB_CAT_BON = "Combat";
	SI_IB_CAT_SBON = "Spells";
	SI_IB_CAT_OBON = "Health and Mana";
	SI_IB_CAT_COH = "Chance on Hit";
		
	-- bonus names
	SI_IB_ARMOR 	= "Reinforced Armor";

	SI_IB_FISHING	= "Fishing";
	SI_IB_MINING	= "Mining";
	SI_IB_HERBALISM	= "Herbalism";
	SI_IB_SKINNING	= "Skinning";
	SI_IB_DEFENSE	= "Defense";
		
	SI_IB_HIT_WOUND = "Wound Target for";
	SI_IB_HIT_SHADOW = "Shadowy Bolt";

	SI_IB_BLOCK = "Block Chance";
	SI_IB_DODGE = "Dodge Chance";
	SI_IB_PARRY = "Parry Chance";
	SI_IB_CRIT = "Crit. Strike";
	SI_IB_RANGEDCRIT = "Crit. Ranged";
	SI_IB_TOHIT = "Hit Chance";
	SI_IB_WEPDMG = "Weapon Damage";
	SI_IB_XTRAHIT = "Extra Hit Chance";
	SI_IB_RANDMG = "Ranged Damage";
	SI_IB_DMG = "Spell Damage";
	SI_IB_ARCANEDMG = "Arcane Damage";
	SI_IB_FIREDMG = "Fire Damage";
	SI_IB_FROSTDMG = "Frost Damage";
	SI_IB_HOLYDMG = "Holy Damage";
	SI_IB_NATUREDMG = "Nature Damage";
	SI_IB_SHADOWDMG = "Shadow Damage";
	SI_IB_SPELLCRIT = "Crit. Spell";
	SI_IB_SPELLTOHIT 	= "Spell Hit Chance";
	SI_IB_HOLYCRIT 	= "Crit. Holy Spell";
	
	SI_IB_HEAL = "Healing";
	SI_IB_HEALCRIT = "Crit. Healing";
	SI_IB_HEALTHREG = "Health Regen";
	SI_IB_MANAREG = "Mana Regen";
	SI_IB_HEALTH = "Health Points";
	SI_IB_MANA = "Mana Points";	

	-- equip and set bonus patterns:
	SI_IB_EQUIP_PREFIX = "Equip: ";
	SI_IB_SET_PREFIX = "Set: ";
	SI_IB_COH_PREFIX = "Chance on Hit: ";

	SI_IB_EQUIP_PATTERNS = {
		{ pattern = "+(%d+) Attack Power%.", effect = "ATTACKPOWER" },
		{ pattern = "+(%d+) ranged Attack Power%.", effect = "RANGEDATTACKPOWER" },
		{ pattern = "Increases your chance to block .+ by (%d+)%%%.", effect = "BLOCK" },
		{ pattern = "Increases your chance to dodge an attack by (%d+)%%%.", effect = "DODGE" },
		{ pattern = "Increases your chance to parry an attack by (%d+)%%%.", effect = "PARRY" },
		{ pattern = "Improves your chance to get a critical strike with spells by (%d+)%%%.", effect = "SPELLCRIT" },
		{ pattern = "Improves your chance to get a critical strike by (%d+)%%%.", effect = "CRIT" },
		{ pattern = "Improves your chance to get a critical strike with missile weapons by (%d+)%%%.", effect = "RANGEDCRIT" },
		{ pattern = "Increases the critical effect chance of your Holy spells by (%d+)%%%.", effect = "HEALCRIT" },
		{ pattern = "Increases damage done by Arcane spells and effects by up to (%d+)%.", effect = "ARCANEDMG" },
		{ pattern = "Increases damage done by Fire spells and effects by up to (%d+)%.", effect = "FIREDMG" },
		{ pattern = "Increases damage done by Frost spells and effects by up to (%d+)%.", effect = "FROSTDMG" },
		{ pattern = "Increases damage done by Holy spells and effects by up to (%d+)%.", effect = "HOLYDMG" },
		{ pattern = "Increases damage done by Nature spells and effects by up to (%d+)%.", effect = "NATUREDMG" },
		{ pattern = "Increases damage done by Shadow spells and effects by up to (%d+)%.", effect = "SHADOWDMG" },
		{ pattern = "Increases healing done by spells and effects by up to (%d+)%.", effect = "HEAL" },
		{ pattern = "Increases damage and healing done by magical spells and effects by up to (%d+)%.", effect = "HEAL" },
		{ pattern = "Increases damage and healing done by magical spells and effects by up to (%d+)%.", effect = "DMG" },
		{ pattern = "Restores (%d+) health .+ %d+ sec", effect = "HEALTHREG" },
		{ pattern = "Restores (%d+) mana .+ %d+ sec", effect = "MANAREG" },
		{ pattern = "Improves your chance to hit by (%d+)%%%.", effect = "TOHIT" },
		{ pattern = "Increases your normal health and mana regeneration by (%d+)", effect = {"HEALTHREG", "MANAREG"} },
		{ pattern = "Increased Defense %+(%d+)", effect = "DEFENSE" },
		{ pattern = "Improves your chance to hit with spells by (%d+)%%%.", effect = "SPELLTOHIT" },
		{ pattern = "Increases the block value of your shield by (%d+)", effect = "BLOCKAMT" },
		{ pattern = "(%d+)%% chance on hit to gain 1 extra attack", effect = "XTRAHIT" },
		{ pattern = "Wounds the target for (%d+) damage.", effect = "HIT_WOUND" },
		{ pattern = "Send a shadowy bolt at the enemy causing %d+ to (%d+) Shadow damage.", effect = "HIT_SHADOW" },
	};


	SI_IB_S1 = {
		{ pattern = "Arcane", 	effect = "ARCANE" },	
		{ pattern = "Fire", 	effect = "FIRE" },	
		{ pattern = "Frost", 	effect = "FROST" },	
		{ pattern = "Holy", 	effect = "HOLY" },	
		{ pattern = "Shadow",	effect = "SHADOW" },	
		{ pattern = "Nature", 	effect = "NATURE" }
	}; 	

	SI_IB_S2 = {
		{ pattern = "Resist", 	effect = "RES" },	
		{ pattern = "Damage", 	effect = "DMG" }
	}; 	
		
	SI_IB_TOKEN_EFFECT = {
		["All Stats"] 			= {"STR", "AGI", "STA", "INT", "SPI"},
		["Strength"]			= "STR",
		["Agility"]				= "AGI",
		["Stamina"]				= "STA",
		["Intellect"]			= "INT",
		["Spirit"] 				= "SPI",

		["All Resistances"] 	= { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

		["Fishing"]				= "FISHING",
		["Fishing Lure"]		= "FISHING", --new
		["Increased Fishing"]	= "FISHING", --new
		["Mining"]				= "MINING",
		["Herbalism"]			= "HERBALISM",
		["Skinning"]			= "SKINNING",
		["Defense"]				= "DEFENSE",

		["Attack Power"] 		= "ATTACKPOWER",
		["Dodge"] 				= "DODGE",
		["Block"]				= "BLOCK",
		["Shield Block Value"]				= "BLOCKAMT", --new
		["Blocking"]			= "BLOCK",
		["Hit"] 				= "TOHIT",
		["Ranged Attack Power"] = "RANGEDATTACKPOWER",
		["health every %d sec"] = "HEALTHREG",
		["Healing Spells"] 		= "HEAL", --new
		["Increases Healing"] 	= "HEAL", --new
		["Healing and Spell Damage"] = {"HEAL", "DMG"}, --new
		["Damage and Healing Spells"] = {"HEAL", "DMG"}, --new
		["Spell Damage and Healing"] = {"HEAL", "DMG"},	--new
		["mana every %d sec"] 	= "MANAREG",
		["Mana Regen"] 	= "MANAREG",
		["Spell Damage"] 		= "DMG",
		["Critical"] 			= "CRIT", --new
		["Critical Hit"] 		= "CRIT",
		["Damage"] 				= "DMG",
		["Health"]				= "HEALTH",
		["HP"]				= "HEALTH", --new
		["Mana"]				= "MANA",
		["Armor"]				= "ARMOR",
		["Reinforced Armor"]	= "ARMOR",
		["Weapon Damage"]	= "WEPDMG",

		--Scope (+X Damage) 
	};	

	SI_IB_OTHER_PATTERNS = {
		{ pattern = "Mana Regen (%d+) per 5 sec%.", effect = "MANAREG" },
		{ pattern = "Zandalar Signet of Might", effect = "ATTACKPOWER", value = 30 },
		{ pattern = "Zandalar Signet of Mojo", effect = {"DMG", "HEAL"}, value = 18 },
		{ pattern = "Zandalar Signet of Serenity", effect = "HEAL", value = 33 },
		
		{ pattern = "Minor Wizard Oil", effect = {"DMG", "HEAL"}, value = 8 },
		{ pattern = "Lesser Wizard Oil", effect = {"DMG", "HEAL"}, value = 16 },
		{ pattern = "Wizard Oil", effect = {"DMG", "HEAL"}, value = 24 },
		{ pattern = "Brilliant Wizard Oil", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },

		{ pattern = "Minor Mana Oil", effect = "MANAREG", value = 4 },
		{ pattern = "Lesser Mana Oil", effect = "MANAREG", value = 8 },
		{ pattern = "Brilliant Mana Oil", effect = { "MANAREG", "HEAL"}, value = {12, 25} },
		{ pattern = "Scope %(%+(%d+) Damage%)", effect = "RANDMG" },

	};

	--TRANSLATE ME
	SI_BONUSWINDOWTITLE = "Item Bonus Summary";
	SI_ITEMSHIDE = "Hide Items";
	SI_ITEMSSHOW = "Show Items";
	SI_ITEMBUTTON_TOOLTIP = "Toggle the display of target's inventory";
	SI_HONORHIDE = "Hide Honor";
	SI_HONORSHOW = "Show Honor";
	SI_HONORBUTTON_TOOLTIP = "Toggle the display of target's honor";
	SI_BONUSESHIDE = "Hide Bonuses";
	SI_BONUSESSHOW = "Show Bonuses";
	SI_BONUSESBUTTON_TOOLTIP = "Toggle the display of target's item bonuses";
	SI_MOBINFOHIDE = "Hide MobInfo";
	SI_MOBINFOSHOW = "Show MobInfo";
	SI_MOBINFOBUTTON_TOOLTIP = "Toggle targeted mob's information gathered";
	SI_LEVEL = "Level";
	SI_NOTARGET = "You must have a target selected";
	SI_REQUESTHONOR = "Requesting Honor Data...";
	SI_REQUESTHONORFAILED = "Request Failed\n(your target may be too far away)";
	SI_SETS = "Sets";
	SI_RAREELITE = ITEM_QUALITY3_DESC..ELITE;
end

--German---------------------------------------------------
-----------------------------------------------------------
--Last Update : 03/02/2006 
if ( GetLocale() == "deDE" ) then
	SI_DURABILITY = "Durability";

	SI_COMPARE_TOOLTIP = "Click to copy this item bonus to the compare window to care with another player";

       -- Allgemeines
       SI_IB_TEXT = "Gegenstandboni";
       SI_IB_DISPLAY_NONE = "Keine Anzeige";
       SI_IB_SHORTDISPLAY = "Kurze Beschriftung";

       SI_IB_CAT_ATT = "Attribute";
       SI_IB_CAT_RES = "Widerstand";
       SI_IB_CAT_SKILL = "Fertigkeiten";
       SI_IB_CAT_BON = "Nah- und Fernkampf";
       SI_IB_CAT_SBON = "Zauber";
       SI_IB_CAT_OBON = "Leben und Mana";

	SI_IB_HIT_WOUND = "Wound Target for";
	SI_IB_HIT_SHADOW = "Shadowy Bolt";

       -- Namen der Boni
       SI_IB_STR = "St\195\164rke";
       SI_IB_AGI = "Beweglichkeit";
       SI_IB_STA = "Ausdauer";
       SI_IB_INT = "Intelligenz";
       SI_IB_SPI = "Willenskraft";
       SI_IB_ARMOR = "Verst\195\164rkte R\195\188stung";

       SI_IB_ARCANERES = "Arkanwiderstand";
       SI_IB_FIRERES   = "Feuerwiderstand";
       SI_IB_NATURERES = "Naturwiderstand";
       SI_IB_FROSTRES  = "Frostwiderstand";
       SI_IB_SHADOWRES = "Schattenwiderstand";

       SI_IB_FISHING   = "Angeln";
       SI_IB_MINING    = "Bergbau";
       SI_IB_HERBALISM = "Kr\195\164uterkunde";
       SI_IB_SKINNING  = "K\195\188rschnerei";
       SI_IB_DEFENSE   = "Verteidigung";

       SI_IB_BLOCK = "Blocken"; --this should say "Chance to Block" instead
       SI_IB_DODGE = "Ausweichen";
       SI_IB_PARRY = "Parieren";
       SI_IB_ATTACKPOWER = "Angriffskraft";
       --TRANSLATE
       SI_IB_WEPDMG = "Waffenschaden"; --new
	SI_IB_XTRAHIT = "Extra Hit Chance";
	SI_IB_RANDMG = "Fernkampfschaden";
       SI_IB_WOUND = "Wound Target for"; --new

       SI_IB_CRIT = "krit. Treffer";
       SI_IB_RANGEDATTACKPOWER = "Distanzangriffskraft";
       SI_IB_RANGEDCRIT = "krit. Schuss";
       SI_IB_TOHIT = "Trefferchance";
       SI_IB_DMG = "Zauberschaden";
       SI_IB_ARCANEDMG = "Arkanschaden";
       SI_IB_FIREDMG = "Feuerschaden";
       SI_IB_FROSTDMG = "Frostschaden";
       SI_IB_HOLYDMG = "Heiligschaden";
       SI_IB_NATUREDMG = "Naturschaden";
       SI_IB_SHADOWDMG = "Schattenschaden";
       SI_IB_SPELLCRIT = "krit. Zauber";
       SI_IB_HOLYCRIT 	= "krit. Heiligzauber";
       SI_IB_SPELLTOHIT = "Zaubertrefferchance";
       
       SI_IB_HEAL = "Heilung";
       SI_IB_HEALTHREG = "Lebensregeneration";
       SI_IB_MANAREG = "Manaregeneration";
       SI_IB_HEALTH = "Lebenspunkte";
       SI_IB_MANA = "Manapunkte";

       -- "Verwenden: " und Set-Suchmuster
       SI_IB_EQUIP_PREFIX = "Anlegen: ";
       SI_IB_SET_PREFIX = "Set: ";
       SI_IB_COH_PREFIX = "Chance on Hit: ";

       SI_IB_EQUIP_PATTERNS = {
               { pattern = "%+(%d+) bei allen Widerstandsarten%.", effect = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"} },
               { pattern = "Erh\195\182ht Eure Chance, Angriffe mit einem Schild zu blocken, um (%d+)%%%.", effect = "BLOCK" },
               { pattern = "Erh\195\182ht Eure Chance, einem Angriff auszuweichen, um (%d+)%%%.", effect = "DODGE" },
               { pattern = "Erh\195\182ht Eure Chance, einen Angriff zu parieren, um (%d+)%%%.", effect = "PARRY" },
               { pattern = "Erh\195\182ht Eure Chance, einen kritischen Schlag durch Zauber zu erzielen, um (%d+)%%%.", effect = "SPELLCRIT" },
               { pattern = "Erh\195\182ht Eure Chance, einen kritischen Schlag durch Heiligzauber zu erzielen, um (%d+)%%%.", effect = "HOLYCRIT" },
               { pattern = "Erh\195\182ht Eure Chance, einen kritischen Schlag zu erzielen, um (%d+)%%%.", effect = "CRIT" },
               { pattern = "Erh\195\182ht Eure Chance, mit Geschosswaffen einen kritischen Schlag zu erzielen, um (%d+)%.", effect = "RANGEDCRIT" },
               { pattern = "Erh\195\182ht durch Arkanzauber und Arkaneffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "ARCANEDMG" },
               { pattern = "Erh\195\182ht durch Feuerzauber und Feuereffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "FIREDMG" },
               { pattern = "Erh\195\182ht durch Frostzauber und Frosteffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "FROSTDMG" },
               { pattern = "Erh\195\182ht durch Heiligzauber und Heiligeffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "HOLYDMG" },
               { pattern = "Erh\195\182ht durch Naturzauber und Natureffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "NATUREDMG" },
               { pattern = "Erh\195\182ht durch Schattenzauber und Schatteneffekte zugef\195\188gten Schaden um bis zu (%d+)%.", effect = "SHADOWDMG" },
               { pattern = "Erh\195\182ht durch Zauber und magische Effekte zugef\195\188gten Schaden und Heilung um bis zu (%d+)%.", effect = {"HEAL","DMG"} },
               { pattern = "Erh\195\182ht durch Zauber und Effekte verursachte Heilung um bis zu (%d+)%.", effect = "HEAL" },
               { pattern = "Erh\195\182ht die durch Zauber und Effekte verursachte Heilung um bis zu (%d+)%.", effect = "HEAL" },
               { pattern = "Stellt alle %d Sek%. (%d+) Punkt%(e%) Gesundheit wieder her%.", effect = "HEALTHREG" },
               { pattern = "Stellt alle %d Sek%. (%d+) Punkt%(e%) Mana wieder her%.", effect = "MANAREG" },
               { pattern = "Verbessert Eure Trefferchance um (%d+)%%%.", effect = "TOHIT" },
               { pattern = "Erh\195\182ht Eure Chance mit Zaubern zu treffen um (%d+)%%%.", effect = "SPELLTOHIT" },
	       { pattern = "Erh\195\182ht Gesundheits%- und Manaregeneration um (%d+)%.", effect = {"HEALTHREG2", "MANAREG2"} },
	       { pattern = "Erh\195\182ht Verteidigung um %+(%d+)", effect = "DEFENSE" },
	       { pattern = "Erh\195\182ht den Blockwert Eures Schildes um (%d+)", effect = "BLOCKAMT" }, 
       };

       SI_IB_S1 = {
               { pattern = "Arkan",    effect = "ARCANE" },
               { pattern = "Feuer",    effect = "FIRE" },
               { pattern = "Frost",    effect = "FROST" },
               { pattern = "Heilig",   effect = "HOLY" },
               { pattern = "Schatten", effect = "SHADOW" },
               { pattern = "Natur",    effect = "NATURE" }};

       SI_IB_S2 = {
               { pattern = "widerst",  effect = "RES" },
               { pattern = "schaden",  effect = "DMG" },
	       { pattern = "zauberschaden", effect = "DMG" },
               { pattern = "effekte",  effect = "DMG" }};

       -- Suchmuster f??ige Gegenstandsboni
       SI_IB_TOKEN_EFFECT = {
               ["Alle Werte"]                  = {"STR", "AGI", "STA", "INT", "SPI"},
               ["St\195\164rke"]                               = "STR",
               ["Beweglichkeit"]               = "AGI",
               ["Ausdauer"]                    = "STA",
               ["Intelligenz"]                 = "INT",
               ["Willenskraft"]                = "SPI",

               ["Alle Widerstandsarten"]       = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

               ["Angeln"]                              = "FISHING",
               ["Angelk\195\182der"]                   = "FISHING",
	       ["Angelschnur"]  = "FISHING",
	       ["Verbessertes Angeln"] = "FISHING",  -- ??
               ["Bergbau"]                             = "MINING",
               ["Kr\195\164uterkunde"]         = "HERBALISM",
               ["K\195\188rschnerei"]          = "SKINNING",
               ["Verteidigung"]                = "DEFENSE",
               ["Verteidigungsfertigkeit"] = "DEFENSE",

               ["Angriffskraft"]               = "ATTACKPOWER",
               ["Ausweichen"]                  = "DODGE",
               ["Blocken"]                             = "BLOCK",
	       ["Schildblockwert"]    = "BLOCKAMT", 
               ["Trefferchance"]               = "TOHIT",
               ["Distanzangriffskraft"] = "RANGEDATTACKPOWER",
               ["Gesundheit alle 5 Sek."] = "HEALTHREG",
               ["Heilzauber"]                  = "HEAL",
               ["Mana alle 5 Sek."]    = "MANAREG",
               ["Manaregeneration"]    = "MANAREG",
               ["Zauberschaden erh\195\182hen"]= "DMG",
               ["Kritischer Treffer"]  = "CRIT",
	       ["krit. Treffer"]    = "CRIT",   -- ??
               ["Zauberschaden"]               = "DMG",
               ["Blocken"]                             = "BLOCK",
               ["Gesundheit"]                  = "HEALTH",
               ["GP"]    = "HEALTH", 
               ["Heilzauber"]                  = "HEAL",
	       ["Verbesserte Heilung"]  = "HEAL",  -- ??
               ["Heilung und Zauberschaden"] = {"HEAL","DMG"},
               ["Schadens- und Heilzauber"] = {"HEAL","DMG"},
	       ["Schadenszauber und Heilzauber"] = {"HEAL", "DMG"},
	       ["Zauberschaden und Heilung"] = {"HEAL", "DMG"},   -- ??
               ["Zaubertrefferchance"] = "SPELLTOHIT",
               ["Mana"]                                = "MANA",
               ["R\195\188stung"]                      = "ARMOR",
               ["Verst\195\164rkte R\195\188stung"]= "ARMOR",
	       ["Waffenschaden"] = "WEPDMG",
               };


	SI_IB_OTHER_PATTERNS = {
		{ pattern = "Manaregeneration (%d+) .+ %d Sek%.", effect = "MANAREG" },
		{ pattern = "Zandalarianisches Siegel der Macht", effect = "ATTACKPOWER", value = 30 },
		{ pattern = "Zandalarianisches Siegel des Mojo", effect = {"DMG", "HEAL"}, value = 18 },
		{ pattern = "Zandalarianisches Siegel der Inneren Ruhe", effect = "HEAL", value = 33 },

		{ pattern = "Schwaches Zauberol", effect = {"DMG", "HEAL"}, value = 8 },
		{ pattern = "Geringes Zauberol", effect = {"DMG", "HEAL"}, value = 16 },
		{ pattern = "Zauberol", effect = {"DMG", "HEAL"}, value = 24 },
		{ pattern = "Hervorragendes Zauberol", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },

		{ pattern = "Schwaches Manaol", effect = "MANAREG", value = 4 },
		{ pattern = "Geringes Manaol", effect = "MANAREG", value = 8 },
		{ pattern = "Hervorragendes Manaol", effect = { "MANAREG", "HEAL"}, value = {12, 25} },

		{ pattern = "Zielfernrohr %(%+(%d+) Schaden%)", effect = "RANDMG" },
	};

	SI_BONUSWINDOWTITLE = "Gegenstandsboni";
	SI_ITEMSHIDE = "Items verstecken";
	SI_ITEMSSHOW = "Items zeigen";
	SI_ITEMBUTTON_TOOLTIP = "Zeigen/Verstecken der Gegenst\195\164nde.";
	SI_HONORHIDE = "Ehre verstecken";
	SI_HONORSHOW = "Ehre zeigen";
	SI_HONORBUTTON_TOOLTIP = "Zeigen/Verstecken der Ehrensystem-Daten.";
	SI_BONUSESHIDE = "Boni verstecken";
	SI_BONUSESSHOW = "Boni zeigen";
	SI_BONUSESBUTTON_TOOLTIP = "Zeigen/Verstecken der Gegenstandsboni.";
	SI_MOBINFOHIDE = "MobInfo verstecken";
	SI_MOBINFOSHOW = "MobInfo zeigen";
	SI_MOBINFOBUTTON_TOOLTIP = "Toggle targeted mob's information gathered";
	SI_LEVEL = "Stufe";
	SI_NOTARGET = "Ihr m\195\188sst ein Ziel angew\195\164hlt haben.";
	SI_REQUESTHONOR = "Rufe Ehrensystem-Daten ab...";
	SI_REQUESTHONORFAILED = "Abruf der Daten fehlgeschlagen\n(Ziel evtl. zu weit entfernt)";
	SI_SETS = "Sets";
	SI_RAREELITE = ELITE..ITEM_QUALITY3_DESC;
end


--French---------------------------------------------------
-----------------------------------------------------------
--French Translation By 
--  Sasmira ( Cosmos Team )
--  Sparrows
--  Drooky
--Last Update : 03/18/2006  

if (GetLocale() == "frFR") then
	SI_DURABILITY = "Durability";

	SI_COMPARE_TOOLTIP = "Cliquez pour copier les bonus\nvers une fenetre de comparaison\nShift-Click pour envoyer les bonus\ndans la fenetre de chat ouverte";

	-- general
	SI_IB_TEXT = "Bonus Objets";

	SI_IB_CAT_ATT = "Attributs";
	SI_IB_CAT_RES = "R\195\169sistance";
	SI_IB_CAT_SKILL = "Comp\195\169tances";
	SI_IB_CAT_BON = "Combat";
	SI_IB_CAT_SBON = "Sorts";
	SI_IB_CAT_OBON = "Vie & mana";

	SI_IB_HIT_WOUND = "Wound Target for";
	SI_IB_HIT_SHADOW = "Shadowy Bolt";

	-- bonus names
	SI_IB_ARMOR = "Armure renforc\195\169e";

	SI_IB_FISHING = "P\195\170che";
	SI_IB_MINING = "Minage";
	SI_IB_HERBALISM = "Herborisme";
	SI_IB_SKINNING = "D\195\169pecage";
	SI_IB_DEFENSE = "D\195\169fense";
	SI_IB_WEPDMG = "Dommages d\'armes"; 
	SI_IB_XTRAHIT = "Chance de toucher"; 
	SI_IB_RANDMG = "Dommages a distance"; 
	SI_IB_WOUND = "Wound Target for"; --new

	SI_IB_BLOCK 		= "Chances de Blocage";
	SI_IB_DODGE 		= "Chances de Esquive";
	SI_IB_PARRY 		= "Chances de Parade";
	SI_IB_CRIT = "Coups Critiques";
	SI_IB_RANGEDCRIT = "Tirs Crit.";
	SI_IB_TOHIT = "Chance de toucher";
	SI_IB_DMG = "D\195\169gats";
	SI_IB_ARCANEDMG = "D\195\169gats d\'Arcanes";
	SI_IB_FIREDMG = "D\195\169gats de Feu";
	SI_IB_FROSTDMG = "D\195\169gats de Froid";
	SI_IB_HOLYDMG = "D\195\169gats Sacr\195\169s";
	SI_IB_NATUREDMG = "D\195\169gats de Nature";
	SI_IB_SHADOWDMG = "D\195\169gats des Ombres";
	SI_IB_SPELLCRIT = "Sorts Crit.";
	SI_IB_SPELLTOHIT = "Chance de toucher (sorts)";
	SI_IB_HOLYCRIT 	= "Soins Crit.";
	

	SI_IB_HEAL = "Soins";
	SI_IB_HEALCRIT = "Soins Crit.";
	SI_IB_HEALTHREG = "R\195\169gen. Vie";
	SI_IB_MANAREG = "R\195\169gen. Mana";
	SI_IB_HEALTH = "Pts de Vie";
	SI_IB_MANA = "Pts de Mana"; 

	-- equip and set bonus patterns:
	SI_IB_EQUIP_PREFIX = "Equip\195\169 : ";
	SI_IB_SET_PREFIX = "Complet: ";
	SI_IB_COH_PREFIX = "Chance de touch\195\169: "; --new

	SI_IB_EQUIP_PATTERNS = {
		{ pattern = "+(%d+) \195\160 la puissance d'attaque%.", effect = "ATTACKPOWER" },
		{ pattern = "+(%d+) \195\160 la puissance des attaques \195\160 distance%.", effect = "RANGEDATTACKPOWER" },
		{ pattern = "Augmente vos chances de bloquer une attaque de (%d+)%%%.", effect = "BLOCK" },
		{ pattern = "Augmente vos chances d'esquiver une attaque de (%d+)%%%.", effect = "DODGE" },
		{ pattern = "Augmente vos chances de parer une attaque par (%d+)%%%.", effect = "PARRY" },
		{ pattern = "Augmente vos chances d'infliger des coups critiques avec vos sorts de (%d+)%%%.", effect = "SPELLCRIT" },
		{ pattern = "Augmente vos chances d'infliger un coup critique de (%d+)%%%.", effect = "CRIT" },
		{ pattern = "Augmente vos chances d'infliger un coup critique avec une arme \195\160 feu par (%d+)%%%.", effect = "RANGEDCRIT" },
		{ pattern = "Augmente vos chances de lancer un soin critique par (%d+)%%%.", effect = "HEALCRIT" },
		{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les effets et les sorts des Arcanes de (%d+)% au maximum.", effect = "ARCANEDMG" },
		{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par vos sorts et effets de Feu de (%d+)% au maximum.", effect = "FIREDMG" },
		{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les sorts et les effets de givre de (%d+)% au maximum.", effect = "FROSTDMG" },
		{ pattern = "Augmente les dommages realises par les sorts Sacr\195\169s de (%d+)%.", effect = "HOLYDMG" },
		{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les sorts et les effets de Nature (%d+)% au maximum.", effect = "NATUREDMG" },
		{ pattern = "Augmente les points de d\195\169g\195\162ts inflig\195\169s par les sorts et les effets d'ombre de (%d+)% au maximum.", effect = "SHADOWDMG" },
		{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts d'ombres.", effect = "SHADOWDMG" },
		{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts et aux soins", effect = "HEAL" },
		{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts et aux soins", effect = "DMG" },
		{ pattern = "(%d+)% aux d\195\169g\195\162ts des sorts", effect = "DMG" },
		{ pattern = "Augmente les soins prodigu\195\169s par les sorts et effets de (%d+)% au maximum.", effect = "HEAL" },
		{ pattern = "Augmente les d\195\169g\195\162ts et les soins prodigu\195\169s par les sorts et effets magiques de (%d+)% au maximum.", effect = "HEAL" },
		{ pattern = "Augmente les d\195\169g\195\162ts et les soins produits par les sorts et effets magiques de (%d+)% au maximum.", effect = "DMG" },
		{ pattern = "Rend (%d+) points de vie .+ %d secondes", effect = "HEALTHREG" },
		{ pattern = "Rend (%d+) points de mana .+ %d secondes.", effect = "MANAREG" },
		{ pattern = "Augmente vos chances de toucher de (%d+)%%%.", effect = "TOHIT" },
		{ pattern = "Augmente vos chances de toucher avec des sorts de (%d+)%%%.", effect = "SPELLTOHIT" },
		{ pattern = "P\195\170che augment\195\169e de (%d+)%.", effect = "FISHING" },
		{ pattern = "D\195\169fense augment\195\169e de (%d+)%.", effect = "DEFENSE"},
		{ pattern = "Increases your normal health and mana regeneration by (%d+)", effect = {"HEALTHREG", "MANAREG"} },
		{ pattern = "Increased Defense %+(%d+)", effect = "DEFENSE" }	
	};


	SI_IB_S1 = {
		{ pattern = "Arcane", effect = "ARCANE" }, 
		{ pattern = "Feu", effect = "FIRE" }, 
		{ pattern = "au feu", effect = "FIRE" }, 
		{ pattern = "Givre", effect = "FROST" }, 
		{ pattern = "au givre", effect = "FROST" }, 
		{ pattern = "Sacr\195\169", effect = "HOLY" }, 
		{ pattern = "Ombre", effect = "SHADOW" }, 
		{ pattern = "a l'ombre", effect = "SHADOW" }, 
		{ pattern = "Nature", effect = "NATURE" }
	}; 

	SI_IB_S2 = {
		{ pattern = "R\195\169sistance", effect = "RES" }, 
		{ pattern = "\195\160 la r\195\169sistance", effect = "RES" }, 
		{ pattern = "D\195\169gats", effect = "DMG" }
	}; 

	SI_IB_TOKEN_EFFECT = {
		["Toutes les caract\195\169ristiques"] = {"STR", "AGI", "STA", "INT", "SPI"},
		["Force"] = "STR",
		["Agilit\195\169"] = "AGI",
		["Endurance"] = "STA",
		["Intelligence"] = "INT",
		["Esprit"] = "SPI",

		["\195\160 toutes les r\195\169sistances"] = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

		["P\195\170che"] = "FISHING",
		["Minage"] = "MINING",
		["Herborisme"] = "HERBALISM",
		["D\195\169pecage"] = "SKINNING",
		["D\195\169fense"] = "DEFENSE",

		["Puissance d\'Attaque"] = "ATTACKPOWER",
		["Esquive"] = "DODGE",
		["Bloquer"] = "BLOCK",
		["Blocage"] = "BLOCK",
	        ["Score de blocage"]				= "BLOCKAMT",
		["Puissance d\'attaque \195\160 distance"] = "RANGEDATTACKPOWER",
		["Soins toutes les 5 sec."] = "HEALTHREG",
		["Sorts de Soins"] = "HEAL",
		["Mana toutes les 5 sec."] = "MANAREG",
		["Dommages des Sorts"] = "DMG",
		["Critique"] = "CRIT",
		["D\195\169gats"] = "DMG",
		["Vie"] = "HEALTH",
		["HP"]				= "HEALTH",
		["Mana"] = "MANA",
		["Armure"] = "ARMOR",
		["Armure :"] = "ARMOR",
		["Armure renforc\195\169e"] = "ARMOR",
	}; 

	--TRANSLATE ME
	SI_IB_OTHER_PATTERNS = {
		{ pattern = "Mana Regen (%d+) .+ %d+ sec%.", effect = "MANAREG" },
		{ pattern = "Cachet de puissance zandalar", effect = "ATTACKPOWER", value = 30 },
		{ pattern = "Cachet de mojo zandalar", effect = {"DMG", "HEAL"}, value = 18 },
		{ pattern = "Cachet de s\195\169r\195\169nit\195\169 zandalar", effect = "HEAL", value = 33 },

		{ pattern = "Huile de sorcier mineure", effect = {"DMG", "HEAL"}, value = 8 },
		{ pattern = "Huile de sorcier inferieure", effect = {"DMG", "HEAL"}, value = 16 },
		{ pattern = "Huile de sorcier brillante", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },
		{ pattern = "Huile de sorcier", effect = {"DMG", "HEAL"}, value = 24 },

		{ pattern = "Huile de mana mineure", effect = "MANAREG", value = 4 },
		{ pattern = "Huile de mana inferieure", effect = "MANAREG", value = 8 },
		{ pattern = "Huile de mana brillante", effect = { "MANAREG", "HEAL"}, value = {12, 25} },
	};

	SI_BONUSWINDOWTITLE = "Bonus d\'objet";
	SI_ITEMSHIDE = "Cacher Objets";
	SI_ITEMSSHOW = "Montrer Objets";
	SI_ITEMBUTTON_TOOLTIP = "Affiche l\'inventaire de la cible";
	SI_HONORHIDE = "Cacher Honeur";
	SI_HONORSHOW = "Montrer Honeur";
	SI_HONORBUTTON_TOOLTIP = "Affiche l\'honneur de la cible";
	SI_BONUSESHIDE = "Cacher Bonus";
	SI_BONUSESSHOW = "Montrer Bonus";
	SI_BONUSESBUTTON_TOOLTIP = "Affiche les bonus d\'objet de la cible";
	SI_MOBINFOHIDE = "Cacher infos";
	SI_MOBINFOSHOW = "Montrer infos";
	SI_MOBINFOBUTTON_TOOLTIP = "Affiche les infos du monstre";
	SI_LEVEL = "Niveau";
	SI_NOTARGET = "Vous devez avoir une cible";
	SI_REQUESTHONOR = "Recherche de l\'Honneur...";
	SI_REQUESTHONORFAILED = "Recherche \195\169chou\195\169e\n(votre cible doit \196\170tre trop loin)";
	SI_SETS = "Sets";
	SI_RAREELITE = ITEM_QUALITY3_DESC..ELITE;
end

--Korean---------------------------------------------------
-----------------------------------------------------------
if (GetLocale() == "koKR") then
	SI_DURABILITY = "내구도";

	SI_COMPARE_TOOLTIP = "복사를 클릭하여 저장하신 후\n비교 살펴보기창을 통해 다른\n플레이어의 장비보너스와 비교해보세요\nShift-클릭을 이용하시면 현재 채팅창에\n장비보너스를 출력할 수 있습니다.";

	-- general
	SI_IB_TEXT = "장비보너스";

	SI_IB_CAT_ATT	= "능력치";
	SI_IB_CAT_RES	= "저항";
	SI_IB_CAT_SKILL = "숙련도";
	SI_IB_CAT_BON	= "근접 및 원거리";
	SI_IB_CAT_SBON	= "주문";
	SI_IB_CAT_OBON	= "생명력/마나";
	SI_IB_CAT_COH	= "발동 효과";
		
	-- bonus names
	SI_IB_ARMOR 	= "방어도 강화";

	SI_IB_FISHING	= "낚시";
	SI_IB_MINING	= "채광";
	SI_IB_HERBALISM	= "약초 채집";
	SI_IB_SKINNING	= "무두질";
	SI_IB_DEFENSE	= "방어 숙련도";
		
	SI_IB_HIT_WOUND		= "상처 피해량";
	SI_IB_HIT_SHADOW	= "암흑 피해량";

	SI_IB_ATTACKPOWER	= "전투력";
	SI_IB_ATTACKPOWERVSUNDEAD = "언데드에 대한 전투력";
	SI_IB_RANGEDATTACKPOWER = "원거리 전투력";
	SI_IB_BLOCK		= "방패방어율";
	SI_IB_DODGE		= "회피율";
	SI_IB_PARRY		= "무기 막기 확률";
	SI_IB_BLOCKAMT		= "방패 피해 방어량";
	SI_IB_CRIT		= "치명타 적중율";
	SI_IB_RANGEDCRIT	= "원거리 치명타 적중율";
	SI_IB_TOHIT		= "적중률";
	SI_IB_XTRAHIT		= "추가 공격률";
	SI_IB_WEPDMG		= "무기 공격력";
	SI_IB_RANDMG		= "원거리 공격력";
	SI_IB_DMG		= "주문 공격력";
	SI_IB_ARCANEDMG		= "비전 주문 공격력";
	SI_IB_FIREDMG		= "화염 주문 공격력";
	SI_IB_FROSTDMG		= "냉기 주문 공격력";
	SI_IB_HOLYDMG		= "신성 주문 공격력";
	SI_IB_NATUREDMG		= "자연 주문 공격력";
	SI_IB_SHADOWDMG		= "암흑 주문 공격력";
	SI_IB_DMGVSUNDEAD	= "언데드에 대한 주문 공격력";
	SI_IB_ARCANECRIT	= "비전 주문 극대화";
	SI_IB_FIRECRIT		= "화염 주문 극대화";
	SI_IB_FROSTCRIT		= "냉기 주문 극대화";
	SI_IB_HOLYCRIT		= "신성 주문 극대화";
	SI_IB_NATURECRIT	= "자연 주문 극대화";
	SI_IB_SHADOWCRIT	= "암흑 주문 극대화";
	SI_IB_SPELLCRIT		= "주문 극대화";
	SI_IB_SPELLTOHIT	= "주문 적중율";

	SI_IB_HEAL		= "치유량";
	SI_IB_HEALTHREG		= "생명력 회복";
	SI_IB_HEALCRIT		= "치유 극대화";
	SI_IB_MANAREG		= "마나 회복";
	SI_IB_HEALTH		= "생명력";
	SI_IB_MANA		= "마나";	

	-- equip and set bonus patterns:
	SI_IB_EQUIP_PREFIX = "착용 효과: ";
	SI_IB_SET_PREFIX = "세트 효과: ";
	SI_IB_COH_PREFIX = "발동 효과: ";

	SI_IB_EQUIP_PATTERNS = {
		{ pattern = "전투력 ++(%d+)", effect = "ATTACKPOWER" },
		{ pattern = "원거리 전투력 ++(%d+)", effect = "RANGEDATTACKPOWER" },
		{ pattern = "방패로 적의 공격을 방어할 확률이 (%d+)%%만큼 증가합니다%.", effect = "BLOCK" },
		{ pattern = "공격을 회피할 확률이 (%d+)%%만큼 증가합니다%.", effect = "DODGE" },
		{ pattern = "무기 막기 확률이 (%d+)%%만큼 증가합니다%.", effect = "PARRY" },
		{ pattern = "주문이 극대화 효과를 낼 확률이 (%d+)%%만큼 증가합니다%.", effect = "SPELLCRIT" },
		{ pattern = "치명타를 적중시킬 확률이 (%d+)%%만큼 증가합니다%.", effect = "CRIT" },
		{ pattern = "원거리 무기로 치명타를 적중시킬 확률이 (%d+)%%만큼 증가합니다%.", effect = "RANGEDCRIT" },

		{ pattern = "비전 계열의 주문과 효과의 공격력이 최대 (%d+)만큼 증가합니다%.", effect = "ARCANEDMG" },
		{ pattern = "화염 계열의 주문과 효과의 공격력이 최대 (%d+)만큼 증가합니다%.", effect = "FIREDMG" },
		{ pattern = "냉기 계열의 주문과 효과의 공격력이 최대 (%d+)만큼 증가합니다%.", effect = "FROSTDMG" },
		{ pattern = "신성 계열의 주문과 효과의 공격력이 최대 (%d+)만큼 증가합니다%.", effect = "HOLYDMG" },
		{ pattern = "자연 계열의 주문과 효과의 공격력이 최대 (%d+)만큼 증가합니다%.", effect = "NATUREDMG" },
		{ pattern = "암흑 계열의 주문과 효과의 공격력이 최대 (%d+)만큼 증가합니다%.", effect = "SHADOWDMG" },

		{ pattern = "비전 주문으로 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "ARCANECRIT" },
		{ pattern = "화염 주문으로 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "FIRECRIT" },
		{ pattern = "냉기 주문으로 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "FROSTCRIT" },
		{ pattern = "신성 주문으로 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "HOLYCRIT" },
		{ pattern = "자연 주문으로 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "NATURECRIT" },
		{ pattern = "암흑 주문으로 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "SHADOWCRIT" },

		{ pattern = "비전 주문이 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "ARCANECRIT" },
		{ pattern = "화염 주문이 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "FIRECRIT" },
		{ pattern = "냉기 주문이 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "FROSTCRIT" },
		{ pattern = "신성 주문이 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "HOLYCRIT" },
		{ pattern = "자연 주문이 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "NATURECRIT" },
		{ pattern = "암흑 주문이 극대화 효과를 발휘할 확률이 (%d+)%%만큼 증가합니다%.", effect = "SHADOWCRIT" },

		{ pattern = "모든 주문 및 효과에 의한 치유량이 최대 (%d+)만큼 증가합니다%.", effect = "HEAL" },
		{ pattern = "모든 주문 및 효과에 의한 피해와 치유량이 최대 (%d+)만큼 증가합니다%.", effect = {"HEAL","DMG"} },
		{ pattern = "매 5초마다 (%d+)의 생명력이 회복됩니다%.", effect = "HEALTHREG" },
		{ pattern = "매 5초마다 (%d+)의 마나가 회복됩니다%.", effect = "MANAREG" },
		{ pattern = "무기의 적중률이 (%d+)%%만큼 증가합니다%.", effect = "TOHIT" },
		{ pattern = "평상시 생명력과 마나의 회복 속도를 (%d+)만큼 향상시킵니다%.", effect = {"HEALTHREG", "MANAREG"} },
		{ pattern = "방어 숙련도 ++(%d+)", effect = "DEFENSE" },
		{ pattern = "주문의 적중률이 (%d+)%%만큼 증가합니다%.", effect = "SPELLTOHIT" },
		{ pattern = "방패의 피해 방어량이 (%d+)만큼 증가합니다%.", effect = "BLOCKAMT" },
		{ pattern = "언데드에 대한 주문 및 효과에 의한 공격력이 최대 (%d+)만큼 증가합니다%. 또한 은빛 여명회를 대표하여 스컬지석을 획득할 수 있습니다%.", effect = "DMGVSUNDEAD" },
		{ pattern = "언데드 공격 시 전투력이 (%d+)만큼 증가합니다%. 또한 은빛 여명회를 대표하여 스컬지석을 획득할 수 있습니다%.", effect = "ATTACKPOWERVSUNDEAD" },
		{ pattern = "타격 시 (%d+)%%의 확률로 1회의 추가 공격을 합니다%.", effect = "XTRAHIT" },
		{ pattern = "상처를 내 (%d+)의 피해를 입힙니다%.", effect = "HIT_WOUND" },
		{ pattern = "적에게 어둠의 화살을 발사하여 %d+~(%d+)의 암흑 피해를 입힙니다%.", effect = "HIT_SHADOW" }
	};


	SI_IB_S1 = {
		{ pattern = "비전", 	effect = "ARCANE" },	
		{ pattern = "화염", 	effect = "FIRE" },	
		{ pattern = "냉기", 	effect = "FROST" },	
		{ pattern = "신성", 	effect = "HOLY" },	
		{ pattern = "암흑", 	effect = "SHADOW" },	
		{ pattern = "자연", 	effect = "NATURE" }
	}; 	

	SI_IB_S2 = {
		{ pattern = "저항",	 	effect = "RES" },	
		{ pattern = "피해", 		effect = "DMG" },
		{ pattern = "주문 공격력",	effect = "DMG" },
		{ pattern = "공격력", 		effect = "DMG" },
		{ pattern = "효과", 		effect = "DMG" }
	}; 	
		
	SI_IB_TOKEN_EFFECT = {
		["모든 능력치"] 			= {"STR", "AGI", "STA", "INT", "SPI"},
		["힘"]					= "STR",
		["민첩성"]				= "AGI",
		["체력"]				= "STA",
		["지능"]				= "INT",
		["정신력"] 				= "SPI",

		["모든 저항력"]				= { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

		["낚시"]				= "FISHING",
		["낚시용 미끼"]				= "FISHING",
		["낚시 숙련도"]				= "FISHING",
		["채광"]				= "MINING",
		["약초 채집"]				= "HERBALISM",
		["무두질"]				= "SKINNING",
		["방어 숙련도"]				= "DEFENSE",

		["전투력"] 				= "ATTACKPOWER",
		["회피율"] 				= "DODGE",
		["방어율"]				= "BLOCK",
		["방패 피해 방어량"]			= "BLOCKAMT",
		["원거리 전투력"]			= "RANGEDATTACKPOWER",
		["근접 공격력"]				= "WEPDMG",
		["원거리 공격력"]			= "RANDMG",
		["5초당 생명력 회복"]			= "HEALTHREG",
		["치유 주문 효과"] 			= "HEAL",
		["치유량 증가"] 			= "HEAL",
		["치유 효과 증가"] 			= "HEAL",
		["치유 효과 중가"] 			= "HEAL",
		["냉기 주문 공격력"]			= "FROSTDMG",
		["치유 및 공격 주문 위력"]		= {"HEAL", "DMG"},
		["치유 및 주문 공격력"]			= {"HEAL", "DMG"},
		["5초당 마나 회복"] 			= "MANAREG",
		["마나 회복"] 				= "MANAREG",
		["주문 피해"]				= "DMG",
		["주문 적중률"]				= "SPELLTOHIT",
		["치명타"] 				= "CRIT",
		["주문 공격력"] 			= "DMG",
		["생명력"]				= "HEALTH",
		["마나"]				= "MANA",
		["방어도"]				= "ARMOR",
		["방어도 보강"]				= "ARMOR",
		["무기 공격력"]				= "WEPDMG",
	};	

	SI_IB_OTHER_PATTERNS = {
		-- 방패 피해 방어량
		{ pattern = "(%d+)의 피해 방어", effect = "BLOCKAMT" },

		-- 장비 일반 방어도
		{ pattern = "방어도 (%d+)", effect = "ARMOR" },

		-- 줄구룹 평판 마부
		{ pattern = "잔달라 힘의 인장", effect = "ATTACKPOWER", value = 30 },
		{ pattern = "잔달라 모조의 인장", effect = {"DMG", "HEAL"}, value = 18 },
		{ pattern = "잔달라 평온의 인장", effect = "HEAL", value = 33 },

		-- 기타
		{ pattern = "5초마다 (%d+)의 마나가 회복됩니다%.", effect = "MANAREG" },

		-- 마법부여 오일
		{ pattern = "최하급 마술사 오일", effect = {"DMG", "HEAL"}, value = 8 },
		{ pattern = "하급 마술사 오일", effect = {"DMG", "HEAL"}, value = 16 },
		{ pattern = "마술사 오일", effect = {"DMG", "HEAL"}, value = 24 },
		{ pattern = "반짝이는 마술사 오일", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },

		{ pattern = "최하급 마나 오일", effect = "MANAREG", value = 4 },
		{ pattern = "하급 마나 오일", effect = "MANAREG", value = 8 },
		{ pattern = "반짝이는 마나 오일", effect = { "MANAREG", "HEAL"}, value = {12, 25} },

		-- 조준경
		{ pattern = "조준경 %(공격력 ++(%d+)%)", effect = "RANDMG" }
	};

	--TRANSLATE ME
	SI_BONUSWINDOWTITLE = "장비 (아이템) 보너스";
	SI_ITEMSHIDE = "아이템 숨김";
	SI_ITEMSSHOW = "아이템 표시";
	SI_ITEMBUTTON_TOOLTIP = "대상의 아이템을 표시 하거나 숨김";
	SI_HONORHIDE = "명예 숨김";
	SI_HONORSHOW = "명예 표시";
	SI_HONORBUTTON_TOOLTIP = "대상의 명예를 표시 하거나 숨김";
	SI_BONUSESHIDE = "장비보너스 숨김";
	SI_BONUSESSHOW = "장비보너스 표시";
	SI_BONUSESBUTTON_TOOLTIP = "대상의 장비보너스를 표시하거나 숨김";
	SI_MOBINFOHIDE = "몹 정보 숨김";
	SI_MOBINFOSHOW = "몹 정보 표시";
	SI_MOBINFOBUTTON_TOOLTIP = "선택된 몹의 정보를 표시 하거나 숨김";
	SI_LEVEL = "레벨";
	SI_NOTARGET = "대상을 선택하여야 합니다.";
	SI_REQUESTHONOR = "명예수치 집계 중...";
	SI_REQUESTHONORFAILED = "명예수치 집계 실패\n(조금 더 가까이 다가 가세요.)";
	SI_SETS = "세트";
	SI_RAREELITE = ELITE..ITEM_QUALITY3_DESC;
end

SI_DURABILITYPATTERN = "^"..SI_DURABILITY.."%s(%d+)%s?/%s?(%d+)";

SI_IB_SETNAME_PATTERN = "^(.*) %(%d/(%d)%)$";

SI_IB_MULTISET_PREFIX = "%((%d*)%).*"..SI_IB_SET_PREFIX;

SI_IB_PREFIX_PATTERN = "^%+(%d+)%%?(.+)$";
SI_IB_SUFFIX_PATTERN = "^(.+)%+(%d+)%%?$";

SI_IB_EFFECTS = {
	{ effect = "STR",			name = SPELL_STAT0_NAME,		format = "+%d",			cat = "ATT" },
	{ effect = "AGI",			name = SPELL_STAT1_NAME, 		format = "+%d",			cat = "ATT" },
	{ effect = "STA",			name = SPELL_STAT2_NAME,		format = "+%d",			cat = "ATT" },
	{ effect = "INT",			name = SPELL_STAT3_NAME, 		format = "+%d",			cat = "ATT" },
	{ effect = "SPI",			name = SPELL_STAT4_NAME,		format = "+%d",			cat = "ATT" },
	{ effect = "ARMOR",			name = ARMOR,				format = "+%d",			cat = "ATT" },

	{ effect = "ARCANERES",			name = RESISTANCE6_NAME,		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "FIRERES",			name = RESISTANCE2_NAME, 		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "NATURERES", 		name = RESISTANCE3_NAME, 		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "FROSTRES",			name = RESISTANCE4_NAME, 		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },
	{ effect = "SHADOWRES",			name = RESISTANCE5_NAME,		format = GREEN_FONT_COLOR_CODE.."+%d",			cat = "RES" },

	{ effect = "DEFENSE",			name = SI_IB_DEFENSE, 			format = "+%d",			cat = "SKILL" },
	{ effect = "MINING",			name = SI_IB_MINING,			format = "+%d",			cat = "SKILL" },
	{ effect = "HERBALISM",			name = SI_IB_HERBALISM, 		format = "+%d",			cat = "SKILL" },
	{ effect = "SKINNING", 			name = SI_IB_SKINNING, 			format = "+%d",			cat = "SKILL" },
	{ effect = "FISHING",			name = SI_IB_FISHING,			format = "+%d",			cat = "SKILL" },

	{ effect = "ATTACKPOWER", 		name = SI_IB_ATTACKPOWER, 		format = "+%d",			cat = "BON" },
	{ effect = "ATTACKPOWERVSUNDEAD", 	name = SI_IB_ATTACKPOWERVSUNDEAD, 	format = "+%d",			cat = "BON" },
	{ effect = "WEPDMG", 			name = SI_IB_WEPDMG, 			format = "+%d",			cat = "BON" },
	{ effect = "RANGEDATTACKPOWER",		name = SI_IB_RANGEDATTACKPOWER,		format = "+%d",			cat = "BON" },
	{ effect = "RANDMG", 			name = SI_IB_RANDMG, 			format = "+%d",			cat = "BON" },
	{ effect = "BLOCK",			name = SI_IB_BLOCK, 			format = "+%d%%",		cat = "BON" },
	{ effect = "BLOCKAMT",			name = SI_IB_BLOCKAMT, 			format = "+%d",			cat = "BON" },
	{ effect = "CRIT",			name = SI_IB_CRIT, 			format = "+%d%%",		cat = "BON" },
	{ effect = "RANGEDCRIT",		name = SI_IB_RANGEDCRIT,		format = "+%d%%",		cat = "BON" },
	{ effect = "DODGE",			name = SI_IB_DODGE, 			format = "+%d%%",		cat = "BON" },
	{ effect = "PARRY", 			name = SI_IB_PARRY, 			format = "+%d%%",		cat = "BON" },
	{ effect = "TOHIT", 			name = SI_IB_TOHIT, 			format = "+%d%%",		cat = "BON" },
	{ effect = "XTRAHIT", 			name = SI_IB_XTRAHIT, 			format = "+%d%%",		cat = "BON" },

	{ effect = "SPELLCRIT", 		name = SI_IB_SPELLCRIT,			format = "+%d%%",		cat = "SBON" },
	{ effect = "SPELLTOHIT", 		name = SI_IB_SPELLTOHIT,		format = "+%d%%",		cat = "SBON" },
	{ effect = "ARCANECRIT", 		name = SI_IB_ARCANECRIT, 		format = "+%d%%",		cat = "SBON" },
	{ effect = "FIRECRIT", 			name = SI_IB_FIRECRIT, 			format = "+%d%%",		cat = "SBON" },
	{ effect = "FROSTCRIT",			name = SI_IB_FROSTCRIT, 		format = "+%d%%",		cat = "SBON" },
	{ effect = "HOLYCRIT", 			name = SI_IB_HOLYCRIT,			format = "+%d%%",		cat = "SBON" },
	{ effect = "NATURECRIT",		name = SI_IB_NATURECRIT, 		format = "+%d%%",		cat = "SBON" },
	{ effect = "SHADOWCRIT",		name = SI_IB_SHADOWCRIT, 		format = "+%d%%",		cat = "SBON" },
	{ effect = "DMG",			name = SI_IB_DMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "DMGVSUNDEAD",		name = SI_IB_DMGVSUNDEAD, 		format = "+%d",			cat = "SBON" },
	{ effect = "HEAL",			name = SI_IB_HEAL, 			format = "+%d",			cat = "SBON"},
	{ effect = "ARCANEDMG", 		name = SI_IB_ARCANEDMG, 		format = "+%d",			cat = "SBON" },
	{ effect = "FIREDMG", 			name = SI_IB_FIREDMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "FROSTDMG",			name = SI_IB_FROSTDMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "HOLYDMG",			name = SI_IB_HOLYDMG, 			format = "+%d",			cat = "SBON" },
	{ effect = "NATUREDMG",			name = SI_IB_NATUREDMG, 		format = "+%d",			cat = "SBON" },
	{ effect = "SHADOWDMG",			name = SI_IB_SHADOWDMG, 		format = "+%d",			cat = "SBON" },

	{ effect = "HEALTH",			name = SI_IB_HEALTH,			format = "+%d",			cat = "OBON" },
	{ effect = "HEALTHREG",			name = SI_IB_HEALTHREG,			format = "%d의 생명력 / 5초",	cat = "OBON" },
	{ effect = "MANA",			name = SI_IB_MANA, 			format = "+%d",			cat = "OBON" },
	{ effect = "MANAREG",			name = SI_IB_MANAREG, 			format = "%d의 마나 / 5초",	cat = "OBON" },

	{ effect = "HIT_SHADOW",		name = SI_IB_HIT_SHADOW, 		format = "%d",			cat = "COH" },
	{ effect = "HIT_WOUND",			name = SI_IB_HIT_WOUND, 		format = "%d",			cat = "COH" },
};
