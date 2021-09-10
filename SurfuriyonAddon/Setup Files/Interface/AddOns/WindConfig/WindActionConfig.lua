function WindActionConfig_OnShow()
	WindActionConfigMain_show();
	WindActionConfigBottomLeft_show();
	WindActionConfigBottomRight_show();
	WindActionConfigMenu_show();
	WindActionConfigRight_show();
	WindActionConfigLeft_show();
	WindActionConfigBag_show();
	WindActionConfigPet_show();
	WindActionConfigShift_show();
end

function WindActionConfigVIEWBR_OnClick()
	local parent = this:GetParent():GetName();
	if (this:GetChecked()) then
		this:SetChecked(1);
		getglobal(parent.."_setBorder")(true);
	else
		this:SetChecked(0);
		getglobal(parent.."_setBorder")(false);
	end
end

function WindActionConfig_clearType(target)
	local line = nil;
	for i=1, 6 do
		line = getglobal(target.."Line"..i);
		if (line) then line:SetChecked(0); end
	end
end

function WindActionConfigLine_OnClick(nmb)
	local parent = this:GetParent():GetName();
	getglobal(parent.."_setType")(nmb);
end

function WindActionConfigMain_show()
	WindConfig_setUnCheckAll("WindActionConfigMain");
	WindConfig_setCheck("WindActionConfigMain", WindActionMainConfig[1]);
	WindActionConfigMainX:SetText(WindActionMainConfig[2]);
	WindActionConfigMainY:SetText(WindActionMainConfig[3]);
	WindActionConfigMainSCALE:SetText(WindActionMainConfig[4]);
	if (WindActionMainConfig[6]) then WindActionConfigMainVIEWBR:SetChecked(1);
	else WindActionConfigMainVIEWBR:SetChecked(0); end
	WindActionConfigMain_setLine();
end

function WindActionConfigMain_setLine()
	WindActionConfig_clearType("WindActionConfigMain");
	getglobal("WindActionConfigMainLine"..WindActionMainConfig[5]):SetChecked(1);
end

function WindActionConfigMain_setConfigPoint(point, x, y)
	WindActionMainConfig[1] = point;
	WindActionMainConfig[2] = x;
	WindActionMainConfig[3] = y;
	WindActionMain_setPoint();
end

function WindActionConfigMain_setConfigX(x)
	WindActionMainConfig[2] = x;
	WindActionMain_setPoint();
end

function WindActionConfigMain_setConfigY(y)
	WindActionMainConfig[3] = y;
	WindActionMain_setPoint();
end

function WindActionConfigMain_setConfigScale(scale)
	WindActionMainConfig[4] = scale;
	WindActionMain_setScale();
end

function WindActionConfigMain_getPoint()
	return WindActionMainConfig[1];
end

function WindActionConfigMain_setBorder(haveBorder)
	WindActionMainConfig[6] = haveBorder;
	WindActionMain_setBorder();
end

function WindActionConfigMain_setType(nmb)
	WindActionMainConfig[5] = nmb;
	WindActionConfigMain_setLine();
	WindActionMain_setSize();
end

function WindActionConfigBottomLeft_show()
	WindConfig_setUnCheckAll("WindActionConfigBottomLeft");
	WindConfig_setCheck("WindActionConfigBottomLeft", WindActionBottomLeftConfig[1]);
	WindActionConfigBottomLeftX:SetText(WindActionBottomLeftConfig[2]);
	WindActionConfigBottomLeftY:SetText(WindActionBottomLeftConfig[3]);
	WindActionConfigBottomLeftSCALE:SetText(WindActionBottomLeftConfig[4]);
	if (WindActionBottomLeftConfig[6]) then WindActionConfigBottomLeftVIEWBR:SetChecked(1);
	else WindActionConfigBottomLeftVIEWBR:SetChecked(0); end
	WindActionConfigBottomLeft_setLine();
end

function WindActionConfigBottomLeft_setLine()
	WindActionConfig_clearType("WindActionConfigBottomLeft");
	getglobal("WindActionConfigBottomLeftLine"..WindActionBottomLeftConfig[5]):SetChecked(1);
end

function WindActionConfigBottomLeft_setConfigPoint(point, x, y)
	WindActionBottomLeftConfig[1] = point;
	WindActionBottomLeftConfig[2] = x;
	WindActionBottomLeftConfig[3] = y;
	WindActionBottomLeft_setPoint();
end

function WindActionConfigBottomLeft_setConfigX(x)
	WindActionBottomLeftConfig[2] = x;
	WindActionBottomLeft_setPoint();
end

function WindActionConfigBottomLeft_setConfigY(y)
	WindActionBottomLeftConfig[3] = y;
	WindActionBottomLeft_setPoint();
end

function WindActionConfigBottomLeft_setConfigScale(scale)
	WindActionBottomLeftConfig[4] = scale;
	WindActionBottomLeft_setScale();
