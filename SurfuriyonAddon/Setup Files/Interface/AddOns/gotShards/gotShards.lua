--[[
   gotShards? - 조각은 챙기셨습니까? ver 1.10
   제작자 : 엘룬섭 프리지아, xenore@kaist.ac.kr
   흑마법사의 주 재산인 영혼의 조각의 갯수를 캐릭터 창 밑에 표시해주는 애드온입니다.

   0.3 변경사항 : 창을 확장하여, 아랫부분에 영혼석 쿨타임을 표시합니다.

   0.7 변경사항 : 영혼석 쿨타임을 이제 직접 계산합니다.
                  영혼석 쿨타임에 따라 경고 메세지를 출력합니다.

   0.8 변경사항 : 버그잡음.
                  cosmos용 설정항목 추가.
		  ExchangeThings가 있을 때 자동생석거래를 위한 단축키를 설정할 수 있습니다.

   0.82변경사항 : 1.9.0 패치 대응 버그수정
                  영혼석 쿨타임이 렉에 의해 시간이 점점 뒤틀려지는 문제를 수정

   0.82b변경사항 : 영혼석 쿨타임 초기화가 영혼석 사용이 아닌데도 일어나는 문제를 수정

   0.83a변경사항 : 설정 저장을 더 이상 cosmos에 의존하지 않음.
                   slash command 일부 추가(중요한 몇 가지만. 다는 아님)
                   조각 자동 정리기능 추가, 테스트 중

   0.83b변경사항 : 조각 자동 정리 기능 추가. slash command 대부분 추가.

   0.84 변경사항 : tooltip 사용 배제(1.10 패치 대응)
                   영혼석 재사용 알림 메세지 크기 조절 및 소리알림 추가

   0.85 변경사항 : 드래그 이동을 shift+드래그로 변경
                   생명석 및 영혼석 아이콘 추가(아이콘 상태로 해당 석 보유 확인 가능)
		   아이콘 클릭으로 해당 석 기능 사용 가능

   1.10 변경사항 : WOW와 버젼번호를 맞추기 위해 버젼번호 변경
]]

gotShards_Color = 1;
gotShards_Full = 1;
gotShards_AlertNum = 5;
gotShards_DisplayFlag = 1;
gotShards_AutoSortShard = 1;
gotShards_AutoSortShardBag = 4;
gotShards_AutoSortShard_BlankOnly = 1;
gotShards_AutoSortShard_Priority = 1;
gotShards_SoulStoneAlert5Flag = 1;
gotShards_SoulStoneAlert2Flag = 1;
gotShards_SoulStoneAlert0Flag = 1;
gotShards_SoulStoneAlertFlag = 1;
gotShards_AlertMessageSize = 133;
gotShards_SoulStoneAlertSound = 1;
gotShards_SoulStoneAlert_Group = 1;

gotShards_HealStone = GOTSHARDS_HEALSTONE;
gotShards_HealStoneF = 0;
gotShards_HealStoneIndex = 0;
gotShards_HealStoneSlot = 0;
gotShards_SoulStone = 0;
gotShards_SoulStoneIndex = 0;
gotShards_SoulStoneSlot = 0;

gotShards_SoulStoneUsingCheck = 0;
gotShards_SoulStoneFailureCheck = 0;
gotShards_SoulStoneTimeCheck = 0;
gotShards_SoulStoneTimeBegun = 0;
gotShards_SoulStoneTimeTick = 0;

gotShards_SoulStoneAlert5 = 1;
gotShards_SoulStoneAlert2 = 1;
gotShards_SoulStoneAlert0 = 1;

gotShards_NowSorting = 0;
gotShards_NumSorting = 0;
gotShards_SortQueue = {["shard"]={["bag"]={},["slot"]={}}, ["other"]={["bag"]={},["slot"]={}}};
gotShards_NumQueued = 0;

gotShards_AmIWarlock = 0;





function gotShards_OnLoad()
	-- 일반 공통 체크
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("PLAYER_LEAVING_WORLD");
	this:RegisterEvent("UNIT_NAME_UPDATE");

	-- 영혼석 체크용
	this:RegisterEvent("SPELLCAST_START");
	this:RegisterEvent("SPELLCAST_STOP");
	this:RegisterEvent("SPELLCAST_FAILED");
	this:RegisterEvent("SPELLCAST_INTERRUPTED");

	-- 창 위치 초기화
	gotShards_ResetPosition(nil, nil);
	gotShardsMessageText:SetFont(ZoneTextString:GetFont(), 64);

	-- cosmos 등록
	gotShards_RegisterCosmos();
