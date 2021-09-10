-- Title: ImproveDressingRoom v1.0
-- Author: TotalPackage
-- Date: 03/14/2006


function ImproveAHDressingRoomModel_Load()
	if( not AuctionDressUpModel ) then
		this:RegisterEvent("ADDON_LOADED");
	else
		ImproveAHDressingRoomFrame:SetParent("AuctionDressUpFrame");
		ImproveAHDressingRoomFrame:Show();
	end
end


function ImproveAHDressingRoomModel_Event()
	if (event == "ADDON_LOADED") then
		if (arg1 == "Blizzard_AuctionUI") then
			this:UnRegisterEvent("ADDON_LOADED");
			ImproveAHDressingRoomFrame:SetParent("AuctionDressUpFrame");
			ImproveAHDressingRoomFrame:Show();
		end
	end
end


function ImproveDressingRoomModel_OnLoad()
	idu_ismoving = nil;
	idu_ispaning = nil;
end


function ImproveDressingRoom_Move_OnMouseDown(arg1)
	if (arg1 == "LeftButton") then
		idu_ismoving = 1;
		previousx, previousy = GetCursorPosition();
	end
	if (arg1 == "RightButton") then
		idu_ispaning = 1;
		previousx, previousy = GetCursorPosition();
	end
end


function ImproveDressingRoom_Move_OnMouseUp(arg1,frameName)
	if (arg1 == "LeftButton") then
		idu_ismoving = nil;
	end
	if (arg1 == "RightButton") then
		idu_ispaning = nil;
	end
end


function ImproveDressingRoom_Move_OnMouseWheel(value,frameName)
	if (frameName == "ImproveDressingRoomFrame") then
		local cz, cx, cy = DressUpModel:GetPosition();
		if ( value > 0 ) then
			idu_zoom = cz + 0.5;
		else
			idu_zoom = cz - 0.5;
		end
		DressUpModel:SetPosition(idu_zoom, cx, cy);
	elseif (frameName == "ImproveAHDressingRoomFrame") then
		local cz, cx, cy = AuctionDressUpModel:GetPosition();
		if ( value > 0 ) then
			idu_ahzoom = cz + 0.5;
		else
			idu_ahzoom = cz - 0.5;
		end
		AuctionDressUpModel:SetPosition(idu_ahzoom, cx, cy);
	end
end


function ImproveDressingRoom_Move_OnUpdate(elapsedTime,frameName)
	if ( idu_ismoving ) then
		local currentx, currenty = GetCursorPosition();
		if (frameName == "ImproveDressingRoomFrame") then
			idu_rotation = DressUpModel:GetFacing() + ((currentx - previousx)/50);
			DressUpModel:SetFacing(idu_rotation);
		elseif (frameName == "ImproveAHDressingRoomFrame") then
			idu_rotation = AuctionDressUpModel:GetFacing() + ((currentx - previousx)/50);
			AuctionDressUpModel:SetFacing(idu_rotation);
		end
		previousx, previousy = GetCursorPosition();
	end
	if ( idu_ispaning ) then
		local currentx, currenty = GetCursorPosition();
		if (frameName == "ImproveDressingRoomFrame") then
			local cz, cx, cy = DressUpModel:GetPosition();
			idu_positionx = cx + ((currentx - previousx)/50);
			idu_positiony = cy + ((currenty - previousy)/50);
			DressUpModel:SetPosition(cz, idu_positionx, idu_positiony);
		elseif (frameName == "ImproveAHDressingRoomFrame") then
			local cz, cx, cy = AuctionDressUpModel:GetPosition();
			idu_ahpositionx = cx + ((currentx - previousx)/50);
			idu_ahpositiony = cy + ((currenty - previousy)/50);
			AuctionDressUpModel:SetPosition(cz, idu_ahpositionx, idu_ahpositiony);
		end
		previousx, previousy = GetCursorPosition();
	end
end

