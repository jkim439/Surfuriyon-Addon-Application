--[[

	SuperInspect: ---------
		copyright 2005-2006 by Chester

]]

SUPERINSPECT_VERSION = "1.18";

BINDING_HEADER_SUPERINSPECT = "Super Inspect";
BINDING_NAME_SUPERINSPECT = "대상 살펴보기";

SuperInspect = {};

UIPanelWindows["SuperInspectFrame"] = { area = "left", pushable = 0 };

function SuperInspectFrame_Load_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ADDON_LOADED");
	
	SLASH_SUPERINSPECT1 = "/superinspect";
	SLASH_SUPERINSPECT2 = "/si";
	SLASH_SUPERINSPECT3 = "/살펴보기";
	SlashCmdList["SUPERINSPECT"] = function(msg)
		SuperInspect_SlashCommand(msg);
	end	
end


function SuperInspectFrame_Load_OnEvent()
	if( event == "VARIABLES_LOADED" ) then
		if( DEFAULT_CHAT_FRAME ) then
--			DEFAULT_CHAT_FRAME:AddMessage("|cffffd200SuperInspect |cffffff00v"..SUPERINSPECT_VERSION.." loaded.");
			if (not IsAddOnLoaded("SuperInspect_UI")) then
				--DEFAULT_CHAT_FRAME:AddMessage("|cffffd200SuperInspect is not loaded");
			end
		end
		if (not SI_Save) then
			SI_Save = { };
			SI_Save.default = 1;
		end

		InspectUnit = SuperInspect_InspectTargetHooked;
		InspectFrame_OnUpdate = SuperInspect_InspectFrame_Nothing;
		InspectTitleText = SI_DummyText;
		
		-- keeps the inspect selection from greying out on the targetframe dropdown
		UnitPopupButtons["INSPECT"] = { text = TEXT(INSPECT), dist = 0 };
	end
	if( event == "ADDON_LOADED" and arg1 == "SuperInspect_UI") then
		--DEFAULT_CHAT_FRAME:AddMessage("|cffffd200SuperInspect is loaded!");
		SuperInspectFrame.uiScale = SuperInspect_GetUIScale();
		if (SI_Save.framepos_L or SI_Save.framepos_T) then
			SuperInspectFrame:ClearAllPoints();
			SuperInspectFrame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", SI_Save.framepos_L, SI_Save.framepos_T);
		else
			SuperInspectFrame:ClearAllPoints();
			SuperInspectFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
			SI_Save.framepos_L = SuperInspectFrame:GetLeft();
			SI_Save.framepos_T = SuperInspectFrame:GetTop();
		end
	end
end

function SI_AddMessage( text )
	if (not text) then
		return;	
	end
	if (SI_Save.debug) then
		ChatFrame3:AddMessage(GREEN_FONT_COLOR_CODE..""..text.."");
	end
end

function SuperInspect_GetUIScale()
	local uiScale;
	if ( GetCVar("useUiScale") == "1" ) then
		uiScale = tonumber(GetCVar("uiscale"));
	else
		uiScale = 1.0;
	end
	return uiScale;
end

function SuperInspect_GetEffectiveScale(frame)
	return frame:GetEffectiveScale()
end

function SuperInspect_SetEffectiveScale(frame, scale, parentframe)
	frame.scale = scale;  -- Saved in case it needs to be re-calculated when the parent's scale changes.
	local parent = getglobal(parentframe);
	if ( not parent ) then
		parent = getglobal("UIParent");
	end
	scale = scale / parent:GetEffectiveScale()
	frame:SetScale(scale);
end

function SuperInspect_SlashCommand(msg)
	if( not msg or msg == "" ) then
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect 명령어:");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect scale <숫자> |cff3366ff- 프레임의 크기를 설정합니다. 0.25 부터 2.0 까지 (기본값 0.75)");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect reset |cff3366ff- 프레임 위치를 초기화 하여 화면 중앙에 놓이도록 합니다.");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect defaulttoggle |cff3366ff- 기본모드를 켜기/끄기 합니다. (켰을 때는, 기본 살펴보기창과 같이 움직이며 껐을 때는 창 크기조절과 드래그할 수 있습니다.");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect itembgtoggle |cff3366ff- 아이템 등급에 따른 테두리 표시를 변경합니다.");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect durabilitytoggle |cff3366ff- 자기자신을 살펴보기할 때 내구도 정보를 켜기/끄기 합니다.");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect sound |cff3366ff- 살펴보기창을 열거나 닫을 때 소리를 켜기/끄기 합니다.");
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect button |cff3366ff- 살펴보기버튼을 표시/숨김 합니다.");						
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20/superinspect buttonreset |cff3366ff- 살펴보기버튼의 위치를 초기화합니다.");

		return;
	end
	if (string.find(msg, "scale") ~= nil) then
		for scale in string.gfind(msg, "scale%s(%d.*)") do
			SuperInspect.s = tonumber(scale);
		end
		if (SuperInspect.s) then
			if (SuperInspect.s > 2) then
				SuperInspect.s = 2;
			elseif (SuperInspect.s < 0.25) then
				SuperInspect.s = 0.25;
			end
			if (not IsAddOnLoaded("SuperInspect_UI")) then
				UIParentLoadAddOn("SuperInspect_UI");
			end
			SuperInspectFrame:SetScale(3);
			SuperInspect_SetEffectiveScale(SuperInspectFrame, SuperInspect.s, "UIParent");
			--SuperInspect_ModelFrame:SetScale(SuperInspectFrame:GetEffectiveScale());
			SuperInspect_ResetFrame();
			SuperInspect_ModelFrame:RefreshUnit();
			SI_Save.scale = SuperInspect.s;
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: SuperInspect 프레임 크기: "..SuperInspect.s);
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: Scale 뒤에 숫자를 입력하여 주세요 (숫자 범위: 0.5-2.0, 예: /superinspect Scale 0.8)");
		end
		return;
