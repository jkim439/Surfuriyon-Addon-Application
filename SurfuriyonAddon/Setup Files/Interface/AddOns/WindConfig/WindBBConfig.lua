function WindBBConfig_OnShow()
	WindBBConfigBodyX:SetText(WindBBConfigAll[1]);
	WindBBConfigBodyY:SetText(WindBBConfigAll[2]);
	WindBBConfigBodySCALE:SetText(WindBBConfigAll[3]);
end

function WindBBConfigBody_setConfigX(x)
	WindBBConfigAll[1] = x;
	CloseAllBags();
	OpenAllBags(1);
end

function WindBBConfigBody_setConfigY(y)
	WindBBConfigAll[2] = y;
	CloseAllBags();
	OpenAllBags(1);
end

function WindBBConfigBody_setConfigScale(scale)
	WindBBConfigAll[3] = scale;
	WindBB_setScale();
	CloseAllBags();
	OpenAllBags(1);
end

function WindBBConfigBody_getPoint()
	return "BOTTOMRIGHT";
end