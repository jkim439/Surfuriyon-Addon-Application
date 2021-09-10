-- 
-- MCP - Master Control Program
--
-- Allows you to control AddOn loading after logging in.
-- 
--  Marc aka Saien on Hyjal
--  WOWSaien@gmail.com
--  http://64.168.251.69/wow
--
-- Changes
--   2006.01.02
--     1.9 release
--     In game changes to the addon list are limited to changing the currently 
--       logged in character only. You cannot change Addons for other characters. 
--       This is a Blizzard restriction.
--   2005.10.10
--     1.8 release

ADDON_LOADED = "Loaded";
ADDON_WILL_NOT_LOAD = "Will not load";
ADDON_REFUSE_TO_LOAD = "Disabled in MCP";
UIPanelWindows["MCP_AddonList"] = { area = "center", pushable = 0, whileDead = 1 };
StaticPopupDialogs["MCP_RELOADUI"] = {
	text = "UI를 다시 재실행 하시겠습니까?",
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		ReloadUI();
	end,
	timeout = 0,
	hideOnEscape = 1
};
MCP_VERSION = "2006.01.03";
MCP_LINEHEIGHT = 16;
local MCP_MAXADDONS = 20;
local MCP_BLIZZARD_ADDONS = { 
	"Blizzard_AuctionUI",
	"Blizzard_BattlefieldMinimap",
	"Blizzard_BindingUI",
	"Blizzard_CraftUI",
	"Blizzard_InspectUI",
	"Blizzard_MacroUI",
	"Blizzard_RaidUI",
	"Blizzard_TalentUI",
	"Blizzard_TradeSkillUI",
	"Blizzard_TrainerUI",
};
local MCP_BLIZZARD_ADDONS_TITLES = { 
	"Blizzard: Auction",
	"Blizzard: Battlefield Minimap",
	"Blizzard: Binding",
	"Blizzard: Craft",
	"Blizzard: Inspect",
	"Blizzard: Macro",
	"Blizzard: Raid",
	"Blizzard: Talent",
	"Blizzard: Trade Skill",
	"Blizzard: Trainer",
};
local MCP_old_LoadAddOn = nil;

-- local MCP_old_IsOptionFrameOpen = nil;
-- local function MCP_new_IsOptionFrameOpen()
-- 	if (MCP_AddonList:IsVisible()) then
-- 		return 1;
-- 	else
-- 		return MCP_old_IsOptionFrameOpen();
-- 	end
-- end

local function MCP_new_LoadAddOn(name)
	if (not IsAddOnLoaded(name) and MCP_Config and MCP_Config.refusetoload and MCP_Config.refusetoload[name]) then
		return nil, "REFUSE_TO_LOAD";
	else
		return MCP_old_LoadAddOn(name);
	end
end

function MCP_OnLoad()
	-- MCP_old_IsOptionFrameOpen = IsOptionFrameOpen;
	-- IsOptionFrameOpen = MCP_new_IsOptionFrameOpen;
	
	MCP_old_LoadAddOn = LoadAddOn;
	LoadAddOn = MCP_new_LoadAddOn;
end

function MCP_OnEvent(event)
end

function MCP_AddonList_Enable(index,enabled)
	if (type(index) == "number") then
		if (enabled) then
			EnableAddOn(index)
		else
			DisableAddOn(index)
		end
	else
		if (enabled) then
			if (MCP_Config and MCP_Config.refusetoload) then
				MCP_Config.refusetoload[index] = nil;
			end
		else
			if (not MCP_Config) then MCP_Config = {}; end
			if (not MCP_Config.refusetoload) then MCP_Config.refusetoload = {}; end
			MCP_Config.refusetoload[index] = true;
		end
	end
	MCP_AddonList_OnShow();
end

function MCP_AddonList_LoadNow(index)
	UIParentLoadAddOn(index);
	MCP_AddonList_OnShow();
end