end

function gotShards_OnEvent(arg1, arg2)

	if ( event == "PLAYER_ENTERING_WORLD" ) then
		-- 영혼 조각 체크용
		this:RegisterEvent("BAG_UPDATE");
		return;
	end
	if ( event == "PLAYER_LEAVING_WORLD" ) then
		this:UnregisterEvent("BAG_UPDATE");
		return;
	end

	if (event == "UNIT_NAME_UPDATE") then

		if (UnitClass("Player") == GOTSHARDS_NAME_OF_WARLOCK)
		then
			gotShards_AmIWarlock = 1;
			if (gotShards_DisplayFlag == 1)
			then
				gotShardsFrame:Show();
			else
				gotShardsFrame:Hide();
			end;
			gotShardsTextSoulTime:SetTextColor(0.8, 0.8, 0.8);
			gotShardsTextSoulTime:SetText(GOTSHARDS_SOULSTONE_UNKNOWN);
		else
			gotShards_AmIWarlock = 0;
			gotShardsFrame:Hide();
		end;
	end;
		
	if (
		(event == "SPELLCAST_START")
		or (event == "SPELLCAST_STOP")
		or (event == "SPELLCAST_INTERRUPTED")
		or (event == "SPELLCAST_FAILED")
	)
	then
--	Print(event.." Time : "..GetTime());
--	if (arg1 ~= nil) then Print(arg1); end;
--	if (arg2 ~= nil) then Print(arg2); end;

		if (
			(event == "SPELLCAST_START")
		)
		then
			if (arg1 == GOTSHARDS_SOULSTONESPELL)
			then
--				Print("U");
				gotShards_SoulStoneUsingCheck = 1;
				gotShards_SoulStoneFailureCheck = 1;
				gotShards_SoulStoneTimeCheck = 0;
				gotShards_SoulStone = 0;
			else
				gotShards_SoulStoneUsingCheck = 0;
				gotShards_SoulStoneFailureCheck = 0;
			end;
		end;

		if (
			(event == "SPELLCAST_STOP")			-- 일단 이 상태에서 영석 시전으로 본다.
		)
		then
			if (
				(gotShards_SoulStoneUsingCheck == 1)
			)
			then
--				Print("UU");
				gotShards_SoulStoneTimeBegun = GetTime();
				gotShards_SoulStoneTimeCheck = 1;
				gotShards_SoulStoneTimeTick = -1;
				gotShards_SoulStoneUsingCheck = 0;
				gotShards_SoulStoneFailureCheck = 1;

				gotShards_SoulStone = 0;
				gotShards_SoulStoneAlert5 = 1;
				gotShards_SoulStoneAlert2 = 1;
				gotShards_SoulStoneAlert0 = 1;
			else	-- 다른 이유에서 STOP 이벤트가 들어오면
				gotShards_SoulStoneUsingCheck = 0;
				gotShards_SoulStoneFailureCheck = 0;
			end;
		end;

		if (
			(
				(event == "SPELLCAST_INTERRUPTED")
				or (event == "SPELLCAST_FAILED")
			)
			and (
				(gotShards_SoulStoneFailureCheck == 1)
			)
		)
		then
--			Print("UUU");
			gotShards_SoulStoneUsingCheck = 0;
			gotShards_SoulStoneFailureCheck = 0;
			gotShards_SoulStoneTimeBegun = 0;
			gotShards_SoulStoneTimeCheck = 0;
			gotShards_SoulStoneAlert5 = 0;
			gotShards_SoulStoneAlert2 = 0;
			gotShards_SoulStoneAlert0 = 0;
			gotShards_Count();
		end;
		
		return;
	end;

	gotShards_Count();
end

