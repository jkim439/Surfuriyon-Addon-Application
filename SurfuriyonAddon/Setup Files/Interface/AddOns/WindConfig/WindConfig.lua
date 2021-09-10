function WindConfig_closeAll()
	WindActionConfig:Hide();
	WindBBConfig:Hide();
	WindCastingConfig:Hide();
	WindChatConfig:Hide();
	WindInfoConfig:Hide();
	WindMinimapConfig:Hide();
end

function WindConfig_validScale(value)
	if (value <= 0) then value = 0.1; end
	if (value > 2) then value = 2.0; end
	return value;
end

function WindConfig_validX(point, value)
	if (string.find(point, "LEFT") and (value < -10)) then value = -10; end
	if (string.find(point, "RIGHT") and (value > 10)) then value = 10; end
	return value;
end

function WindConfig_validY(point, value)
	if (string.find(point, "BOTTOM") and (value < -10)) then value = -10; end
	if (string.find(point, "TOP") and (value > 10)) then value = 10; end
	return value;
end

function WindConfig_validWidthHeight(value)
	if (value <= 0) then value = 0.1; end
	return value;
end

function WindConfig_changePoint(btn, point)
	local parent = btn:GetParent():GetName();
	WindConfig_setUnCheckAll(parent);
	btn:SetChecked(1);
	getglobal(parent.."X"):SetText("0");
	getglobal(parent.."Y"):SetText("0");
	getglobal(parent.."_setConfigPoint")(point, 0, 0);
end

function WindConfig_changeScale(editbox, isMove)
	local parent = editbox:GetParent():GetName();
	local scale = WindConfig_validScale(editbox:GetNumber());
	editbox:SetText(scale);
	getglobal(parent.."_setConfigScale")(scale);

	if (isMove) then getglobal(parent.."X"):SetFocus();
	else editbox:ClearFocus(); end
end

function WindConfig_changeX(editbox, isMove)
	local parent = editbox:GetParent():GetName();
	local x = WindConfig_validX(getglobal(parent.."_getPoint")(), editbox:GetNumber());
	editbox:SetText(x);
	getglobal(parent.."_setConfigX")(x);

	if (isMove) then getglobal(parent.."Y"):SetFocus();
	else editbox:ClearFocus(); end
end

function WindConfig_changeY(editbox)
	local parent = editbox:GetParent():GetName();
	local y = WindConfig_validY(getglobal(parent.."_getPoint")(), editbox:GetNumber());
	editbox:SetText(y);
	getglobal(parent.."_setConfigY")(y);

	editbox:ClearFocus();
end

function WindConfig_setUnCheckAll(target)
	getglobal(target.."TOPLEFT"):SetChecked(0);
	getglobal(target.."TOP"):SetChecked(0);
	getglobal(target.."TOPRIGHT"):SetChecked(0);
	getglobal(target.."LEFT"):SetChecked(0);
	getglobal(target.."CENTER"):SetChecked(0);
	getglobal(target.."RIGHT"):SetChecked(0);
	getglobal(target.."BOTTOMLEFT"):SetChecked(0);
	getglobal(target.."BOTTOM"):SetChecked(0);
	getglobal(target.."BOTTOMRIGHT"):SetChecked(0);
end

function WindConfig_setCheck(target, point)
	if (point == "TOPLEFT") then getglobal(target.."TOPLEFT"):SetChecked(1);
	elseif (point == "TOP") then getglobal(target.."TOP"):SetChecked(1);
	elseif (point == "TOPRIGHT") then getglobal(target.."TOPRIGHT"):SetChecked(1);
	elseif (point == "LEFT") then getglobal(target.."LEFT"):SetChecked(1);
	elseif (point == "CENTER") then getglobal(target.."CENTER"):SetChecked(1);
	elseif (point == "RIGHT") then getglobal(target.."RIGHT"):SetChecked(1);
	elseif (point == "BOTTOMLEFT") then getglobal(target.."BOTTOMLEFT"):SetChecked(1);
	elseif (point == "BOTTOM") then getglobal(target.."BOTTOM"):SetChecked(1);
	elseif (point == "BOTTOMRIGHT") then getglobal(target.."BOTTOMRIGHT"):SetChecked(1); end
end

function WindConfig_changeWidth(editbox, isMove)
	local parent = editbox:GetParent():GetName();
	local width = WindConfig_validWidthHeight(editbox:GetNumber());
	editbox:SetText(width);
	getglobal(parent.."_setWidth")(width);

	if (isMove) then getglobal(parent.."HEIGHT"):SetFocus();
	else editbox:ClearFocus(); end
end

function WindConfig_changeHeight(editbox)
	local parent = editbox:GetParent():GetName();
	local height = WindConfig_validWidthHeight(editbox:GetNumber());
	editbox:SetText(height);
	getglobal(parent.."_setHeight")(height);
	editbox:ClearFocus();
end

function WindConfig_changeView(btn)
	local parent = btn:GetParent():GetName();
	if (btn:GetChecked()) then
		btn:SetChecked(1);
		getglobal(parent.."_setView")(true);
	else
		btn:SetChecked(0);
		getglobal(parent.."_setView")(false);
	end
end