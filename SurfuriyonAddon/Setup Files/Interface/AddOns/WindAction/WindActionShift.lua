WindActionShiftSize = {
	{324, 46},
	{170, 77},
	{77, 170},
	{46, 324}
}

function WindActionShift_OnLoad()
	for i=1, 10 do getglobal("ShapeshiftButton"..i):SetParent(WindActionShift); end
	WindCommon_setPoint(ShapeshiftButton1, "TOPLEFT", WindActionShift, "TOPLEFT", 8, -8);
	WindCommon_setSize(ShapeshiftBarFrame, 1, 1);
	WindActionShift_update();
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("UPDATE_SHAPESHIFT_FORMS");
	this:RegisterEvent("ACTIONBAR_PAGE_CHANGED");
	this:RegisterEvent("VARIABLES_LOADED");
end

function WindActionShift_update()
	if (GetNumShapeshiftForms() > 0) then WindActionShift:Show();
	else WindActionShift:Hide(); end
	ShapeshiftBar_UpdateState();
end

function WindActionShift_OnEvent()
	if (event == "PLAYER_ENTERING_WORLD" or event == "UPDATE_SHAPESHIFT_FORMS") then WindActionShift_update();
	elseif (event == "ACTIONBAR_PAGE_CHANGED") then
		if ( GetBonusBarOffset() > 0 ) then ShowBonusActionBar();
		else HideBonusActionBar() end
	elseif (event == "VARIABLES_LOADED") then
		WindActionShift_initConfig();
		WindActionShift_setPoint();
		WindActionShift_setScale();
		WindActionShift_setSize();
		WindActionShift_setBorder();
	else ShapeshiftBar_UpdateState(); end
end

function WindActionShift_initConfig()
	if (not WindActionShiftConfig) then WindActionShiftConfig = {"BOTTOM", 116, 201, 1.0, 1, false}; end
end

function WindActionShift_setPoint()
	WindCommon_setPoint(WindActionShift, WindActionShiftConfig[1], UIParent, WindActionShiftConfig[1], WindActionShiftConfig[2], WindActionShiftConfig[3]);
end

function WindActionShift_setScale()
	WindActionShift:SetScale(WindActionShiftConfig[4]);
end

function WindActionShift_setSize()
	local index = WindActionShiftConfig[5];
	WindCommon_setSize(WindActionShift, WindActionShiftSize[index][1], WindActionShiftSize[index][2]);
	WindActionShift_setAnchor(index);
end

function WindActionShift_setAnchor(index)
	if (index == 1) then
		WindCommon_setPoint(ShapeshiftButton2, "LEFT", ShapeshiftButton1, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton3, "LEFT", ShapeshiftButton2, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton4, "LEFT", ShapeshiftButton3, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton5, "LEFT", ShapeshiftButton4, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton6, "LEFT", ShapeshiftButton5, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton7, "LEFT", ShapeshiftButton6, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton8, "LEFT", ShapeshiftButton7, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton9, "LEFT", ShapeshiftButton8, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton10, "LEFT", ShapeshiftButton9, "RIGHT", 1, 0);
	elseif (index == 2) then
		WindCommon_setPoint(ShapeshiftButton2, "LEFT", ShapeshiftButton1, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton3, "LEFT", ShapeshiftButton2, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton4, "LEFT", ShapeshiftButton3, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton5, "LEFT", ShapeshiftButton4, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton6, "TOPLEFT", ShapeshiftButton1, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton7, "LEFT", ShapeshiftButton6, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton8, "LEFT", ShapeshiftButton7, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton9, "LEFT", ShapeshiftButton8, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton10, "LEFT", ShapeshiftButton9, "RIGHT", 1, 0);
	elseif (index == 3) then
		WindCommon_setPoint(ShapeshiftButton2, "LEFT", ShapeshiftButton1, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton3, "TOPLEFT", ShapeshiftButton1, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton4, "LEFT", ShapeshiftButton3, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton5, "TOPLEFT", ShapeshiftButton3, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton6, "LEFT", ShapeshiftButton5, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton7, "TOPLEFT", ShapeshiftButton5, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton8, "LEFT", ShapeshiftButton7, "RIGHT", 1, 0);
		WindCommon_setPoint(ShapeshiftButton9, "TOPLEFT", ShapeshiftButton7, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton10, "LEFT", ShapeshiftButton9, "RIGHT", 1, 0);
	elseif (index == 4) then
		WindCommon_setPoint(ShapeshiftButton2, "TOPLEFT", ShapeshiftButton1, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton3, "TOPLEFT", ShapeshiftButton2, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton4, "TOPLEFT", ShapeshiftButton3, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton5, "TOPLEFT", ShapeshiftButton4, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton6, "TOPLEFT", ShapeshiftButton5, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton7, "TOPLEFT", ShapeshiftButton6, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton8, "TOPLEFT", ShapeshiftButton7, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton9, "TOPLEFT", ShapeshiftButton8, "BOTTOMLEFT", 0, -1);
		WindCommon_setPoint(ShapeshiftButton10, "TOPLEFT", ShapeshiftButton9, "BOTTOMLEFT", 0, -1);
	end
end

function WindActionShift_setBorder()
	if (WindActionShiftConfig[6]) then WindActionShift:SetBackdrop(WindCommon_Border);
	else WindActionShift:SetBackdrop(nil); end
end