function gotShards_Count()
	if (
		gotShards_AmIWarlock ~= 1
		or gotShards_NowSorting > 0)
	then
		return;
	end

	local gotShards_ShardsCount = 0;
	local ShardsBagTotal = 0;
	local ShardsBagUsed = 0;
	local OldSoulStone = gotShards_SoulStone;
	gotShards_SoulStone = 0;
	gotShards_HealStoneF = 0;

	gotShards_SortQueue["other"]["bag"]["size"] = 0;
	gotShards_SortQueue["shard"]["bag"]["size"] = 0;
	gotShards_NowSorting = 0;

	gotShardsAHeal:SetVertexColor(0.5, 0.5, 0.5);
	gotShardsASoul:SetVertexColor(0.5, 0.5, 0.5);

	for bag=4, 0, -1 do
		local size = GetContainerNumSlots(bag);

		if (size > 0) then
			ShardsBagTotal = ShardsBagTotal + size;
			for slot=1, size, 1 do
				local _, itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = nil;
					local ttext = GetContainerItemLink(bag, slot);

					if (ttext ~= nil)
					then
						itemName = string.sub(ttext, string.find(ttext, "%[")+1, string.find(ttext, "%]")-1);

						if (itemName ~= nil) then
							ShardsBagUsed = ShardsBagUsed + 1;
						end

						if (itemName ~= nil and itemName == NAME_OF_SHARDS)
						then
							gotShards_ShardsCount = gotShards_ShardsCount+ 1;

							if (
								bag ~= gotShards_AutoSortShardBag
								and GetBagName(bag) ~= GOTSHARDS_SHARDBAG_SMALL
								and GetBagName(bag) ~= GOTSHARDS_SHARDBAG_MEDIUM
								and GetBagName(bag) ~= GOTSHARDS_SHARDBAG_LARGE
								and (GetBagName(bag) ~= GOTSHARDS_SHARDBAG_LOADING or bag == 0)
							)
							then
								gotShards_SortQueue["shard"]["bag"]["size"] = gotShards_SortQueue["shard"]["bag"]["size"] + 1;
								gotShards_SortQueue["shard"]["bag"][gotShards_SortQueue["shard"]["bag"]["size"]] = bag;
								gotShards_SortQueue["shard"]["slot"][gotShards_SortQueue["shard"]["bag"]["size"]]= slot;
							end;
						else
							if (
								bag == gotShards_AutoSortShardBag
								and gotShards_AutoSortShard_BlankOnly == 0
							)
							then
								gotShards_SortQueue["other"]["bag"]["size"] = gotShards_SortQueue["other"]["bag"]["size"] + 1;
								gotShards_SortQueue["other"]["bag"][gotShards_SortQueue["other"]["bag"]["size"]] = bag;
								gotShards_SortQueue["other"]["slot"][gotShards_SortQueue["other"]["bag"]["size"]] = slot;
							end;
						end;

						if (itemName ~= nil and
							(itemName == "최상급 영혼석"
							or itemName == "상급 영혼석"
							or itemName == "영혼석"
							or itemName == "중급 영혼석"
							or itemName == "하급 영혼석"
							or itemName == "최하급 영혼석")) then
							gotShards_SoulStone = 1;
							gotShards_SoulStoneIndex = bag;
							gotShards_SoulStoneSlot = slot;
							gotShards_SoulStoneTimeCheck = 1;
							gotShardsASoul:SetVertexColor(1, 1, 1);
						end

						if (
							(itemName ~= nil)
							and (string.find(itemName, GOTSHARDS_HEALSTONE) ~= nil)
						)
						then
							gotShards_HealStone = itemName;
							gotShards_HealStoneF = 1;
							gotShards_HealStoneIndex = bag;
							gotShards_HealStoneSlot = slot;
							gotShardsAHeal:SetVertexColor(1, 1, 1);
						end;
					end
				else
					if (
						bag == gotShards_AutoSortShardBag
					)
					then
						gotShards_SortQueue["other"]["bag"]["size"] = gotShards_SortQueue["other"]["bag"]["size"] + 1;
						gotShards_SortQueue["other"]["bag"][gotShards_SortQueue["other"]["bag"]["size"]] = bag;
						gotShards_SortQueue["other"]["slot"][gotShards_SortQueue["other"]["bag"]["size"]] = slot;

					end;
				end
			end
		end
	end
	
	if (
		gotShards_SortQueue["shard"]["bag"]["size"] > 0
		and gotShards_AutoSortShard == 1
	)
	then
		gotShards_NowSorting = math.min(gotShards_SortQueue["shard"]["bag"]["size"], gotShards_SortQueue["other"]["bag"]["size"]);
		gotShards_NumSorting = gotShards_SortQueue["shard"]["bag"]["size"];
	end;

	gotShardsText:SetTextColor(0.2, 1.0, 0.2);

	if (gotShards_ShardsCount <= gotShards_AlertNum and gotShards_Color == 1) then
		gotShardsText:SetTextColor(1.0, 0.6, 0.6);
	end
	if (ShardsBagTotal == ShardsBagUsed and gotShards_Full == 1) then
	-- 가방에 빈 공간이 없으면
		gotShardsText:SetTextColor(0.8, 0.8, 0.8);
	end

	gotShardsText:SetText(format("%d", gotShards_ShardsCount));

	local VC = 0.5 + 0.5 * gotShards_SoulStone;
	gotShardsASoul:SetVertexColor(VC, VC, VC);
