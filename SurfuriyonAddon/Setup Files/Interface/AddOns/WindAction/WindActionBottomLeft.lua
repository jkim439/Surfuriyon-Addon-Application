function WindActionBottomLeft_OnLoad()
	for i=1, 12 do
		local btn = getglobal("MultiBarBottomLeftButton"..i);
		btn:SetParent(MultiBarBottomLeft);
		btn:SetScript("OnEvent", WindActionButton_OnEvent);
		btn:SetScript("OnUpdate", WindActionButton_OnUpdate);
	end
	WindCommon_setPoint(MultiBarBottomLeftButton1, "TOPLEFT", WindActionBottomLeft, "TOPLEFT", 8, -8);
	MultiBarBottomLeft:SetScript("OnShow", WindActionBottomLeft_OnShow);
	MultiBarBottomLeft:SetScript("OnHide", WindActionBottomLeft_OnHide);
	WindCommon_setSize(MultiBarBottomLeft, 1, 1);
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionBottomLeft_OnShow()
	WindCommon_setPoint(MultiBarBottomLeftButton1, "TOPLEFT", WindActionBottomLeft, "TOPLEFT", 8, -8);
	WindActionBottomLeft:Show();
end

function WindActionBottomLeft_OnHide()
	WindActionBottomLeft:Hide();
end

function WindActionBottomLeft_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionBottomLeft_initConfig();
		WindActionBottomLeft_setPoint();
		WindActionBottomLeft_setScale();
		WindActionBottomLeft_setSize();
		WindActionBottomLeft_setBorder();
	end
end

function WindActionBottomLeft_initConfig()
	if (not WindActionBottomLeftConfig) then WindActionBottomLeftConfig = {"BOTTOM", 200, 47, 0.876, 1, true}; end
end

function WindActionBottomLeft_setPoint()
	WindCommon_setPoint(WindActionBottomLeft, WindActionBottomLeftConfig[1], UIParent, WindActionBottomLeftConfig[1], WindActionBottomLeftConfig[2], WindActionBottomLeftConfig[3]);
end

function WindActionBottomLeft_setScale()
	WindActionBottomLeft:SetScale(WindActionBottomLeftConfig[4]);
	MultiBarBottomLeft:SetScale(WindActionBottomLeftConfig[4]);
end

function WindActionBottomLeft_setSize()
	local index = WindActionBottomLeftConfig[5];
	WindCommon_setSize(WindActionBottomLeft, WindActionBorderSize[index][1], WindActionBorderSize[index][2]);
	WindActionButton_setAnchor(index, "MultiBarBottomLeftButton");
end

function WindActionBottomLeft_setBorder()
	if (WindActionBottomLeftConfig[6]) then WindActionBottomLeft:SetBackdrop(WindCommon_Border);
	else WindActionBottomLeft:SetBackdrop(nil); end
end