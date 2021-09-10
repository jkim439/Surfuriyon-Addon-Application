function WindBag_OnLoad()
	local index = WindBag_getIndex(this:GetName());
	ContainerFrame = getglobal("ContainerFrame"..index);
	this:SetAllPoints(ContainerFrame);
	this:SetPoint("TOPLEFT", ContainerFrame, "TOPLEFT", 6, 0);
	WindBag_setName(getglobal("ContainerFrame"..index.."Name"), ContainerFrame);
	getglobal("ContainerFrame"..index.."Portrait"):Hide();
	WindCommon_setPoint(getglobal("ContainerFrame"..index.."BackgroundTop"), "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 1000, 0);
	this:SetFrameLevel(ContainerFrame:GetFrameLevel()-1);
end

function WindBag_getIndex(frame)
	return string.sub(frame, 8);
end

function WindBag_setName(frame, container)
	WindCommon_setPoint(frame, "TOPLEFT", container, "TOPLEFT", 16, -10);
	frame:SetJustifyH("LEFT");
	frame:SetTextColor(1.0, 0.8, 0.0);
end

function WindBank_OnLoad()
	BankCloseButton:SetParent(WindBank);
	BankFramePurchaseButton:SetParent(WindBank);
	BankFrameDetailMoneyFrame:SetParent(WindBank);
	BankFrameMoneyFrame:SetParent(WindBank);
	for i=1,24 do getglobal("BankFrameItem"..i):SetParent(WindBank); end
	for i=1,6 do getglobal("BankFrameBag"..i):SetParent(WindBank); end
	BankFramePurchaseButton:SetWidth(38);
	WindCommon_setPoint(BankCloseButton, "TOPRIGHT", WindBank, "TOPRIGHT", -3, 1);
	WindCommon_setPoint(BankFrameItem1, "TOPLEFT", WindBank, "TOPLEFT", 10, -25);
	WindCommon_setPoint(BankFrameBag1, "TOPLEFT", WindBank, "TOPLEFT", 10, -215);
	WindCommon_setPoint(BankFramePurchaseButton, "TOPRIGHT", WindBank, "TOPRIGHT", -10, -255);
	WindCommon_setPoint(BankFrameDetailMoneyFrame, "RIGHT", BankFramePurchaseButton, "LEFT", 0, 0);
	WindCommon_setPoint(BankFrameMoneyFrame, "BOTTOMLEFT", WindBank, "BOTTOMLEFT", 10, 8);
	BankFrame:SetAlpha(0.0);
	BankFrame:SetFrameStrata("BACKGROUND");
	WindCommon_setSize(BankFrame, 1, 1);
	WindBank:RegisterEvent("BANKFRAME_OPENED");
	WindBank:RegisterEvent("BANKFRAME_CLOSED");
	WindBank:RegisterEvent("PLAYERBANKBAGSLOTS_CHANGED");
	WindBank:RegisterEvent("PLAYER_MONEY");
	WindBank:RegisterEvent("VARIABLES_LOADED");
	updateContainerFrameAnchors = WindBB_updateContainerFrameAnchors;
end

function WindBank_OnEvent(event)
	if (event == "VARIABLES_LOADED") then
		WindBB_initConfig();
		WindBB_setScale();
	elseif ( event == "BANKFRAME_OPENED" ) then
		ShowUIPanel(this);
		WindBB_OpenAllBags();
		if (not this:IsVisible()) then CloseBankFrame(); end
		WindBank_UpdateBagSlotStatus();
	elseif ( event == "BANKFRAME_CLOSED" ) then
		HideUIPanel(this);
		CloseAllBags();
	elseif ( event == "PLAYER_MONEY" or event == "PLAYERBANKBAGSLOTS_CHANGED" ) then
		WindBank_UpdateBagSlotStatus();
	end
end

function WindBank_UpdateBagSlotStatus()
	local numSlots,full = GetNumBankSlots();
	if( full ) then
		BankFramePurchaseButton:Hide();
		BankFrameDetailMoneyFrame:Hide();
	else
		BankFramePurchaseButton:Show();
		BankFrameDetailMoneyFrame:Show();
	end
	UpdateBagSlotStatus();
end

function WindBB_initConfig()
	if (not WindBBConfigAll) then WindBBConfigAll = {0, 260, 0.8}; end
end

function WindBB_setScale()
	WindBank:SetScale(WindBBConfigAll[3]);
	for i=1, 11 do getglobal("ContainerFrame"..i):SetScale(WindBBConfigAll[3]); end
end

function WindBB_updateContainerFrameAnchors()
	local uiScale = GetCVar("uiscale") + 0;
	local screenHeight = 768;
	if ( GetCVar("useUiScale") == "1" ) then screenHeight = 768 / uiScale; end
	local freeScreenHeight = screenHeight / WindBBConfigAll[3] - WindBBConfigAll[2];
	local index = 1;
	local column = 0;
	while ContainerFrame1.bags[index] do
		local frame = getglobal(ContainerFrame1.bags[index]);
		if ( index == 1 ) then frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", WindBBConfigAll[1], WindBBConfigAll[2]);
		elseif ( freeScreenHeight < frame:GetHeight() ) then
			column = column + 1;
			freeScreenHeight = UIParent:GetHeight() / WindBBConfigAll[3] - WindBBConfigAll[2];
			frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", WindBBConfigAll[1] - (column * (CONTAINER_WIDTH - 6)), WindBBConfigAll[2]);
		else frame:SetPoint("BOTTOMRIGHT", ContainerFrame1.bags[index - 1], "TOPRIGHT", 0, CONTAINER_SPACING);	 end
		freeScreenHeight = freeScreenHeight - frame:GetHeight() - VISIBLE_CONTAINER_SPACING;
		index = index + 1;
	end
end

function WindBB_OpenAllBags()
	CloseAllBags();
	OpenAllBags(1);
	for i=5, 11 do ToggleBag(i); end
end