-- Korean translations

if (GetLocale() == "koKR") then
    BINDING_HEADER_FLIGHTMAP = "FlightMap";
    BINDING_NAME_FLIGHTMAP   = "비행경로 보기";

    FLIGHTMAP_NAME          = "FlightMap";
    FLIGHTMAP_DESCRIPTION   = "월드맵에 비행경로를 표시합니다.";
    FLIGHTMAP_ALLIANCE      = "얼라이언스";
    FLIGHTMAP_HORDE         = "호드";
    FLIGHTMAP_CONTESTED     = "Contested";

    -- Zone names
    FLIGHTMAP_MOONGLADE     = "달의 숲";
    FLIGHTMAP_ELWYNN        = "엘윈 숲";
    FLIGHTMAP_DUNMOROGH     = "던 모로";
    FLIGHTMAP_TIRISFAL      = "티리스팔 숲";
    FLIGHTMAP_LOCHMODAN     = "모단 호수";
    FLIGHTMAP_SILVERPINE    = "은빛소나무 숲";
    FLIGHTMAP_WESTFALL      = "서부 몰락지대";
    FLIGHTMAP_REDRIDGE      = "붉은마루 산맥";
    FLIGHTMAP_DUSKWOOD      = "그늘숲";
    FLIGHTMAP_HILLSBRAD     = "힐스브래드 구릉지";
    FLIGHTMAP_WETLANDS      = "저습지";
    FLIGHTMAP_ALTERAC       = "알터랙 산맥";
    FLIGHTMAP_ARATHI        = "아라시 고원";
    FLIGHTMAP_STRANGLETHORN = "가시덤불 골짜기";
    FLIGHTMAP_BADLANDS      = "황야의 땅";
    FLIGHTMAP_SORROWS       = "슬픔의 늪";
    FLIGHTMAP_HINTERLANDS   = "동부 내륙지";
    FLIGHTMAP_SEARINGGORGE  = "이글거리는 협곡";
    FLIGHTMAP_BLASTEDLANDS  = "저주받은 땅";
    FLIGHTMAP_BURNINGSTEPPE = "불타는 평원";
    FLIGHTMAP_WESTERNPLAGUE = "서부 역병지대";
    FLIGHTMAP_EASTERNPLAGUE = "동부 역병지대";
    FLIGHTMAP_DUROTAR       = "듀로타";
    FLIGHTMAP_MULGORE       = "멀고어";
    FLIGHTMAP_DARKSHORE     = "어둠의 해안";
    FLIGHTMAP_BARRENS       = "불모의 땅";
    FLIGHTMAP_STONETALON    = "돌발톱 산맥";
    FLIGHTMAP_ASHENVALE     = "잿빛 골짜기";
    FLIGHTMAP_1KNEEDLES     = "버섯구름 봉우리";
    FLIGHTMAP_DESOLACE      = "잊혀진 땅";
    FLIGHTMAP_DUSTWALLOW    = "먼지진흙 습지대";
    FLIGHTMAP_FERALAS       = "페랄라스";
    FLIGHTMAP_TANARIS       = "타나리스";
    FLIGHTMAP_AZSHARA       = "아즈샤라";
    FLIGHTMAP_FELWOOD       = "악령의 숲";
    FLIGHTMAP_UNGOROCRATER  = "운고로 분화구";
    FLIGHTMAP_SILITHUS      = "실리더스";
    FLIGHTMAP_WINTERSPRING  = "여명의 설원";
    FLIGHTMAP_TELDRASSIL    = "텔드랏실";
    FLIGHTMAP_DEADWINDPASS  = "죽음의 고개";
    FLIGHTMAP_ORGRIMMAR     = "오그리마";
    FLIGHTMAP_UNDERCITY     = "언더시티";
    FLIGHTMAP_THUNDERBLUFF  = "썬더블러프";
    FLIGHTMAP_IRONFORGE     = "아이언포지";
    FLIGHTMAP_STORMWIND     = "스톰윈드";

    -- General strings
    FLIGHTMAP_TIMING        = "(측정중)";
    FLIGHTMAP_LEVELS        = "|cff00ff00레벨: %d - %d|r";
    FLIGHTMAP_NOFLIGHTS     = "가지 않은 경로!";    -- TODO translate
    FLIGHTMAP_NOT_KNOWN     = "(모르는 곳)";    -- TODO translate
    FLIGHTMAP_NO_COST       = "무료";           -- TODO translate
    FLIGHTMAP_MONEY_GOLD    = "G";              -- TODO translate
    FLIGHTMAP_MONEY_SILVER  = "S";              -- TODO translate
    FLIGHTMAP_MONEY_COPPER  = "C";              -- TODO translate
    FLIGHTMAP_FLIGHTTIME    = "비행 시간: ";  -- TODO translate
    FLIGHTMAP_QUICKEST      = "빠른 경로";  -- TODO translate
    FLIGHTMAP_TOTAL_TIME    = "총 시간";     -- TODO translate
    FLIGHTMAP_VIA           = "경유: ";           -- TODO translate
    FLIGHTMAP_CONFIRM       = "정말 %s(|cff00ff00%s|r)로 이동하시겠습니까?";
    FLIGHTMAP_CONFIRM_TIME  = "비행시간 - ";

    -- Command strings
    FLIGHTMAP_RESET         = "초기화";  -- TODO translate
    FLIGHTMAP_SHOWMAP       = "열기";   -- TODO translate
    FLIGHTMAP_LOCKTIMES     = "고정";   -- TODO translate
    FLIGHTMAP_GETHELP       = "도움말";   -- TODO translate

    -- Help text        TODO translate
    FLIGHTMAP_TIMER_HELP    =
        "SHIFT키를 누른채로 드래그하여 위치를 이동할 수 있습니다.";
    FLIGHTMAP_SUBCOMMANDS   = {
        [FLIGHTMAP_RESET]       = "이동시간 표시바 위치를 초기화합니다.",
        [FLIGHTMAP_SHOWMAP]     = "플라이트맵 창을 엽니다.",
        [FLIGHTMAP_GETHELP]     = "도움말을 봅니다.",
    };

    -- Locked/unlocked status           TODO translate
    FLIGHTMAP_TIMESLOCKED   = {
        [true] = "비행시간이 더이상 저장되지 않습니다.",
        [false] = "비행시간을 저장합니다.",
    };

    -- Option strings
    FLIGHTMAP_OPTIONS_CLOSE = "닫기";             -- TODO translate
    FLIGHTMAP_OPTIONS_TITLE = "플라이트맵 설정"; -- TODO translate
    FLIGHTMAP_OPTIONS = {};
    FLIGHTMAP_OPTIONS[1] = {   -- Option 1: flight path lines
        label = "비행 경로",
        option = "showPaths",
        tooltip = "비행 경로를 월드맵에 표시해줍니다.",
    };
    FLIGHTMAP_OPTIONS[2] = {   -- Option 2: extra POI buttons
        label = "비행장 아이콘 표시",
        option = "showPOIs",
        tooltip = "비행장의 위치를 아이콘으로 표시해줍니다.",
    };
    FLIGHTMAP_OPTIONS[3] = {   -- Option 3: Unknown masters
        label = "모든 정보 보기",
        option = "showAllInfo",
        tooltip = "비행경로를 알 수 없어도 모두 보여줍니다.",
    };
    FLIGHTMAP_OPTIONS[4] = {   -- Option 4: Auto-Dismount
        label = "탈것 내리기",
        option = "autoDismount",
        tooltip = "조련사 클릭시 자동으로 탈 것에서 내립니다.",
    };
    FLIGHTMAP_OPTIONS[5] = {   -- Option 5: flight timers
        label = "비행 시간 타이머",
        option = "useTimer",
        tooltip = "비행 시간을 잽니다.",
    };

    FLIGHTMAP_OPTIONS[6] = {   -- Option 6: Show flight destinations
        label = "비행경로 설명 보기",
        option = "showDestinations",
        tooltip = "비행경로 툴팁에 시간/비용을 표시합니다.",
        children = {7, 8, 9},
    };
    FLIGHTMAP_OPTIONS[7] = {   -- Option 7: Show multi-hop destinations
        label = "경유 이동경로 표시",
        option = "showMultiHop",
        tooltip = "툴팁에 경유 이동경로를 표시합니다.",
    };
    FLIGHTMAP_OPTIONS[8] = {   -- Option 8: Show flight times
        label = "비행 시간 표시",
        option = "showTimes",
        tooltip = "비행 시간을 툴팁에 보여줍니다.",
    };
    FLIGHTMAP_OPTIONS[9] = {   -- Option 9: Show flight costs
        label = "비행료 표시",
        option = "showCosts",
        tooltip = "비행료를 툴팁에 보여줍니다.",
    };
    FLIGHTMAP_OPTIONS[10] = {   -- Option 10: Taxi window extras
        label = "전체 비행경로 표시",
        option = "fullTaxiMap",
        tooltip = "한 번에 갈 수 없는 비행경로라도 모두 표시합니다.",
    };
    FLIGHTMAP_OPTIONS[11] = {   -- Option 11: Confirm flight destinations
        label = "비행경로 확인",
        option = "confirmFlights",
        tooltip = "선택한 경로로 날아가기 전에 확인 창을 표시합니다.확인을 눌러야만 비행을 시작합니다.",
    };

    -- These constants determine how "Town (Zone)" strings look.
    -- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
    -- is anything that is after Zone.
    FLIGHTMAP_SEP_STRING    = " (";
    FLIGHTMAP_SEP_POSTAMBLE = ")";
end
