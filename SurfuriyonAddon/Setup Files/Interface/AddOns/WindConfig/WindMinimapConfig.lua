function WindMinimapConfig_OnShow()
	WindMinimapConfigBody_show();
	WindMinimapConfigTracking_show();
	WindMinimapConfigMeetingStone_show();
	WindMinimapConfigMail_show();
	WindMinimapConfigBattlefield_show();
	WindMinimapConfigItem_show();
	WindMinimapConfigZone_show();
end

function WindMinimapConfigBody_show()
	WindConfig_setUnCheckAll("WindMinimapConfigBody");
	WindConfig_setCheck("WindMinimapConfigBody", WindMinimapBodyConfig[1]);
	WindMinimapConfigBodyX:SetText(WindMinimapBodyConfig[2]);
	WindMinimapConfigBodyY:SetText(WindMinimapBodyConfig[3]);
	WindMinimapConfigBodySCALE:SetText(WindMinimapBodyConfig[4]);
end

function WindMinimapConfigTracking_show()
	MiniMapTrackingFrame:Show();
	WindConfig_setUnCheckAll("WindMinimapConfigTracking");
	WindConfig_setCheck("WindMinimapConfigTracking", WindMinimapTrackingConfig[1]);
	WindMinimapConfigTrackingX:SetText(WindMinimapTrackingConfig[2]);
	WindMinimapConfigTrackingY:SetText(WindMinimapTrackingConfig[3]);
	WindMinimapConfigTrackingSCALE:SetText(WindMinimapTrackingConfig[4]);
end

function WindMinimapConfigMeetingStone_show()
	MiniMapMeetingStoneFrame:Show();
	WindConfig_setUnCheckAll("WindMinimapConfigMeetingStone");
	WindConfig_setCheck("WindMinimapConfigMeetingStone", WindMinimapMeetingStoneConfig[1]);
	WindMinimapConfigMeetingStoneX:SetText(WindMinimapMeetingStoneConfig[2]);
	WindMinimapConfigMeetingStoneY:SetText(WindMinimapMeetingStoneConfig[3]);
	WindMinimapConfigMeetingStoneSCALE:SetText(WindMinimapMeetingStoneConfig[4]);
end

function WindMinimapConfigMail_show()
	MiniMapMailFrame:Show();
	WindConfig_setUnCheckAll("WindMinimapConfigMail");
	WindConfig_setCheck("WindMinimapConfigMail", WindMinimapMailConfig[1]);
	WindMinimapConfigMailX:SetText(WindMinimapMailConfig[2]);
	WindMinimapConfigMailY:SetText(WindMinimapMailConfig[3]);
	WindMinimapConfigMailSCALE:SetText(WindMinimapMailConfig[4]);
end

function WindMinimapConfigBattlefield_show()
	MiniMapBattlefieldFrame:Show();
	WindConfig_setUnCheckAll("WindMinimapConfigBattlefield");
	WindConfig_setCheck("WindMinimapConfigBattlefield", WindMinimapBattlefieldConfig[1]);
	WindMinimapConfigBattlefieldX:SetText(WindMinimapBattlefieldConfig[2]);
	WindMinimapConfigBattlefieldY:SetText(WindMinimapBattlefieldConfig[3]);
	WindMinimapConfigBattlefieldSCALE:SetText(WindMinimapBattlefieldConfig[4]);
end

function WindMinimapConfigItem_show()
	if (WindItemIconButton) then
		WindMinimapConfigItem:Show();
		WindConfig_setUnCheckAll("WindMinimapConfigItem");
		WindConfig_setCheck("WindMinimapConfigItem", WindItemButtonConfig[1]);
		WindMinimapConfigItemX:SetText(WindItemButtonConfig[2]);
		WindMinimapConfigItemY:SetText(WindItemButtonConfig[3]);
		WindMinimapConfigItemSCALE:SetText(WindItemButtonConfig[4]);
	end
end

function WindMinimapConfigZone_show()
	if (WindZoneIconButton) then
		WindMinimapConfigZone:Show();
		WindConfig_setUnCheckAll("WindMinimapConfigZone");
		WindConfig_setCheck("WindMinimapConfigZone", WindZoneButtonConfig[1]);
		WindMinimapConfigZoneX:SetText(WindZoneButtonConfig[2]);
		WindMinimapConfigZoneY:SetText(WindZoneButtonConfig[3]);
		WindMinimapConfigZoneSCALE:SetText(WindZoneButtonConfig[4]);
	end
end

function WindMinimapConfigBody_setConfigPoint(point, x, y)
	WindMinimapBodyConfig[1] = point;
	WindMinimapBodyConfig[2] = x;
	WindMinimapBodyConfig[3] = y;
	WindMinimapBody_setPoint();
end

function WindMinimapConfigBody_setConfigX(x)
	WindMinimapBodyConfig[2] = x;
	WindMinimapBody_setPoint();
end

function WindMinimapConfigBody_setConfigY(y)
	WindMinimapBodyConfig[3] = y;
	WindMinimapBody_setPoint();
end

function WindMinimapConfigBody_setConfigScale(scale)
	WindMinimapBodyConfig[4] = scale;
	WindMinimapBody_setScale();
end

