--[[
 The Original Cosmos UI Configuration values
 
 This is the simplest example of how CosmosMaster can be used. 
 Simply include this lua file in CosmosIncludes.xml file,
 then register it under the proper event handlers.
 
 
 Original code by Justin Crites (Xiphoris)
 Registration design by Alex Brazie (AlexanderYoshi)
]]--

function ToggleCosmosFeatureFrame()
	local loaded = LoadAddOn("CosmosMenu");
	if ( loaded ) then
		if (CosmosFeatureFrame:IsVisible()) then
			HideUIPanel(CosmosFeatureFrame);
		else
			ShowUIPanel(CosmosFeatureFrame);
		end
	else
		Sea.io.print (COSMOS_BUTTON_NOTLOADED);
	end
end

Cosmos_TurnOnOpenAllBags = 1;

function Cosmos_ToggleOpenAllBags(value)
	if ( ( value == 1 ) or ( value == true ) ) then 
		Cosmos_TurnOnOpenAllBags = 1;
	else
		Cosmos_TurnOnOpenAllBags = 0;
	end
end

Cosmos_ShiftToSell = false;

function Cosmos_ContainerFrameItemButton_OnClick(button, ignoreShift)
	if ( button == "RightButton" ) then
		if ( Cosmos_ShiftToSell == true ) then
			if (  MerchantFrame:IsVisible() ) then
				if ( IsShiftKeyDown() ) then
					UseContainerItem(this:GetParent():GetID(), this:GetID());
				end
			else
				UseContainerItem(this:GetParent():GetID(), this:GetID());					
			end
		else 
			UseContainerItem(this:GetParent():GetID(), this:GetID());
		end
	else
		return true;
	end

	return false;
end
Sea.util.hook("ContainerFrameItemButton_OnClick", "Cosmos_ContainerFrameItemButton_OnClick", "hide");

-- Adds ALT Invites to WhoLinks
function Cosmos_SetItemRef (link, text, button) 
-- Begin Wholink mod code

	if (WhoLink_ProcessLink) then
		local linkIsWhoLink = WhoLink_ProcessLink(link, button);
		if (linkIsWhoLink) then
			return;
		end
	end

-- End Wholink mod code
	if ( strsub(link, 1, 6) == "player" ) then
		local name = strsub(link, 8);
		if ( name and (strlen(name) > 0) ) then
			name = gsub(name, "([^%s]*)%s+([^%s]*)%s+([^%s]*)", "%3");
			name = gsub(name, "([^%s]*)%s+([^%s]*)", "%2");
			if ( IsShiftKeyDown() ) then
				local staticPopup;
				staticPopup = StaticPopup_Visible("ADD_IGNORE");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = StaticPopup_Visible("ADD_FRIEND");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = StaticPopup_Visible("ADD_GUILDMEMBER");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = StaticPopup_Visible("ADD_RAIDMEMBER");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				if ( ChatFrameEditBox:IsVisible() ) then
					ChatFrameEditBox:Insert(name);
				else
					SendWho("n-"..name);
				end
				
			elseif ( button == "RightButton" ) then
				FriendsFrame_ShowDropdown(name, 1);
			else
				ChatFrame_SendTell(name);
			end
		end
		return;
	end
	return true;
end
Sea.util.hook("SetItemRef", "Cosmos_SetItemRef", "hide");

function Cosmos_ShiftSell(toggle)
	if ( toggle ~= 0 ) then
		Cosmos_ShiftToSell = true;
	else
		Cosmos_ShiftToSell = false;
	end
end

-- Quest Scroll speed
function Cosmos_SetQuestTextScrollSpeed(toggle, speed)
	if ( toggle ~= 0 ) then 
		setglobal('QUEST_DESCRIPTION_GRADIENT_CPS',speed);
	else
		setglobal('QUEST_DESCRIPTION_GRADIENT_CPS',600000);
	end
end

-- Cosmos channels functionality START
function Cosmos_ToggleUseChatFunctions(toggle)
	if ( Hanul_InitLoaded and toggle == 1 ) then
		if (not (CosmosMaster_UseChatFunctions == true)) then
			CosmosMaster_UseChatFunctions = true;
		end
	else
		if (CosmosMaster_UseChatFunctions ~= nil) then
			CosmosMaster_UseChatFunctions = nil;
			CosmosMaster_ChanList = {};
			CosmosMaster_CleanChannels();
		end
	end
end
-- Cosmos channels functionality END

-- Cosmos START
function PartyMemberFrame_UpdateCosmos(type, info, arg1, arg2, arg3, arg4)
	if ( not Hanul_InitLoaded ) then
		return;
	end
	--Sea.io.print ( "PMF_UC: '"..arg1.."'");
	if (arg1 == "<UC>" or arg1 == '<CL>') then -- UC : Use Cosmos
		for i = 1, MAX_PARTY_MEMBERS, 1 do
			if ( getglobal("PartyMemberFrame"..i.."CosmosIcon") ) then
				if (UnitName("party"..i) == arg2) then
					getglobal("PartyMemberFrame"..i.."CosmosIcon"):Show();
				end
			end
		end
	elseif (arg1 == "<AC>") then
		Cosmos_SendPartyMessage("<UC>");
	end

	return 1;
