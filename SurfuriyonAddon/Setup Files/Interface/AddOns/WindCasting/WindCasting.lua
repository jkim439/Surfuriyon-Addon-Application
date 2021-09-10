function WindCasting_OnLoad()
	WindCommon_setBackground(WindCastingBorder, WindCasting, 6);

	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("SPELLCAST_START");
	this:RegisterEvent("SPELLCAST_STOP");
	this:RegisterEvent("SPELLCAST_FAILED");
	this:RegisterEvent("SPELLCAST_INTERRUPTED");
	this:RegisterEvent("SPELLCAST_DELAYED");
	this:RegisterEvent("SPELLCAST_CHANNEL_START");
	this:RegisterEvent("SPELLCAST_CHANNEL_UPDATE");
	this:RegisterEvent("SPELLCAST_CHANNEL_STOP");

	this.casting = nil;
	this.holdTime = 0;
	CastingBarFrameStatusBar = WindCCCastingBar;

	CastingBarFrame:UnregisterAllEvents();
	CastingBarFrame:SetScript("OnLoad", nil);
	CastingBarFrame:SetScript("OnEvent", nil);
	CastingBarFrame:SetScript("OnUpdate", nil);
	CastingBarFrame:Hide();
end

function WindCasting_OnEvent()
	if (event == "VARIABLES_LOADED") then
		WindCasting_initConfig();
		WindCasting_setPoint();
		WindCasting_setScale();
		WindCasting_setSize();
	elseif ( event == "SPELLCAST_START" ) then WindCasting_spellStart(this, arg1, arg2);
	elseif ( event == "SPELLCAST_STOP" or event == "SPELLCAST_CHANNEL_STOP" ) then WindCasting_spellStop(this, event);
	elseif ( event == "SPELLCAST_FAILED" or event == "SPELLCAST_INTERRUPTED" ) then WindCasting_spellFail(this, event);
	elseif ( event == "SPELLCAST_DELAYED" ) then WindCasting_spellDelay(this, arg1);
	elseif ( event == "SPELLCAST_CHANNEL_START" ) then WindCasting_channelStart(this, arg1, arg2);
	elseif ( event == "SPELLCAST_CHANNEL_UPDATE" ) then WindCasting_channelUpdate(this, arg1); end
end

function WindCasting_spellStart(obj, arg1, arg2)
	obj:SetStatusBarColor(1.0, 0.7, 0.0);
	WindCastingSpark:Show();
	obj.startTime = GetTime();
	obj.maxValue = obj.startTime + (arg2 / 1000);
	obj:SetMinMaxValues(obj.startTime, obj.maxValue);
	obj:SetValue(obj.startTime);
	WindCastingText:SetText(arg1);
	obj:SetAlpha(1.0);
	obj.holdTime = 0;
	obj.casting = 1;
	obj.fadeOut = nil;
	obj:Show();
	WindCastingBorder:Show();
	obj.mode = "casting";
end

function WindCasting_spellStop(obj, event)
	if ( not obj:IsVisible() ) then
		obj:Hide();
		WindCastingBorder:Hide();
	elseif ( obj:IsShown() ) then
		obj:SetValue(obj.maxValue);
		obj:SetStatusBarColor(0.0, 1.0, 0.0);
		WindCastingSpark:Hide();
		if ( event == "SPELLCAST_STOP" ) then obj.casting = nil;
		else obj.channeling = nil; end
		obj.fadeOut = 1;
		obj.mode = "flash";
	end
end

function WindCasting_spellFail(obj, event)
	if ( obj:IsShown() and not obj.channeling ) then
		obj:SetValue(obj.maxValue);
		obj:SetStatusBarColor(1.0, 0.0, 0.0);
		WindCastingSpark:Hide();
		if ( event == "SPELLCAST_FAILED" ) then WindCastingText:SetText(FAILED);
		else WindCastingText:SetText(INTERRUPTED); end
		obj.casting = nil;
		obj.fadeOut = 1;
		obj.holdTime = GetTime() + CASTING_BAR_HOLD_TIME;
	end