end

function gotShards_SoulCooldown(elapsed)
	gotShards_SoulStoneTimeTick = gotShards_SoulStoneTimeTick + elapsed;

	if (
		gotShards_NowSorting > 0
	)
	then
		gotShards_SortShards();
	end;

	if (
		gotShards_SoulStoneTimeTick < 1
	)
	then
		return;
	end;

	gotShards_SoulStoneTimeTick = gotShards_SoulStoneTimeTick - 1;

	if (
		gotShards_AmIWarlock == 0		-- 흑마가 아니거나
		or gotShards_SoulStoneTimeCheck == 0	-- 체크중이 아니면
	)
	then
		return;
	end

	local itemTime;

	if (gotShards_SoulStone == 1)
	then
		local TimeS, TimeC, TimeE = GetContainerItemCooldown(gotShards_SoulStoneIndex, gotShards_SoulStoneSlot);

		if (TimeE == 0)
		then
			return;			-- Item Does Not Exist - Error?
		end;

		gotShards_SoulStoneTimeBegun = TimeS;
	end;

	local gotShards_SoulStoneTimeLeft;
	gotShards_SoulStoneTimeLeft = 1800 - (GetTime() - gotShards_SoulStoneTimeBegun);

	gotShardsTextSoulTime:SetTextColor(1.0, 1.0, 1.0);

	if (gotShards_SoulStoneTimeLeft > 60)
	then
		itemTime = format("%d분", ((gotShards_SoulStoneTimeLeft + 59) / 60));
	else
		itemTime = format("%d초", gotShards_SoulStoneTimeLeft);
	end;

	-- 5분 이하이면 색깔 변경
	if (
		(gotShards_SoulStoneTimeLeft <= 300)
		and (gotShards_SoulStoneAlertFlag == 1)
	)
	then
		gotShardsTextSoulTime:SetTextColor(1.0, 0.7, 0.7);
	else
		gotShardsTextSoulTime:SetTextColor(0.8, 0.8, 0.8);
	end;

	gotShardsTextSoulTime:SetText(itemTime);

	-- Alerts

	if (
		(gotShards_SoulStoneTimeLeft <= 300)
		and (gotShards_SoulStoneTimeLeft > 120)
		and (gotShards_SoulStoneAlert5 == 1)
	)
	then
		gotShards_SoulStoneAlert5 = 0;
		if (gotShards_SoulStoneAlert5Flag == 1)
		then
			gotShards_ShowAlertMessage(GOTSHARDS_SOULSTONEALERT_MESSAGE5);
			if (gotShards_SoulStoneAlert_Group == 1)
			then
				gotShards_ShowAlertMessage_Group(format(GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE5, UnitName("player")));
			end;
		end;
	end;

	if (
		(gotShards_SoulStoneTimeLeft <= 120)
		and (gotShards_SoulStoneTimeLeft > 0)
		and (gotShards_SoulStoneAlert2 == 1)
	)
	then
		gotShards_SoulStoneAlert5 = 0;
		gotShards_SoulStoneAlert2 = 0;
		if (gotShards_SoulStoneAlert2Flag == 1)
		then
			gotShards_ShowAlertMessage(GOTSHARDS_SOULSTONEALERT_MESSAGE2);
			if (gotShards_SoulStoneAlert_Group == 1)
			then
				gotShards_ShowAlertMessage_Group(format(GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE2, UnitName("player")));
			end;
		end;
	end;

	if (
		(gotShards_SoulStoneTimeLeft <= 0)
	)
	then
		if (gotShards_SoulStone == 1)
		then
			gotShardsTextSoulTime:SetTextColor(1.0, 1.0, 1.0);
		else
			gotShardsTextSoulTime:SetTextColor(0.8, 0.8, 0.8);
		end;

		gotShardsTextSoulTime:SetText("준비됨");
		gotShards_SoulStoneTimeCheck = 0;

		if (
			(gotShards_SoulStoneAlert0Flag == 1)
			and (gotShards_SoulStoneAlert0 == 1)
		)
		then
			gotShards_ShowAlertMessage(GOTSHARDS_SOULSTONEREADY_MESSAGE);
			if (gotShards_SoulStoneAlert_Group == 1)
			then
				gotShards_ShowAlertMessage_Group(format(GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE, UnitName("player")));
			end;
		end;

		gotShards_SoulStoneAlert5 = 0;
		gotShards_SoulStoneAlert2 = 0;
		gotShards_SoulStoneAlert0 = 0;
	end;
