function WindActionBottomRight_OnLoad()
	for i=1, 12 do
		local btn = getglobal("MultiBarBottomRightButton"..i);
		btn:SetParent(MultiBarBottomRight);
		btn:SetScript("OnEvent", WindActionButton_OnEvent);
		btn:SetScript("OnUpdate", WindActionButton_OnUpdate);
	end
	WindCommon_setPoint(MultiBarBottomRightButton1, "TOPLEFT", WindActionBottomRight, "TOPLEFT", 8, -8);
	MultiBarBottomRight:SetScript("OnShow", WindActionBottomRight_OnShow);
	MultiBarBottomRight:SetScript("OnHide", WindActionBottomRight_OnHide);
	WindCommon_setSize(MultiBarBottomRight, 1, 1);
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionBottomRight_OnShow()
	WindCommon_setPoint(MultiBarBottomRightButton1, "TOPLEFT", WindActionBottomRight, "TOPLEFT", 8, -8);
	WindActionBottomRight:Show();
end

function WindActionBottomRight_OnHide()
	WindActionBottomRight:Hide();
end

function WindActionBottomRight_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionBottomRight_initConfig();
		WindActionBottomRight_setPoint();
		WindActionBottomRight_setScale();
		WindActionBottomRight_setSize();
		WindActionBottomRight_setBorder();
	end
end

function WindActionBottomRight_initConfig()
	if (not WindActionBottomRightConfig) then WindActionBottomRightConfig = {"BOTTOM", 200, 94, 0.876, 1, true}; end
end

function WindActionBottomRight_setPoint()
	WindCommon_setPoint(WindActionBottomRight, WindActionBottomRightConfig[1], UIParent, WindActionBottomRightConfig[1], WindActionBottomRightConfig[2], WindActionBottomRightConfig[3]);
end

function WindActionBottomRight_setScale()
	WindActionBottomRight:SetScale(WindActionBottomRightConfig[4]);
	MultiBarBottomRight:SetScale(WindActionBottomRightConfig[4]);
end

function WindActionBottomRight_setSize()
	local index = WindActionBottomRightConfig[5];
	WindCommon_setSize(WindActionBottomRight, WindActionBorderSize[index][1], WindActionBorderSize[index][2]);
	WindActionButton_setAnchor(index, "MultiBarBottomRightButton");
end

function WindActionBottomRight_setBorder()
	if (WindActionBottomRightConfig[6]) then WindActionBottomRight:SetBackdrop(WindCommon_Border);
	else WindActionBottomRight:SetBackdrop(nil); end
end