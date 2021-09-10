function WindActionLeft_OnLoad()
	for i=1, 12 do
		local btn = getglobal("MultiBarLeftButton"..i);
		btn:SetParent(MultiBarLeft);
		btn:SetScript("OnEvent", WindActionButton_OnEvent);
		btn:SetScript("OnUpdate", WindActionButton_OnUpdate);
	end
	WindCommon_setPoint(MultiBarLeftButton1, "TOPLEFT", WindActionLeft, "TOPLEFT", 8, -8);
	MultiBarLeft:SetScript("OnShow", WindActionLeft_OnShow);
	MultiBarLeft:SetScript("OnHide", WindActionLeft_OnHide);
	WindCommon_setSize(MultiBarLeft, 1, 1);
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionLeft_OnShow()
	WindCommon_setPoint(MultiBarLeftButton1, "TOPLEFT", WindActionLeft, "TOPLEFT", 8, -8);
	WindActionLeft:Show();
end

function WindActionLeft_OnHide()
	WindActionLeft:Hide();
end

function WindActionLeft_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionLeft_initConfig();
		WindActionLeft_setPoint();
		WindActionLeft_setScale();
		WindActionLeft_setSize();
		WindActionLeft_setBorder();
	end
end

function WindActionLeft_initConfig()
	if (not WindActionLeftConfig) then WindActionLeftConfig = {"BOTTOM", 200, 188, 0.876, 1, true}; end
end

function WindActionLeft_setPoint()
	WindCommon_setPoint(WindActionLeft, WindActionLeftConfig[1], UIParent, WindActionLeftConfig[1], WindActionLeftConfig[2], WindActionLeftConfig[3]);
end

function WindActionLeft_setScale()
	WindActionLeft:SetScale(WindActionLeftConfig[4]);
	MultiBarLeft:SetScale(WindActionLeftConfig[4]);
end

function WindActionLeft_setSize()
	local index = WindActionLeftConfig[5];
	WindCommon_setSize(WindActionLeft, WindActionBorderSize[index][1], WindActionBorderSize[index][2]);
	WindActionButton_setAnchor(index, "MultiBarLeftButton");
end

function WindActionLeft_setBorder()
	if (WindActionLeftConfig[6]) then WindActionLeft:SetBackdrop(WindCommon_Border);
	else WindActionLeft:SetBackdrop(nil); end
end