end

function gotShards_ShowAlertMessage(message)
	gotShardsMessageText:SetText(message);
	gotShardsMessageFrame:SetAlpha(1.0);
	gotShardsMessageFrame:Show();
	UIFrameFadeOut(gotShardsMessageFrame, 4);
	if (gotShards_SoulStoneAlertSound == 1)
	then
		PlaySound("LEVELUPSOUND");
	end;
end

function gotShards_ShowAlertMessage_Group(message)
	if (UnitInRaid("player"))
	then
		SendChatMessage(message, "RAID");
	elseif (GetNumPartyMembers() > 0)
	then
		SendChatMessage(message, "PARTY");
	end;
end

function gotShards_ExchangeHealStone()
	if (ExchangeThings_BeginTrade)
	then
		if (gotShards_HealStoneF == 0)
		then
--			CastSpellByName("생명석 창조");
		end;

		if (type(ExchangeThings_BeginTrade) == "function")
		then
			ExchangeThings_BeginTrade(gotShards_HealStone, 1);
			return;
		end;
	end;
	gotShards_ShowAlertMessage(GOTSHARDS_ERROR_EXCHANGETHINGSISNEEDED);
end

function gotShards_SortShards()
	PickupContainerItem(gotShards_SortQueue["shard"]["bag"][gotShards_AutoSortShard_Priority * (gotShards_NumSorting + 1) + (1 - 2 * gotShards_AutoSortShard_Priority) * gotShards_NowSorting], gotShards_SortQueue["shard"]["slot"][gotShards_AutoSortShard_Priority * (gotShards_NumSorting + 1) + (1 - 2 * gotShards_AutoSortShard_Priority) * gotShards_NowSorting]);
	PickupContainerItem(gotShards_SortQueue["other"]["bag"][gotShards_NowSorting], gotShards_SortQueue["other"]["slot"][gotShards_NowSorting]);
	gotShards_NowSorting = gotShards_NowSorting - 1;
end



function gotShards_ActivateShard()
end;

function gotShards_ActivateSoulStone()
	if (gotShards_SoulStone == 1)
	then
		if ((UnitName("target") ~= nil) and UnitIsPlayer("target") and UnitIsFriend("player", "target"))
		then
			UseContainerItem(gotShards_SoulStoneIndex, gotShards_SoulStoneSlot);
			if (gotShards_SoulStoneAlert_Group == 1)
			then
				gotShards_ShowAlertMessage_Group(format(GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE30, UnitName("target")));
			end;
		end;
	else
--		CastSpellByName("영혼석 창조");
	end;
end;

function gotShards_ActivateHealStone()
	if (gotShards_HealStoneF == 1)
	then
		if ((UnitName("target") ~= nil) and UnitIsPlayer("target") and UnitIsFriend("player","target"))
		then
			gotShards_ExchangeHealStone();
		else
			UseContainerItem(gotShards_HealStoneIndex, gotShards_HealStoneSlot);
		end;
	else
--		CastSpellByName("생명석 창조");
	end;
end;




