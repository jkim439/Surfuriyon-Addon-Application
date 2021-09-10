function WindCastingConfig_OnShow()
	WindCastingConfigBorder:SetAllPoints(WindCastingBorder);
	WindConfig_setUnCheckAll("WindCastingConfigBody");
	WindConfig_setCheck("WindCastingConfigBody", WindCastingConfigAll[1]);
	WindCastingConfigBodyX:SetText(WindCastingConfigAll[2]);
	WindCastingConfigBodyY:SetText(WindCastingConfigAll[3]);
	WindCastingConfigBodySCALE:SetText(WindCastingConfigAll[4]);
	WindCastingConfigBodyWIDTH:SetText(WindCastingConfigAll[5]);
	WindCastingConfigBodyHEIGHT:SetText(WindCastingConfigAll[6]);
end

function WindCastingConfigBody_setConfigPoint(point, x, y)
	WindCastingConfigAll[1] = point;
	WindCastingConfigAll[2] = x;
	WindCastingConfigAll[3] = y;
	WindCasting_setPoint();
end

function WindCastingConfigBody_setConfigX(x)
	WindCastingConfigAll[2] = x;
	WindCasting_setPoint();
end

function WindCastingConfigBody_setConfigY(y)
	WindCastingConfigAll[3] = y;
	WindCasting_setPoint();
end

function WindCastingConfigBody_setConfigScale(scale)
	WindCastingConfigAll[4] = scale;
	WindCasting_setScale();
end

function WindCastingConfigBody_getPoint()
	return WindCastingConfigAll[1];
end

function WindCastingConfigBody_setWidth(width)
	WindCastingConfigAll[5] = width;
	WindCasting_setSize();
end

function WindCastingConfigBody_setHeight(height)
	WindCastingConfigAll[6] = height;
	WindCasting_setSize();
end