function MCP_AddonList_OnShow()
	local function setSecurity (obj, idx)
		local width,height,iconWidth = 64,16,16;
		local increment = iconWidth/width;
		local left = (idx-1)*increment;
		local right = idx*increment;
		obj:SetTexCoord(left, right, 0, 1);
	end

	-- UIDropDownMenu_Initialize(this, MCP_CharacterDropDown_Initialize);
	-- local character = UIDropDownMenu_GetSelectedValue(MCP_AddonList_CharacterDropDown);
	-- if (character == ALL) then character = nil; end

	local numAddons = GetNumAddOns();
	local origNumAddons = numAddons;
	numAddons = numAddons + table.getn(MCP_BLIZZARD_ADDONS);
	FauxScrollFrame_Update(MCP_AddonList_ScrollFrame, numAddons, MCP_MAXADDONS, MCP_LINEHEIGHT, nil, nil, nil);
	local i;
	local offset = FauxScrollFrame_GetOffset(MCP_AddonList_ScrollFrame);
	for i = 1, MCP_MAXADDONS, 1 do
		obj = getglobal("MCP_AddonListEntry"..i);
		local addonIdx = offset+i;
		if (addonIdx > numAddons) then
			obj:Hide();
			obj.addon = nil;
		else
			obj:Show();
			local titleText = getglobal("MCP_AddonListEntry"..i.."Title");
			local status = getglobal("MCP_AddonListEntry"..i.."Status");
			local checkbox = getglobal("MCP_AddonListEntry"..i.."Enabled");
			local securityIcon = getglobal("MCP_AddonListEntry"..i.."SecurityIcon");
			local loadnow = getglobal("MCP_AddonListEntry"..i.."LoadNow");

			local name, title, notes, enabled, loadable, reason, security;
			if (addonIdx > origNumAddons) then
				name = MCP_BLIZZARD_ADDONS[(addonIdx-origNumAddons)];
				obj.addon = name;
				title = MCP_BLIZZARD_ADDONS_TITLES[(addonIdx-origNumAddons)];
				notes = "";
				if (MCP_Config and MCP_Config.refusetoload and MCP_Config.refusetoload[name]) then
					enabled = nil;
					loadable = nil;
					reason = "WILL_NOT_LOAD";
				else
					enabled = 1;
					loadable = 1;
				end
				if (IsAddOnLoaded(name)) then
					reason = "LOADED";
					loadable = 1;
				end
				security = "SECURE";
			else
				name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(addonIdx);
				obj.addon = addonIdx;
			end
			local loaded = IsAddOnLoaded(name);
			local ondemand = IsAddOnLoadOnDemand(name);
			if (loadable) then
				titleText:SetTextColor(1,0.78,0);
			elseif (enabled and reason ~= "DEP_DISABLED") then
				titleText:SetTextColor(1,0.1,0.1);
			else
				titleText:SetTextColor(0.5,0.5,0.5);
			end
			if (title) then
				titleText:SetText(title);
			else
				titleText:SetText(name);
			end
			if (title == "Master Control Program") then
				checkbox:Hide();
			else
				checkbox:Show();
				checkbox:SetChecked(enabled);
			end
			if (security == "SECURE") then
				setSecurity(securityIcon,1);
			elseif (security == "INSECURE") then
				setSecurity(securityIcon,2);
			elseif (security == "BANNED") then -- wtf?
				setSecurity(securityIcon,3);
			end
			if (reason) then
				status:SetText(TEXT(getglobal("ADDON_"..reason)));
			elseif (loaded) then
				status:SetText(TEXT(ADDON_LOADED));
			elseif (ondemand) then
				status:SetText("Loaded on demand.");
			else
				status:SetText("");
			end
			if (not loaded and enabled and ondemand) then
				loadnow:Show();
			else
				loadnow:Hide();
			end
		end

	end
end
--[[

function MCP_CharacterDropDown_OnClick()
	UIDropDownMenu_SetSelectedValue(MCP_AddonList_CharacterDropDown, this.value);
	MCP_AddonList_OnShow();
end

function MCP_CharacterDropDown_Initialize()
	local selected = UIDropDownMenu_GetSelectedValue(MCP_AddonList_CharacterDropDown);
	info = {};
	info.text = ALL;
	info.value = ALL;
	if (selected == ALL) then
		info.checked = 1;
	end
	info.func = MCP_CharacterDropDown_OnClick;

	info = {};
	info.text = UnitName("player");
	info.value = UnitName("player");
	if (not selected or selected == UnitName("player")) then
		info.checked = 1;
	end
	info.func = MCP_CharacterDropDown_OnClick;
end
]]