end
-- Cosmos END

function Cosmos_ResetPartyFrames()
	local lastFrame = PartyMemberFrame1;
	lastFrame:ClearAllPoints();
	lastFrame:SetPoint("TOPLEFT", "UIParent", "TOPLEFT", 10, -128);
	local newFrame = nil;
	for i = 2, MAX_PARTY_MEMBERS do
		newFrame = getglobal(string.format("PartyMemberFrame%d", i));
		if ( newFrame ) then
			newFrame:ClearAllPoints();
			newFrame:SetPoint("TOPLEFT", lastFrame:GetName(), "BOTTOMLEFT", 0, -10);
		end
		lastFrame = newFrame;
	end
end

function Cosmos_Registers()
	-- Register with the CosmosMaster
	Cosmos_RegisterConfiguration(
		"COS_COS",
		"SECTION",
		TEXT(COSMOS_CONFIG_SEP),
		TEXT(COSMOS_CONFIG_SEP_INFO)
		);
 	Cosmos_RegisterConfiguration(
		"COS_COS_DEFAULTSEPARATOR",
		"SEPARATOR",
		TEXT(COSMOS_CONFIG_SEP),
		TEXT(COSMOS_CONFIG_SEP_INFO)
		);
	Cosmos_RegisterConfiguration(
		"COS_COS_QUESTSCROLL",
		"BOTH",
		COSMOS_CONFIG_QUESTSCROLL,
		COSMOS_CONFIG_QUESTSCROLL_INFO,
		Cosmos_SetQuestTextScrollSpeed,
		1,
 		400,										 --Default Value
 		40,										 --Min value
 		400,										 --Max value
 		COSMOS_CONFIG_QUESTSCROLL_CHARS,	--Slider Text
 		20,									 --Slider Increment
 		1,										 --Slider state text on/off
 		COSMOS_CONFIG_QUESTSCROLL_APPEND,			--Slider state text append
 		1										 --Slider state text multiplier
		);
		
	Cosmos_RegisterConfiguration(
		"COS_COS_SHIFTSELL",
		"CHECKBOX", 
		TEXT(COSMOS_CONFIG_S2SELL),
		TEXT(COSMOS_CONFIG_S2SELL_INFO),
		Cosmos_ShiftSell,
		0
		);
	if ( OpenAllBags_InitLoaded == true ) then
		Cosmos_RegisterConfiguration(
			"COS_COS_OPENALLBAGS",
			"CHECKBOX",
			TEXT(COSMOS_CONFIG_OPENALLBAGS),
			TEXT(COSMOS_CONFIG_OPENALLBAGS_INFO),
			Cosmos_ToggleOpenAllBags,
			1
		);
	end
	if ( Hanul_InitLoaded ) then
		Cosmos_RegisterConfiguration(
			"COS_COS_USECHAN",
			"CHECKBOX",
			TEXT(COSMOS_CONFIG_USECHAN),
			TEXT(COSMOS_CONFIG_USECHAN_INFO),
			Cosmos_ToggleUseChatFunctions,
			1
			);
	end
	Cosmos_RegisterConfiguration(
		"COS_COS_RESET_PARTY_FRAMES",
		"BUTTON",
		TEXT(COSMOS_CONFIG_RESET_PARTY_FRAMES),
		TEXT(COSMOS_CONFIG_RESET_PARTY_FRAMES_INFO),
		Cosmos_ResetPartyFrames,
		0,
		0,
		0,
		0,
		TEXT(COSMOS_CONFIG_RESET_PARTY_FRAMES_TEXT)
		);

	-- Cosmos Configuration Button
	Cosmos_RegisterButton ( 
		COSMOS_BUTTON_COSMOS, 
		COSMOS_BUTTON_COSMOS_SUB, 
		COSMOS_BUTTON_COSMOS_TIP, 
		"Interface\\Icons\\Ability_Repair", 
		function()
			if (CosmosMasterFrame:IsVisible()) then 
				HideUIPanel(CosmosMasterFrame);
			else 
				PlaySound("igMainMenuOption");
				ShowUIPanel(CosmosMasterFrame);
				CosmosMasterFrame_Show();
			end
		end
		);
	if ( Hanul_InitLoaded ) then
		-- Cosmos Party Button
		Cosmos_RegisterChatWatch( 
			"PARTYCOSMOSBUTTON", 
			{CHANNEL_COSMOS, CHANNEL_PARTY}, 
			PartyMemberFrame_UpdateCosmos, 
			"Add the cosmos button near the party member" 
			);
		-- Cosmos Userlist
		Cosmos_RegisterChatWatch( 
			"COSMOSUSERSONLINE", 
			{CHANNEL_COSMOS} ,
			CosmosMaster_CosmosUsers_Update,
			"Add cosmos users who login to the list"
			);
	end
end