end

function WindCasting_spellDelay(obj, arg1)
	if( obj:IsShown() ) then
		obj.startTime = obj.startTime + (arg1 / 1000);
		obj.maxValue = obj.maxValue + (arg1 / 1000);
		obj:SetMinMaxValues(obj.startTime, obj.maxValue);
	end
end

function WindCasting_channelStart(obj, arg1, arg2)
	obj:SetStatusBarColor(1.0, 0.7, 0.0);
	WindCastingSpark:Show();
	obj.maxValue = 1;
	obj.startTime = GetTime();
	obj.endTime = obj.startTime + (arg1 / 1000);
	obj.duration = arg1 / 1000;
	obj:SetMinMaxValues(obj.startTime, obj.endTime);
	obj:SetValue(obj.endTime);
	WindCastingText:SetText(arg2);
	obj:SetAlpha(1.0);
	obj.holdTime = 0;
	obj.casting = nil;
	obj.channeling = 1;
	obj.fadeOut = nil;
	obj:Show();
	WindCastingBorder:Show();
end

function WindCasting_channelUpdate(obj, arg1)
	if ( obj:IsShown() ) then
		local origDuration = obj.endTime - obj.startTime
		obj.endTime = GetTime() + (arg1 / 1000)
		obj.startTime = obj.endTime - origDuration
		obj:SetMinMaxValues(obj.startTime, obj.endTime);
	end
end

function WindCasting_OnUpdate()
	if ( WindCasting.casting ) then WindCasting_casting(WindCasting);
	elseif ( WindCasting.channeling ) then WindCasting_channeling(WindCasting);
	elseif ( GetTime() < WindCasting.holdTime ) then return;
	elseif ( WindCasting.fadeOut ) then WindCasting_fadeOut(WindCasting); end
end

function WindCasting_casting(obj)
	local status = GetTime();
	if ( status > obj.maxValue ) then status = obj.maxValue end
	obj:SetValue(status);
	local sparkPosition = ((status - obj.startTime) / (obj.maxValue - obj.startTime)) * WindCastingConfigAll[5];
	if ( sparkPosition < 0 ) then sparkPosition = 0; end
	WindCastingTime:SetText(string.format("%.1f", math.max(obj.maxValue - status, 0.0)));
	WindCastingSpark:SetPoint("CENTER", obj, "LEFT", sparkPosition, 0);
end

function WindCasting_channeling(obj)
	local time = GetTime();
	if ( time > obj.endTime ) then time = obj.endTime end
	if ( time == obj.endTime ) then
		obj.channeling = nil;
		obj.fadeOut = 1;
		return;
	end
	local barValue = obj.startTime + (obj.endTime - time);
	obj:SetValue( barValue );
	local sparkPosition = ((barValue - obj.startTime) / (obj.endTime - obj.startTime)) * WindCastingConfigAll[5];
	WindCastingTime:SetText(string.format("%.1f", math.max(obj.endTime - time, 0.0)));
	WindCastingSpark:SetPoint("CENTER", obj, "LEFT", sparkPosition, 0);
end

function WindCasting_fadeOut(obj)
	local alpha = obj:GetAlpha() - CASTING_BAR_ALPHA_STEP;
	if ( alpha > 0 ) then obj:SetAlpha(alpha);
	else
		obj.fadeOut = nil;
		obj:Hide();
		WindCastingBorder:Hide();
	end
end

function WindCasting_initConfig()
	if (not WindCastingConfigAll) then WindCastingConfigAll = {"BOTTOMLEFT", 5, 212, 1.0, 526, 35}; end
end

function WindCasting_setPoint()
	WindCommon_setPoint(WindCasting, WindCastingConfigAll[1], UIParent, WindCastingConfigAll[1], WindCastingConfigAll[2], WindCastingConfigAll[3]);
end

function WindCasting_setScale()
	WindCasting:SetScale(WindCastingConfigAll[4]);
end

function WindCasting_setSize()
	WindCommon_setSize(WindCasting, WindCastingConfigAll[5], WindCastingConfigAll[6]);
end