end

function WindActionConfigBottomLeft_getPoint()
	return WindActionBottomLeftConfig[1];
end

function WindActionConfigBottomLeft_setBorder(haveBorder)
	WindActionBottomLeftConfig[6] = haveBorder;
	WindActionBottomLeft_setBorder();
end

function WindActionConfigBottomLeft_setType(nmb)
	WindActionBottomLeftConfig[5] = nmb;
	WindActionConfigBottomLeft_setLine();
	WindActionBottomLeft_setSize();
end

function WindActionConfigBottomRight_show()
	WindConfig_setUnCheckAll("WindActionConfigBottomRight");
	WindConfig_setCheck("WindActionConfigBottomRight", WindActionBottomRightConfig[1]);
	WindActionConfigBottomRightX:SetText(WindActionBottomRightConfig[2]);
	WindActionConfigBottomRightY:SetText(WindActionBottomRightConfig[3]);
	WindActionConfigBottomRightSCALE:SetText(WindActionBottomRightConfig[4]);
	if (WindActionBottomRightConfig[6]) then WindActionConfigBottomRightVIEWBR:SetChecked(1);
	else WindActionConfigBottomRightVIEWBR:SetChecked(0); end
	WindActionConfigBottomRight_setLine();
end

function WindActionConfigBottomRight_setLine()
	WindActionConfig_clearType("WindActionConfigBottomRight");
	getglobal("WindActionConfigBottomRightLine"..WindActionBottomRightConfig[5]):SetChecked(1);
end

function WindActionConfigBottomRight_setConfigPoint(point, x, y)
	WindActionBottomRightConfig[1] = point;
	WindActionBottomRightConfig[2] = x;
	WindActionBottomRightConfig[3] = y;
	WindActionBottomRight_setPoint();
end

function WindActionConfigBottomRight_setConfigX(x)
	WindActionBottomRightConfig[2] = x;
	WindActionBottomRight_setPoint();
end

function WindActionConfigBottomRight_setConfigY(y)
	WindActionBottomRightConfig[3] = y;
	WindActionBottomRight_setPoint();
end

function WindActionConfigBottomRight_setConfigScale(scale)
	WindActionBottomRightConfig[4] = scale;
	WindActionBottomRight_setScale();
end

function WindActionConfigBottomRight_getPoint()
	return WindActionBottomRightConfig[1];
end

function WindActionConfigBottomRight_setBorder(haveBorder)
	WindActionBottomRightConfig[6] = haveBorder;
	WindActionBottomRight_setBorder();
end

function WindActionConfigBottomRight_setType(nmb)
	WindActionBottomRightConfig[5] = nmb;
	WindActionConfigBottomRight_setLine();
	WindActionBottomRight_setSize();
end

function WindActionConfigMenu_show()
	WindConfig_setUnCheckAll("WindActionConfigMenu");
	WindConfig_setCheck("WindActionConfigMenu", WindActionMenuConfig[1]);
	WindActionConfigMenuX:SetText(WindActionMenuConfig[2]);
	WindActionConfigMenuY:SetText(WindActionMenuConfig[3]);
	WindActionConfigMenuSCALE:SetText(WindActionMenuConfig[4]);
	if (WindActionMenuConfig[6]) then WindActionConfigMenuVIEWBR:SetChecked(1);
	else WindActionConfigMenuVIEWBR:SetChecked(0); end
	WindActionConfigMenu_setLine();
end

function WindActionConfigMenu_setLine()
	WindActionConfig_clearType("WindActionConfigMenu");
	getglobal("WindActionConfigMenuLine"..WindActionMenuConfig[5]):SetChecked(1);
end

function WindActionConfigMenu_setConfigPoint(point, x, y)
	WindActionMenuConfig[1] = point;
	WindActionMenuConfig[2] = x;
	WindActionMenuConfig[3] = y;
	WindActionMenu_setPoint();
end

function WindActionConfigMenu_setConfigX(x)
	WindActionMenuConfig[2] = x;
	WindActionMenu_setPoint();
end

function WindActionConfigMenu_setConfigY(y)
	WindActionMenuConfig[3] = y;
	WindActionMenu_setPoint();
end

function WindActionConfigMenu_setConfigScale(scale)
	WindActionMenuConfig[4] = scale;
	WindActionMenu_setScale();
end

function WindActionConfigMenu_getPoint()
	return WindActionMenuConfig[1];
end

function WindActionConfigMenu_setBorder(haveBorder)
	WindActionMenuConfig[6] = haveBorder;
	WindActionMenu_setBorder();
end

function WindActionConfigMenu_setType(nmb)
	WindActionMenuConfig[5] = nmb;
	WindActionConfigMenu_setLine();
	WindActionMenu_setSize();
end

