TITAN_MODMENU_ID = "ModMenu";
TITAN_MODMENU_ICON = "Interface\\Icons\\Spell_Holy_BlessingOfAgility"
TITAN_MODMENU_ENCH = false;

--------------------------------------------
--                 Debug                  --
--------------------------------------------

TitanPanelModMenu_DebugOutput = false;

function TPMM_Debug(msg)
	if (TitanPanelModMenu_DebugOutput) then DEFAULT_CHAT_FRAME:AddMessage("MM Debug: ".. msg); end
end

--------------------------------------------
--              onFunctions               --
--------------------------------------------

function TitanPanelModMenuButton_OnLoad()
	this.registry = { 
		id = TITAN_MODMENU_ID,
		menuText = TITAN_MODMENU_MENU_TEXT, 
		buttonTextFunction = "TitanPanelModMenuButton_GetButtonText", 
		icon = TITAN_MODMENU_ICON,	
		iconWidth = 16,
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 0,
		}
	};
end

--------------------------------------------
--             Mod Functions              --
--------------------------------------------

function TitanPanelModMenu_ToggleFrame()
	DropDownList1:Hide();
	if (getglobal(this.value):IsVisible()) then
		HideUIPanel(getglobal(this.value), true);
	else 
		ShowUIPanel(getglobal(this.value), true);
	end
end

function TitanPanelModMenu_PassSlashCmd()
	DropDownList1:Hide();
	TitanPanelModMenuEditBox:SetText(this.value);
	ChatEdit_SendText(TitanPanelModMenuEditBox);
end

function TitanPanelModMenu_CallFunction()
	DropDownList1:Hide();
	local func = getglobal(this.value);
	func();
end

function TitanPanelModMenu_RegisterMenu(addon, infoarray)
	TitanModMenu_MenuItems[addon] = infoarray;
end

--------------------------------------------
--            Titan Functions             --
--------------------------------------------

function TitanPanelModMenuButton_GetButtonText(id)
	return TITAN_MODMENU_MENU_BARTEXT, "";
end

function TitanPanelModMenu_ToggleIconText()
	if (TitanGetVar(TITAN_MODMENU_ID, "ShowIcon") == TitanGetVar(TITAN_MODMENU_ID, "ShowLabelText")) then
			TitanToggleVar(TITAN_MODMENU_ID, "ShowLabelText");
	else
		TitanToggleVar(TITAN_MODMENU_ID, "ShowIcon");
		TitanToggleVar(TITAN_MODMENU_ID, "ShowLabelText");
	end
	TitanPanelButton_UpdateButton(TITAN_MODMENU_ID, 1);
end

function TitanPanelModMenu_Hide()
	TitanPanel_RemoveButton(TITAN_MODMENU_ID);
end

function TitanPanelRightClickMenu_PrepareModMenuMenu(level)
	if (level == 1) then TitanPanelModMenu_BuildRootMenu(); end
	if (level == 2) then TitanPanelModMenu_BuildCatMenu(); end
	if (level == 3) then TitanPanelModMenu_BuildAddonMenu(); end
end

function TitanPanelModMenu_BuildRootMenu()
	local level = 1;
	
	local loadedmodcats = {[TITAN_MODMENU_CAT_TRADESKILLS] = true};
	for addon in TitanModMenu_MenuItems do
		if (not TitanModMenu_MenuItems[addon].cat) then
			TitanModMenu_MenuItems[addon].cat = TITAN_MODMENU_CAT_OTHER;
		end
		
		local cat = TitanModMenu_MenuItems[addon].cat;
		
		if (not TitanModMenu_MenuItems[addon].frame) then
			loadedmodcats[cat] = true;
		elseif (getglobal(TitanModMenu_MenuItems[addon].frame)) then
			loadedmodcats[cat] = true;
		end
	end

	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_MODMENU_ID].menuText, level);
	TitanPanelRightClickMenu_AddSpacer(level);
	
	for i,cat in TitanModMenu_BaseMenu do
		if (cat == TITAN_MODMENU_SPACER) then
			TitanPanelRightClickMenu_AddSpacer(level);
		else
			local info = {};
			info.text = cat;
			info.value = cat;
			if (loadedmodcats[cat]) then	
				info.hasArrow = 1;
			end
			UIDropDownMenu_AddButton(info, level);
		end
	end
end

function TitanPanelModMenu_BuildCatMenu()
	local level = 2;
	local cat = UIDROPDOWNMENU_MENU_VALUE;	
	
	if (cat == TITAN_MODMENU_CAT_TRADESKILLS) then
		TitanPanelModMenu_BuildTradeMenu();
		return;
	end
	
	local loadedmods = {};
	for addon in TitanModMenu_MenuItems do
		local skip = false;
		if (TitanModMenu_MenuItems[addon].loc) then
			if (TitanModMenu_MenuItems[addon].loc ~= GetLocale()) then
				skip = true;
			end
		end
		if (TitanModMenu_MenuItems[addon].frame) then
			if (not getglobal(TitanModMenu_MenuItems[addon].frame)) then
				skip = true;
			end
		end
		if (not skip) then table.insert(loadedmods, addon); end
	end
	table.sort(loadedmods);	

	for i,addon in loadedmods do
		local menudata = TitanModMenu_MenuItems[addon];
		if (menudata.cat == cat) then
			if (menudata.text == TITAN_MODMENU_SPACER) then
				TitanPanelRightClickMenu_AddSpacer(level);
			elseif (menudata.submenu) then 
				local info = {};
				info.text = menudata.text;
				info.value = addon;
				info.hasArrow = 1;
				UIDropDownMenu_AddButton(info, level);
			elseif (menudata.toggle) then
				TitanPanelRightClickMenu_AddCommand(menudata.text, menudata.toggle, "TitanPanelModMenu_ToggleFrame", level);
			elseif (menudata.cmd) then
				TitanPanelRightClickMenu_AddCommand(menudata.text, menudata.cmd, "TitanPanelModMenu_PassSlashCmd", level);
			elseif (menudata.func) then
				TitanPanelRightClickMenu_AddCommand(menudata.text, menudata.func, "TitanPanelModMenu_CallFunction", level);
			end
			
		end
	end
