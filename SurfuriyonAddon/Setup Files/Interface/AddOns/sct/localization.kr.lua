
if ( GetLocale() == "koKR" ) then

	--Version
	SCT_Version = "4.131";
	SCT_EXAMPLE = "SCT";
	SCT_MSG_EXAMPLE = "전투 메세지 확장 메세지";

	--Everything From here on would need to be translated and put
	--into if statements for each specific language.

	--***********
	--KOREAN
	--***********

	-- Static Messages
	SCT_LowHP= "체력 낮음!";			-- Message to be displayed when HP is low
	SCT_LowMana= "마나 낮음!";			-- Message to be displayed when Mana is Low
	SCT_SelfFlag = "*";						-- Icon to show self hits
	SCT_Combat = "+전투중";				-- Message to be displayed when entering combat
	SCT_NoCombat = "-비전투";			-- Message to be displayed when leaving combat
	SCT_ComboPoint = "연계";			  		-- Message to be displayed when gaining a combo point
	SCT_FiveCPMessage = "연계 다모임!"; -- Message to be displayed when you have 5 combo points
	SCT_ExecuteMessage = "마무리 일격 가능!"; -- Message to be displayed when time to execute
	SCT_WrathMessage = "천벌의 망치 가능!"; -- Message to be displayed when time Wrath

	--Option messages
	SCT_STARTUP = "전투 메세지 확장 "..SCT_Version.." 이 로드되었습니다. /전투메세지설정 명령으로 설정 창을 열 수 있습니다.";
	SCT_Option_Crit_Tip = "이 전투 상황 메세지를 치명타 메세지와 같은 형태로 표시합니다.";
	SCT_Option_Msg_Tip = "이 전투상황을 화면 위에 크게 표시합니다.";

	--Warnings
	SCT_Version_Warning= "|cff00ff00전투메세지 확장 경고|r\n\n전투메세지 확장 설정 파일이 현재 버전과 일치하지 않습니다. 에러 또는 비정상적인 작동을 해결하려면, 초기화 버튼을 누르거나 /전투메세지초기화 명령어를 입력하여 설정을 초기화 해주세요.";
	SCT_Load_Error = "|cff00ff00전투메세지 설정 로딩 오류입니다. 설정이 적용되지 않았습니다.|r 오류: ";

	--nouns
	SCT_TARGET = "대상이 ";
	SCT_PROFILE = "전투 메세지 확장 프로파일 로딩: |cff00ff00";
	SCT_PROFILE_DELETE = "전투 메세지 확장 프로파일 삭제: |cff00ff00";
	SCT_PROFILE_NEW = "전투 메세지 확장 새 프로파일: |cff00ff00";
	SCT_WARRIOR = "전사";
	SCT_ROGUE = "도적";
	SCT_HUNTER = "사냥꾼";
	SCT_MAGE = "마법사";
	SCT_WARLOCK = "흑마법사";
	SCT_DRUID = "드루이드";
	SCT_PRIEST = "사제";
	SCT_SHAMAN = "주술사";
	SCT_PALADIN = "성기사";

	--Useage
	SCT_DISPLAY_USEAGE = "사용법: \n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "/전투메세지 '할말' (하얀색으로 표시)\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "/전투메세지 '할말' 빨간색(0-10) 녹색(0-10) 파란색(0-10)\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "예: /전투메세지 '치료좀' 10 0 0\n밝은 빨간색으로 '치료좀' 이라는 문구를 표시합니다.\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "색 예제: 빨간색 = 10 0 0, 녹색 = 0 10 0, 파란색 = 0 0 10,\n노란색 = 10 10 0, 보라색 = 10 0 10, 하늘색 = 0 10 10";

	--Event and Damage option values
	SCT_OPTION_EVENT1 = {name = "피해량", tooltipText = "근접 및 기타(화염, 낙하, 등등...) 피해를 표시합니다."};
	SCT_OPTION_EVENT2 = {name = "빗맞힘", tooltipText = "근접공격 빗맞힘 메세지 표시합니다."};
	SCT_OPTION_EVENT3 = {name = "피함", tooltipText = "근접공격 피함 메세지를 표시합니다."};
	SCT_OPTION_EVENT4 = {name = "막음", tooltipText = "근접공격 막음 메세지를 표시합니다."};
	SCT_OPTION_EVENT5 = {name = "방어함", tooltipText = "근접공격 방어함 메세지를 표시합니다."};
	SCT_OPTION_EVENT6 = {name = "주문 피해량", tooltipText = "주문에 의한 피해를 표시합니다."};
	SCT_OPTION_EVENT7 = {name = "치유량", tooltipText = "주문에 의한 치유량을 표시합니다."};
	SCT_OPTION_EVENT8 = {name = "주문 저항", tooltipText = "주문에 대한 저항 메세지를 표시합니다."};
	SCT_OPTION_EVENT9 = {name = "디버프 걸림", tooltipText = "디버프에 걸렸을 때 표시합니다."};
	SCT_OPTION_EVENT10 = {name = "흡수함", tooltipText = "몹의 데미지를 흡수할 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT11 = {name = "체력 낮음", tooltipText = "체력이 낮은 상태일 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT12 = {name = "마나 낮음", tooltipText = "마나가 낮은 상태일 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT13 = {name = "기력/분노 생성", tooltipText = "물약,아이템,버프 등으로 인해\n마나, 분노, 기력등이 생성될 때\n메세지를 표시합니다.(정기적인 생성은 제외)"};
	SCT_OPTION_EVENT14 = {name = "전투중 상태", tooltipText = "전투중 상태에 들어가거나\n전투중 상태를 벗어날 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT15 = {name = "연계 포인트", tooltipText = "연계 포인트가 모일때 메세지를 표시합니다."};
	SCT_OPTION_EVENT16 = {name = "명예 점수 획득", tooltipText = "명예 점수를 획득시 메세지를 표시합니다."};
	SCT_OPTION_EVENT17 = {name = "버프 걸림", tooltipText = "버프에 걸렸을 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT18 = {name = "버프 사라짐", tooltipText = "버프가 사라질 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT19 = {name = "마격/천벌의 망치", tooltipText = "마무리 일격 또는 천벌의 망치가 사용가능할 때 메세지를 표시합니다. (전사/성기사 전용)"};
	SCT_OPTION_EVENT20 = {name = "평판", tooltipText = "평판을 획득하거나 또는 평판이 감소할 때 메세지를 표시합니다."};
	SCT_OPTION_EVENT21 = {name = "자신이 치유한 양", tooltipText = "다른 사람에게 얼마나 치유를 했는지를 표시합니다."};
	SCT_OPTION_EVENT22 = {name = "숙련도 상승", tooltipText = "기술에 대한 숙련도가 증가했을 때 표시합니다."};

	--Check Button option values
	SCT_OPTION_CHECK1 = { name = "전투 메시지 확장 켜기", tooltipText = "전투 메세지 확장 기능을 사용합니다."};
	SCT_OPTION_CHECK2 = { name = "메세지에 * 테두리 표시", tooltipText = "전투 메세지에 * 표 테두리를 표시합니다."};
	SCT_OPTION_CHECK3 = { name = "치유한 사람 표시", tooltipText = "당신에게 누가 어떤 주문으로 치유를 했는지 표시합니다."};
	SCT_OPTION_CHECK4 = { name = "메세지 아래로 스크롤", tooltipText = "전투 메세지가 위에서 아래 방향으로 스크롤 됩니다."};
	SCT_OPTION_CHECK5 = { name = "치명타 메세지 고정", tooltipText = "치명타 및 극대화 메세지를 자신의 머리 위치에 고정시킵니다."};
	SCT_OPTION_CHECK6 = { name = "피해 주문 속성 표시", tooltipText = "피해 주문의 속성을 표시합니다."};
	SCT_OPTION_CHECK7 = { name = "피해량에 쓰이는 글꼴 변경", tooltipText = "피해량에 쓰이는 글꼴을 전투메세지 확장에서 사용중인 글꼴로 변경합니다.\n\n알림: 이 기능을 적용하려면 설정 후 반드시 재접속 해야합니다. UI 재실행으로는 작동하지 않습니다."};
	SCT_OPTION_CHECK8 = { name = "모든 생성 표시", tooltipText = "전투창에 표시되지 않는 마나/기력/분노 생성도 모두 표시합니다.\n\n알림: 정규 생성 이벤트에 의존성을 가지고 작동하기 때문에 스팸성이 매우 강합니다. 그리고 드루이드가 변신 직후 다시 변신을 풀 때 종종 오작동 하는 경우가 있습니다."};
	SCT_OPTION_CHECK9 = { name = "독립적 FPS 모드", tooltipText = "동작 속도를 자신의 FPS에 맞추어 변경합니다. 옵션을 켰을 때, 시스템 사양이 낮거나 랙이 심한 상황에서 스크롤 애니메이션이 보다 고정적이고 빠르게 올라갑니다."};
	SCT_OPTION_CHECK10 = { name = "과도한 치유량 표시", tooltipText = "자신 또는 대상에게 얼마나 과도한 치유를 하는지 표시합니다. '자신이 치유한 양' 설정에 의존성을 가지고 있습니다."};

	--Slider options values
	SCT_OPTION_SLIDER1 = { name="메세지 스크롤 속도조정", minText="빠름", maxText="느림", tooltipText = "글씨 스크롤 속도를 조정합니다."};
	SCT_OPTION_SLIDER2 = { name="글씨 크기", minText="작음", maxText="큼", tooltipText = "글씨 크기를 조정합니다."};
	SCT_OPTION_SLIDER3 = { name=" ", minText="10%", maxText="90%", tooltipText = "체력이 몇 % 가 되면 경고 메세지를 출력할 지 조정합니다."};
	SCT_OPTION_SLIDER4 = { name="  ",  minText="10%", maxText="90%", tooltipText = "마나가 몇 % 가 되면 경고 메세지를 출력할 지 조정합니다."};
	SCT_OPTION_SLIDER5 = { name="글씨 투명도", minText="0%", maxText="100%", tooltipText = "글씨의 투명도를 조정합니다."};
	SCT_OPTION_SLIDER6 = { name="메세지 스크롤 거리조정", minText="작게", maxText="크게", tooltipText = "각 메세지가 갱신될 때 글자의 스크롤 범위를 조정합니다."};
	SCT_OPTION_SLIDER7 = { name="글자 X 좌표 위치", minText="-300", maxText="300", tooltipText = "글자의 중심축이 위치할 곳을 조정합니다."};
	SCT_OPTION_SLIDER8 = { name="글자 Y 좌표 위치", minText="-300", maxText="300", tooltipText = "글자의 중심축이 위치할 곳을 조정합니다."};
	SCT_OPTION_SLIDER9 = { name="메세지 X 좌표 위치", minText="-600", maxText="600", tooltipText = "메세지 중심축의 위치를 조정합니다."};
	SCT_OPTION_SLIDER10 = { name="메세지 Y 좌표 위치", minText="-600", maxText="600", tooltipText = "메세지 중심축의 위치를 조정합니다."};
	SCT_OPTION_SLIDER11 = { name="메세지 사라짐 속도", minText="빠르게", maxText="느리게", tooltipText = "메세지가 사라질 때 속도를 조정합니다."};
	SCT_OPTION_SLIDER12 = { name="메세지 크기", minText="작게", maxText="크게", tooltipText = "메세지의 크기를 조정합니다."};

	--Misc option values
	SCT_OPTION_MISC1 = {name="전투 메세지 설정 "..SCT_Version};
	SCT_OPTION_MISC2 = {name="전투 상황 설정"};
	SCT_OPTION_MISC3 = {name="글자 설정"};
	SCT_OPTION_MISC4 = {name="기타 설정"};
	SCT_OPTION_MISC5 = {name="경고 설정"};
	SCT_OPTION_MISC6 = {name="글자 움직임 설정"};
	SCT_OPTION_MISC7 = {name="프로파일 선택"};
	SCT_OPTION_MISC8 = {name="저장 & 닫기", tooltipText = "현재 모든 설정을 저장하고 설정창을 닫습니다."};
	SCT_OPTION_MISC9 = {name="초기화", tooltipText = "-경고-\n\n정말로 전투메세지 확장의 설정을 초기화 하시겠습니까?"};
	SCT_OPTION_MISC10 = {name="선택", tooltipText = "다른 캐릭터의 프로파일을 선택합니다."};
	SCT_OPTION_MISC11 = {name="불러오기", tooltipText = "다른 캐릭터의 프로파일을 이 캐릭터의 프로파일로 불러옵니다."};
	SCT_OPTION_MISC12 = {name="삭제", tooltipText = "캐릭터 프로파일을 삭제합니다."}; 
	SCT_OPTION_MISC13 = {name="취소", tooltipText = "선택을 취소합니다."};
	SCT_OPTION_MISC14 = {name="글자", tooltipText = ""};
	SCT_OPTION_MISC15 = {name="메세지", tooltipText = ""};
	SCT_OPTION_MISC16 = {name="메세지 설정"};
	SCT_OPTION_MISC17 = {name="주문 설정"};
	SCT_OPTION_MISC18 = {name="그밖의 주문 설정", tooltipText = ""};
	SCT_OPTION_MISC19 = {name="주문들", tooltipText = ""};

	--Fonts
	SCT_FONTS = { 
		[1] = { name="기본값", path="Fonts\\2002.TTF"},
		[2] = { name="TwCenMT", path="Interface\\Addons\\sct\\fonts\\Tw_Cen_MT_Bold.TTF"},
		[3] = { name="Adventure", path="Interface\\Addons\\sct\\fonts\\Adventure.ttf"},
		[4] = { name="Enigma", path="Interface\\Addons\\sct\\fonts\\Enigma__2.TTF"},
	}

	--Animation Types
	SCT_OPTION_SELECTION1 = { name="움직임 형태", tooltipText = "글자의 움직임 형태를 선택합니다.", table = {[1] = "세로 (보통)",[2] = "무지개",[3] = "가로",[4] = "모나게"}};
	SCT_OPTION_SELECTION2 = { name="옆면 스크롤 형태", tooltipText = "옆면의 움직이는 글자의 표시형태를 설정합니다.", table = {[1] = "교차",[2] = "피해량을 왼쪽에",[3] = "피해량을 오른쪽에"}};
	SCT_OPTION_SELECTION3 = { name="글꼴", tooltipText = "사용할 글꼴을 선택합니다.", table = {[1] = SCT_FONTS[1].name,[2] = SCT_FONTS[2].name,[3] = SCT_FONTS[3].name,[4] = SCT_FONTS[4].name}};
	SCT_OPTION_SELECTION4 = { name="글꼴 테두리", tooltipText = "글꼴의 테두리 형태를 선택합니다.", table = {[1] = "없음",[2] = "얇게",[3] = "두껍게"}};
	SCT_OPTION_SELECTION5 = { name="메세지 글꼴", tooltipText = "메세지에 쓰일 글꼴을 선택합니다.", table = {[1] = SCT_FONTS[1].name,[2] = SCT_FONTS[2].name,[3] = SCT_FONTS[3].name,[4] = SCT_FONTS[4].name}};
	SCT_OPTION_SELECTION6 = { name="메세지 글꼴 테두리", tooltipText = "메세지의 테두리 형태를 선택합니다.", table = {[1] = "없음",[2] = "얇게",[3] = "두껍게"}};

	-- Cosmos button
	SCT_CB_NAME			= "전투 메세지 확장";
	SCT_CB_SHORT_DESC	= "Greyhoof 제작";
	SCT_CB_LONG_DESC	= "유용한 전투 메세지를 팝업 시킵니다. - 사용해 보세요!";
	SCT_CB_ICON			= "Interface\\Icons\\Spell_Shadow_EvilEye"; -- "Interface\\Icons\\Spell_Shadow_FarSight"

end