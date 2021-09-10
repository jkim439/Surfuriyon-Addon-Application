function WindInfoConfig_OnShow()
	WindInfoConfigBody_show();
	WindInfoConfigXP_show();
	WindInfoConfigRP_show();
	WindInfoConfigMoney_show();
	WindInfoConfigTime_show();
	WindInfoConfigPerf_show();
	WindInfoConfigBag_show();
end

function WindInfoConfigBody_show()
	WindConfig_setUnCheckAll("WindInfoConfigBody");
	WindConfig_setCheck("WindInfoConfigBody", WindInfoBodyConfig[1]);
	WindInfoConfigBodyX:SetText(WindInfoBodyConfig[2]);
	WindInfoConfigBodyY:SetText(WindInfoBodyConfig[3]);
	WindInfoConfigBodySCALE:SetText(WindInfoBodyConfig[4]);
	WindInfoConfigBodyWIDTH:SetText(WindInfoBodyConfig[5]);
	WindInfoConfigBodyHEIGHT:SetText(WindInfoBodyConfig[6]);
	if (WindInfoBodyConfig[7]) then WindInfoConfigBodyMOUSEOVER:SetChecked(1);
	else WindInfoConfigBodyMOUSEOVER:SetChecked(0); end
end

function WindInfoConfigXP_show()
	WindConfig_setUnCheckAll("WindInfoConfigXP");
	WindConfig_setCheck("WindInfoConfigXP", WindInfoXPConfig[1]);
	WindInfoConfigXPX:SetText(WindInfoXPConfig[2]);
	WindInfoConfigXPY:SetText(WindInfoXPConfig[3]);
	WindInfoConfigXPSCALE:SetText(WindInfoXPConfig[4]);
	WindInfoConfigXPWIDTH:SetText(WindInfoXPConfig[5]);
	WindInfoConfigXPHEIGHT:SetText(WindInfoXPConfig[6]);
	if (WindInfoXPConfig[7]) then WindInfoConfigXPVIEW:SetChecked(1);
	else WindInfoConfigXPVIEW:SetChecked(0); end
end

function WindInfoConfigRP_show()
	WindConfig_setUnCheckAll("WindInfoConfigRP");
	WindConfig_setCheck("WindInfoConfigRP", WindInfoRPConfig[1]);
	WindInfoConfigRPX:SetText(WindInfoRPConfig[2]);
	WindInfoConfigRPY:SetText(WindInfoRPConfig[3]);
	WindInfoConfigRPSCALE:SetText(WindInfoRPConfig[4]);
	WindInfoConfigRPWIDTH:SetText(WindInfoRPConfig[5]);
	WindInfoConfigRPHEIGHT:SetText(WindInfoRPConfig[6]);
	if (WindInfoRPConfig[7]) then WindInfoConfigRPVIEW:SetChecked(1);
	else WindInfoConfigRPVIEW:SetChecked(0); end
end

function WindInfoConfigMoney_show()
	WindConfig_setUnCheckAll("WindInfoConfigMoney");
	WindConfig_setCheck("WindInfoConfigMoney", WindInfoMoneyConfig[1]);
	WindInfoConfigMoneyX:SetText(WindInfoMoneyConfig[2]);
	WindInfoConfigMoneyY:SetText(WindInfoMoneyConfig[3]);
	WindInfoConfigMoneySCALE:SetText(WindInfoMoneyConfig[4]);
	WindInfoConfigMoneyWIDTH:SetText(WindInfoMoneyConfig[5]);
	WindInfoConfigMoneyHEIGHT:SetText(WindInfoMoneyConfig[6]);
	if (WindInfoMoneyConfig[7]) then WindInfoConfigMoneyVIEW:SetChecked(1);
	else WindInfoConfigMoneyVIEW:SetChecked(0); end
end

function WindInfoConfigTime_show()
	WindConfig_setUnCheckAll("WindInfoConfigTime");
	WindConfig_setCheck("WindInfoConfigTime", WindInfoTimeConfig[1]);
	WindInfoConfigTimeX:SetText(WindInfoTimeConfig[2]);
	WindInfoConfigTimeY:SetText(WindInfoTimeConfig[3]);
	WindInfoConfigTimeSCALE:SetText(WindInfoTimeConfig[4]);
	WindInfoConfigTimeWIDTH:SetText(WindInfoTimeConfig[5]);
	WindInfoConfigTimeHEIGHT:SetText(WindInfoTimeConfig[6]);
	if (WindInfoTimeConfig[7]) then WindInfoConfigTimeVIEW:SetChecked(1);
	else WindInfoConfigTimeVIEW:SetChecked(0); end
end

function WindInfoConfigPerf_show()
	WindConfig_setUnCheckAll("WindInfoConfigPerf");
	WindConfig_setCheck("WindInfoConfigPerf", WindInfoPerfConfig[1]);
	WindInfoConfigPerfX:SetText(WindInfoPerfConfig[2]);
	WindInfoConfigPerfY:SetText(WindInfoPerfConfig[3]);
	WindInfoConfigPerfSCALE:SetText(WindInfoPerfConfig[4]);
	WindInfoConfigPerfWIDTH:SetText(WindInfoPerfConfig[5]);
	WindInfoConfigPerfHEIGHT:SetText(WindInfoPerfConfig[6]);
	if (WindInfoPerfConfig[7]) then WindInfoConfigPerfVIEW:SetChecked(1);
	else WindInfoConfigPerfVIEW:SetChecked(0); end