--/script CSG_Main_Frame:SetScale(UIParent:GetScale() * 0.75);
	end
	if( msg == "reset" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end
		SuperInspect_ResetFrame();
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 프레임 위치가 화면 중앙으로 초기화됨.");
	end
	if( msg == "defaulttoggle" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end
		if (SI_Save.default) then
			SI_Save.default = nil;
			SuperInspect_ResetFrame();
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 살펴보기창은 더이상 블리자드 기본스타일이 아님 (자유로운 이동과 크기조절)");						
		else
			SI_Save.default = 1;
			SuperInspect_ResetFrame();
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 살펴보기창이 블리자드 기본스타일 같이 변경 (크기와 위치 고정)");			
		end
	end
	if( msg == "itembgtoggle" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end
		if (SI_Save.itembg) then
			SI_Save.itembg = nil;
			if (SuperInspectFrame:IsVisible()) then
				SuperInspectFrame:Hide();
				SuperInspectFrame:Show();
			end
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 아이템 등급 표시로 테두리를 사용합니다.");						
		else
			SI_Save.itembg = 1;
			if (SuperInspectFrame:IsVisible()) then
				SuperInspectFrame:Hide();
				SuperInspectFrame:Show();
			end
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 아이템 등급 표시로 탭을 사용합니다.");	
		end
	end
	--SI_Save.durabilityoff
	if( msg == "durabilitytoggle" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end

		if (SI_Save.durabilityoff) then
			SI_Save.durabilityoff = nil;
			SuperInspect_ResetFrame();
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 내구도 정보를 표시합니다.");						
		else
			SI_Save.durabilityoff = 1;
			SuperInspect_ResetFrame();
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 내구도 정보를 더이상 표시하지 않습니다.");	
		end
	end
	if( msg == "sound" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end
		if (SI_Save.snd) then
			SI_Save.snd = nil;
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 클릭 소리 비활성화");						
		else
			SI_Save.snd = 1;
			PlaySound("igCharacterInfoOpen");
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 클릭 소리 활성화");	
		end
	end
	if( msg == "button" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end
		if (SI_Save.buttonoff) then
			SI_Save.buttonoff = nil;
			SuperInspectButtonFrame:ClearAllPoints();
			SuperInspectButtonFrame:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT", 115, -50);
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 살펴보기 버튼을 표시합니다.");						
		else
			SI_Save.buttonoff = 1;
			SuperInspectButtonFrame:StartMoving()
			SuperInspectButtonFrame:SetPoint("TOPLEFT", "UIParent", "TOPLEFT", -1000, 1000);
			SuperInspectButtonFrame:StopMovingOrSizing()
			DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 살펴보기 버튼을 더이상 표시하지 않습니다.");	
		end
	end
	if( msg == "buttonreset" ) then
		if (not UIParentLoadAddOn("SuperInspect_UI")) then
			return; 
		end
		SuperInspectButtonFrame:ClearAllPoints();
		SuperInspectButtonFrame:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT", 115, -50);
		DEFAULT_CHAT_FRAME:AddMessage("|cff20ff20SuperInspect: 살펴보기 버튼 위치 초기화");	
	end
end

function SuperInspect_InspectFrame_Nothing()
	--what
end

function SuperInspect_InspectTarget(unit)
	if (not UIParentLoadAddOn("SuperInspect_UI")) then
		--UIParentLoadAddOn("SuperInspect_UI");
		--SuperInspect_InspectTarget(unit);
		return; 
	end
	if (not unit) then
		unit = "target";	
	end
	if (SuperInspectFrame:IsVisible()) then
		HideUIPanel(SuperInspectFrame);
		SuperInspect.isVisible = nil;
		return;
	else
		if (not UnitExists("target")) then
			TargetUnit("player");
		end
		SuperInspect_UpdateModel(unit);	
	end
end

function SuperInspect_InspectTargetHooked(unit)
	if (not UIParentLoadAddOn("SuperInspect_UI")) then
		return; 
	end
	if (not unit) then
		unit = "target";	
	end
	if (not UnitExists("target")) then
		TargetUnit("player");
	end
	SuperInspect_UpdateModel(unit);	
end

function checkEvents( event )
	if( event == "PLAYER_TARGET_CHANGED" ) then
		-- See if we need to hide the button
		if( checkTarget() == 1 ) then
			-- SHOW
			SuperInspectButtonFrame:Show();	
		else
			-- HIDE
			SuperInspectButtonFrame:Hide();
		end
	end
end

function checkTarget()
	if ( UnitIsVisible("target")) then
		return 1;
	else
		return 0;
	end
end

function SuperInspectButton_OnLoad()
	if( checkTarget() == 1 ) then
		SuperInspectButtonFrame:Show();	
	else
		SuperInspectButtonFrame:Hide();
	end
	this:RegisterForDrag("RightButton");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
end

function SuperInspectButton_OnDragStart()
	this:StartMoving()
end

function SuperInspectButton_OnDragStop()
	this:StopMovingOrSizing()
end