function WindMinimapConfigBody_getPoint()
	return WindMinimapBodyConfig[1];
end

function WindMinimapConfigTracking_setConfigPoint(point, x, y)
	WindMinimapTrackingConfig[1] = point;
	WindMinimapTrackingConfig[2] = x;
	WindMinimapTrackingConfig[3] = y;
	WindMinimapTracking_setPoint();
end

function WindMinimapConfigTracking_setConfigX(x)
	WindMinimapTrackingConfig[2] = x;
	WindMinimapTracking_setPoint();
end

function WindMinimapConfigTracking_setConfigY(y)
	WindMinimapTrackingConfig[3] = y;
	WindMinimapTracking_setPoint();
end

function WindMinimapConfigTracking_setConfigScale(scale)
	WindMinimapTrackingConfig[4] = scale;
	WindMinimapTracking_setScale();
end

function WindMinimapConfigTracking_getPoint()
	return WindMinimapTrackingConfig[1];
end

function WindMinimapConfigMeetingStone_setConfigPoint(point, x, y)
	WindMinimapMeetingStoneConfig[1] = point;
	WindMinimapMeetingStoneConfig[2] = x;
	WindMinimapMeetingStoneConfig[3] = y;
	WindMinimapMeetingStone_setPoint();
end

function WindMinimapConfigMeetingStone_setConfigX(x)
	WindMinimapMeetingStoneConfig[2] = x;
	WindMinimapMeetingStone_setPoint();
end

function WindMinimapConfigMeetingStone_setConfigY(y)
	WindMinimapMeetingStoneConfig[3] = y;
	WindMinimapMeetingStone_setPoint();
end

function WindMinimapConfigMeetingStone_setConfigScale(scale)
	WindMinimapMeetingStoneConfig[4] = scale;
	WindMinimapMeetingStone_setScale();
end

function WindMinimapConfigMeetingStone_getPoint()
	return WindMinimapMeetingStoneConfig[1];
end

function WindMinimapConfigMail_setConfigPoint(point, x, y)
	WindMinimapMailConfig[1] = point;
	WindMinimapMailConfig[2] = x;
	WindMinimapMailConfig[3] = y;
	WindMinimapMail_setPoint();
end

function WindMinimapConfigMail_setConfigX(x)
	WindMinimapMailConfig[2] = x;
	WindMinimapMail_setPoint();
end

function WindMinimapConfigMail_setConfigY(y)
	WindMinimapMailConfig[3] = y;
	WindMinimapMail_setPoint();
end

function WindMinimapConfigMail_setConfigScale(scale)
	WindMinimapMailConfig[4] = scale;
	WindMinimapMail_setScale();
end

function WindMinimapConfigMail_getPoint()
	return WindMinimapMailConfig[1];
end

function WindMinimapConfigBattlefield_setConfigPoint(point, x, y)
	WindMinimapBattlefieldConfig[1] = point;
	WindMinimapBattlefieldConfig[2] = x;
	WindMinimapBattlefieldConfig[3] = y;
	WindMinimapBattlefield_setPoint();
end

function WindMinimapConfigBattlefield_setConfigX(x)
	WindMinimapBattlefieldConfig[2] = x;
	WindMinimapBattlefield_setPoint();
end

function WindMinimapConfigBattlefield_setConfigY(y)
	WindMinimapBattlefieldConfig[3] = y;
	WindMinimapBattlefield_setPoint();
end

function WindMinimapConfigBattlefield_setConfigScale(scale)
	WindMinimapBattlefieldConfig[4] = scale;
	WindMinimapBattlefield_setScale();
end

function WindMinimapConfigBattlefield_getPoint()
	return WindMinimapBattlefieldConfig[1];
end

function WindMinimapConfigItem_setConfigPoint(point, x, y)
	WindItemButtonConfig[1] = point;
	WindItemButtonConfig[2] = x;
	WindItemButtonConfig[3] = y;
	WindItem_setPoint();
end

function WindMinimapConfigItem_setConfigX(x)
	WindItemButtonConfig[2] = x;
	WindItem_setPoint();
end

function WindMinimapConfigItem_setConfigY(y)
	WindItemButtonConfig[3] = y;
	WindItem_setPoint();
end

function WindMinimapConfigItem_setConfigScale(scale)
	WindItemButtonConfig[4] = scale;
	WindItem_setScale();
end

function WindMinimapConfigItem_getPoint()
	return WindItemButtonConfig[1];
end

function WindMinimapConfigZone_setConfigPoint(point, x, y)
	WindZoneButtonConfig[1] = point;
	WindZoneButtonConfig[2] = x;
	WindZoneButtonConfig[3] = y;
	WindZone_setPoint();
end

function WindMinimapConfigZone_setConfigX(x)
	WindZoneButtonConfig[2] = x;
	WindZone_setPoint();
end

function WindMinimapConfigZone_setConfigY(y)
	WindZoneButtonConfig[3] = y;
	WindZone_setPoint();
end

function WindMinimapConfigZone_setConfigScale(scale)
	WindZoneButtonConfig[4] = scale;
	WindZone_setScale();
end

function WindMinimapConfigZone_getPoint()
	return WindZoneButtonConfig[1];
end