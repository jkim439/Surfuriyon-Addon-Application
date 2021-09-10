function WindActionMain_OnLoad()
	for i=1, 12 do
		local btn = getglobal("ActionButton"..i);
		btn:SetParent(WindActionMain);
		btn:SetScript("OnEvent", WindActionButton_OnEvent);
		btn:SetScript("OnUpdate", WindActionButton_OnUpdate);
	end
	WindCommon_setPoint(ActionButton1, "TOPLEFT", WindActionMain, "TOPLEFT", 8, -8);
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionMain_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindActionMain_initConfig();
		WindActionMain_setPoint();
		WindActionMain_setScale();
		WindActionMain_setSize();
		WindActionMain_setBorder();
	end
end

function WindActionMain_initConfig()
	if (not WindActionMainConfig) then WindActionMainConfig = {"BOTTOM", 200, 0, 0.876, 1, true}; end
end

function WindActionMain_setPoint()
	WindCommon_setPoint(WindActionMain, WindActionMainConfig[1], UIParent, WindActionMainConfig[1], WindActionMainConfig[2], WindActionMainConfig[3]);
end

function WindActionMain_setScale()
	WindActionMain:SetScale(WindActionMainConfig[4]);
end

function WindActionMain_setSize()
	local index = WindActionMainConfig[5];
	WindCommon_setSize(WindActionMain, WindActionBorderSize[index][1], WindActionBorderSize[index][2]);
	WindActionButton_setAnchor(index, "ActionButton");
end

function WindActionMain_setBorder()
	if (WindActionMainConfig[6]) then WindActionMain:SetBackdrop(WindCommon_Border);
	else WindActionMain:SetBackdrop(nil); end
end