-- Add entry into cosmos configuration
function gotShards_RegisterCosmos()
	if (Cosmos_RegisterConfiguration) then

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS",
			"SECTION",
			GOTSHARDS_HEADER,
			GOTSHARDS_HEADER_INFO
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SECTION",
			"SEPARATOR",
			GOTSHARDS_SECTION_HEADER,
			GOTSHARDS_SECTION_HEADER_INFO
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_ENABLE",
			"CHECKBOX",
			GOTSHARDS_ENABLE, 
			GOTSHARDS_ENABLE_INFO,
			gotShards_Display,
			1,
			0
		);
		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_COLOR",
			"CHECKBOX",
			GOTSHARDS_COLOR,
			GOTSHARDS_COLOR_INFO,
			gotShards_Color_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_ALERTNUM", -- CVAr
			"SLIDER",
			GOTSHARDS_ALERTNUM,
			GOTSHARDS_ALERTNUM_INFO,
			gotShards_SetAlertNum,
			0,
			5,
			0,
			20,
			GOTSHARDS_ALERTNUM_NAME,
			1,
			1,
			GOTSHARDS_ALERTNUM_SUFFIX,
			1				
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_FULL",
			"CHECKBOX",
			GOTSHARDS_FULL,
			GOTSHARDS_FULL_INFO,
			gotShards_Full_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_RESET_POSITION",
			"BUTTON",
			GOTSHARDS_RESET_POSITION,
			GOTSHARDS_RESET_POSITION_INFO,
			gotShards_ResetPosition,
			0,
			0,
			0,
			0,
			GOTSHARDS_RESET_POSITION_NAME
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_AUTOSORTSHARD_SECTION",
			"SEPARATOR",
			GOTSHARDS_AUTOSORTSHARD_HEADER,
			GOTSHARDS_AUTOSORTSHARD_HEADER_INFO
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_AUTOSORTSHARD",
			"CHECKBOX",
			GOTSHARDS_AUTOSORTSHARD,
			GOTSHARDS_AUTOSORTSHARD_INFO,
			gotShards_AutoSortShard_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_AUTOSORTSHARD_BAG",
			"SLIDER",
			GOTSHARDS_AUTOSORTSHARD_BAG,
			GOTSHARDS_AUTOSORTSHARD_BAG_INFO,
			gotShards_AutoSortShard_Bag_Set,
			0,
			4,
			0,
			4,
			GOTSHARDS_AUTOSORTSHARD_BAG_NAME,
			1,
			1,
			GOTSHARDS_AUTOSORTSHARD_BAG_SUFFIX,
			1				
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_AUTOSORTSHARD_PRIORITY",
			"CHECKBOX",
			GOTSHARDS_AUTOSORTSHARD_PRIORITY,
			GOTSHARDS_AUTOSORTSHARD_PRIORITY_INFO,
			gotShards_AutoSortShard_Priority_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_AUTOSORTSHARD_BLANKONLY",
			"CHECKBOX",
			GOTSHARDS_AUTOSORTSHARD_BLANKONLY,
			GOTSHARDS_AUTOSORTSHARD_BLANKONLY_INFO,
			gotShards_AutoSortShard_BlankOnly_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONE_SECTION",
			"SEPARATOR",
			GOTSHARDS_SOULSTONE_HEADER,
			GOTSHARDS_SOULSTONE_HEADER_INFO
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERT",
			"CHECKBOX",
			GOTSHARDS_SOULSTONEALERT,
			GOTSHARDS_SOULSTONEALERT_INFO,
			gotShards_SoulStoneAlert_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERTSIZE",
			"SLIDER",
			GOTSHARDS_SOULSTONEALERTSIZE,
			GOTSHARDS_SOULSTONEALERTSIZE_INFO,
			gotShards_SoulStoneAlertSize,
			0,
			200,
			100,
			800,
			GOTSHARDS_SOULSTONEALERTSIZE_NAME,
			1,
			1,
			"%",
			1				
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERTSOUND",
			"CHECKBOX",
			GOTSHARDS_SOULSTONEALERTSOUND,
			GOTSHARDS_SOULSTONEALERTSOUND_INFO,
			gotShards_SoulStoneAlertSound_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERTTEST",
			"BUTTON",
			GOTSHARDS_SOULSTONEALERTTEST,
			GOTSHARDS_SOULSTONEALERTTEST_INFO,
			gotShards_SoulStoneAlertTest,
			0,
			0,
			0,
			0,
			GOTSHARDS_SOULSTONEALERTTEST_NAME
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERT5",
			"CHECKBOX",
			GOTSHARDS_SOULSTONEALERT5,
			GOTSHARDS_SOULSTONEALERT5_INFO,
			gotShards_SoulStoneAlert5_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERT2",
			"CHECKBOX",
			GOTSHARDS_SOULSTONEALERT2,
			GOTSHARDS_SOULSTONEALERT2_INFO,
			gotShards_SoulStoneAlert2_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERT0",
			"CHECKBOX",
			GOTSHARDS_SOULSTONEALERT0,
			GOTSHARDS_SOULSTONEALERT0_INFO,
			gotShards_SoulStoneAlert0_Toggle,
			1
			);

		Cosmos_RegisterConfiguration(
			"COS_GOTSHARDS_SOULSTONEALERT_GROUP",
			"CHECKBOX",
			GOTSHARDS_SOULSTONEALERT_GROUP,
			GOTSHARDS_SOULSTONEALERT_GROUP_INFO,
			gotShards_SoulStoneAlert_Group_Toggle,
			1
			);
	else
		DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_BEGIN_MSG, 1, 1, 0);
	end

	SlashCmdList["GOTSHARDS"] = function(msg)
		if (msg == "")
		then
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP10, 1, 1, 0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP21, 1, 1, 0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP31, 1, 1, 0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP32, 1, 1, 0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP33, 1, 1, 0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP34, 1, 1, 0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_HELP41, 1, 1, 0);
		elseif (msg == "켜기")
		then
			gotShards_Display(1);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_DISPLAY_ON_MSG);
		elseif (msg == "끄기")
		then
			gotShards_Display(0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_DISPLAY_OFF_MSG);
		elseif (msg == "정리")
		then
			gotShards_NowSorting = 0;
			gotShards_Count();
			gotShards_NowSorting = math.min(gotShards_SortQueue["shard"]["bag"]["size"], gotShards_SortQueue["other"]["bag"]["size"]);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_AUTOSORTSHARD_FORCESORT_MSG);
		elseif (msg == "정리 켜기")
		then
			gotShards_AutoSortShard_Toggle(1);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_AUTOSORTSHARD_ON_MSG);
		elseif (msg == "정리 끄기")
		then
			gotShards_AutoSortShard_Toggle(0);
			DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_AUTOSORTSHARD_OFF_MSG);
		elseif (string.find(msg, "정리가방"))
		then
			local n = tonumber(string.sub(msg, 14, 15));
			if (msg == "정리가방")
			then
				DEFAULT_CHAT_FRAME:AddMessage(format(GOTSHARDS_AUTOSORTSHARD_BAG_MSG, gotShards_AutoSortShardBag, GetBagName(gotShards_AutoSortShardBag)));
			elseif (n >= 0 and n <= 4)
			then
				gotShards_AutoSortShard_Bag_Set(0, n);
				DEFAULT_CHAT_FRAME:AddMessage(format(GOTSHARDS_AUTOSORTSHARD_BAG_MSG, gotShards_AutoSortShardBag, GetBagName(gotShards_AutoSortShardBag)));
			else
				SlashCmdList["GOTSHARDS"]("");
			end;
		elseif (msg == "정리빈칸")
		then
			if (gotShards_AutoSortShards_BlankOnly == 1)
			then
				gotShards_AutoSortShard_BlankOnly_Toggle(0);
				DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_AUTOSORTSHARD_NOT_BLANKONLY_MSG);
			else
				gotShards_AutoSortShard_BlankOnly_Toggle(1);
				DEFAULT_CHAT_FRAME:AddMessage(GOTSHARDS_AUTOSORTSHARD_BLANKONLY_MSG);
			end;
		elseif (msg == "생석거래" or msg == "생명석거래")
		then
			gotShards_ExchangeHealStone();
		else
			SlashCmdList["GOTSHARDS"]("");
		end;
	end;
	SLASH_GOTSHARDS1 = "/조각";
	SLASH_GOTSHARDS2 = "/gshard";
