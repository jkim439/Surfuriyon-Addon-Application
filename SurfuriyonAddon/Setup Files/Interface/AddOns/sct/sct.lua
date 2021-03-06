--[[
  ****************************************************************
	Scrolling Combat Text v4.131

	Author: Grayhoof
	****************************************************************
	Description:
		A fairly simple but very configurable mod that adds damage, 
		heals, and events (dodge, parry, etc...) as 
		scrolling text above you character model, much like what 
		already happens above your target. This makes it so you do not 
		have to watch (or use) your regular combat chat window and 
		gives it a "Final Fantasy" feel.

	Thank you to:
		Nulli, for the original healthbar mod
		Kaitlin, for Mini-Group code examples
		Dhargo/Mairelon, for FlexBar code examples
		Ayny, for the new parsing code samples
		wT, for the new class based event filters.
		Dennie for his Chinese Version

	Official Site:
		http://grayhoof.wowinterface.com 
	
	****************************************************************]]
--global constants
SCT_COLORS_TABLE = "COLORS";
SCT_CRITS_TABLE = "CRITS";
SCT_MSGS_TABLE = "MSGS";

-- local constants
local SCTPlayer = nil;
local SCT_PlayerName = nil;
local SCT_Vars_Loaded = nil;
local SCT_LastHPPercent = 0;
local SCT_LastTargetHPPercent = 0;
local SCT_LastManaPercent = 0;
local SCT_LastManaFull = 99999;
local SCT_CRIT_FADEINTIME = 0.5;
local SCT_CRIT_HOLDTIME = 2.0;
local SCT_CRIT_FADEOUTTIME = 0.5;
local SCT_CRIT_X_OFFSET = 100;
local SCT_CRIT_Y_OFFSET = 75;
local SCT_CRIT_SIZE_PERCENT = 1.25;
local SCT_CRUSH_SIZE_PERCENT = 1.15;
local SCT_GLANCE_SIZE_PERCENT = .85;
local SCT_MAX_SPEED = .025;
local SCT_MIN_UPDATE_SPEED = .01;
local SCT_TOP_POINT = 210;
local SCT_BOTTOM_POINT = 60;
local SCT_SIDE_POINT = 210;
local SCT_MIDDLE_POINT = 0;
local SCT_MAX_DISTANCE = 150;
local SCT_DIRECTION = 1;
local Original_ChatFrame_OnEvent;

--Animation System variables
local SCT_LASTBAR = 1;					-- Holds what the next avalible fontstring for the animation system is
local SCT_LASTCRITBAR = 1;					-- Holds what the next avalible fontstring for the animation system is
local arrAniData = {
		["aniData1"] = {},					-- These are structures that define the animation data
		["aniData2"] = {},
		["aniData3"] = {},
		["aniData4"] = {},
		["aniData5"] = {},
		["aniData6"] = {},
		["aniData7"] = {},
		["aniData8"] = {},
		["aniData9"] = {},
		["aniData10"] = {},
		["aniData11"] = {},
		["aniData12"] = {},
		["aniData13"] = {},
		["aniData14"] = {},
		["aniData15"] = {}
}

local arrPowerStrings = {
		[0] = MANA,
		[1] = RAGE,
		[3] = ENERGY
}

local arrShadowOutline = {
	[1] = "",
	[2] = "OUTLINE",
	[3] = "THICKOUTLINE"
}

local default_config = {
		["VERSION"] = SCT_Version,
		["ENABLED"] = 0,
		["ANIMATIONSPEED"] = 0.015,
		["MOVEMENT"] = 2,
		["TEXTSIZE"] = 24,
		["LOWHP"] = .4,
		["LOWMANA"] = .4,
		["SHOWHIT"] = 1,
		["SHOWMISS"] = 1,
		["SHOWDODGE"] = 1,
		["SHOWPARRY"] = 1,
		["SHOWBLOCK"] = 1,
		["SHOWSPELL"] = 1,
		["SHOWHEAL"] = 1,
		["SHOWRESIST"] = 1,
		["SHOWDEBUFF"] = 1,
		["SHOWBUFF"] = 1,
		["SHOWFADE"] = nil,
		["SHOWABSORB"] = 1,
		["SHOWLOWHP"] = 1,
		["SHOWLOWMANA"] = 1,
		["SHOWPOWER"] = 1,
		["SHOWCOMBAT"] = nil,
		["SHOWCOMBOPOINTS"] = nil,
		["SHOWHONOR"] = 1,
		["SHOWEXECUTE"] = 1,
		["SHOWREP"] = 1,
		["SHOWSELFHEAL"] = 1,
		["SHOWSKILL"] = 1,
		["SHOWTARGETS"] = 1,
		["SHOWSELF"] = nil,
		["DIRECTION"] = nil,
		["STICKYCRIT"] = 1,
		["SPELLTYPE"] = nil,
		["ALPHA"] = 1,
		["ANITYPE"] = 1,
		["ANISIDETYPE"] = 1,
		["XOFFSET"] = 0,
		["YOFFSET"] = 0,
		["MSGXOFFSET"] = 0,
		["MSGYOFFSET"] = 250,
		["MSGFADE"] = 1.5,
		["FONT"] = 1,
		["FONTSHADOW"] = 1,
		["MSGFONT"] = 1,
		["MSGFONTSHADOW"] = 1,
		["MSGSIZE"] = 24,
		["DMGFONT"] = nil,
		["SHOWALLPOWER"] = nil,
		["FPSMODE"] = nil,
		["SHOWOVERHEAL"] = 1,
		[SCT_COLORS_TABLE] = {
			["SHOWHIT"] =  {r = 1.0, g = 0.0, b = 0.0},
			["SHOWMISS"] =  {r = 0.0, g = 0.0, b = 1.0},
			["SHOWDODGE"] =  {r = 0.0, g = 0.0, b = 1.0},
			["SHOWPARRY"] =  {r = 0.0, g = 0.0, b = 1.0},
			["SHOWBLOCK"] =  {r = 0.0, g = 0.0, b = 1.0},
			["SHOWSPELL"] =  {r = 0.5, g = 0.0, b = 0.5},
			["SHOWHEAL"] =  {r = 0.0, g = 1.0, b = 0.0},
			["SHOWRESIST"] =  {r = 0.5, g = 0.0, b = 0.5},
			["SHOWDEBUFF"] =  {r = 0.0, g = 0.5, b = 0.5},
			["SHOWABSORB"] =  {r = 1.0, g = 1.0, b = 0.0},
			["SHOWLOWHP"] =  {r = 1.0, g = 0.5, b = 0.5},
			["SHOWLOWMANA"] =  {r = 0.5, g = 0.5, b = 1.0},
			["SHOWPOWER"] =  {r = 1.0, g = 1.0, b = 0.0},
			["SHOWCOMBAT"] =  {r = 1.0, g = 1.0, b = 1.0},
			["SHOWCOMBOPOINTS"] =  {r = 1.0, g = 0.5, b = 0.0},
			["SHOWHONOR"] =  {r = 0.5, g = 0.5, b = 0.7},
			["SHOWBUFF"] =  {r = 0.7, g = 0.7, b = 0.0},
			["SHOWFADE"] =  {r = 0.7, g = 0.7, b = 0.0},
			["SHOWEXECUTE"] =  {r = 0.7, g = 0.7, b = 0.7},
			["SHOWREP"] =  {r = 0.5, g = 0.5, b = 1},
			["SHOWSELFHEAL"] = {r = 0, g = 0.7, b = 0},
			["SHOWSKILL"] = {r = 0, g = 0, b = 0.7}
		},
		[SCT_CRITS_TABLE] = {},
		[SCT_MSGS_TABLE] = {}
	};


----------------------
--Called when its loaded
function SCT_OnLoad()
	-- Register Startup Events
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ADDON_LOADED");
end

----------------------
-- Show the Option Menu
function SCT_showMenu()
	local loaded, message = LoadAddOn("sct_options");
	if (loaded) then
		PlaySound("igMainMenuOpen");
		ShowUIPanel(SCTOptions);
	else
		PlaySound("TellMessage");
		SCT_Chat_Message(SCT_Load_Error.." "..message);
	end
end

----------------------
--Hide the Option Menu
function SCT_hideMenu()
	PlaySound("igMainMenuClose");
	HideUIPanel(SCTOptions);
	
	-- myAddOns support
	if(MYADDONS_ACTIVE_OPTIONSFRAME == SCTOptions) then
		ShowUIPanel(myAddOnsFrame);
	end
end


----------------------
--Get a clean config
function SCT_FreshVar()
	SCT_CONFIG = {};
end

