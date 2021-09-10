WindActionPetSize = {
	{351, 47},
	{181, 81},
	{79, 183},
	{45, 353}
}

function WindActionPet_OnLoad()
	for i=1, 10 do
		local btn = getglobal("PetActionButton"..i);
		btn:SetParent(WindActionPet);
		btn:SetScript("OnUpdate", WindActionPetButton_OnUpdate);
	end
	WindCommon_setPoint(PetActionButton1, "TOPLEFT", WindActionPet, "TOPLEFT", 8, -8);
	WindActionPet_update();
	this:RegisterEvent("PLAYER_CONTROL_LOST");
	this:RegisterEvent("PLAYER_CONTROL_GAINED");
	this:RegisterEvent("PLAYER_FARSIGHT_FOCUS_CHANGED");
	this:RegisterEvent("UNIT_PET");
	this:RegisterEvent("UNIT_FLAGS");
	this:RegisterEvent("UNIT_AURA");
	this:RegisterEvent("PET_BAR_UPDATE");
	this:RegisterEvent("PET_BAR_UPDATE_COOLDOWN");
	this:RegisterEvent("PET_BAR_SHOWGRID");
	this:RegisterEvent("PET_BAR_HIDEGRID");
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionPetButton_OnUpdate()
	if (this.needUpdate) then
		local start, duration, enable = GetPetActionCooldown(ActionButton_GetPagedID(this));
		local text = getglobal(this:GetName().."RCCCount");
		if (start>0 and duration>0 and enable>0) then
			if ( duration > 2.0 ) then
				text:SetText(WindActionButton_getColldownText(start, duration, GetTime()));
				text:Show();
			end
		else
			this.needUpdate	= false;
			text:Hide();
		end
	end
end

function WindActionPet_update()
	local petActionButton, petActionIcon;
	local petActionsUsable = GetPetActionsUsable();

	for i=1, NUM_PET_ACTION_SLOTS, 1 do
		petActionButton = getglobal("PetActionButton"..i);
		petActionIcon = getglobal("PetActionButton"..i.."Icon");
		petAutoCastableTexture = getglobal("PetActionButton"..i.."AutoCastable");
		petAutoCastModel = getglobal("PetActionButton"..i.."AutoCast");
		local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);

		if ( not isToken ) then
			petActionIcon:SetTexture(texture);
			petActionButton.tooltipName = name;
		else
			petActionIcon:SetTexture(getglobal(texture));
			petActionButton.tooltipName = TEXT(getglobal(name));
		end

		petActionButton.isToken = isToken;
		petActionButton.tooltipSubtext = subtext;

		if (isActive) then petActionButton:SetChecked(1);
		else petActionButton:SetChecked(0); end

		if (autoCastAllowed) then petAutoCastableTexture:Show();
		else petAutoCastableTexture:Hide(); end

		if (autoCastEnabled) then petAutoCastModel:Show();
		else petAutoCastModel:Hide(); end

		if (name) then petActionButton:Show();
		elseif ( WindActionPet.showgrid == 0 ) then petActionButton:Hide(); end

		if (texture) then
			if ( petActionsUsable ) then SetDesaturation(petActionIcon, nil);
			else SetDesaturation(petActionIcon, 1); end
			petActionIcon:Show();
			petActionButton:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2");
		else
			petActionIcon:Hide();
			petActionButton:SetNormalTexture("Interface\\Buttons\\UI-Quickslot");
		end
	end

	WindActionPet_updateCooldowns();
	if (not PetHasActionBar()) then WindActionPet_hideGrid();
	else WindActionPet_showGrid(); end
end

function WindActionPet_updateCooldowns()
	for i=1, NUM_PET_ACTION_SLOTS, 1 do
		local start, duration, enable = GetPetActionCooldown(i);
		CooldownFrame_SetTimer(getglobal("PetActionButton"..i.."Cooldown"), start, duration, enable);
		getglobal("PetActionButton"..i).needUpdate	= 1;
	end
end

function WindActionPet_showGrid()
	WindActionPet:Show();
	for i=1, NUM_PET_ACTION_SLOTS, 1 do getglobal("PetActionButton"..i):Show(); end
end

function WindActionPet_hideGrid()
	WindActionPet:Hide();
	for i=1, NUM_PET_ACTION_SLOTS, 1 do if ( not GetPetActionInfo(i) ) then getglobal("PetActionButton"..i):Hide(); end end
end

