TALENT_ADDHEIGHT = 128;

TalentFrame:SetHeight(512 + TALENT_ADDHEIGHT);
TalentFrameScrollFrame:SetHeight(332 + TALENT_ADDHEIGHT);
TalentFrameCancelButton:SetPoint("CENTER", TalentFrameCancelButton:GetParent(), "TOPLEFT", 305, -(422 + TALENT_ADDHEIGHT));
TalentFrameScrollFrame:SetHeight(332 + TALENT_ADDHEIGHT);
TalentFrame_MidTextures:SetFrameLevel(TalentFrame:GetFrameLevel());
TalentFrameBackgroundTopLeft:SetHeight(356);
TalentFrameBackgroundTopRight:SetHeight(356);
TalentFrameBackgroundBottomLeft:SetHeight(178);
TalentFrameBackgroundBottomRight:SetHeight(178);

TalentFrame:SetMovable(1);
TalentFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then TalentFrame:StartMoving(); end end);
TalentFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then TalentFrame:StopMovingOrSizing(); end end);