----------------------
--Set the global player config
function SCT_Initialize()
	
	--SCT_Chat_Message(SCT_STARTUP);
	
	--Fix Cmbat Messages for DE
	SCT_CombatMessagesAmbigousFix();

	-- Register Main Events
	this:RegisterEvent("UNIT_HEALTH");
	this:RegisterEvent("UNIT_MANA");
	this:RegisterEvent("UNIT_ENERGY");
	this:RegisterEvent("UNIT_RAGE");
	this:RegisterEvent("UNIT_DISPLAYPOWER");
	this:RegisterEvent("PLAYER_REGEN_ENABLED");
	this:RegisterEvent("PLAYER_REGEN_DISABLED");
	this:RegisterEvent("PLAYER_COMBO_POINTS");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	
	--core chat events
	this:RegisterEvent("CHAT_MSG_COMBAT_HONOR_GAIN");
	this:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE");
	this:RegisterEvent("CHAT_MSG_SKILL");
	this:RegisterEvent("CHAT_MSG_COMBAT_SELF_HITS");
	this:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES");
	this:RegisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS");
	this:RegisterEvent("CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES");
	this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS");
	this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES");
	this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF");
	this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"); 
	this:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF");
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS");
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS");

	--searchable added events
	local key, value
	for key, value in SCT_Event_List do
		this:RegisterEvent(value);
	end
	
	--hook chat frame if using event debug
	if SCT_Event_Debug then
		local SCT_OriginalChatHandlers;
		for i = 1, 7, 1 do
			SCT_OriginalChatHandlers = getglobal("ChatFrame" .. i).AddMessage;
			getglobal("ChatFrame" .. i).AddMessage = 
				function(self, msg, r, g, b)
					SCT_OriginalChatHandlers(self, msg.." ["..tostring(event).."]", r, g, b);
				end
		end
	end

	-- Add Slash Commands
	SlashCmdList["SCT"] = SCT_showMenu;
	SLASH_SCT1 = "/???????????????";
	SLASH_SCT2 = "/sct";
	
	SlashCmdList["SCTMENU"] = SCT_showMenu;
	SLASH_SCTMENU1 = "/?????????????????????";
	
	SlashCmdList["SCTRESET"] = SCT_Reset;
	SLASH_SCTRESET1 = "/????????????????????????";
	
	SlashCmdList["SCTDISPLAY"] = SCT_CmdDisplay;
	SLASH_SCTDISPLAY1 = "/?????????????????????";

   -- myAddOns support
   if(myAddOnsList) then
      myAddOnsList.SCT = {
         name = SCT_CB_NAME,
         description = SCT_CB_LONG_DESC,
         version = SCT_Version,
         frame = "SCT_HEALTHTEXT",
         optionsframe = "SCTOptions",
         category = MYADDONS_CATEGORY_COMBAT
      };
   end
   
   --Cosmos support
   if ( EarthFeature_AddButton ) then
      EarthFeature_AddButton(
         {
            id="SCT";
            name=SCT_CB_NAME;
            text=SCT_CB_NAME;
            subtext=SCT_CB_SHORT_DESC;
            helptext=SCT_CB_LONG_DESC;
            icon=SCT_CB_ICON;
            callback=SCT_showMenu;
         }
      );
   elseif (Cosmos_RegisterButton) then
      Cosmos_RegisterButton (
         SCT_CB_NAME,
         SCT_CB_SHORT_DESC,
         SCT_CB_LONG_DESC,
         SCT_CB_ICON,
         SCT_showMenu,
         function()
            return true;
         end
      );
      default_config.ENABLED = 0;
   end

	-- Add to CTMod Control panel if available
	if ( CT_RegisterMod ) then
		CT_RegisterMod(SCT_CB_NAME, nil, 5, SCT_CB_ICON, SCT_CB_LONG_DESC, "switch", nil, SCT_showMenu);
	end
   
   -- Add my options frame to the global UI panel list
   UIPanelWindows["SCTOptions"] = {area = "center", pushable = 0};

   --if there's not a config loaded
   if ( SCT_CONFIG == nil) then
      --get a new clean one
      SCT_FreshVar();
   end
   
	--set player name
	SCT_PlayerName = GetCVar("realmName").." ????????? "..UnitName("player");
	
	--set the currentplayer config
	SCTPlayer = SCT_Config_GetPlayer();
	
	--update old values
	SCT_UpdateValues();
	
	--setup animations
	SCT_aniInit();

end

----------------------
--Get or Create a config based on the current player
function SCT_Config_GetPlayer()
	if (not SCT_CONFIG[SCT_PlayerName]) then
		SCT_Config_NewPlayer(SCT_PlayerName);
	end
	return SCT_CONFIG[SCT_PlayerName];
end

----------------------
--Set up a default config
function SCT_Config_NewPlayer(PlayerName)
	SCT_CONFIG[PlayerName] = SCT_clone(default_config);
	SCT_Chat_Message(SCT_PROFILE_NEW..PlayerName);
end

----------------------
--Copy a whole table
function SCT_clone(t)             -- return a copy of the table t
  local new = {};             -- create a new table
  local i, v = next(t, nil);  -- i is an index of t, v = t[i]
  while i do
  	if type(v)=="table" then 
  		v=SCT_clone(v);
  	end 
    new[i] = v;
    i, v = next(t, i);        -- get next index
  end
  return new;
end

------------------------------
---Sort a table by its keys.
---stolen from http://www.lua.org/pil/19.3.html
function SCT_pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

----------------------
--Reset everything to default
function SCT_Reset()
	SCT_CONFIG[SCT_PlayerName] = nil;
	SCTPlayer = SCT_Config_GetPlayer();
	SCT_hideMenu();
	SCT_showMenu();
	SCT_ShowExample();
end

----------------------
--Get a value from player config
function SCT_Get(option)
	return SCTPlayer[option];
end

----------------------
--Set a value in player config
function SCT_Set(option, newVal)
	SCTPlayer[option] = newVal;
end

----------------------
--Get a crit from player config
function SCT_GetTable(tab, key)	
	return SCTPlayer[tab][key];
end

----------------------
--Set a color in the player config
function SCT_SetTable(tab, key, value)
	SCTPlayer[tab][key] = value;
end

----------------------
--Update old values for new versions
function SCT_UpdateValues()
	local i, var;
	-- non check boxes
	local new_vars = {
	"VERSION",
	"ANIMATIONSPEED",
	"MOVEMENT",
	"TEXTSIZE",
	"LOWHP",
	"LOWMANA",
	"ALPHA",
	"ANITYPE",
	"ANISIDETYPE",
	"XOFFSET",
	"YOFFSET",
	"MSGXOFFSET",
	"MSGYOFFSET",
	"MSGFADE",
	"FONT",
	"FONTSHADOW",
	"MSGFONT",
	"MSGFONTSHADOW",
	"MSGSIZE"
	}
	
	--Version specfic updates first
	if (SCT_Get("VERSION") ~= SCT_Version) then
		local version = SCT_Get("VERSION");
		if (version == "v4.11") or (version == "4.12") or (version == "4.13") then
			--nothing yet, next version maybe
		else
			--alert user
			StaticPopupDialogs["SCT_VERSION"] = {
							  text = SCT_Version_Warning,
							  button1 = TEXT(OKAY) ,
							  timeout = 0,
							  whileDead = 1,
							  hideOnEscape = 1,
							  showAlert = 1
							};
			StaticPopup_Show("SCT_VERSION");
		end
		SCT_Set("VERSION", SCT_Version);
	end
	
	--set manadaory fields, SCT would error without them
	for _, i in new_vars do
		var = SCT_Get(i) or default_config[i];
		SCT_Set(i, var);
	end
	local new_vars = nil;

	--set manadaory colors, SCT would errors without them
	for i in default_config[SCT_COLORS_TABLE] do
		var = SCT_GetTable(SCT_COLORS_TABLE, i) or default_config[SCT_COLORS_TABLE][i];
		SCT_SetTable(SCT_COLORS_TABLE, i, var);
	end
end

----------------------
--Search for any resists
function SCT_FindResists()
	local resisted;
	resisted = SCTGlobalParser_ParseMessage(arg1, RESIST_TRAILER)
	return resisted;
end

----------------------
--Search for any partial blocks
function SCT_FindBlock()
	local blocked;
	blocked = SCTGlobalParser_ParseMessage(arg1, BLOCK_TRAILER)
	if blocked then
		SCT_Display_Toggle("SHOWBLOCK", BLOCK.." ("..blocked..")", nil, YOU.." "..BLOCK.." ("..blocked..")");
	end
end