end

function WindInfoConfigBag_show()
	WindConfig_setUnCheckAll("WindInfoConfigBag");
	WindConfig_setCheck("WindInfoConfigBag", WindInfoBagConfig[1]);
	WindInfoConfigBagX:SetText(WindInfoBagConfig[2]);
	WindInfoConfigBagY:SetText(WindInfoBagConfig[3]);
	WindInfoConfigBagSCALE:SetText(WindInfoBagConfig[4]);
	WindInfoConfigBagWIDTH:SetText(WindInfoBagConfig[5]);
	WindInfoConfigBagHEIGHT:SetText(WindInfoBagConfig[6]);
	if (WindInfoBagConfig[7]) then WindInfoConfigBagVIEW:SetChecked(1);
	else WindInfoConfigBagVIEW:SetChecked(0); end
end

function WindInfoConfigBody_setConfigPoint(point, x, y)
	WindInfoBodyConfig[1] = point;
	WindInfoBodyConfig[2] = x;
	WindInfoBodyConfig[3] = y;
	WindInfoBody_setPoint();
end

function WindInfoConfigBody_setConfigX(x)
	WindInfoBodyConfig[2] = x;
	WindInfoBody_setPoint();
end

function WindInfoConfigBody_setConfigY(y)
	WindInfoBodyConfig[3] = y;
	WindInfoBody_setPoint();
end

function WindInfoConfigBody_setConfigScale(scale)
	WindInfoBodyConfig[4] = scale;
	WindInfoBody_setScale();
end

function WindInfoConfigBody_getPoint()
	return WindInfoBodyConfig[1];
end

function WindInfoConfigBody_setWidth(width)
	WindInfoBodyConfig[5] = width;
	WindInfoBody_setSize();
	WindInfoBar_setSize();
end

function WindInfoConfigBody_setHeight(height)
	WindInfoBodyConfig[6] = height;
	WindInfoBody_setSize();
	WindInfoBar_setSize();
end

function WindInfoConfigBodyMOUSEOVER_OnClick(isChecked)
	if (isChecked) then
		DEFAULT_CHAT_FRAME:AddMessage("Wind Info Mouse Over Event is enabled.");
		WindInfoConfigBodyMOUSEOVER:SetChecked(1);
		WindInfoConfigBody_setMouseOver(true);
	else
		DEFAULT_CHAT_FRAME:AddMessage("Wind Info Mouse Over Event is desabled.");
		WindInfoConfigBodyMOUSEOVER:SetChecked(0);
		WindInfoConfigBody_setMouseOver(false);
	end
end

function WindInfoConfigBody_setMouseOver(isEnabled)
	WindInfoBodyConfig[7] = isEnabled;
end

function WindInfoConfigXP_setConfigPoint(point, x, y)
	WindInfoXPConfig[1] = point;
	WindInfoXPConfig[2] = x;
	WindInfoXPConfig[3] = y;
	WindInfoXP_setPoint();
end

function WindInfoConfigXP_setConfigX(x)
	WindInfoXPConfig[2] = x;
	WindInfoXP_setPoint();
end

function WindInfoConfigXP_setConfigY(y)
	WindInfoXPConfig[3] = y;
	WindInfoXP_setPoint();
end

function WindInfoConfigXP_setConfigScale(scale)
	WindInfoXPConfig[4] = scale;
	WindInfoXP_setScale();
end

function WindInfoConfigXP_getPoint()
	return WindInfoXPConfig[1];
end

function WindInfoConfigXP_setWidth(width)
	WindInfoXPConfig[5] = width;
	WindInfoXP_setSize();
end

function WindInfoConfigXP_setHeight(height)
	WindInfoXPConfig[6] = height;
	WindInfoXP_setSize();
end

function WindInfoConfigXP_setView(isView)
	WindInfoXPConfig[7] = isView;
	if (not isView) then WindInfoXPText:Hide(); end
end

function WindInfoConfigRP_setConfigPoint(point, x, y)
	WindInfoRPConfig[1] = point;
	WindInfoRPConfig[2] = x;
	WindInfoRPConfig[3] = y;
	WindInfoRP_setPoint();
end

function WindInfoConfigRP_setConfigX(x)
	WindInfoRPConfig[2] = x;
	WindInfoRP_setPoint();
end

function WindInfoConfigRP_setConfigY(y)
	WindInfoRPConfig[3] = y;
	WindInfoRP_setPoint();
end

function WindInfoConfigRP_setConfigScale(scale)
	WindInfoRPConfig[4] = scale;
	WindInfoRP_setScale();
end

function WindInfoConfigRP_getPoint()
	return WindInfoRPConfig[1];
end

function WindInfoConfigRP_setWidth(width)
	WindInfoRPConfig[5] = width;
	WindInfoRP_setSize();
end