end

function gotShards_Display(toggle)

	if (UnitClass("Player") == GOTSHARDS_NAME_OF_WARLOCK)
	then
		gotShards_AmIWarlock = 1;
		gotShardsFrame:Show();
	else
		gotShards_AmIWarlock = 0;
		gotShardsFrame:Hide();
	end

	if ( toggle == 1 and gotShards_AmIWarlock == 1) then 
		gotShardsFrame:Show();
		gotShards_DisplayFlag = 1;
	else
		gotShardsFrame:Hide();
		gotShards_DisplayFlag = 0;
	end

end

function gotShards_Color_Toggle(toggle)
	if (toggle) then
		gotShards_Color = toggle;
	else
		gotShards_Color = 1 - gotShards_Color;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_COLOR_X",CSM_CHECKONOFF,gotShards_Color);
	end
end

function gotShards_Full_Toggle(toggle)
	if (toggle) then
		gotShards_Full = toggle;
	else
		gotShards_Full = 1 - gotShards_Full;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_FULL_X",CSM_CHECKONOFF,gotShards_Full);
	end
end

function gotShards_AutoSortShard_Toggle(toggle)
	if (toggle) then
		gotShards_AutoSortShard = toggle;
	else
		gotShards_AutoSortShard = 1 - gotShards_AutoSortShard;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_AUTOSORTSHARD_X",CSM_CHECKONOFF,gotShards_AutoSortShard);
	end