----------------------
--Search for any partial absorbs
function SCT_FindAbsorb()
	local absorbed;
	absorbed = SCTGlobalParser_ParseMessage(arg1, ABSORB_TRAILER)
	if absorbed then
		SCT_Display_Toggle("SHOWABSORB", ABSORB.." ("..absorbed..")", nil, YOU.." "..ABSORB.." ("..absorbed..")");
	end
end	

----------------------
-- Event Handler
-- this function parses events that are printed in the combat
-- chat window then displays the health changes
function SCT_OnEvent()
	
	local critical;

	--Player loaded completely
	if (event == "ADDON_LOADED") then
		if (strlower(arg1) == "sct") then
			SCT_Vars_Loaded = 1;
			SCT_Initialize();
		end
		--set damage font after evey addon, incase they try to override
		SCT_SetDmgFont();
	
	--Vars loaded, only load once (bug fix for some users)
	elseif (event == "VARIABLES_LOADED") then
		if (not SCT_Vars_Loaded) then
			SCT_Vars_Loaded = 1;
			SCT_Initialize();
		end

	-- if its enabled
	elseif (SCT_Get("ENABLED")) then
		
		--Player Health
		if (event == "UNIT_HEALTH") then
			if (arg1 == "player") then
				local warnlevel = SCT_Get("LOWHP");
				local HPPercent = UnitHealth("player") / UnitHealthMax("player");
	      if (HPPercent < warnlevel) and (SCT_LastHPPercent >= warnlevel) and (not SCT_CheckFD("player")) then
	      	SCT_Display_Toggle("SHOWLOWHP", SCT_LowHP.." ("..UnitHealth("player")..")");
	      end
	      SCT_LastHPPercent = HPPercent;
	      return;
			end
			--execute check
			
			if (arg1 == "target") then
				local currentclass = UnitClass("player");
				if (UnitIsEnemy("target", "player")) and (UnitIsDead("target")~=true) and (UnitIsCorpse("target")~=true) and ((currentclass == SCT_WARRIOR) or (currentclass == SCT_PALADIN)) then
				local HPTargetPercent = UnitHealth("target");
		      if (HPTargetPercent < 20) and (SCT_LastTargetHPPercent >= 20) then
			local msg;
		      	if (currentclass == SCT_WARRIOR) then
				msg = SCT_ExecuteMessage;
			else
				msg = SCT_WrathMessage;
			end
		      	SCT_Display_Toggle("SHOWEXECUTE", msg);
		      end
		      SCT_LastTargetHPPercent = HPTargetPercent;
			end
		return;
			end
			return;
			
		--Target Changed
		elseif (event == "PLAYER_TARGET_CHANGED") then
			if (UnitIsEnemy("target", "player") and (UnitIsDead("target")~=true) and (UnitIsCorpse("target")~=true)) then
				SCT_LastTargetHPPercent = UnitHealth("target");
			else
				SCT_LastTargetHPPercent = 100;
			end
	
		--Player Mana
		elseif (event == "UNIT_MANA") or (event == "UNIT_RAGE") or (event == "UNIT_ENERGY")then
			if (arg1 == "player") and (UnitPowerType("player") == 0)then
				local warnlevel = SCT_Get("LOWMANA");
				local ManaPercent = UnitMana("player") / UnitManaMax("player");
	      if (ManaPercent < warnlevel) and (SCT_LastManaPercent >= warnlevel) and (not SCT_CheckFD("player")) then
	      	SCT_Display_Toggle("SHOWLOWMANA", SCT_LowMana.." ("..UnitMana("player")..")");
	      end
	      SCT_LastManaPercent = ManaPercent;
			end
			if (arg1 == "player") and (SCT_Get("SHOWALLPOWER")) then
				local ManaFull = UnitMana("player");
				if (ManaFull > SCT_LastManaFull) then
					SCT_Display_Only("SHOWPOWER", "+"..ManaFull-SCT_LastManaFull.." "..arrPowerStrings[UnitPowerType("player")]);
				end
				SCT_LastManaFull = ManaFull;
			end

			return;
			
		--Power Change
		elseif (event == "UNIT_DISPLAYPOWER") then
			SCT_LastManaFull = UnitMana("player");
			return;
			
		--Player Combat
		elseif (event =="PLAYER_REGEN_DISABLED") then
			SCT_Display_Toggle("SHOWCOMBAT", SCT_Combat);
			return;
			
		--Player NoCombat
		elseif (event =="PLAYER_REGEN_ENABLED") then
			SCT_Display_Toggle("SHOWCOMBAT", SCT_NoCombat);
			return;
			
		--Player Combo Points
		elseif (event == "PLAYER_COMBO_POINTS") then
			local SCT_CP = GetComboPoints();
			if (SCT_CP ~= 0) then
				local SCT_CP_Message = SCT_CP.." "..SCT_ComboPoint;
				if (SCT_CP == 5) then
					SCT_CP_Message = SCT_CP_Message.." "..SCT_FiveCPMessage;
				end;
				SCT_Display_Toggle("SHOWCOMBOPOINTS", SCT_CP_Message);
			end
			return;
			
		--All other combat events	
		elseif (arg1) then
			SCT_ParseCombat(event, arg1);	
		end
	end
end

