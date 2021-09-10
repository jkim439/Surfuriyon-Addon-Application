CRAFTS_ADDLINES = 8;
CRAFTS_DISPLAYED = CRAFTS_DISPLAYED + CRAFTS_ADDLINES;

CraftFrame:SetHeight(512 + CRAFTS_ADDLINES * CRAFT_SKILL_HEIGHT);
CraftHorizontalBarLeft:SetPoint("TOPLEFT", 15, -(221 + CRAFTS_ADDLINES * CRAFT_SKILL_HEIGHT));
CraftListScrollFrame:SetHeight(130 + CRAFTS_ADDLINES * CRAFT_SKILL_HEIGHT);
CraftDetailScrollFrame:SetPoint("TOPLEFT", 20, -(234 + CRAFTS_ADDLINES * CRAFT_SKILL_HEIGHT));
CraftCreateButton:SetPoint("CENTER", CraftCreateButton:GetParent(), "TOPLEFT", 224, -(422 + CRAFTS_ADDLINES * CRAFT_SKILL_HEIGHT));
CraftCancelButton:SetPoint("CENTER", CraftCancelButton:GetParent(), "TOPLEFT", 305, -(422 + CRAFTS_ADDLINES * CRAFT_SKILL_HEIGHT));

CraftFrame_MidTextures:SetFrameLevel(CraftFrame:GetFrameLevel());

CraftFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then CraftFrame:StartMoving(); end end);
CraftFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then CraftFrame:StopMovingOrSizing(); end end);