function WindActionPet_OnEvent()
	if (event == "PET_BAR_UPDATE") then WindActionPet_update();
	elseif (event == "UNIT_PET" and arg1 == "player") then WindActionPet_update();
	elseif (event == "PLAYER_CONTROL_LOST") then WindActionPet_update();
	elseif (event == "PLAYER_CONTROL_GAINED") then WindActionPet_update();
	elseif (event == "PLAYER_FARSIGHT_FOCUS_CHANGED") then WindActionPet_update();
	elseif (event == "UNIT_FLAGS" and arg1 == "pet") then WindActionPet_update();
	elseif (event == "UNIT_AURA" and arg1 == "pet") then WindActionPet_update();
	elseif (event =="PET_BAR_UPDATE_COOLDOWN") then WindActionPet_updateCooldowns();
	elseif (event =="PET_BAR_SHOWGRID") then WindActionPet_showGrid();
	elseif (event =="PET_BAR_HIDEGRID") then WindActionPet_hideGrid();
	elseif (event == "VARIABLES_LOADED") then
		WindActionPet_initConfig();
		WindActionPet_setPoint();
		WindActionPet_setScale();
		WindActionPet_setSize();
		WindActionPet_setBorder();
	end
end

function WindActionPet_initConfig()
	if (not WindActionPetConfig) then WindActionPetConfig = {"BOTTOM", 134, 206, 1.0, 1, true}; end
end

function WindActionPet_setPoint()
	WindCommon_setPoint(WindActionPet, WindActionPetConfig[1], UIParent, WindActionPetConfig[1], WindActionPetConfig[2], WindActionPetConfig[3]);
end

function WindActionPet_setScale()
	WindActionPet:SetScale(WindActionPetConfig[4]);
end

function WindActionPet_setSize()
	local index = WindActionPetConfig[5];
	WindCommon_setSize(WindActionPet, WindActionPetSize[index][1], WindActionPetSize[index][2]);
	WindActionPet_setAnchor(index);
end

function WindActionPet_setAnchor(index)
	if (index == 1) then
		WindCommon_setPoint(PetActionButton2, "LEFT", PetActionButton1, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton3, "LEFT", PetActionButton2, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton4, "LEFT", PetActionButton3, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton5, "LEFT", PetActionButton4, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton6, "LEFT", PetActionButton5, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton7, "LEFT", PetActionButton6, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton8, "LEFT", PetActionButton7, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton9, "LEFT", PetActionButton8, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton10, "LEFT", PetActionButton9, "RIGHT", 4, 0);
	elseif (index == 2) then
		WindCommon_setPoint(PetActionButton2, "LEFT", PetActionButton1, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton3, "LEFT", PetActionButton2, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton4, "LEFT", PetActionButton3, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton5, "LEFT", PetActionButton4, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton6, "TOPLEFT", PetActionButton1, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton7, "LEFT", PetActionButton6, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton8, "LEFT", PetActionButton7, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton9, "LEFT", PetActionButton8, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton10, "LEFT", PetActionButton9, "RIGHT", 4, 0);
	elseif (index == 3) then
		WindCommon_setPoint(PetActionButton2, "LEFT", PetActionButton1, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton3, "TOPLEFT", PetActionButton1, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton4, "LEFT", PetActionButton3, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton5, "TOPLEFT", PetActionButton3, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton6, "LEFT", PetActionButton5, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton7, "TOPLEFT", PetActionButton5, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton8, "LEFT", PetActionButton7, "RIGHT", 4, 0);
		WindCommon_setPoint(PetActionButton9, "TOPLEFT", PetActionButton7, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton10, "LEFT", PetActionButton9, "RIGHT", 4, 0);
	elseif (index == 4) then
		WindCommon_setPoint(PetActionButton2, "TOPLEFT", PetActionButton1, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton3, "TOPLEFT", PetActionButton2, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton4, "TOPLEFT", PetActionButton3, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton5, "TOPLEFT", PetActionButton4, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton6, "TOPLEFT", PetActionButton5, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton7, "TOPLEFT", PetActionButton6, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton8, "TOPLEFT", PetActionButton7, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton9, "TOPLEFT", PetActionButton8, "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(PetActionButton10, "TOPLEFT", PetActionButton9, "BOTTOMLEFT", 0, -4);
	end
end

function WindActionPet_setBorder()
	if (WindActionPetConfig[6]) then WindActionPet:SetBackdrop(WindCommon_Border);
	else WindActionPet:SetBackdrop(nil); end
end