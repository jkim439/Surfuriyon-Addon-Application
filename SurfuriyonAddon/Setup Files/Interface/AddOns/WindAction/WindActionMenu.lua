WindActionMenuSize = {
	{232, 51},
	{124, 85},
	{70, 153},
	{42, 289}
}

function WindActionMenu_OnLoad()
	WindCommon_setParentPoint(CharacterMicroButton, WindActionMenu, "TOPLEFT", WindActionMenu, "TOPLEFT", 7, 14);
	SpellbookMicroButton:SetParent(WindActionMenu);
	TalentMicroButton:SetParent(WindActionMenu);
	QuestLogMicroButton:SetParent(WindActionMenu);
	SocialsMicroButton:SetParent(WindActionMenu);
	WorldMapMicroButton:SetParent(WindActionMenu);
	MainMenuMicroButton:SetParent(WindActionMenu);
	HelpMicroButton:SetParent(WindActionMenu);
	UpdateTalentButton = WindActionMenu_UpdateTalentButton;
	WindActionMenu:RegisterEvent("VARIABLES_LOADED");
end

function WindActionMenu_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionMenu_initConfig();
		WindActionMenu_setPoint();
		WindActionMenu_setScale();
		WindActionMenu_setSize();
		WindActionMenu_setBorder();
	end
end

function WindActionMenu_initConfig()
	if (not WindActionMenuConfig) then WindActionMenuConfig = {"BOTTOM", -74, 0, 0.72, 4, true}; end
end

function WindActionMenu_setPoint()
	WindCommon_setPoint(WindActionMenu, WindActionMenuConfig[1], UIParent, WindActionMenuConfig[1], WindActionMenuConfig[2], WindActionMenuConfig[3]);
end

function WindActionMenu_setScale()
	WindActionMenu:SetScale(WindActionMenuConfig[4]);
end

function WindActionMenu_setSize()
	local index = WindActionMenuConfig[5];
	WindCommon_setSize(WindActionMenu, WindActionMenuSize[index][1], WindActionMenuSize[index][2]);
	WindActionMenu_setAnchor(index);
end

function WindActionMenu_setAnchor(index)
	if (index == 1) then
		WindCommon_setPoint(SpellbookMicroButton, "LEFT", CharacterMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(TalentMicroButton, "LEFT", SpellbookMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(QuestLogMicroButton, "LEFT", TalentMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(SocialsMicroButton, "LEFT", QuestLogMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(WorldMapMicroButton, "LEFT", SocialsMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(MainMenuMicroButton, "LEFT", WorldMapMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(HelpMicroButton, "LEFT", MainMenuMicroButton, "RIGHT", -2, 0);
	elseif (index == 2) then
		WindCommon_setPoint(SpellbookMicroButton, "LEFT", CharacterMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(TalentMicroButton, "LEFT", SpellbookMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(QuestLogMicroButton, "LEFT", TalentMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(SocialsMicroButton, "TOPLEFT", CharacterMicroButton, "BOTTOMLEFT", 0, 24);
		WindCommon_setPoint(WorldMapMicroButton, "LEFT", SocialsMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(MainMenuMicroButton, "LEFT", WorldMapMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(HelpMicroButton, "LEFT", MainMenuMicroButton, "RIGHT", -2, 0);
	elseif (index == 3) then
		WindCommon_setPoint(SpellbookMicroButton, "LEFT", CharacterMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(TalentMicroButton, "TOPLEFT", CharacterMicroButton, "BOTTOMLEFT", 0, 24);
		WindCommon_setPoint(QuestLogMicroButton, "LEFT", TalentMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(SocialsMicroButton, "TOPLEFT", TalentMicroButton, "BOTTOMLEFT", 0, 24);
		WindCommon_setPoint(WorldMapMicroButton, "LEFT", SocialsMicroButton, "RIGHT", -2, 0);
		WindCommon_setPoint(MainMenuMicroButton, "TOPLEFT", SocialsMicroButton, "BOTTOMLEFT", 0, 24);
		WindCommon_setPoint(HelpMicroButton, "LEFT", MainMenuMicroButton, "RIGHT", -2, 0);
	elseif (index == 4) then
		WindCommon_setPoint(SpellbookMicroButton, "TOPLEFT", CharacterMicroButton, "BOTTOMLEFT", 0, 24);
		WindCommon_setPoint(TalentMicroButton, "TOPLEFT", SpellbookMicroButton, "BOTTOMLEFT", 0, 24);
		WindCommon_setPoint(HelpMicroButton, "BOTTOMLEFT", WindActionMenu, "BOTTOMLEFT", 7, 7);
		WindCommon_setPoint(MainMenuMicroButton, "BOTTOMLEFT", HelpMicroButton, "TOPLEFT", 0, -24);
		WindCommon_setPoint(WorldMapMicroButton, "BOTTOMLEFT", MainMenuMicroButton, "TOPLEFT", 0, -24);
		WindCommon_setPoint(SocialsMicroButton, "BOTTOMLEFT", WorldMapMicroButton, "TOPLEFT", 0, -24);
		WindCommon_setPoint(QuestLogMicroButton, "BOTTOMLEFT", SocialsMicroButton, "TOPLEFT", 0, -24);
	end
end

function WindActionMenu_setBorder()
	if (WindActionMenuConfig[6]) then WindActionMenu:SetBackdrop(WindCommon_Border);
	else WindActionMenu:SetBackdrop(nil); end
end

function WindActionMenu_UpdateTalentButton()
	if ( UnitLevel("player") < 10 ) then TalentMicroButton:Hide();
	else TalentMicroButton:Show(); end
end