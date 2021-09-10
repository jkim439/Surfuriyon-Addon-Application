QUESTS_ADDLINES = 8;
QUESTS_DISPLAYED_ORG = QUESTS_DISPLAYED;
QUESTS_DISPLAYED = QUESTS_DISPLAYED_ORG + QUESTS_ADDLINES;

local FramesResized_QuestLogFrame_org_QuestLog_OnShow = QuestLog_OnShow;

QuestLogFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then QuestLogFrame:StartMoving(); end end);
QuestLogFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then QuestLogFrame:StopMovingOrSizing(); end end);

for index = 1, QUESTS_DISPLAYED do
	button = getglobal("QuestLogTitle"..index);
	button:SetFrameLevel(QuestLogFrame_MidTextures:GetFrameLevel() + 1);
end

function QuestLog_OnShow()
	if (GetNumQuestLogEntries() > 0) then
		QUESTS_DISPLAYED = QUESTS_DISPLAYED_ORG + QUESTS_ADDLINES;
		QuestLogFrame:SetHeight(512 + QUESTS_ADDLINES * QUESTLOG_QUEST_HEIGHT);
		QuestLogListScrollFrame:SetHeight(93 + QUESTS_ADDLINES * QUESTLOG_QUEST_HEIGHT);
		QuestLogFrame_MidTextures:Show();
	else
		QUESTS_DISPLAYED = QUESTS_DISPLAYED_ORG;
		QuestLogFrame:SetHeight(512);
		QuestLogListScrollFrame:SetHeight(93);
		QuestLogFrame_MidTextures:Hide();
	end
	FramesResized_QuestLogFrame_org_QuestLog_OnShow();
end