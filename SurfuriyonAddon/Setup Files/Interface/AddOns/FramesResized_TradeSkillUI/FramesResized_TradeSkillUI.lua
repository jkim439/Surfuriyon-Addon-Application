TRADE_SKILL_ADDLINES = 8;
TRADE_SKILLS_DISPLAYED = TRADE_SKILLS_DISPLAYED + TRADE_SKILL_ADDLINES;

TradeSkillFrame:SetHeight(512 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT);
TradeSkillHorizontalBarLeft:SetPoint("TOPLEFT", 15, -(221 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT));
TradeSkillListScrollFrame:SetHeight(130 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT);
TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", 20, -(234 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT));
TradeSkillCreateButton:SetPoint("CENTER", TradeSkillCreateButton:GetParent(), "TOPLEFT", 224, -(422 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT));
TradeSkillCancelButton:SetPoint("CENTER", TradeSkillCancelButton:GetParent(), "TOPLEFT", 305, -(422 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT));

TradeSkillFrame_MidTextures:SetFrameLevel(TradeSkillFrame:GetFrameLevel());

TradeSkillFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then TradeSkillFrame:StartMoving(); end end);
TradeSkillFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then TradeSkillFrame:StopMovingOrSizing(); end end);
