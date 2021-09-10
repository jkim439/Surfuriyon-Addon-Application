function WindActionBonus_OnLoad()
	WindActionBonus:SetAllPoints(WindActionMain);
	for i=1, 12 do
		local btn = getglobal("BonusActionButton"..i);
		btn:SetParent(WindActionBonus);
		btn:SetScript("OnEvent", WindActionButton_OnEvent);
		btn:SetScript("OnUpdate", WindActionButton_OnUpdate);
	end
	WindCommon_setPoint(BonusActionButton1, "TOPLEFT", WindActionBonus, "TOPLEFT", 8, -8);
	BonusActionBarFrame:SetParent(WindActionMain);
	WindCommon_setSize(BonusActionBarFrame, 1, 1);
	BonusActionBarTexture0:Hide();
	BonusActionBarTexture1:Hide();
	BonusActionBarFrame:SetScript("OnShow", BonusActionBarFrame_OnShow);
	BonusActionBarFrame:SetScript("OnHide", BonusActionBarFrame_OnHide);
	this:RegisterEvent("VARIABLES_LOADED");
end

function BonusActionBarFrame_OnShow()
	WindActionMain:SetAlpha(0.0);
	WindActionBonus:Show();
end

function BonusActionBarFrame_OnHide()
	WindActionMain:SetAlpha(1.0);
	WindActionBonus:Hide();
end

function WindActionBonus_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionBonus_setScale();
		WindActionBonus_setSize();
		WindActionBonus_setBorder();
	end
end

function WindActionBonus_setScale()
	WindActionBonus:SetScale(WindActionMainConfig[4]);
	BonusActionBarFrame:SetScale(WindActionMainConfig[4]);
end

function WindActionBonus_setSize()
	local index = WindActionMainConfig[5];
	WindCommon_setSize(WindActionBonus, WindActionBorderSize[index][1], WindActionBorderSize[index][2]);
	WindActionButton_setAnchor(index, "BonusActionButton");
end

function WindActionBonus_setBorder()
	if (WindActionMainConfig[6]) then WindActionBonus:SetBackdrop(WindCommon_Border); end
end