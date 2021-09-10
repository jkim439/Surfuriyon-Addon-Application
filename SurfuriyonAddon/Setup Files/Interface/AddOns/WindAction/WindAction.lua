WindActionBorderSize = {
	{492, 51},
	{252, 93},
	{172, 133},
	{132, 173},
	{92, 253},
	{52, 493}
}

function WindActionButton_OnEvent()
	if (event == "ACTIONBAR_SLOT_CHANGED" and (arg1 == -1 or arg1 == ActionButton_GetPagedID(this))) then
		this.needUpdate = 1;
		ActionButton_Update();
	elseif (event == "PLAYER_ENTERING_WORLD" or event == "ACTIONBAR_PAGE_CHANGED") then
		this.needUpdate = 1;
		ActionButton_Update();
	elseif (event == "UPDATE_BONUS_ACTIONBAR" and this.isBonus) then
		this.needUpdate = 1;
		ActionButton_Update();
	elseif (event == "ACTIONBAR_SHOWGRID") then ActionButton_ShowGrid();
	elseif (event == "ACTIONBAR_HIDEGRID") then ActionButton_HideGrid();
	elseif (event == "UPDATE_BINDINGS") then ActionButton_UpdateHotkeys();
	elseif (event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_AURAS_CHANGED") then ActionButton_UpdateUsable();
	elseif (event == "UNIT_INVENTORY_CHANGED" and arg1 == "player") then
		this.needUpdate = 1;
		ActionButton_Update();
	elseif (event == "ACTIONBAR_UPDATE_STATE") then ActionButton_UpdateState();
	elseif (event == "ACTIONBAR_UPDATE_USABLE" or event == "UPDATE_INVENTORY_ALERTS" or event == "ACTIONBAR_UPDATE_COOLDOWN") then
		this.needUpdate = 1;
		ActionButton_UpdateUsable();
		ActionButton_UpdateCooldown();
	elseif (event == "CRAFT_SHOW" or event == "CRAFT_CLOSE" or event == "TRADE_SKILL_SHOW" or event == "TRADE_SKILL_CLOSE") then ActionButton_UpdateState();
	elseif (event == "PLAYER_ENTER_COMBAT" and IsAttackAction(ActionButton_GetPagedID(this))) then ActionButton_StartFlash();
	elseif (event == "PLAYER_LEAVE_COMBAT" and IsAttackAction(ActionButton_GetPagedID(this))) then ActionButton_StopFlash();
	elseif (event == "START_AUTOREPEAT_SPELL" and IsAutoRepeatAction(ActionButton_GetPagedID(this))) then ActionButton_StartFlash();
	elseif (event == "STOP_AUTOREPEAT_SPELL" and ActionButton_IsFlashing() and not IsAttackAction(ActionButton_GetPagedID(this))) then ActionButton_StopFlash(); end
end

function WindActionButton_OnUpdate()
	if (this.needUpdate and HasAction(ActionButton_GetPagedID(this))) then WindActionButton_updateCCount(); end
	if (ActionButton_IsFlashing()) then
		this.flashtime = this.flashtime - arg1;
		if (this.flashtime <= 0) then
			local overtime = -this.flashtime;
			if (overtime >= ATTACK_BUTTON_FLASH_TIME) then overtime = 0; end
			this.flashtime = ATTACK_BUTTON_FLASH_TIME - overtime;
			local flashTexture = getglobal(this:GetName().."Flash");
			if (flashTexture:IsVisible()) then flashTexture:Hide();
			else flashTexture:Show(); end
		end
	end

	if (this.rangeTimer) then
		this.rangeTimer = this.rangeTimer - arg1;
		if (this.rangeTimer <= 0) then
			local range = getglobal(this:GetName().."RCRange");
			if (IsActionInRange(ActionButton_GetPagedID(this)) == 0) then range:Show();
			else range:Hide(); end
			this.rangeTimer = TOOLTIP_UPDATE_TIME;
		end
	end

	if (not this.updateTooltip) then return; end
	this.updateTooltip = this.updateTooltip - arg1;
	if (this.updateTooltip > 0) then return; end
	if (GameTooltip:IsOwned(this)) then ActionButton_SetTooltip();
	else this.updateTooltip = nil; end
end

function WindActionButton_updateCCount()
	local start, duration, enable = GetActionCooldown(ActionButton_GetPagedID(this));
	local text = getglobal(this:GetName().."RCCCount");
	if (start>0 and duration>0 and enable>0) then
		if (duration > 2.0) then
			text:SetText(WindActionButton_getColldownText(start, duration, GetTime()));
			text:Show();
		end
	else
		this.needUpdate	= nil;
		text:Hide();
	end
end

function WindActionButton_getColldownText(start, duration, now)
	local remainingTime = ceil((start + duration) - now);
	if (remainingTime>=3600) then return (math.floor((remainingTime / 3600)+0.5).."시");
	elseif (remainingTime>=60) then return (math.floor((remainingTime / 60)+0.5).."분");
	else return remainingTime; end
end

function WindActionButton_setAnchor(index, btn)
	if (index == 1) then
		WindCommon_setPoint(getglobal(btn.."2"), "LEFT", btn.."1", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."3"), "LEFT", btn.."2", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."4"), "LEFT", btn.."3", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."5"), "LEFT", btn.."4", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."6"), "LEFT", btn.."5", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."7"), "LEFT", btn.."6", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."8"), "LEFT", btn.."7", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."9"), "LEFT", btn.."8", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."10"), "LEFT", btn.."9", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."11"), "LEFT", btn.."10", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."12"), "LEFT", btn.."11", "RIGHT", 4, 0);
	elseif (index == 2) then
		WindCommon_setPoint(getglobal(btn.."2"), "LEFT", btn.."1", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."3"), "LEFT", btn.."2", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."4"), "LEFT", btn.."3", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."5"), "LEFT", btn.."4", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."6"), "LEFT", btn.."5", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."7"), "TOPLEFT", btn.."1", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."8"), "LEFT", btn.."7", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."9"), "LEFT", btn.."8", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."10"), "LEFT", btn.."9", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."11"), "LEFT", btn.."10", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."12"), "LEFT", btn.."11", "RIGHT", 4, 0);
	elseif (index == 3) then
		WindCommon_setPoint(getglobal(btn.."2"), "LEFT", btn.."1", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."3"), "LEFT", btn.."2", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."4"), "LEFT", btn.."3", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."5"), "TOPLEFT", btn.."1", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."6"), "LEFT", btn.."5", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."7"), "LEFT", btn.."6", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."8"), "LEFT", btn.."7", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."9"), "TOPLEFT", btn.."5", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."10"), "LEFT", btn.."9", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."11"), "LEFT", btn.."10", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."12"), "LEFT", btn.."11", "RIGHT", 4, 0);
	elseif (index == 4) then
		WindCommon_setPoint(getglobal(btn.."2"), "LEFT", btn.."1", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."3"), "LEFT", btn.."2", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."4"), "TOPLEFT", btn.."1", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."5"), "LEFT", btn.."4", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."6"), "LEFT", btn.."5", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."7"), "TOPLEFT", btn.."4", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."8"), "LEFT", btn.."7", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."9"), "LEFT", btn.."8", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."10"), "TOPLEFT", btn.."7", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."11"), "LEFT", btn.."10", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."12"), "LEFT", btn.."11", "RIGHT", 4, 0);
	elseif (index == 5) then
		WindCommon_setPoint(getglobal(btn.."2"), "LEFT", btn.."1", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."3"), "TOPLEFT", btn.."1", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."4"), "LEFT", btn.."3", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."5"), "TOPLEFT", btn.."3", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."6"), "LEFT", btn.."5", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."7"), "TOPLEFT", btn.."5", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."8"), "LEFT", btn.."7", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."9"), "TOPLEFT", btn.."7", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."10"), "LEFT", btn.."9", "RIGHT", 4, 0);
		WindCommon_setPoint(getglobal(btn.."11"), "TOPLEFT", btn.."9", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."12"), "LEFT", btn.."11", "RIGHT", 4, 0);
	elseif (index == 6) then
		WindCommon_setPoint(getglobal(btn.."2"), "TOPLEFT", btn.."1", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."3"), "TOPLEFT", btn.."2", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."4"), "TOPLEFT", btn.."3", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."5"), "TOPLEFT", btn.."4", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."6"), "TOPLEFT", btn.."5", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."7"), "TOPLEFT", btn.."6", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."8"), "TOPLEFT", btn.."7", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."9"), "TOPLEFT", btn.."8", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."10"), "TOPLEFT", btn.."9", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."11"), "TOPLEFT", btn.."10", "BOTTOMLEFT", 0, -4);
		WindCommon_setPoint(getglobal(btn.."12"), "TOPLEFT", btn.."11", "BOTTOMLEFT", 0, -4);
	end
end