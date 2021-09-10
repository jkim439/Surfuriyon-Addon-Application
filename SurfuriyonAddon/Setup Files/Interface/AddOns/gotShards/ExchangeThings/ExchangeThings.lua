--[[
   ExchangeThings - 생석 거래 거세요~ v 1.0 for 1.10
   제작자 : xenore (엘룬섭 프리지아)
   지정한 물건의 거래를 도와줍니다. 특히 생석과 물, 빵.

   패치노트

   1.0 for 1.10   : tooltip 사용부분을 전부 삭제 (1.10 패치 대응)
]]

ExchangeThings_AutoAccept = 1;
ExchangeThings_SafeAutoAccept = 1;
ExchangeThings_TradeNotEnoughItems = 1;

ExchangeThings_OnWorking = 0;
ExchangeThings_OnTrade = 0;
ExchangeThings_ItemToTrade = "";
ExchangeThings_ItemNumToTrade = 0;

function ExchangeThings_OnLoad()
	this:RegisterEvent("TRADE_SHOW");
	this:RegisterEvent("TRADE_CLOSED");
	this:RegisterEvent("TRADE_REQUEST");
	this:RegisterEvent("TRADE_REQUEST_CANCEL");
	this:RegisterEvent("TRADE_ACCEPT_UPDATE");

	ExchangeThings_RegisterCosmos();
end

function ExchangeThings_OnEvent(arg1, arg2)
--	DEFAULT_CHAT_FRAME:AddMessage(format("%s, OnWorking - %d, OnTrade - %d", event, ExchangeThings_OnWorking, ExchangeThings_OnTrade));
	if (event == "TRADE_REQUEST")	-- 거래 요구를 받으면
	then
		ExchangeThings_OnTrade = 1;
	end;

	if (
		event == "TRADE_REQUEST_CANCEL"
		or event == "TRADE_CLOSED"
	)	-- 거래 요구가 취소되면
	then
		ExchangeThings_OnTrade = 0;
		ExchangeThings_OnWorking = 0;
	end;

	if (event == "TRADE_SHOW")	-- 거래창이 열리면
	then
		ExchangeThings_OnTrade = 1;
		if (ExchangeThings_OnWorking == 1)	-- 거래도우미 발동중이면
		then
			ExchangeThings_FindItem(
				ExchangeThings_ItemToTrade,
				ExchangeThings_TradeItem,
				ExchangeThings_ItemNumToTrade
				);
			AcceptTrade();
		end;
	end;

	if (
		event == "TRADE_ACCEPT_UPDATE"
		and (ExchangeThings_OnWorking == 1)
		and (ExchangeThings_AutoAccept == 1)
	)
	then
		if (
		(arg2 == 1)
		and ((ExchangeThings_SafeAutoAccept == 0)
			or (GetPlayerTradeMoney() == 0) and (GetTargetTradeMoney() == 0))
		)
		then
			AcceptTrade();
		end
	end
end

function ExchangeThings_FindItem(itemToFind, callback_function, count)
	local bag, slot, lcount;
	lcount = count;
	for bag=4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _, itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = nil;
					local ttext = GetContainerItemLink(bag, slot);

					if (ttext ~= nil)
					then
						itemName = string.sub(ttext, string.find(ttext, "%[")+1, string.find(ttext, "%]")-1);

						if (itemName ~= nil and itemName == itemToFind)
						then
							if (
								(callback_function)
								and (type(callback_function) == "function")
								and (lcount > 0)
							)
							then
								callback_function(bag, slot);
								lcount = lcount - 1;
								if (lcount == 0)
								then
									return 0, count, nil;
								end
							else
								return 1, bag, slot;
							end
						end
					end
				end
			end
		end
	end
	return nil, (count - lcount), nil;
end

function ExchangeThings_TradeItem(index, slot)
	if (ExchangeThings_OnTrade == 1)
	then
		local tradeslot, slot_occupied;	-- 빈 거래 슬롯을 찾는다.
		for tradeslot = 1, 6, 1 do
			slot_occupied = GetTradePlayerItemInfo(tradeslot);
			if (slot_occupied == nil)	-- 빈 거래 슬롯을 찾으면
			then
				PickupContainerItem(index, slot);
				ClickTradeButton(tradeslot);
				AcceptTrade();
				return tradeslot;
			end;
		end;
		-- 빈 거래 슬롯이 없다!
		DEFAULT_CHAT_FRAME:AddMessage(format(EXCHANGETHINGS_ERROR_NOSLOT, ExchangeThings_ItemToTrade));
		return 7;
	end;

	return nil;
end

