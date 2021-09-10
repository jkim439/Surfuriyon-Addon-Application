function WindMinimap_OnLoad()
	GameTimeFrame:Hide();
	MinimapToggleButton:Hide();
	MinimapZoomIn:Hide();
	MinimapZoomOut:Hide();

	WindMinimapBorderTop:SetPoint("BOTTOMLEFT", Minimap, "TOPLEFT", -7, 4);
	WindMinimapBorderTop:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 5, 4);
	WindMinimapBorderTop:SetHeight(25);
	WindMinimapBorderTop:SetFrameLevel(MinimapZoneTextButton:GetFrameLevel()-1);
	WindCommon_setPoint(MinimapZoneText, "CENTER", WindMinimapBorderTop, "CENTER", 0, 0);
	MinimapBorderTop:Hide();

	MinimapBorder:Hide();
	Minimap:SetMaskTexture("Interface\\AddOns\\WindMinimap\\images\\mask");
	WindMinimap:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -7, 7);
	WindMinimap:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 5, 7);
	WindMinimap:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", -7, -5);
	WindMinimap:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 5, -5);
	WindMinimap:SetFrameLevel(Minimap:GetFrameLevel()-1);
	MinimapBackdrop:SetAllPoints(WindMinimap);

	WindCommon_setPoint(MiniMapMailFrame, "TOPRIGHT", Minimap, "TOPRIGHT", 3, -1);
	WindCommon_setPoint(MiniMapTrackingFrame, "TOPLEFT", Minimap, "TOPLEFT", -1, -1);
	WindCommon_setPoint(MiniMapMeetingStoneFrame, "BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 3, -4);
	WindCommon_setPoint(MiniMapBattlefieldFrame, "BOTTOMLEFT", Minimap, "BOTTOMLEFT", -1, -4);

	WindMinimap:RegisterEvent("VARIABLES_LOADED");
end

function WindMinimap_OnMouseWheel(arg1)
	if ( arg1 < 0 ) then
		if (Minimap:GetZoom() ~= 0 ) then
			Minimap:SetZoom(Minimap:GetZoom() - 1);
			PlaySound("igMinimapZoomOut");
		end
	elseif ( arg1 > 0 ) then
		if (Minimap:GetZoom() ~= 5 ) then
			Minimap:SetZoom(Minimap:GetZoom() + 1);
			PlaySound("igMinimapZoomIn");
		end
	end
end

function WindMinimap_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindMinimapBody_initConfig();
		WindMinimapBody_setPoint();
		WindMinimapBody_setScale();

		WindMinimapTracking_initConfig();
		WindMinimapTracking_setPoint();
		WindMinimapTracking_setScale();

		WindMinimapMeetingStone_initConfig();
		WindMinimapMeetingStone_setPoint();
		WindMinimapMeetingStone_setScale();

		WindMinimapMail_initConfig();
		WindMinimapMail_setPoint();
		WindMinimapMail_setScale();

		WindMinimapBattlefield_initConfig();
		WindMinimapBattlefield_setPoint();
		WindMinimapBattlefield_setScale();
	end
end

function WindMinimapBody_initConfig()
	if (not WindMinimapBodyConfig) then WindMinimapBodyConfig = {"BOTTOM", -140, 40, 1.0}; end
end

function WindMinimapBody_setPoint()
	WindCommon_setPoint(Minimap, WindMinimapBodyConfig[1], UIParent, WindMinimapBodyConfig[1], WindMinimapBodyConfig[2], WindMinimapBodyConfig[3]);
end

function WindMinimapBody_setScale()
	Minimap:SetScale(WindMinimapBodyConfig[4]);
	MinimapZoneTextButton:SetScale(WindMinimapBodyConfig[4]);
end

function WindMinimapTracking_initConfig()
	if (not WindMinimapTrackingConfig) then WindMinimapTrackingConfig = {"TOPLEFT", 0, 0, 0.7}; end
end

function WindMinimapTracking_setPoint()
	WindCommon_setPoint(MiniMapTrackingFrame, WindMinimapTrackingConfig[1], Minimap, WindMinimapTrackingConfig[1], WindMinimapTrackingConfig[2], WindMinimapTrackingConfig[3]);
end

function WindMinimapTracking_setScale()
	MiniMapTrackingFrame:SetScale(WindMinimapTrackingConfig[4]);
end

function WindMinimapMeetingStone_initConfig()
	if (not WindMinimapMeetingStoneConfig) then WindMinimapMeetingStoneConfig = {"TOPLEFT", 42, 0, 0.87}; end
end

function WindMinimapMeetingStone_setPoint()
	WindCommon_setPoint(MiniMapMeetingStoneFrame, WindMinimapMeetingStoneConfig[1], Minimap, WindMinimapMeetingStoneConfig[1], WindMinimapMeetingStoneConfig[2], WindMinimapMeetingStoneConfig[3]);
end

function WindMinimapMeetingStone_setScale()
	MiniMapMeetingStoneFrame:SetScale(WindMinimapMeetingStoneConfig[4]);
end

function WindMinimapMail_initConfig()
	if (not WindMinimapMailConfig) then WindMinimapMailConfig = {"TOPRIGHT", 0, 0, 0.87}; end
end

function WindMinimapMail_setPoint()
	WindCommon_setPoint(MiniMapMailFrame, WindMinimapMailConfig[1], Minimap, WindMinimapMailConfig[1], WindMinimapMailConfig[2], WindMinimapMailConfig[3]);
end

function WindMinimapMail_setScale()
	MiniMapMailFrame:SetScale(WindMinimapMailConfig[4]);
end

function WindMinimapBattlefield_initConfig()
	if (not WindMinimapBattlefieldConfig) then WindMinimapBattlefieldConfig = {"TOPRIGHT", -42, 0, 0.87}; end
end

function WindMinimapBattlefield_setPoint()
	WindCommon_setPoint(MiniMapBattlefieldFrame, WindMinimapBattlefieldConfig[1], Minimap, WindMinimapBattlefieldConfig[1], WindMinimapBattlefieldConfig[2], WindMinimapBattlefieldConfig[3]);
end

function WindMinimapBattlefield_setScale()
	MiniMapBattlefieldFrame:SetScale(WindMinimapBattlefieldConfig[4]);
end