function WindInfoConfigRP_setHeight(height)
	WindInfoRPConfig[6] = height;
	WindInfoRP_setSize();
end

function WindInfoConfigRP_setView(isView)
	WindInfoRPConfig[7] = isView;
	if (not isView) then WindInfoRPText:Hide(); end
end

function WindInfoConfigMoney_setConfigPoint(point, x, y)
	WindInfoMoneyConfig[1] = point;
	WindInfoMoneyConfig[2] = x;
	WindInfoMoneyConfig[3] = y;
	WindInfoMoney_setPoint();
end

function WindInfoConfigMoney_setConfigX(x)
	WindInfoMoneyConfig[2] = x;
	WindInfoMoney_setPoint();
end

function WindInfoConfigMoney_setConfigY(y)
	WindInfoMoneyConfig[3] = y;
	WindInfoMoney_setPoint();
end

function WindInfoConfigMoney_setConfigScale(scale)
	WindInfoMoneyConfig[4] = scale;
	WindInfoMoney_setScale();
end

function WindInfoConfigMoney_getPoint()
	return WindInfoMoneyConfig[1];
end

function WindInfoConfigMoney_setWidth(width)
	WindInfoMoneyConfig[5] = width;
	WindInfoMoney_setSize();
end

function WindInfoConfigMoney_setHeight(height)
	WindInfoMoneyConfig[6] = height;
	WindInfoMoney_setSize();
end

function WindInfoConfigMoney_setView(isView)
	WindInfoMoneyConfig[7] = isView;
	WindInfoMoney_setView();
end

function WindInfoConfigTime_setConfigPoint(point, x, y)
	WindInfoTimeConfig[1] = point;
	WindInfoTimeConfig[2] = x;
	WindInfoTimeConfig[3] = y;
	WindInfoTime_setPoint();
end

function WindInfoConfigTime_setConfigX(x)
	WindInfoTimeConfig[2] = x;
	WindInfoTime_setPoint();
end

function WindInfoConfigTime_setConfigY(y)
	WindInfoTimeConfig[3] = y;
	WindInfoTime_setPoint();
end

function WindInfoConfigTime_setConfigScale(scale)
	WindInfoTimeConfig[4] = scale;
	WindInfoTime_setScale();
end

function WindInfoConfigTime_getPoint()
	return WindInfoTimeConfig[1];
end

function WindInfoConfigTime_setWidth(width)
	WindInfoTimeConfig[5] = width;
	WindInfoTime_setSize();
end

function WindInfoConfigTime_setHeight(height)
	WindInfoTimeConfig[6] = height;
	WindInfoTime_setSize();
end

function WindInfoConfigTime_setView(isView)
	WindInfoTimeConfig[7] = isView;
	WindInfoTime_setView();
end

function WindInfoConfigPerf_setConfigPoint(point, x, y)
	WindInfoPerfConfig[1] = point;
	WindInfoPerfConfig[2] = x;
	WindInfoPerfConfig[3] = y;
	WindInfoPerf_setPoint();
end

function WindInfoConfigPerf_setConfigX(x)
	WindInfoPerfConfig[2] = x;
	WindInfoPerf_setPoint();
end

function WindInfoConfigPerf_setConfigY(y)
	WindInfoPerfConfig[3] = y;
	WindInfoPerf_setPoint();
end

function WindInfoConfigPerf_setConfigScale(scale)
	WindInfoPerfConfig[4] = scale;
	WindInfoPerf_setScale();
end

function WindInfoConfigPerf_getPoint()
	return WindInfoPerfConfig[1];
end

function WindInfoConfigPerf_setWidth(width)
	WindInfoPerfConfig[5] = width;
	WindInfoPerf_setSize();
end

function WindInfoConfigPerf_setHeight(height)
	WindInfoPerfConfig[6] = height;
	WindInfoPerf_setSize();
end

function WindInfoConfigPerf_setView(isView)
	WindInfoPerfConfig[7] = isView;
	WindInfoPerf_setView();
end

function WindInfoConfigBag_setConfigPoint(point, x, y)
	WindInfoBagConfig[1] = point;
	WindInfoBagConfig[2] = x;
	WindInfoBagConfig[3] = y;
	WindInfoBag_setPoint();
end

function WindInfoConfigBag_setConfigX(x)
	WindInfoBagConfig[2] = x;
	WindInfoBag_setPoint();
end

function WindInfoConfigBag_setConfigY(y)
	WindInfoBagConfig[3] = y;
	WindInfoBag_setPoint();
end

function WindInfoConfigBag_setConfigScale(scale)
	WindInfoBagConfig[4] = scale;
	WindInfoBag_setScale();
end

function WindInfoConfigBag_getPoint()
	return WindInfoBagConfig[1];
end

function WindInfoConfigBag_setWidth(width)
	WindInfoBagConfig[5] = width;
	WindInfoBag_setSize();
end

function WindInfoConfigBag_setHeight(height)
	WindInfoBagConfig[6] = height;
	WindInfoBag_setSize();
end

function WindInfoConfigBag_setView(isView)
	WindInfoBagConfig[7] = isView;
	WindInfoBag_setView();
end