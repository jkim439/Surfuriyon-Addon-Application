function WindActionRight_OnLoad()
	for i=1, 12 do
		local btn = getglobal("MultiBarRightButton"..i);
		btn:SetParent(MultiBarRight);
		btn:SetScript("OnEvent", WindActionButton_OnEvent);
		btn:SetScript("OnUpdate", WindActionButton_OnUpdate);
	end
	WindCommon_setPoint(MultiBarRightButton1, "TOPLEFT", WindActionRight, "TOPLEFT", 8, -8);
	MultiBarRight:SetScript("OnShow", WindActionRight_OnShow);
	MultiBarRight:SetScript("OnHide", WindActionRight_OnHide);
	WindCommon_setSize(MultiBarRight, 1, 1);
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionRight_OnShow()
	WindCommon_setPoint(MultiBarRightButton1, "TOPLEFT", WindActionRight, "TOPLEFT", 8, -8);
	WindActionRight:Show();
end

function WindActionRight_OnHide()
	WindActionRight:Hide();
end

function WindActionRight_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionRight_initConfig();
		WindActionRight_setPoint();
		WindActionRight_setScale();
		WindActionRight_setSize();
		WindActionRight_setBorder();
	end
end

function WindActionRight_initConfig()
	if (not WindActionRightConfig) then WindActionRightConfig = {"BOTTOM", 200, 141, 0.876, 1, true}; end
end

function WindActionRight_setPoint()
	WindCommon_setPoint(WindActionRight, WindActionRightConfig[1], UIParent, WindActionRightConfig[1], WindActionRightConfig[2], WindActionRightConfig[3]);
end

function WindActionRight_setScale()
	WindActionRight:SetScale(WindActionRightConfig[4]);
	MultiBarRight:SetScale(WindActionRightConfig[4]);
end

function WindActionRight_setSize()
	local index = WindActionRightConfig[5];
	WindCommon_setSize(WindActionRight, WindActionBorderSize[index][1], WindActionBorderSize[index][2]);
	WindActionButton_setAnchor(index, "MultiBarRightButton");
end

function WindActionRight_setBorder()
	if (WindActionRightConfig[6]) then WindActionRight:SetBackdrop(WindCommon_Border);
	else WindActionRight:SetBackdrop(nil); end
end