----------------------
-- Parses all combat events using global strings
-- Partly taken from NurfedUI Combatlog http://www.nurfedui.net/addons.php
function SCT_ParseCombat(event, arg1)
	local target, spell, damage, damagetype, debuff, buff, faction, rank, honor;

	--SCT_Chat_Message(event..", "..arg1);
	
	if (SCT_CustomEventSearch(arg1) == true) then
		return;
	end
	
	--Player Environmental
	if (event == "CHAT_MSG_SPELL_SELF_DAMAGE" or
			event == "CHAT_MSG_COMBAT_SELF_HITS") then

		damage = SCTGlobalParser_ParseMessage(arg1, VSENVIRONMENTALDAMAGE_FALLING_SELF) 
		if damage then
			SCT_Display_Only("SHOWHIT", "-"..damage);
			return;
		end
		damage = SCTGlobalParser_ParseMessage(arg1, VSENVIRONMENTALDAMAGE_DROWNING_SELF)
		if damage then
			SCT_Display_Only("SHOWHIT", "-"..damage);
			return;
		end
		damage = SCTGlobalParser_ParseMessage(arg1, VSENVIRONMENTALDAMAGE_FATIGUE_SELF)
		if damage then
			SCT_Display_Only("SHOWHIT", "-"..damage);
			return;
		end
		damage = SCTGlobalParser_ParseMessage(arg1, VSENVIRONMENTALDAMAGE_FIRE_SELF)
		if damage then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, nil, SCT_FindResists());
			return;
		end
		damage = SCTGlobalParser_ParseMessage(arg1, VSENVIRONMENTALDAMAGE_LAVA_SELF)
		if damage then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, nil, SCT_FindResists());
			return;
		end
		damage = SCTGlobalParser_ParseMessage(arg1, VSENVIRONMENTALDAMAGE_SLIME_SELF)
		if damage then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, nil, SCT_FindResists());
			return;
		end
		--reflected stuff
		spell, damage, damagetype = SCTGlobalParser_ParseMessage(arg1, SPELLLOGSCHOOLSELFSELF)
		if spell then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, damagetype, SCT_FindResists());
			SCT_FindAbsorb();
			return;
		end

	--Events Effecting Player
	elseif (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" or
					event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS") then

		--Melee
		target, damage = SCTGlobalParser_ParseMessage(arg1, COMBATHITCRITOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage, 1);
			SCT_FindBlock();
			return;
		end
		target, damage = SCTGlobalParser_ParseMessage(arg1, COMBATHITOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage);
			SCT_FindBlock();
			return;
		end
		--Melee elemental
		target, damage, damagetype = SCTGlobalParser_ParseMessage(arg1, COMBATHITCRITSCHOOLOTHERSELF)
		if target then
			SCT_Display_Only("SHOWSPELL", "-"..damage, 1, damagetype, SCT_FindResists());
			return;
		end
		target, damage, damagetype = SCTGlobalParser_ParseMessage(arg1, COMBATHITSCHOOLOTHERSELF)
		if target then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, damagetype, SCT_FindResists());
			return;
		end
		

	--Miss events
	elseif (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES" or
					event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES") then
		
		--Melee hits with absorbs
		target, damage = SCTGlobalParser_ParseMessage(arg1, COMBATHITCRITOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage, 1);
			SCT_FindAbsorb();
			return;
		end
		target, damage = SCTGlobalParser_ParseMessage(arg1, COMBATHITOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage);
			SCT_FindAbsorb();
			return;
		end
		--non-hits
		target = SCTGlobalParser_ParseMessage(arg1, MISSEDOTHERSELF)
		if target then
			SCT_Display_Toggle("SHOWMISS", MISS, nil, SCT_TARGET.." "..MISS);
			return;
		end
		target = SCTGlobalParser_ParseMessage(arg1, VSPARRYOTHERSELF)
		if target then
			SCT_Display_Toggle("SHOWPARRY", PARRY, nil, YOU.." "..PARRY);
			return;
		end
		target = SCTGlobalParser_ParseMessage(arg1, VSDODGEOTHERSELF)
		if target then
			SCT_Display_Toggle("SHOWDODGE", DODGE, nil, YOU.." "..DODGE);
			return;
		end
		target = SCTGlobalParser_ParseMessage(arg1, VSBLOCKOTHERSELF)
		if target then
			SCT_Display_Toggle("SHOWBLOCK", BLOCK, nil, YOU.." "..BLOCK);
			return;
		end
	  target = SCTGlobalParser_ParseMessage(arg1, VSABSORBOTHERSELF)
	  if target then
			SCT_Display_Toggle("SHOWABSORB", ABSORB, nil, YOU.." "..ABSORB);
			return;
		end
		target, spell = SCTGlobalParser_ParseMessage(arg1, SPELLRESISTOTHERSELF)
		if target then
			SCT_Display_Toggle("SHOWRESIST", RESIST, nil, YOU.." "..RESIST);
			return;
		end

	elseif (event == "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE" or
					event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE") then

		--Spell
		target, spell, damage, damagetype = SCTGlobalParser_ParseMessage(arg1, SPELLLOGCRITSCHOOLOTHERSELF)
		if target then
			SCT_Display_Only("SHOWSPELL", "-"..damage, 1, damagetype, SCT_FindResists());
			SCT_FindAbsorb();
			return;
		end
		target, spell, damage, damagetype = SCTGlobalParser_ParseMessage(arg1, SPELLLOGSCHOOLOTHERSELF)
		if target then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, damagetype, SCT_FindResists());
			SCT_FindAbsorb();
			return;
		end
		target = SCTGlobalParser_ParseMessage(arg1, SPELLLOGABSORBOTHERSELF)
	  if target then
			SCT_Display_Toggle("SHOWABSORB", ABSORB, nil, YOU.." "..ABSORB);
			return;
		end
		target, spell, damage = SCTGlobalParser_ParseMessage(arg1, SPELLLOGCRITOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage, 1, nil, SCT_FindResists());
			SCT_FindAbsorb();
			return;
		end
		target, spell, damage = SCTGlobalParser_ParseMessage(arg1, SPELLLOGOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage, nil, nil, SCT_FindResists());
			SCT_FindAbsorb();
			return;
		end
		target, spell, damage = SCTGlobalParser_ParseMessage(arg1, SPELLSPLITDAMAGEOTHERSELF)
		if target then
			SCT_Display_Only("SHOWHIT", "-"..damage);
			SCT_FindAbsorb();
			return;
		end
		target, spell = SCTGlobalParser_ParseMessage(arg1, SPELLRESISTOTHERSELF)
		if target then
			SCT_Display_Toggle("SHOWRESIST", RESIST, nil, YOU.." "..RESIST);
			return;
		end
	--Over Time Events
	elseif (event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE" or
					event == "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE") then
	
		damage, damagetype, target, spell = SCTGlobalParser_ParseMessage(arg1, PERIODICAURADAMAGEOTHERSELF)
		if target and string.find(target, "(.+)%|1???;???;") then
			return;
		end
		if damage then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, damagetype, SCT_FindResists());
			return;
		end
		damage, damagetype, spell = SCTGlobalParser_ParseMessage(arg1, PERIODICAURADAMAGESELFSELF)
		if spell and string.find(spell, "(.+)%|1???;???;") then
			return;
		end
		if damage then
			SCT_Display_Only("SHOWSPELL", "-"..damage, nil, damagetype, SCT_FindResists());
			return;
		end
		--power gains
		damage, damagetype = SCTGlobalParser_ParseMessage(arg1, POWERGAINSELFSELF)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end
		--power drains
		_,_,_,_,damage, damagetype = SCTGlobalParser_ParseMessage(arg1, SPELLPOWERLEECHSELFOTHER)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end
		--debuffs
		debuff = SCTGlobalParser_ParseMessage(arg1, AURAADDEDSELFHARMFUL)
		if debuff and string.find(debuff, "(.+)%|1???;???;") then
			return;
		end
		if debuff then
			SCT_Display_Toggle("SHOWDEBUFF", "("..debuff..")", nil, arg1);
			return;
		end
		

	--Healing Events
	elseif (event == "CHAT_MSG_SPELL_SELF_BUFF") then
		--self heals
		spell, damage = SCTGlobalParser_ParseMessage(arg1, HEALEDCRITSELFSELF)
		if spell then
			if (SCT_Get("SHOWOVERHEAL")) then
				damage = SCT_GetOverheal("player", damage);
			end
			SCT_Display_Only("SHOWHEAL", "+"..damage, 1, nil, nil, spell);
			return;
		end
		spell, damage = SCTGlobalParser_ParseMessage(arg1, HEALEDSELFSELF)
		if spell then
			if (SCT_Get("SHOWOVERHEAL")) then
				damage = SCT_GetOverheal("player", damage);
			end
			SCT_Display_Only("SHOWHEAL", "+"..damage, nil, nil, nil, spell);
			return;
		end
		--your heals
		spell, target, damage = SCTGlobalParser_ParseMessage(arg1, HEALEDCRITSELFOTHER)
		if spell then
			if (SCT_Get("SHOWOVERHEAL")) then
				damage = SCT_GetOverheal(target, damage);
			end
			SCT_Display_Toggle("SHOWSELFHEAL", target..": +"..damage, 1);
			return;
		end
		spell, target, damage = SCTGlobalParser_ParseMessage(arg1, HEALEDSELFOTHER)
		if spell then
			if (SCT_Get("SHOWOVERHEAL")) then
				damage = SCT_GetOverheal(target, damage);
			end
			SCT_Display_Toggle("SHOWSELFHEAL", target..": +"..damage);
			return;
		end
		--power gains
		damage, damagetype = SCTGlobalParser_ParseMessage(arg1, POWERGAINSELFSELF)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end
		--power drains
		_,_,_,_,damage, damagetype = SCTGlobalParser_ParseMessage(arg1, SPELLPOWERLEECHSELFOTHER)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end

	elseif (event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS") then
		--hots
		damage, target, spell = SCTGlobalParser_ParseMessage(arg1, PERIODICAURAHEALOTHERSELF)
		if damage then
			if string.find(arg1, "(.+)??? (.+)??? (.+)%|1??????;???;") then
				target = string.gsub(target, "(.+)??? (.+)", "%1");
			end
			SCT_Display_Only("SHOWHEAL", "+"..damage, nil, nil, nil, target);
			return;
		end
		--self hots
		damage, spell = SCTGlobalParser_ParseMessage(arg1, PERIODICAURAHEALSELFSELF)
		if damage then
			SCT_Display_Only("SHOWHEAL", "+"..damage, nil, nil, nil, spell);
			return;
		end
		--power gains
		damage, damagetype = SCTGlobalParser_ParseMessage(arg1, POWERGAINSELFSELF)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end
		--power drains
		_,_,_,_,damage, damagetype = SCTGlobalParser_ParseMessage(arg1, SPELLPOWERLEECHSELFOTHER)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end
		--buffs
		buff = SCTGlobalParser_ParseMessage(arg1, AURAADDEDSELFHELPFUL)
		if buff then
			SCT_Display_Toggle("SHOWBUFF", "["..buff.."]", nil, arg1);
			return;
		end
	elseif (event == "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF") then
		--others heals to you
		target, spell, damage = SCTGlobalParser_ParseMessage(arg1, HEALEDCRITOTHERSELF)
		if target then
			if string.find(arg1, "(.+)??? (.+)??? (.+)%|1???;???;") then
				target = string.gsub(target, "(.+)??? (.+)", "%1");
			end
			SCT_Display_Only("SHOWHEAL", "+"..damage, 1, nil, nil, target);
			return;
		end
		target, spell, damage = SCTGlobalParser_ParseMessage(arg1, HEALEDOTHERSELF)
		if target then
			if string.find(arg1, "(.+)??? (.+)??? (.+)%|1??????;???;") then
				target = string.gsub(target, "(.+)??? (.+)", "%1");
			end
			SCT_Display_Only("SHOWHEAL", "+"..damage, nil, nil, nil, target);
			return;
		end

	elseif (event == "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS") then

		target, damage, spell = SCTGlobalParser_ParseMessage(arg1, PERIODICAURAHEALSELFOTHER)
		if spell and string.find(spell, "(.+)%|1???;???;") then
			return;
		end
		if target then
			SCT_Display_Only("SHOWSELFHEAL", target..": +"..damage);
			return;
		end

	--Power gain from others
	elseif (event == "CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS" or
					event == "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS") then
					
		damage, damagetype = SCTGlobalParser_ParseMessage(arg1, POWERGAINSELFSELF)
		if damage then
			if (not SCT_Get("SHOWALLPOWER")) then
				SCT_Display_Only("SHOWPOWER", "+"..damage.." "..damagetype);
			end
			return;
		end

	--Aura Events
	elseif ( event == "CHAT_MSG_SPELL_AURA_GONE_SELF") then
		
		buff = SCTGlobalParser_ParseMessage(arg1, AURAREMOVEDSELF)
		if buff then
			SCT_Display_Toggle("SHOWFADE", "-["..buff.."]", nil, arg1);
			return;
		end
		
	--Player Honor Gain
	elseif (event == "CHAT_MSG_COMBAT_HONOR_GAIN") then
		target, rank, honor = SCTGlobalParser_ParseMessage(arg1, COMBATLOG_HONORGAIN)
		if target then
			SCT_Display_Toggle("SHOWHONOR", "+"..honor.." "..HONOR);
			return;
		end
		
	--Player Skill Gains
	elseif (event == "CHAT_MSG_SKILL") then
		target, rank = SCTGlobalParser_ParseMessage(arg1, SKILL_RANK_UP)
		if target then
			SCT_Display_Toggle("SHOWSKILL", target..": "..rank);
			return;
		end
	
	--Player Reputation Gain
	elseif (event == "CHAT_MSG_COMBAT_FACTION_CHANGE") then
		--Gain
		faction, damage = SCTGlobalParser_ParseMessage(arg1, FACTION_STANDING_INCREASED)
		if faction then
			SCT_Display_Toggle("SHOWREP", "+"..damage.." "..REPUTATION.." ("..faction..")");
			return;
		end
		
		--Lost
		faction, damage = SCTGlobalParser_ParseMessage(arg1, FACTION_STANDING_DECREASED)
		if faction then
			SCT_Display_Toggle("SHOWREP", "-"..damage.." "..REPUTATION.." ("..faction..")");
			return;
		end
		
	end
end

----------------------
--Find a custom capture event message
function SCT_CustomEventSearch(arg1)
	local strTempMessage, currentcolor, table, classfound, key, value;
	local currentclass = UnitClass("player");
	
	for key, value in SCT_pairsByKeys(SCT_Event_Config) do
		--default class found to true
		classfound = true;
		
		--check if they want to see it for this class
		if (value.class) then
			--if want to filter by class, default to false
			classfound = false;
			for key2, class in value.class do
				if (currentclass == class) then
					classfound = true;
					break;
				end
			end
		end
		
		if (classfound) then
			if ( string.find(arg1, "(.+)%|1???;???;") ) then
				return;
			end
			for carg1, carg2, carg3, carg4, carg5 in string.gfind(arg1, value.search) do
				strTempMessage = value.name;
				--if there are capture args
				if ((value.argcount) and (value.argcount > 0) and (value.argcount < 6)) then
					if ( value.argcount == 3 ) then
						local _,_,prefix,suffix = string.find(carg1, "(.+)??? (.+)");
						if ( prefix and suffix ) and ( string.find(prefix, "(.+)??? (.+)") or string.find(suffix, "(.+) (.+)") or suffix == "?????????" or suffix == "??????" ) then
							return;
						end
					end
					table = {carg1, carg2, carg3, carg4, carg5}
					--loop though each capture arg. if it exists replace the display position with it
					for i = 1, value.argcount do
						if (table[i]) then
							strTempMessage, strCount = string.gsub(strTempMessage, "*"..i, table[i]);
						end
					end			 
				end
				--get color
				currentcolor = {r = 1.0, g = 1.0, b = 1.0};
				if (value.r and value.g and value.b) then
					currentcolor.r = value.r;
					currentcolor.g = value.g;
					currentcolor.b = value.b;
				end
				--display
				SCT_Display_Custom_Toggle(strTempMessage, currentcolor, value.iscrit, value.ismsg, value.anitype);
				return true;				
			end
		end
	end
	return false;
end

----------------------
--Display the Text based on message flag
--Mainly used to longer messages
function SCT_Display_Toggle(option, msg1, crit, msg2)
	local rbgcolor, showcrit, showmsg;
	
	--if option is on
	if (SCT_Get(option)) then
		--get options
		rbgcolor = SCT_GetTable(SCT_COLORS_TABLE, option);
		showcrit = SCT_GetTable(SCT_CRITS_TABLE, option);
		showmsg = SCT_GetTable(SCT_MSGS_TABLE, option);
		
		--if messages
		if (showmsg) then
			--see if 2nd message
			if (msg2) then
				msg1 = msg2;
			end
			SCT_Display_Message( msg1, rbgcolor );
		else
			--see if crit override
			if (showcrit) then
				crit = 1;
			end
			SCT_Display( msg1 , rbgcolor, crit, "event");
		end
	end
end

----------------------
--Display for mainly combat events
--Mainly used for short messages
function SCT_Display_Only(option, msg1, crit, damagetype, resisted, target)
	local rbgcolor, showcrit, showmsg;
	
	--if option is on
	if (SCT_Get(option)) then
		--get options
		rbgcolor = SCT_GetTable(SCT_COLORS_TABLE, option);
		showcrit = SCT_GetTable(SCT_CRITS_TABLE, option);
		showmsg = SCT_GetTable(SCT_MSGS_TABLE, option);
		--if damage type
		if ((damagetype) and (SCT_Get("SPELLTYPE"))) then
			msg1 = msg1.." ("..damagetype..")";
		end
		--if resisted
		if ((resisted) and (SCT_Get("SHOWRESIST"))) then
			msg1 = msg1.." ("..resisted.." "..ERR_FEIGN_DEATH_RESISTED..")";
		end
		--if target label
		if ((target) and (SCT_Get("SHOWTARGETS"))) then
			msg1 = msg1.." ("..target..")";
		end
		--if messages
		if (showmsg) then
			SCT_Display_Message( msg1, rbgcolor );
		else
			--see if crit override
			if (showcrit) then
				crit = 1;
			end
			SCT_Display( msg1 , rbgcolor, crit);
		end
	end
end

----------------------
--Display the Text based on message flag for custom events
function SCT_Display_Custom_Toggle(msg1, color, iscrit, ismsg, anitype)
	if (ismsg) then
		SCT_Display_Message( msg1, color );
	else
		SCT_Display( msg1 , color, iscrit, "event", anitype);
	end	
end

----------------------
--Display the Text
function SCT_Display(msg, color, iscrit, type, anitype)
	local adat, curDir;
	local startpos, lastpos, textsize;
	
	--Set up  text animation
	adat = SCT_GetNextAniObj();
	
	-- if its active (rarely happens as all 10 must be in use), set points, if not set as active
	if (adat.Active == true) then
		SCT_aniReset(adat);
		adat.Active = true;
	end
	
	--set animation
	if (anitype) then
		adat.anitype = anitype
	else
		adat.anitype = SCT_Get("ANITYPE");
	end	
			
	--set alpha
	adat.alpha = SCT_Get("ALPHA");
	
	--If they want to tag all self events
	if (SCT_Get("SHOWSELF")) then
		msg = SCT_SelfFlag..msg..SCT_SelfFlag
	end
		
	--If its a crit hit, increase the size
	if (iscrit) then
		textsize = SCT_Get("TEXTSIZE") * SCT_CRIT_SIZE_PERCENT;
		if (SCT_Get("STICKYCRIT")) then
			adat.crit = true;
			local critcount = SCT_critCount();
			
			adat.posY = (SCT_TOP_POINT + SCT_BOTTOM_POINT)/2;
			
			--if there are other Crits active, set offset.
			if (critcount > 1) then
            --alternate left to right, up, down
				if (SCT_LASTCRITBAR == 1) then
					adat.posX = adat.posX + SCT_CRIT_X_OFFSET;
					adat.posY = adat.posY + SCT_CRIT_Y_OFFSET;
					SCT_LASTCRITBAR = 2;
				elseif (SCT_LASTCRITBAR == 2) then
					adat.posX = adat.posX + SCT_CRIT_X_OFFSET;
					adat.posY = adat.posY - SCT_CRIT_Y_OFFSET;
					SCT_LASTCRITBAR = 3;
				elseif (SCT_LASTCRITBAR == 3) then
					adat.posX = adat.posX - SCT_CRIT_X_OFFSET;
					adat.posY = adat.posY + SCT_CRIT_Y_OFFSET;
					SCT_LASTCRITBAR = 4;
				elseif (SCT_LASTCRITBAR == 4) then
					adat.posX = adat.posX - SCT_CRIT_X_OFFSET;
					adat.posY = adat.posY - SCT_CRIT_Y_OFFSET;
					SCT_LASTCRITBAR = 5;
				else
					SCT_LASTCRITBAR = 1;
				end
			else
				SCT_LASTCRITBAR = 1;
			end
		end
	--Crushing
	elseif (iscrit == 2) then
		textsize = SCT_Get("TEXTSIZE") * SCT_CRUSH_SIZE_PERCENT;
	--glancing
	elseif (iscrit == 3) then
		textsize = SCT_Get("TEXTSIZE") * SCT_GLANCE_SIZE_PERCENT;
	else
		textsize = SCT_Get("TEXTSIZE");
	end
	
	--if its not a sticky critm set up normal text
	if (adat.crit ~= true) then
		if (adat.anitype == 1) then
			--get the last known point of active items
			lastpos = SCT_MinPoint()
			
			if (not SCT_Get("DIRECTION")) then
				--move the position down
				if ((lastpos - adat.posY) <= SCT_Get("TEXTSIZE")) then
					adat.posY = adat.posY - (SCT_Get("TEXTSIZE") - (lastpos - adat.posY));
				end
				--if its gone too far down, stop
				if (adat.posY < (SCT_BOTTOM_POINT - SCT_MAX_DISTANCE)) then
					adat.posY = (SCT_BOTTOM_POINT - SCT_MAX_DISTANCE)
				end
			else
				--move the position up
				if ((adat.posY - lastpos) <= SCT_Get("TEXTSIZE")) then
					adat.posY = adat.posY + (SCT_Get("TEXTSIZE") - (adat.posY - lastpos));
				end
				--if its gone too far up, stop
				if (adat.posY > (SCT_TOP_POINT + SCT_MAX_DISTANCE)) then
					adat.posY = (SCT_TOP_POINT + SCT_MAX_DISTANCE)
				end
			end
		else
			--get direction type
			if (SCT_Get("ANISIDETYPE") == 1) then
				SCT_DIRECTION = SCT_DIRECTION * -1;
				curDir = SCT_DIRECTION;
			elseif (SCT_Get("ANISIDETYPE") == 2) then
				if (type=="event") then
					curDir = -1;
				else
					curDir = 1;
				end
			elseif (SCT_Get("ANISIDETYPE") == 3) then
				if (type=="event") then
					curDir = 1;
				else
					curDir = -1;
				end
			end
			
			adat.dir = curDir;
			
			--set animation start pos.
			if (adat.anitype == 2) then
				adat.addY = random(3,6);
				adat.posX = adat.posX - (20 * adat.dir);
			elseif (adat.anitype == 3) then
				adat.posX = adat.posX - (55 * adat.dir);
				adat.posY = SCT_BOTTOM_POINT + (random(0,200) - 100);
			elseif (adat.anitype == 4) then
				adat.posX = adat.posX - (20 * adat.dir);
				adat.addY = random(9,12);
				adat.addX = random(9,12);
			end
		end
	end
	
	--set to active
	adat.Active = true;
	
	--Start up onUpdate, note this is done after active is set to true
	if (not SCT_HEALTHTEXT:IsVisible()) then
		SCT_HEALTHTEXT:Show();
	end
	
	--set text size
	SCT_SetFontSize(adat.FObject, textsize);
	--set the color
	if (not color) then
		color = {r = 1.0, g = 1.0, b = 1.0};
	end
	adat.FObject:SetTextColor(color.r, color.g, color.b);
	--set alpha
	adat.FObject:SetAlpha(adat.alpha);
	--Position
	adat.FObject:SetPoint("CENTER", "UIParent", "CENTER", adat.posX, adat.posY);
	--Set the text to display
	adat.FObject:SetText(msg);
	
end

-------------------------
--gets the next available animation object
--can be used by SCT addons since public
function SCT_GetNextAniObj()
	local adat;
	--get object
	adat = arrAniData["aniData"..SCT_LASTBAR];
	
	--update current text being used
	SCT_LASTBAR = SCT_LASTBAR + 1;
	
	--if we reached the end, set to first
	if (SCT_LASTBAR >= 16) then
		SCT_LASTBAR = 1;
	end
	
	return adat;
end

----------------------
--Displays a message at the top of the screen
function SCT_Display_Message(msg, color)
		SCT_MSGTEXT:SetPoint("CENTER", "UIParent", "CENTER", SCT_Get("MSGXOFFSET"), SCT_Get("MSGYOFFSET"));
		SCT_MSGTEXT:SetTimeVisible(SCT_Get("MSGFADE"));
		SCT_MSGTEXT:AddMessage(msg, color.r, color.g, color.b, 1);
end

----------------------
--Displays a message to chat
function SCT_Chat_Message(msg)
	if( DEFAULT_CHAT_FRAME ) then
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	end
end

----------------------
--Display text from a command line
function SCT_CmdDisplay(msg)	
	
	local message = nil;
	local colors = nil;
	
	--If there are not parameters, display useage
	if string.len(msg) == 0 then
		SCTDisplayUseage();
	--Get message anf colors if quotes used
	elseif string.sub(msg,1,1) == "'" then
		local location = string.find(string.sub(msg,2),"'")
		if location and (location>1) then
			message = string.sub(msg,2,location)
			colors = string.sub(msg,location+1);
		end
	--Get message anf colors if single word used
	else
		local idx = string.find(msg," ");
		if (idx) then
			message = string.sub(msg,1,idx-1);
			colors = string.sub(msg,idx+1);
		else
			message = msg;
		end
	end
	
	--if they sent colors, grab them
	local firsti, lasti, red, green, blue = nil;
	if (colors ~= nil) then
		firsti, lasti, red, green, blue = string.find (colors, "(%w+) (%w+) (%w+)");
	end
    
  local color = {r = 1.0, g = 1.0, b = 1.0}; 
	
	--if they sent 3 colors use them, else use default white
  if (red == nil) or (green == nil) or (blue == nil) then
  	SCT_Display(message, color);
  else
  	color.r = (tonumber(red)/10)
  	color.g = (tonumber(green)/10)
  	color.b = (tonumber(blue)/10)
  	SCT_Display(message, color);
  end
end

----------------------
--Explains how to use sctdisplay
function SCTDisplayUseage()
    SCT_Chat_Message(SCT_DISPLAY_USEAGE);
end

----------------------
-- Upate animations that are being used
function SCT_updateAnimation(elapsed)	
	local anyActive = false;

	for key, value in arrAniData do
		if (value.Active) then
			anyActive = true;
			SCT_doAnimation(value, elapsed);
		end
	end

	--if none are active, stop onUpdate;
	if ((anyActive ~= true) and (SCT_HEALTHTEXT:IsVisible())) then
		SCT_HEALTHTEXT:Hide();
	end

end

----------------------
--Move text to get the animation
function SCT_doAnimation(aniData, elapsed)
	local speed = SCT_Get("ANIMATIONSPEED");
	--If a crit			
	aniData.lastupdate = aniData.lastupdate + elapsed;
	if (aniData.crit) then
		--display crit		
		local elapsedTime = aniData.lastupdate;
		local fadeInTime = SCT_CRIT_FADEINTIME;
		if ( elapsedTime < fadeInTime ) then
			local alpha = (elapsedTime / fadeInTime);
			alpha = alpha * SCT_Get("ALPHA");
			aniData.FObject:SetAlpha(alpha);
			return;
		end
		local holdTime = (SCT_CRIT_HOLDTIME * (speed/SCT_MAX_SPEED));
		if ( elapsedTime < (fadeInTime + holdTime) ) then
			aniData.FObject:SetAlpha(SCT_Get("ALPHA"));
			return;
		end
		local fadeOutTime = SCT_CRIT_FADEOUTTIME;
		if ( elapsedTime < (fadeInTime + holdTime + fadeOutTime) ) then
			local alpha = 1 - ((elapsedTime - holdTime - fadeInTime) / fadeOutTime);
			alpha = alpha * SCT_Get("ALPHA");
			aniData.FObject:SetAlpha(alpha);
			return;
		end
		--reset crit
		SCT_aniReset(aniData);
		
	--else normal text or event text
	elseif (aniData.anitype == 1) then
		local startpos, endpos, step, alpha;
		local avgpos, diffpos;
		
		avgpos = (SCT_TOP_POINT + SCT_BOTTOM_POINT)/2;
		diffpos = (SCT_TOP_POINT - SCT_BOTTOM_POINT)/2;
		
		--if its time to update, move the text step positions
		while (aniData.lastupdate > speed) do
			--set parameters based on direction settings
			if (not SCT_Get("DIRECTION")) then
				startpos = SCT_BOTTOM_POINT;
				endpos = SCT_TOP_POINT;
				step = SCT_Get("MOVEMENT");
				if ((aniData.posY) > avgpos) then
					alpha = (1 - ((aniData.posY-avgpos) / (diffpos - step)));
				else
					alpha = 1;
				end
			else
				startpos = SCT_TOP_POINT;
				endpos = SCT_BOTTOM_POINT;
				step = SCT_Get("MOVEMENT") * -1;
				if ((aniData.posY) < avgpos) then
					alpha = (1 - (((avgpos + SCT_Get("MOVEMENT")) - aniData.posY) / diffpos));
				else
					alpha = 1;
				end
			end
			
			if (alpha > 1) then
				alpha = 1;
			end

			alpha = alpha * SCT_Get("ALPHA");
					
			aniData.posY = aniData.posY + step;
			aniData.alpha = alpha;
			
			--set based on FPS mode
			if (SCT_Get("FPSMODE")) then
				aniData.lastupdate = aniData.lastupdate - speed;
			else
				aniData.lastupdate = 0;
			end
			
			aniData.FObject:SetAlpha(aniData.alpha);
			aniData.FObject:SetPoint("CENTER", "UIParent", "CENTER", aniData.posX, aniData.posY);
			
			--if it reachs the end, reset
			if (not SCT_Get("DIRECTION")) then
				if (aniData.posY >= endpos) then
					SCT_aniReset(aniData);
				end
			else
				if (aniData.posY <= endpos) then
					SCT_aniReset(aniData);
				end
			end
		end
	--else rainbow text
	elseif (aniData.anitype == 2) then
		
		--if its time to update, move the text step positions
		while (aniData.lastupdate > speed) do
		
			--display rainbow text			
			if (aniData.addY > 0) then
					aniData.addY = aniData.addY - 0.22 
			else
					aniData.addY = aniData.addY - (0.18 * (SCT_Get("MOVEMENT")/2));
			end
			if (aniData.addY < -7) then
					aniData.addY = -7;
			end	
			
			aniData.posY = aniData.posY + aniData.addY;
			aniData.posX = aniData.posX - 2.2 * aniData.dir;
	
			if ( aniData.posY < (SCT_BOTTOM_POINT - SCT_MAX_DISTANCE) ) then			
					aniData.alpha = aniData.alpha - 0.05;
					if (aniData.alpha < 0) then						
						aniData.alpha = 0;
					end
			end
			
			--set based on FPS mode
			if (SCT_Get("FPSMODE")) then
				aniData.lastupdate = aniData.lastupdate - speed;
			else
				aniData.lastupdate = 0;
			end
			
			aniData.FObject:SetAlpha(aniData.alpha);
			aniData.FObject:SetPoint("CENTER", "UIParent", "CENTER", aniData.posX, aniData.posY);
			
			if (aniData.alpha <= 0) then
					SCT_aniReset(aniData);
			end
		end
	--else Horizontal
	elseif (aniData.anitype == 3) then
		
		--display Horizontal
		--if its time to update, move the text step positions
		while (aniData.lastupdate > speed) do
		
			aniData.posX = aniData.posX - (SCT_Get("MOVEMENT") * aniData.dir);
	
			if ( abs(SCT_MIDDLE_POINT - aniData.posX) > (SCT_SIDE_POINT-60) ) then			
					aniData.alpha = aniData.alpha - 0.05;
					if (aniData.alpha < 0) then						
						aniData.alpha = 0;
					end
			end
			
			--set based on FPS mode
			if (SCT_Get("FPSMODE")) then
				aniData.lastupdate = aniData.lastupdate - speed;
			else
				aniData.lastupdate = 0;
			end
			
			aniData.FObject:SetAlpha(aniData.alpha);
			aniData.FObject:SetPoint("CENTER", "UIParent", "CENTER", aniData.posX, aniData.posY);
			
			if (aniData.alpha <= 0) then
					SCT_aniReset(aniData);
			end
		end
								
	--else Angled Down
	elseif (aniData.anitype == 4) then
		
		--if its time to update, move the text step positions
		while (aniData.lastupdate > speed) do
					
			if ( abs(SCT_MIDDLE_POINT - aniData.posX) < (SCT_SIDE_POINT - 60) and (aniData.delay <= 35) ) then			
					aniData.posY = aniData.posY - aniData.addY;				
					aniData.posX = aniData.posX - aniData.addX * aniData.dir;			
			elseif (aniData.delay <= 20) then
					aniData.delay = aniData.delay + 1;
					aniData.posY = aniData.posY + (random(0,70) - 35) * 0.02;
					aniData.posX = aniData.posX + (random(0,70) - 35) * 0.02;
			elseif (aniData.delay <= 35) then
					aniData.delay = aniData.delay + 1;
			else
					aniData.posY = aniData.posY + SCT_Get("MOVEMENT");
					aniData.posX = aniData.posX - SCT_Get("MOVEMENT") * aniData.dir;
					aniData.alpha = aniData.alpha - 0.02;
					if (aniData.alpha < 0) then						
						aniData.alpha = 0;
					end
			end
			
			--set based on FPS mode
			if (SCT_Get("FPSMODE")) then
				aniData.lastupdate = aniData.lastupdate - speed;
			else
				aniData.lastupdate = 0;
			end
			
			aniData.FObject:SetAlpha(aniData.alpha);
			aniData.FObject:SetPoint("CENTER", "UIParent", "CENTER", aniData.posX, aniData.posY);
			
			if (aniData.alpha <= 0) then
					SCT_aniReset(aniData);
			end
		end	
	end
end

----------------------
--count the number of crits active
function SCT_critCount()
	local count = 0
	
	for key, value in arrAniData do
		if (value.crit) then
			count = count + 1;
		end
	end
	
	return count;
end

----------------------
--get the min current min point
function SCT_MinPoint()	
	
	local posY;
	
	if (not SCT_Get("DIRECTION")) then
		posY = SCT_TOP_POINT;
		for key, value in arrAniData do
			if ((value.Active) and (value.posY < posY) and (value.anitype == 1) and (not value.crit)) then
				posY = value.posY;
			end
		end
	else
		posY = SCT_BOTTOM_POINT;
		for key, value in arrAniData do
			if ((value.Active) and (value.posY > posY) and (value.anitype == 1) and (not value.crit)) then
				posY = value.posY;
			end
		end
	end
	
	return posY;
end

----------------------
--Rest the text animation
function SCT_aniReset(aniData)	
	local startpos;
	if ((SCT_Get("DIRECTION")) and (aniData.anitype == 1)) then
		startpos = SCT_TOP_POINT;
	else
		startpos = SCT_BOTTOM_POINT;
	end
	
	aniData.Active = false;
	aniData.crit = false;
	aniData.posY = startpos;
	aniData.posX = SCT_MIDDLE_POINT;
	aniData.addY = 0;
	aniData.addX = 0;
	aniData.alpha = 0;
	aniData.lastupdate = 0;
	aniData.dir = 1;
	aniData.delay = 0;
	aniData.anitype = 1;
	
	aniData.FObject:SetAlpha(aniData.alpha);
	aniData.FObject:SetPoint("CENTER", "UIParent", "CENTER", aniData.posX, aniData.posY);

end

----------------------
--Rest all the text animations
function SCT_aniResetAll()
	
	for key, value in arrAniData do
		SCT_aniReset(value);
		--set font only on global update
		SCT_SetFont(value.FObject);
	end

end

----------------------
--Initial animation settings
function SCT_aniInit()

	for key, value in arrAniData do
		value.FObject = getglobal("SCT"..key);
	end
	
	SCT_UpdateGlobalPos();
end

------------------------
--Update the global position vars
function SCT_UpdateGlobalPos()
	SCT_TOP_POINT = SCT_Get("YOFFSET") + SCT_MAX_DISTANCE;
	SCT_BOTTOM_POINT = SCT_Get("YOFFSET");
	SCT_MIDDLE_POINT = SCT_Get("XOFFSET");
	SCT_aniResetAll();
	SCT_SetMsgFont(SCT_MSGTEXT);
	SCT_SetDmgFont();
end

-------------------------
--Set the font of an object
function SCT_SetFont(object)
	local outline;

	--set outline
	outline = arrShadowOutline[SCT_Get("FONTSHADOW")]
	
	--set font
	object:SetFont(SCT_FONTS[SCT_Get("FONT")].path, SCT_Get("TEXTSIZE"), outline);
end

-------------------------
--Set the font of an object using msg vars
function SCT_SetMsgFont(object)
	local outline;

	--set outline
	outline = arrShadowOutline[SCT_Get("MSGFONTSHADOW")]
	
	--set font
	object:SetFont(SCT_FONTS[SCT_Get("MSGFONT")].path, SCT_Get("MSGSIZE"), outline);
	
	--reset size of allow 3 messages
	object:SetHeight(SCT_Get("MSGSIZE") * 4) 
	
	--Set Fade Duration
	if (object.SetFadeDuration) then
		object:SetFadeDuration(1);
	end
end

-------------------------
--Set the font of the built in damage font
function SCT_SetDmgFont()
	if (SCT_Get("DMGFONT")) then
		DAMAGE_TEXT_FONT = SCT_FONTS[SCT_Get("FONT")].path;
	end
end

-------------------------
--Set the font of an object
function SCT_SetFontSize(object, textsize)
	local cFont, cTextsize, cOutline;
	
	--get current values
	cFont, cTextsise, cOutline = object:GetFont() 	
	
	--if size then update it
	if (cFont ~= SCT_FONTS[SCT_Get("FONT")].path) then
		object:SetFont(SCT_FONTS[SCT_Get("FONT")].path, textsize, arrShadowOutline[SCT_Get("FONTSHADOW")]);
	elseif (cTextsize ~= textsize ) then
		object:SetFont(cFont, textsize, cOutline);
	end

end

-------------------------
--Determine if a hunter is FD'ing
--Code taken from CTRA
function SCT_CheckFD(unit)
	if ( UnitClass(unit) ~= SCT_HUNTER ) then
		return;
	end
	local hasFD;
	local num, buff = 0, UnitBuff(unit, 1);
	while ( buff ) do
		if ( buff == "Interface\\Icons\\Ability_Rogue_FeignDeath" ) then
			hasFD = 1;
			break;
		end
		num = num + 1;
		buff = UnitBuff(unit, num+1);
	end
	if ( hasFD ) then
		return true;
	else
		return false;
	end
end

-------------------------
--Return the unit if for a given  target
function SCT_GetTargetUnit(target)
	local unit;
	if (target == "player") then
		unit = "player";
	end
	if not unit then
		for i = 1, GetNumRaidMembers(), 1 do
			if ( UnitName("raid" .. i) and UnitName("raid" .. i) == target ) then
				unit = "raid"..i;
				break;
			end
		end
	end
	if not unit then
		for i = 1, GetNumPartyMembers(), 1 do
			if ( UnitName("party" .. i) and UnitName("party" .. i) == target ) then
				unit = "party"..i;
				break;
			end
		end
	end
	return unit;
end

-------------------------
--Return the amount the target is overhealed
function SCT_GetOverheal(target, damage)
	local unit = SCT_GetTargetUnit(target);
	if unit then
		local lost = UnitHealthMax(unit)-UnitHealth(unit);
  	local overheal = damage - lost;
  	if (overheal > 0) then
  		damage = lost.." {"..overheal.."}";
  	end
  end
  return damage;
end

-------------------------
--Fixes abmgious combat messages 
--Taken from the CombatMessagesAmbigousFix addon
function SCT_CombatMessagesAmbigousFix()
	--AmbigousFix--
	if (not IsAddOnLoaded("CombatMessagesAmbigousFix") and not IsAddOnLoaded("Nurfed_CombatLog")) then
		local COMBAT_MESSAGES;
		-- CombatMessageAmbigousfix by No-Nonsense
		-- GERMAN
		if (GetLocale() == "deDE") then
			COMBAT_MESSAGES = {
			-- Combat Messages.
			"SPELLLOGCRITOTHEROTHER",
			"SPELLLOGOTHEROTHER",
			"SPELLLOGCRITSCHOOLOTHERSELF",
			"SPELLLOGCRITSCHOOLOTHEROTHER",
			"SPELLLOGSCHOOLOTHERSELF",
			"SPELLLOGSCHOOLOTHEROTHER",
			"SPELLSPLITDAMAGEOTHEROTHER",
			"SPELLSPLITDAMAGEOTHERSELF",
			"SPELLRESISTOTHEROTHER",

			-- Heal Messages.
			"PERIODICAURAHEALOTHEROTHER",
			"HEALEDCRITOTHEROTHER",
			"HEALEDCRITOTHERSELF",
			"HEALEDOTHEROTHER",
			
			--Buff Fades
			"AURADISPELOTHER",
		};

		 -- Apply modifications.
		for _, cmsg in COMBAT_MESSAGES do
			local fixcode = cmsg .. '= string.gsub(string.gsub(' .. cmsg .. ', "(%%%d%$s)s", "%1\'s"), "%%ss", "%%s\'s")';
			RunScript(fixcode);
		end
		--FRENCH
		elseif (GetLocale() == "frFR") then
			COMBAT_MESSAGES = {
			"PERIODICAURADAMAGEOTHEROTHER",
			"SPELLLOGOTHEROTHER",
			"SPELLPOWERDRAINOTHEROTHER",
			"SPELLPOWERLEECHOTHEROTHER",
			"IMMUNEDAMAGECLASSOTHEROTHER",
			"IMMUNESPELLOTHEROTHER",
			"PROCRESISTOTHEROTHER",
			"SPELLBLOCKEDOTHEROTHER",
			"SPELLDEFLECTEDOTHEROTHER",
			"SPELLDODGEDOTHEROTHER",
			"SPELLEVADEDOTHEROTHER",
			"SPELLPARRIEDOTHEROTHER",
			"PERIODICAURADAMAGEOTHERSELF",
			"SPELLLOGCRITSCHOOLOTHERSELF",
			"SPELLLOGOTHERSELF",
			"SPELLPOWERDRAINOTHERSELF",
			"SPELLPOWERLEECHOTHERSELF",
			"IMMUNEDAMAGECLASSOTHERSELF",
			"IMMUNESPELLOTHERSELF",
			"PROCRESISTOTHERSELF",
			"SPELLDEFLECTEDOTHERSELF",
			"SPELLIMMUNEOTHERSELF",
			"SPELLMISSOTHERSELF",
			"SPELLPARRIEDOTHERSELF",
			"HEALEDCRITOTHEROTHER",
			"HEALEDOTHEROTHER",
			"PERIODICAURAHEALOTHEROTHER",
			"SPELLPOWERLEECHOTHEROTHER",
			"HEALEDOTHERSELF",
			"PERIODICAURAHEALOTHERSELF",
			"SPELLPOWERLEECHOTHERSELF"
			};

			for _, cmsg in COMBAT_MESSAGES do
				local fixcode = cmsg .. '= string.gsub(string.gsub(' .. cmsg .. ', "(%%%d%$s) de ", "%1 DE "), "%%s de ", "%%s DE ")';
				RunScript(fixcode);
			end

		end

		-- Free Memory.
		local COMBAT_MESSAGES = nil;
	end
end

---------------------
--Save current settings, mainly to catch when they load a profile
function SCTSaveCurrentSettings()
	SCT_CONFIG[SCT_PlayerName] = SCT_clone(SCTPlayer);
	SCTPlayer = SCT_Config_GetPlayer();
end

-----------------------
--Load a profile
function SCTLoadProfile()
	local editbox = getglobal("SCTOptionsProfileEditBox");
	local profile = editbox:GetText();
	if (SCT_CONFIG[profile]) then
		SCTPlayer = SCT_clone(SCT_CONFIG[profile]);
		editbox:SetText("");
		SCT_hideMenu();
		SCT_showMenu();
		SCT_Chat_Message(SCT_PROFILE..profile);
	end
end

-----------------------
--Delete a profile
function SCTDeleteProfile()
	local editbox = getglobal("SCTOptionsProfileEditBox");
	local profile = editbox:GetText();
	if (SCT_CONFIG[profile]) then
		if (profile == SCT_PlayerName) then
			SCT_Reset();
		else
			SCT_CONFIG[profile] = nil;
		end
		editbox:SetText("");
		SCT_UpdateProfileList()
		SCT_hideMenu();
		SCT_showMenu();
		SCT_Chat_Message(SCT_PROFILE_DELETE..profile);
	end
end