function WindActionConfigRight_show()
	WindConfig_setUnCheckAll("WindActionConfigRight");
	WindConfig_setCheck("WindActionConfigRight", WindActionRightConfig[1]);
	WindActionConfigRightX:SetText(WindActionRightConfig[2]);
	WindActionConfigRightY:SetText(WindActionRightConfig[3]);
	WindActionConfigRightSCALE:SetText(WindActionRightConfig[4]);
	if (WindActionRightConfig[6]) then WindActionConfigRightVIEWBR:SetChecked(1);
	else WindActionConfigRightVIEWBR:SetChecked(0); end
	WindActionConfigRight_setLine();
end

function WindActionConfigRight_setLine()
	WindActionConfig_clearType("WindActionConfigRight");
	getglobal("WindActionConfigRightLine"..WindActionRightConfig[5]):SetChecked(1);
end

function WindActionConfigRight_setConfigPoint(point, x, y)
	WindActionRightConfig[1] = point;
	WindActionRightConfig[2] = x;
	WindActionRightConfig[3] = y;
	WindActionRight_setPoint();
end

function WindActionConfigRight_setConfigX(x)
	WindActionRightConfig[2] = x;
	WindActionRight_setPoint();
end

function WindActionConfigRight_setConfigY(y)
	WindActionRightConfig[3] = y;
	WindActionRight_setPoint();
end

function WindActionConfigRight_setConfigScale(scale)
	WindActionRightConfig[4] = scale;
	WindActionRight_setScale();
end

function WindActionConfigRight_getPoint()
	return WindActionRightConfig[1];
end

function WindActionConfigRight_setBorder(haveBorder)
	WindActionRightConfig[6] = haveBorder;
	WindActionRight_setBorder();
end

function WindActionConfigRight_setType(nmb)
	WindActionRightConfig[5] = nmb;
	WindActionConfigRight_setLine();
	WindActionRight_setSize();
end

function WindActionConfigLeft_show()
	WindConfig_setUnCheckAll("WindActionConfigLeft");
	WindConfig_setCheck("WindActionConfigLeft", WindActionLeftConfig[1]);
	WindActionConfigLeftX:SetText(WindActionLeftConfig[2]);
	WindActionConfigLeftY:SetText(WindActionLeftConfig[3]);
	WindActionConfigLeftSCALE:SetText(WindActionLeftConfig[4]);
	if (WindActionLeftConfig[6]) then WindActionConfigLeftVIEWBR:SetChecked(1);
	else WindActionConfigLeftVIEWBR:SetChecked(0); end
	WindActionConfigLeft_setLine();
end

function WindActionConfigLeft_setLine()
	WindActionConfig_clearType("WindActionConfigLeft");
	getglobal("WindActionConfigLeftLine"..WindActionLeftConfig[5]):SetChecked(1);
end

function WindActionConfigLeft_setConfigPoint(point, x, y)
	WindActionLeftConfig[1] = point;
	WindActionLeftConfig[2] = x;
	WindActionLeftConfig[3] = y;
	WindActionLeft_setPoint();
end

function WindActionConfigLeft_setConfigX(x)
	WindActionLeftConfig[2] = x;
	WindActionLeft_setPoint();
end

function WindActionConfigLeft_setConfigY(y)
	WindActionLeftConfig[3] = y;
	WindActionLeft_setPoint();
end

function WindActionConfigLeft_setConfigScale(scale)
	WindActionLeftConfig[4] = scale;
	WindActionLeft_setScale();
end

function WindActionConfigLeft_getPoint()
	return WindActionLeftConfig[1];
end

function WindActionConfigLeft_setBorder(haveBorder)
	WindActionLeftConfig[6] = haveBorder;
	WindActionLeft_setBorder();
end

function WindActionConfigLeft_setType(nmb)
	WindActionLeftConfig[5] = nmb;
	WindActionConfigLeft_setLine();
	WindActionLeft_setSize();
end

function WindActionConfigBag_show()
	WindConfig_setUnCheckAll("WindActionConfigBag");
	WindConfig_setCheck("WindActionConfigBag", WindActionBagConfig[1]);
	WindActionConfigBagX:SetText(WindActionBagConfig[2]);
	WindActionConfigBagY:SetText(WindActionBagConfig[3]);
	WindActionConfigBagSCALE:SetText(WindActionBagConfig[4]);
	if (WindActionBagConfig[6]) then WindActionConfigBagVIEWBR:SetChecked(1);
	else WindActionConfigBagVIEWBR:SetChecked(0); end
	WindActionConfigBag_setLine();
end

function WindActionConfigBag_setLine()
	WindActionConfig_clearType("WindActionConfigBag");
	getglobal("WindActionConfigBagLine"..WindActionBagConfig[5]):SetChecked(1);
end