end

function TitanPanelModMenu_BuildAddonMenu()
	local level = 3;
	local addon = UIDROPDOWNMENU_MENU_VALUE;
	local submenudata = TitanModMenu_MenuItems[addon].submenu;
	
	TPMM_Debug("Level 3, ".. addon);
	
	TitanPanelRightClickMenu_AddTitle(TitanModMenu_MenuItems[addon].text, level);
	TitanPanelRightClickMenu_AddSpacer(level);
	
	for i,entryarray in submenudata do			
		if (entryarray == TITAN_MODMENU_SPACER) then
			TitanPanelRightClickMenu_AddSpacer(level);
		elseif (entryarray.toggle) then
			TitanPanelRightClickMenu_AddCommand(entryarray.text, entryarray.toggle, "TitanPanelModMenu_ToggleFrame", level);
		elseif (entryarray.cmd) then
			TitanPanelRightClickMenu_AddCommand(entryarray.text, entryarray.cmd, "TitanPanelModMenu_PassSlashCmd", level);
		elseif (entryarray.func) then
			TitanPanelRightClickMenu_AddCommand(entryarray.text, entryarray.func, "TitanPanelModMenu_CallFunction", level);
		else
			TitanPanelRightClickMenu_AddTitle(entryarray.text, level);
		end
	end
end


function TitanPanelModMenu_BuildTradeMenu()
	local level=2
--	ExpandSkillHeader(0);
	for i=1, GetNumSkillLines(), 1 do
		local skillName, _, _, skillRank, _, skillModifier, skillMaxRank = GetSkillLineInfo(i);
		if (skillName) then
			if (skillName == TITAN_MODMENU_TRADE_HERB) then
				local slot = TitanPanelModMenu_GetSlot(TITAN_MODMENU_TRADE_FINDHERB);
				local txt = TitanPanelModMenu_GetSkillText(skillName, skillRank, skillModifier, skillMaxRank)
				TitanPanelRightClickMenu_AddCommand(txt, slot, "TitanPanelModMenu_OpenCraft", level);
			elseif (skillName == TITAN_MODMENU_TRADE_MINING) then
				local slot = TitanPanelModMenu_GetSlot(TITAN_MODMENU_TRADE_FINDORE);
				local txt = TitanPanelModMenu_GetSkillText(skillName, skillRank, skillModifier, skillMaxRank)
				TitanPanelRightClickMenu_AddCommand(txt, slot, "TitanPanelModMenu_OpenCraft", level);
			elseif (skillName == TITAN_MODMENU_TRADE_FIRSTAID)
				or (skillName == TITAN_MODMENU_TRADE_ALCHEMY)
				or (skillName == TITAN_MODMENU_TRADE_TAILOR)
				or (skillName == TITAN_MODMENU_TRADE_BLACKSMITH)
				or (skillName == TITAN_MODMENU_TRADE_ENGINEER)
				or (skillName == TITAN_MODMENU_TRADE_LEATHER)
				or (skillName == TITAN_MODMENU_TRADE_SKINNING)
				or (skillName == TITAN_MODMENU_TRADE_ENCHANTING)
				or (skillName == TITAN_MODMENU_TRADE_COOKING)
				or (skillName == TITAN_MODMENU_TRADE_FISHING)
				then
				local slot = TitanPanelModMenu_GetSlot(skillName);
				local txt = TitanPanelModMenu_GetSkillText(skillName, skillRank, skillModifier, skillMaxRank)
				TitanPanelRightClickMenu_AddCommand(txt, slot, "TitanPanelModMenu_OpenCraft", level);
			end
			if (skillName == TITAN_MODMENU_TRADE_ENCHANTING) then
				TITAN_MODMENU_ENCH = true;
			end
		end
	end  
	
	if(TITAN_MODMENU_ENCH) then
		local slot = TitanPanelModMenu_GetSlot(TITAN_MODMENU_TRADE_DISENCHANTING);
		TitanPanelRightClickMenu_AddSpacer(level);
		TitanPanelRightClickMenu_AddCommand(TITAN_MODMENU_TRADE_DISENCHANTING, slot, "TitanPanelModMenu_OpenCraft", level);
	end
end

function TitanPanelModMenu_GetSkillText(skillName, skillRank, skillModifier, skillMaxRank)
	local txt = skillName.." ".. skillRank;
	if (skillModifier > 0) then
		txt = txt.. " (+".. skillModifier.. ")";
	end
	txt = txt.. "/".. skillMaxRank;
	
	return txt;
end

function TitanPanelModMenu_GetSlot(craft)
	local _, _, _, numSpells = GetSpellTabInfo(1);
	
	for i=1, numSpells do
		local spellName = GetSpellName(i, TITAN_MODMENU_TRADE_SPELLBOOKGENERAL);
		if (spellName == craft) then return i; end
	end
end

function TitanPanelModMenu_OpenCraft()
	DropDownList1:Hide();
	local id = this.value;
	CastSpell(id, TITAN_MODMENU_TRADE_SPELLBOOKGENERAL)
end

-- These functions are here because I don't know how 
-- to pass args with the current implementation
function TPMM_TogCharFrame()
	ToggleCharacter("PaperDollFrame");
end

function TPMM_TogSpellFrame()
	ToggleSpellBook(BOOKTYPE_SPELL);
end