function ExchangeThings_BeginTrade(item, count)
	-- item 을 count개 만큼 거래합니다.

	local result, result2;

	if (ExchangeThings_OnTrade == 1)	-- 이미 거래창이 열려있으면
	then
		ExchangeThings_ItemToTrade = item;
		ExchangeThings_ItemNumToTrade = count;
		ExchangeThings_OnWorking = 1;
		result = ExchangeThings_FindItem(
			item,
			ExchangeThings_TradeItem,
			count
			);
		if (result == nil)
		then
			DEFAULT_CHAT_FRAME:AddMessage(format(EXCHANGETHINGS_ERROR_NOITEM, item));
			return nil;
		end;
	else
		result = ExchangeThings_FindItem(item, nil, 1);
		if (result == nil)
		then	-- 거래하려는 아이템이 없으면
			DEFAULT_CHAT_FRAME:AddMessage(format(EXCHANGETHINGS_ERROR_NOITEM, item));
			return nil;
		end;

		result, result2 = ExchangeThings_FindItem(item, nil, count);
		if (result == nil)
		then	-- 거래하려는 아이템이 없으면
			DEFAULT_CHAT_FRAME:AddMessage(format(EXCHANGETHINGS_ERROR_NOENOUGHITEM, item, result2, count));
			if (ExchangeThings_TradeNotEnoughItems == 0)
			then
				return nil;
			end;
		end;

		ExchangeThings_OnWorking = 1;
		ExchangeThings_ItemToTrade = item;
		ExchangeThings_ItemNumToTrade = count;
		InitiateTrade("target");
	end
	
	return 1;
end

function ExchangeThings_RegisterCosmos()
	if (Cosmos_RegisterConfiguration) then

		if (gotShards_RegisterCosmos == nil)
		then
			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS",
				"SECTION",
				EXCHANGETHINGS_HEADER,
				EXCHANGETHINGS_HEADER_INFO
				);

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_SECTION",
				"SEPARATOR",
				EXCHANGETHINGS_HEADER,
				EXCHANGETHINGS_HEADER_INFO
				);

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_AUTOACCEPT",
				"CHECKBOX",
				EXCHANGETHINGS_AUTOACCEPT, 
				EXCHANGETHINGS_AUTOACCEPT_INFO,
				ExchangeThings_AutoAccept_Toggle,
				1,
				0
				);

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_SAFEAUTOACCEPT",
				"CHECKBOX",
				EXCHANGETHINGS_SAFEAUTOACCEPT, 
				EXCHANGETHINGS_SAFEAUTOACCEPT_INFO,
				ExchangeThings_SafeAutoAccept_Toggle,
				1,
				0
				);

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_TRADENOTENOUGHITEMS",
				"CHECKBOX",
				EXCHANGETHINGS_TRADENOTENOUGHITEMS,
				EXCHANGETHINGS_TRADENOTENOUGHITEMS_INFO,
				ExchangeThings_TradeNotEnoughItems_Toggle,
				1,
				0
				);
		else

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_SECTION",
				"SEPARATOR",
				GOTSHARDS_EXCHANGETHINGS_HEADER,
				GOTSHARDS_EXCHANGETHINGS_HEADER_INFO
				);

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_AUTOACCEPT",
				"CHECKBOX",
				GOTSHARDS_EXCHANGETHINGS_AUTOACCEPT, 
				GOTSHARDS_EXCHANGETHINGS_AUTOACCEPT_INFO,
				ExchangeThings_AutoAccept_Toggle,
				1,
				0
				);

			Cosmos_RegisterConfiguration(
				"COS_EXCHANGETHINGS_SAFEAUTOACCEPT",
				"CHECKBOX",
				GOTSHARDS_EXCHANGETHINGS_SAFEAUTOACCEPT, 
				GOTSHARDS_EXCHANGETHINGS_SAFEAUTOACCEPT_INFO,
				ExchangeThings_SafeAutoAccept_Toggle,
				1,
				0
				);
		end;
	end

	SlashCmdList["EXCHANGETHINGS"] = function(msg)
		if (msg == "")
		then
			DEFAULT_CHAT_FRAME:AddMessage(EXCHANGETHINGS_HELP10, 1, 1, 0);
		elseif (msg ~= nil and msg~= "")
		then
			local pos1, pos2 = string.find(msg, "%d+$");
			local itemName = string.sub(msg, 1, pos1 - 2);
			local itemNum = tonumber(string.sub(msg, pos1, pos2));

			ExchangeThings_BeginTrade(itemName, itemNum);
		else
			SlashCmdList["EXCHANGETHINGS"]("");
		end;
	end;
	SLASH_EXCHANGETHINGS1 = "/자동거래";
	SLASH_EXCHANGETHINGS2 = "/ething";
end

function ExchangeThings_AutoAccept_Toggle(toggle)
	if (toggle) then
		ExchangeThings_AutoAccept = toggle;
	else
		ExchangeThings_AutoAccept = 1 - ExchangeThings_AutoAccept;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_EXCHANGETHINGS_AUTOACCEPT_X",CSM_CHECKONOFF,ExchangeThings_AutoAccept);
	end
end

function ExchangeThings_SafeAutoAccept_Toggle(toggle)
	if (toggle) then
		ExchangeThings_SafeAutoAccept = toggle;
	else
		ExchangeThings_SafeAutoAccept = 1 - ExchangeThings_SafeAutoAccept;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_EXCHANGETHINGS_SAFEAUTOACCEPT_X",CSM_CHECKONOFF,ExchangeThings_SafeAutoAccept);
	end
end

function ExchangeThings_TradeNotEnoughItems_Toggle(toggle)
	if (toggle) then
		ExchangeThings_TradeNotEnoughItems = toggle;
	else
		ExchangeThings_TradeNotEnoughItems = 1 - ExchangeThings_TradeNotEnoughItems;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_EXCHANGETHINGS_TRADENOTENOUGHITEMS_X",CSM_CHECKONOFF,ExchangeThings_TradeNotEnoughItems);
	end
end