function WindActionConfigBag_setConfigPoint(point, x, y)
	WindActionBagConfig[1] = point;
	WindActionBagConfig[2] = x;
	WindActionBagConfig[3] = y;
	WindActionBag_setPoint();
end

function WindActionConfigBag_setConfigX(x)
	WindActionBagConfig[2] = x;
	WindActionBag_setPoint();
end

function WindActionConfigBag_setConfigY(y)
	WindActionBagConfig[3] = y;
	WindActionBag_setPoint();
end

function WindActionConfigBag_setConfigScale(scale)
	WindActionBagConfig[4] = scale;
	WindActionBag_setScale();
end

function WindActionConfigBag_getPoint()
	return WindActionBagConfig[1];
end

function WindActionConfigBag_setBorder(haveBorder)
	WindActionBagConfig[6] = haveBorder;
	WindActionBag_setBorder();
end

function WindActionConfigBag_setType(nmb)
	WindActionBagConfig[5] = nmb;
	WindActionConfigBag_setLine();
	WindActionBag_setSize();
end

function WindActionConfigPet_show()
	WindConfig_setUnCheckAll("WindActionConfigPet");
	WindConfig_setCheck("WindActionConfigPet", WindActionPetConfig[1]);
	WindActionConfigPetX:SetText(WindActionPetConfig[2]);
	WindActionConfigPetY:SetText(WindActionPetConfig[3]);
	WindActionConfigPetSCALE:SetText(WindActionPetConfig[4]);
	if (WindActionPetConfig[6]) then WindActionConfigPetVIEWBR:SetChecked(1);
	else WindActionConfigPetVIEWBR:SetChecked(0); end
	WindActionConfigPet_setLine();
end

function WindActionConfigPet_setLine()
	WindActionConfig_clearType("WindActionConfigPet");
	getglobal("WindActionConfigPetLine"..WindActionPetConfig[5]):SetChecked(1);
end

function WindActionConfigPet_setConfigPoint(point, x, y)
	WindActionPetConfig[1] = point;
	WindActionPetConfig[2] = x;
	WindActionPetConfig[3] = y;
	WindActionPet_setPoint();
end

function WindActionConfigPet_setConfigX(x)
	WindActionPetConfig[2] = x;
	WindActionPet_setPoint();
end

function WindActionConfigPet_setConfigY(y)
	WindActionPetConfig[3] = y;
	WindActionPet_setPoint();
end

function WindActionConfigPet_setConfigScale(scale)
	WindActionPetConfig[4] = scale;
	WindActionPet_setScale();
end

function WindActionConfigPet_getPoint()
	return WindActionPetConfig[1];
end

function WindActionConfigPet_setBorder(haveBorder)
	WindActionPetConfig[6] = haveBorder;
	WindActionPet_setBorder();
end

function WindActionConfigPet_setType(nmb)
	WindActionPetConfig[5] = nmb;
	WindActionConfigPet_setLine();
	WindActionPet_setSize();
end

function WindActionConfigShift_show()
	WindConfig_setUnCheckAll("WindActionConfigShift");
	WindConfig_setCheck("WindActionConfigShift", WindActionShiftConfig[1]);
	WindActionConfigShiftX:SetText(WindActionShiftConfig[2]);
	WindActionConfigShiftY:SetText(WindActionShiftConfig[3]);
	WindActionConfigShiftSCALE:SetText(WindActionShiftConfig[4]);
	if (WindActionShiftConfig[6]) then WindActionConfigShiftVIEWBR:SetChecked(1);
	else WindActionConfigShiftVIEWBR:SetChecked(0); end
	WindActionConfigShift_setLine();
end

function WindActionConfigShift_setLine()
	WindActionConfig_clearType("WindActionConfigShift");
	getglobal("WindActionConfigShiftLine"..WindActionShiftConfig[5]):SetChecked(1);
end

function WindActionConfigShift_setConfigPoint(point, x, y)
	WindActionShiftConfig[1] = point;
	WindActionShiftConfig[2] = x;
	WindActionShiftConfig[3] = y;
	WindActionShift_setPoint();
end

function WindActionConfigShift_setConfigX(x)
	WindActionShiftConfig[2] = x;
	WindActionShift_setPoint();
end

function WindActionConfigShift_setConfigY(y)
	WindActionShiftConfig[3] = y;
	WindActionShift_setPoint();
end

function WindActionConfigShift_setConfigScale(scale)
	WindActionShiftConfig[4] = scale;
	WindActionShift_setScale();
end

function WindActionConfigShift_getPoint()
	return WindActionShiftConfig[1];
end

function WindActionConfigShift_setBorder(haveBorder)
	WindActionShiftConfig[6] = haveBorder;
	WindActionShift_setBorder();
end

function WindActionConfigShift_setType(nmb)
	WindActionShiftConfig[5] = nmb;
	WindActionConfigShift_setLine();
	WindActionShift_setSize();
end