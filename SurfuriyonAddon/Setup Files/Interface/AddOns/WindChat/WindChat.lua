function WindChat_OnLoad()
	local name = WindChat_getBlzFrame(this:GetName());
	local frame = getglobal(name);
	WindCommon_setBackground(this, frame, 6);
	WindCommon_setHide(getglobal(name.."UpButton"));
	WindCommon_setHide(getglobal(name.."DownButton"));

	local bottom = getglobal(name.."BottomButton");
	bottom:SetScript("OnClick", WindChatBottomButton_OnClick);
	WindCommon_setSize(bottom, 24, 24);
	WindCommon_setPoint(bottom, "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0);
	WindCommon_setHide(bottom);

	ChatTypeInfo["CHANNEL"].sticky = 1;
	ChatTypeInfo["OFFICER"].sticky = 1;
end

function WindChat_getBlzFrame(name)
	return string.sub(name, 5);
end

function WindChatBottomButton_OnClick()
	PlaySound("igChatBottom");
	this:GetParent():ScrollToBottom();
	WindCommon_setHide(this);
end

function WindChat_OnMouseWheel(value)
	local name = WindChat_getBlzFrame(this:GetName());
	local frame = getglobal(name);
	if ( value < 0 ) then
		if IsShiftKeyDown() then frame:ScrollToBottom();
		elseif IsControlKeyDown() then
			frame:ScrollDown();
			frame:ScrollDown();
			frame:ScrollDown();
		else frame:ScrollDown(); end
	elseif ( value > 0 ) then
		if IsShiftKeyDown() then frame:ScrollToTop();
		elseif IsControlKeyDown() then
			frame:ScrollUp();
			frame:ScrollUp();
			frame:ScrollUp();
		else frame:ScrollUp(); end
	end

	if (frame:AtBottom()) then WindCommon_setHide(getglobal(name.."BottomButton"));
	else
		WindChat_viewBottomButton(getglobal(name.."BottomButton"), frame);
	end
end

function WindChat_viewBottomButton(bottom, frame)
	WindCommon_setPoint(bottom, "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0);
	WindCommon_setSize(bottom, 24, 24);
	bottom:SetAlpha(1.0);
end

function WindChatEditBox_OnLoad()
	WindChat_setChatFrameMenuButton();

	ChatFrameEditBoxLeft:ClearAllPoints();
	ChatFrameEditBoxLeft:SetPoint("LEFT", "ChatFrame1", "LEFT", 0, 0);
	ChatFrameEditBoxLeft:SetPoint("RIGHT", "ChatFrame1", "RIGHT", 0, 0);	
	ChatFrameEditBoxLeft:Hide();
	ChatFrameEditBoxRight:Hide();

	WindCommon_setBackground(this, ChatFrameEditBox, 1);
	WindCommon_setBackgroundPoint(WindChatEditBoxBG, WindChatEditBox, -5);
	WindCommon_setPoint(ChatFrameEditBoxLanguage, "LEFT", "ChatFrameEditBox", "RIGHT", -5, 0);

	SetItemRef = WindChat_SetItemRef;

	ChatFrameEditBox:SetAltArrowKeyMode(false);
	ChatFrameEditBox:SetFrameStrata("TOOLTIP");
	WindChatEditBox:RegisterEvent("VARIABLES_LOADED");
end

function WindChat_setChatFrameMenuButton()
	WindCommon_setSize(ChatFrameMenuButton, 20, 20);
	WindCommon_setPoint(ChatFrameMenuButton, "TOPRIGHT", "ChatFrame1", "TOPRIGHT", 0, 0);
end

function WindChat_SetItemRef(link, text, button)
	if ( strsub(link, 1, 6) == "player" ) then
		WindChat_SetItemRefPlayer(link, button);
		return;
	end

	if ( IsControlKeyDown() ) then DressUpItemLink(text);
	elseif ( IsShiftKeyDown() ) then
		if ( ChatFrameEditBox:IsVisible() ) then ChatFrameEditBox:Insert(text); end
	else
		ShowUIPanel(ItemRefTooltip);
		if ( not ItemRefTooltip:IsVisible() ) then ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE"); end
		ItemRefTooltip:SetHyperlink(link);
	end
end

function WindChat_SetItemRefPlayer(link, button)
	local name = strsub(link, 8);
	if ( name and (strlen(name) > 0) ) then
		name = gsub(name, "([^%s]*)%s+([^%s]*)%s+([^%s]*)", "%3");
		name = gsub(name, "([^%s]*)%s+([^%s]*)", "%2");
		if ( IsShiftKeyDown() ) then SendWho("n-"..name);
		elseif ( button == "RightButton" ) then FriendsFrame_ShowDropdown(name, 1);
		elseif ( IsAltKeyDown() ) then InviteByName(name);
		elseif ( IsControlKeyDown() ) then TargetByName(name);
		elseif (StaticPopup_Visible("ADD_IGNORE")) then getglobal(staticPopup.."EditBox"):SetText(name);
		else ChatFrame_SendTell(name); end
	end
end

function WindChatEditBox_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindChat_initConfig();
		for i=1,7 do
			WindChat_setScale(i);
			WindChat_setBorder(i);
		end
		WindChatEditBox_setLocation();
	end
end

function WindChat_initConfig()
	if (not WindChatConfigAll) then WindChatConfigAll = {{1.0, true}, {1.0, true}, {1.0, true}, {1.0, true}, {1.0, true}, {1.0, true}, {1.0, true}, false}; end
end

function WindChat_setScale(index)
	getglobal("ChatFrame"..index):SetScale(WindChatConfigAll[index][1]);
	if (index == 1) then ChatFrameEditBox:SetScale(WindChatConfigAll[1][1]); end
end

function WindChat_setBorder(index)
	if (WindChatConfigAll[index][2]) then getglobal("WindChatFrame"..index):SetBackdrop(WindCommon_Border);
	else getglobal("WindChatFrame"..index):SetBackdrop(nil); end
end

function WindChatEditBox_setLocation()
	if (WindChatConfigAll[8]) then
		ChatFrameEditBox:ClearAllPoints();
		ChatFrameEditBox:SetPoint("BOTTOMLEFT", "ChatFrame1", "TOPLEFT", -5, 4);
		ChatFrameEditBox:SetPoint("BOTTOMRIGHT", "ChatFrame1", "TOPRIGHT", 5, 4);
	else
		ChatFrameEditBox:ClearAllPoints();
		ChatFrameEditBox:SetPoint("TOPLEFT", "ChatFrame1", "BOTTOMLEFT", -5, -4);
		ChatFrameEditBox:SetPoint("TOPRIGHT", "ChatFrame1", "BOTTOMRIGHT", 5, -4);
	end
end