end

function gotShards_AutoSortShard_Bag_Set(checked,value)
	gotShards_AutoSortShardBag = value;
	gotShards_NowSorting = 0;
	gotShards_Count();
end

function gotShards_AutoSortShard_BlankOnly_Toggle(toggle)
	if (toggle) then
		gotShards_AutoSortShard_BlankOnly = toggle;
	else
		gotShards_AutoSortShard_BlankOnly = 1 - gotShards_AutoSortShard_BlankOnly;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_AUTOSORTSHARD_BLANKONLY_X",CSM_CHECKONOFF,gotShards_AutoSortShard_BlankOnly);
	end
end

function gotShards_AutoSortShard_Priority_Toggle(toggle)
	if (toggle) then
		gotShards_AutoSortShard_Priority = toggle;
	else
		gotShards_AutoSortShard_Priority = 1 - gotShards_AutoSortShard_Priority;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_AUTOSORTSHARD_PRIORITY_X",CSM_CHECKONOFF,gotShards_AutoSortShard_Priority);
	end
end

function gotShards_SoulStoneAlert_Toggle(toggle)
	if (toggle) then
		gotShards_SoulStoneAlertFlag = toggle;
	else
		gotShards_SoulStoneAlertFlag = 1 - gotShards_SoulStoneAlertFlag;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_SOULSTONEALERT_X",CSM_CHECKONOFF,gotShards_SoulStoneAlertFlag);
	end
end

function gotShards_SoulStoneAlert5_Toggle(toggle)
	if (toggle) then
		gotShards_SoulStoneAlert5Flag = toggle;
	else
		gotShards_SoulStoneAlert5Flag = 1 - gotShards_SoulStoneAlert5Flag;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_SOULSTONEALERT5_X",CSM_CHECKONOFF,gotShards_SoulStoneAlert5Flag);
	end
end

function gotShards_SoulStoneAlert2_Toggle(toggle)
	if (toggle) then
		gotShards_SoulStoneAlert2Flag = toggle;
	else
		gotShards_SoulStoneAlert2Flag = 1 - gotShards_SoulStoneAlert2Flag;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_SOULSTONEALERT2_X",CSM_CHECKONOFF,gotShards_SoulStoneAlert2Flag);
	end
end

function gotShards_SoulStoneAlert0_Toggle(toggle)
	if (toggle) then
		gotShards_SoulStoneAlert0Flag = toggle;
	else
		gotShards_SoulStoneAlert0Flag = 1 - gotShards_SoulStoneAlert0Flag;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_SOULSTONEALERT0_X",CSM_CHECKONOFF,gotShards_SoulStoneAlert0Flag);
	end
end

function gotShards_SoulStoneAlertTest(setval, checked)
	gotShards_ShowAlertMessage(GOTSHARDS_SOULSTONEALERTTESTMESSAGE);
end

function gotShards_SoulStoneAlertSize(checked, value)
	gotShardsMessageText:SetTextHeight(16/100 *value);
	gotShards_AlertMessageSize = value;
end

function gotShards_SoulStoneAlertSound_Toggle(toggle)
	if (toggle) then
		gotShards_SoulStoneAlertSound = toggle;
	else
		gotShards_SoulStoneAlertSound = 1 - gotShards_SoulStoneAlertSound;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_SOULSTONEALERTSOUND_X",CSM_CHECKONOFF,gotShards_SoulStoneAlertSound);
	end
end

function gotShards_SoulStoneAlert_Group_Toggle(toggle)
	if (toggle) then
		gotShards_SoulStoneAlert_Group = toggle;
	else
		gotShards_SoulStoneAlert_Group = 1 - gotShards_SoulStoneAlert_Group;
	end
	if (Cosmos_UpdateValue) then
		Cosmos_UpdateValue("COS_GOTSHARDS_SOULSTONEALERT_GROUP_X",CSM_CHECKONOFF,gotShards_SoulStoneAlert_Group);
	end
end

function gotShards_ResetPosition(setval, checked)
	gotShardsFrame:ClearAllPoints();
	gotShardsFrame:SetPoint("TOPLEFT", "PlayerFrame", "BOTTOMLEFT", 25, 20);
end

function gotShards_SetAlertNum(checked,value)
	gotShards_AlertNum = value;
	gotShards_Count();
end