WindActionBagSize = {
	{208, 51},
	{51, 208}
}

function WindActionBag_OnLoad()
	WindCommon_setParentPoint(MainMenuBarBackpackButton, WindActionBag, "BOTTOMRIGHT", WindActionBag, "BOTTOMRIGHT", -7, 7);
	CharacterBag0Slot:SetParent(WindActionBag);
	CharacterBag1Slot:SetParent(WindActionBag);
	CharacterBag2Slot:SetParent(WindActionBag);
	CharacterBag3Slot:SetParent(WindActionBag);
	MainMenuBar:Hide();
	WindActionBag:RegisterEvent("VARIABLES_LOADED");
end

function WindActionBag_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionBag_initConfig();
		WindActionBag_setPoint();
		WindActionBag_setScale();
		WindActionBag_setSize();
		WindActionBag_setBorder();
	end
end

function WindActionBag_initConfig()
	if (not WindActionBagConfig) then WindActionBagConfig = {"BOTTOM", -196, 0, 0.72, 1, true}; end
end

function WindActionBag_setPoint()
	WindCommon_setPoint(WindActionBag, WindActionBagConfig[1], UIParent, WindActionBagConfig[1], WindActionBagConfig[2], WindActionBagConfig[3]);
end

function WindActionBag_setScale()
	WindActionBag:SetScale(WindActionBagConfig[4]);
end

function WindActionBag_setSize()
	local index = WindActionBagConfig[5];
	WindCommon_setSize(WindActionBag, WindActionBagSize[index][1], WindActionBagSize[index][2]);
	WindActionBag_setAnchor(index);
end

function WindActionBag_setAnchor(index)
	if (index == 1) then
		WindCommon_setPoint(CharacterBag0Slot, "RIGHT", MainMenuBarBackpackButton, "LEFT", -2, 0);
		WindCommon_setPoint(CharacterBag1Slot, "RIGHT", CharacterBag0Slot, "LEFT", -2, 0);
		WindCommon_setPoint(CharacterBag2Slot, "RIGHT", CharacterBag1Slot, "LEFT", -2, 0);
		WindCommon_setPoint(CharacterBag3Slot, "RIGHT", CharacterBag2Slot, "LEFT", -2, 0);
	elseif (index == 2) then
		WindCommon_setPoint(CharacterBag0Slot, "BOTTOMRIGHT", MainMenuBarBackpackButton, "TOPRIGHT", 0, 2);
		WindCommon_setPoint(CharacterBag1Slot, "BOTTOMRIGHT", CharacterBag0Slot, "TOPRIGHT", 0, 2);
		WindCommon_setPoint(CharacterBag2Slot, "BOTTOMRIGHT", CharacterBag1Slot, "TOPRIGHT", 0, 2);
		WindCommon_setPoint(CharacterBag3Slot, "BOTTOMRIGHT", CharacterBag2Slot, "TOPRIGHT", 0, 2);
	end
end

function WindActionBag_setBorder()
	if (WindActionBagConfig[6]) then WindActionBag:SetBackdrop(WindCommon_Border);
	else WindActionBag:SetBackdrop(nil); end
end