-- gotShards? localizations for Korean by xenore


-- language-dependent variables

BEGIN_GOTSHARDS				= "[영혼 조각 도우미(gotShards) 0.83a]";

NAME_OF_SHARDS				= "영혼의 조각";
GOTSHARDS_NAME_OF_WARLOCK		= "흑마법사";
GOTSHARDS_HEALSTONE			= "생명석";
GOTSHARDS_SOULSTONEREADY		= "영혼석이 준비되었습니다";
GOTSHARDS_SOULSTONESPELL		= "영혼석 부활";
GOTSHARDS_SHARDBAG_SMALL		= "영혼의 주머니";
GOTSHARDS_SHARDBAG_MEDIUM		= "지옥매듭 가방";
GOTSHARDS_SHARDBAG_LARGE		= "화산핵 지옥매듭 가방";
GOTSHARDS_SHARDBAG_LOADING		= "소지품";

-- numeric variables

COOLDOWN_TIME_SOULSTONE			= 1800;


-- in-use messages

GOTSHARDS_SOULSTONEALERT_MESSAGE5	= "영혼석 재사용 5분 전";
GOTSHARDS_SOULSTONEALERT_MESSAGE2	= "영혼석 재사용 2분 전";
GOTSHARDS_SOULSTONEREADY_MESSAGE	= "영혼석이 준비되었습니다.";
GOTSHARDS_SOULSTONEALERTTESTMESSAGE	= "흑마법사 만세!";
GOTSHARDS_SOULSTONE_UNKNOWN		= "비활성";
GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE30 = "< %s >님께 영혼석을 겁니다.";
GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE5	= "%s의 영혼석 재사용까지 5분 남았습니다.";
GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE2	= "%s의 영혼석 재사용까지 2분 남았습니다.";
GOTSHARDS_SOULSTONEALERTGROUP_MESSAGE	= "%s의 영혼석이 재사용 가능합니다.";


-- error messages

GOTSHARDS_ERROR_EXCHANGETHINGSISNEEDED	= "ExchangeThings 애드온이 필요합니다.";

EXCHANGETHINGS_ERROR_NOITEM		= "오류 - %s이(가) 존재하지 않습니다.";
EXCHANGETHINGS_ERROR_NOENOUGHITEM	= "경고 - %s이(가) 충분하지 않습니다 : (%d / %d).";
EXCHANGETHINGS_ERROR_NOSLOT		= "오류 - %s을(를) 거래할 충분한 공간이 없습니다.";

-- for cosmos registration

GOTSHARDS_HEADER			= "조각은 챙기셨습니까?";
GOTSHARDS_HEADER_INFO			= "흑마용 영혼의 조각 카운터 및 이것저것... \n 제작 - 엘룬섭 [프리지아]";

GOTSHARDS_SECTION_HEADER		= "영혼의 조각 갯수 표시";
GOTSHARDS_SECTION_HEADER_INFO		= "영혼의 조각 갯수 표시에 관한 설정입니다."

GOTSHARDS_ENABLE			= "영혼의 조각 갯수 표시";
GOTSHARDS_ENABLE_INFO			= "영혼의 조각 갯수를 표시합니다.";

GOTSHARDS_COLOR				= "갯수에 따른 색상 경고";
GOTSHARDS_COLOR_INFO			= "조각의 갯수가 일정 갯수 이하이면 붉은 색으로 표시합니다.";
GOTSHARDS_ALERTNUM			= "경고할 조각 갯수 설정";
GOTSHARDS_ALERTNUM_INFO			= "이 갯수 이하의 조각이 있으면 붉게 표시합니다."
GOTSHARDS_ALERTNUM_NAME			= "갯수 설정";
GOTSHARDS_ALERTNUM_SUFFIX		= "개";

GOTSHARDS_FULL				= "가방 상태에 따른 색상 지정";
GOTSHARDS_FULL_INFO			= "가방이 가득 차서 더 이상 조각을 모을 수 없으면 회색으로 표시합니다.";

GOTSHARDS_RESET_POSITION		= "조각 표시 위치 초기화";
GOTSHARDS_RESET_POSITION_INFO		= "조각 표시 위치를 초기화합니다.";
GOTSHARDS_RESET_POSITION_NAME		= "초기화";

GOTSHARDS_AUTOSORTSHARD_HEADER		= "조각 자동 정리";
GOTSHARDS_AUTOSORTSHARD_HEADER_INFO	= "조각 자동 정리에 관한 설정입니다."

GOTSHARDS_AUTOSORTSHARD			= "조각 자동 정리기능 사용";
GOTSHARDS_AUTOSORTSHARD_INFO		= "조각 자동 정리기능을 사용합니다.\n영혼의 가방을 제외한 다른 가방에 있는 조각을 지정한 가방으로 모아줍니다.\n \"/조각 정리\"명령으로 수동 정리가 가능합니다.";
GOTSHARDS_AUTOSORTSHARD_BAG		= "조각이 모일 가방 지정";
GOTSHARDS_AUTOSORTSHARD_BAG_INFO	= "조각이 정리될 가방을 지정합니다. (주의 : 4번 가방이 맨 왼쪽입니다!)";
GOTSHARDS_AUTOSORTSHARD_BAG_NAME	= "0 = 맨 오른쪽(기본 소지품 가방)\n 4 = 맨 왼쪽";
GOTSHARDS_AUTOSORTSHARD_BAG_SUFFIX	= "번째 가방";
GOTSHARDS_AUTOSORTSHARD_PRIORITY	= "소지품 가방부터 정리";
GOTSHARDS_AUTOSORTSHARD_PRIORITY_INFO	= "표시하면 맨 오른쪽인 소지품 가방의 조각부터 정리하고, 표시하지 않으면 맨 왼쪽 가방의 조각부터 정리합니다.";
GOTSHARDS_AUTOSORTSHARD_BLANKONLY	= "빈 공간에만 정리";
GOTSHARDS_AUTOSORTSHARD_BLANKONLY_INFO	= "조각을 해당 가방의 빈 공간에만 정리합니다.\n표시를 해제하면 아이템과도 교환해서 정리합니다.\n주의 : 정리할 가방을 지정할 때는 반드시 이 표시를 켜시기를 권합니다."

GOTSHARDS_SOULSTONE_HEADER		= "영혼석 쿨타임 알림";
GOTSHARDS_SOULSTONE_HEADER_INFO		= "영혼석 쿨타임 알림에 대한 설정입니다.";

GOTSHARDS_SOULSTONEALERT		= "시간에 따른 영혼석 시간 색상 표시";
GOTSHARDS_SOULSTONEALERT_INFO		= "영혼석의 재사용 대기 시간이 5분 이하가 되면 붉은 색으로 표시합니다.";
GOTSHARDS_SOULSTONEALERT5		= "영혼석 재사용 5분전 알림";
GOTSHARDS_SOULSTONEALERT5_INFO		= "영혼석의 재사용 대기 시간이 5분이 되면 알려줍니다.";
GOTSHARDS_SOULSTONEALERT2		= "영혼석 재사용 2분전 알림";
GOTSHARDS_SOULSTONEALERT2_INFO		= "영혼석의 재사용 대기 시간이 2분이 되면 알려줍니다.";
GOTSHARDS_SOULSTONEALERT0		= "영혼석 재사용 알림";
GOTSHARDS_SOULSTONEALERT0_INFO		= "영혼석의 재사용 대기 시간이 끝나게 되면 알려줍니다.";
GOTSHARDS_SOULSTONEALERTZONE		= "지역표시로 알림";
GOTSHARDS_SOULSTONEALERTZONE_INFO	= "선택하면 재사용 대기시간의 알림을 지역표시로 알리고, 선택하지 않으면 작은 창으로 알려줍니다.";

GOTSHARDS_SOULSTONEALERTTEST		= "영혼석 재사용 알림 설정 시험해보기"
GOTSHARDS_SOULSTONEALERTTEST_INFO	= "영혼석 재사용 알림 설정 시험해보기";
GOTSHARDS_SOULSTONEALERTTEST_NAME	= "시험해보기";

GOTSHARDS_SOULSTONEALERTSIZE_NAME	= "16포인트 기준 크기";
GOTSHARDS_SOULSTONEALERTSIZE		= "영혼석 재사용 알림 크기";
GOTSHARDS_SOULSTONEALERTSIZE_INFO	= "영혼석 재사용 알림 크기를 설정합니다.";

GOTSHARDS_SOULSTONEALERTSOUND		= "영혼석 재사용 알림 소리 사용";
GOTSHARDS_SOULSTONEALERTSOUND_INFO	= "영혼석 재사용 알림시 소리 사용을 켜거나 끕니다.";

GOTSHARDS_SOULSTONEALERT_GROUP		= "파티/공격대에 영혼석 상태 알림";
GOTSHARDS_SOULSTONEALERT_GROUP_INFO	= "파티 혹은 공격대에 영혼석 상태를 알립니다.";

-- slash command help

GOTSHARDS_BEGIN_MSG			= "gotShards : /조각 명령을 통해 도움말을 볼 수 있습니다.";

GOTSHARDS_HELP10			= "gotShards - 흑마법사 영혼의 조각 갯수를 표시하는 애드온입니다.";
GOTSHARDS_HELP21			= "/조각 켜기|끄기      - 조각표시를 켜거나 끕니다.";
GOTSHARDS_HELP31			= "/조각 정리 켜기|끄기 - 조각 자동 정리 기능 사용을 켜거나 끕니다.";
GOTSHARDS_HELP32			= "/조각 정리   - 조각을 정리합니다.";
GOTSHARDS_HELP33			= "/조각 정리가방 <숫자> - <숫자>번째 가방을 정리 가방으로 지정합니다.\n"..
					  "/조각 정리가방 <숫자> - <숫자>번째 가방을 정리 가방으로 지정합니다.";
GOTSHARDS_HELP34			= "/조각 정리빈칸  - 빈 공간에만 조각 정리를 하게 하는 기능을 켜거나 끕니다.";
GOTSHARDS_HELP41			= "/조각 생석거래  - 지정된 대상에게 생명석을 거래합니다. 대상이 없거나 거래가 불가능하면 거래 대기모드가 됩니다.";

-- slash command message

GOTSHARDS_DISPLAY_ON_MSG		= "gotShards를 켜고 조각 갯수를 표시합니다.";
GOTSHARDS_DISPLAY_OFF_MSG		= "gotShards를 끄고 조각 갯수가 더 이상 표시하지 않습니다.";
GOTSHARDS_AUTOSORTSHARD_FORCESORT_MSG	= "조각 정리를 수행합니다.";
GOTSHARDS_AUTOSORTSHARD_ON_MSG		= "조각 정리 기능이 작동하게 됩니다.";
GOTSHARDS_AUTOSORTSHARD_OFF_MSG		= "조각 정리 기능이 더 이상 작동하지 않게 됩니다.";
GOTSHARDS_AUTOSORTSHARD_BAG_MSG		= "%d 번째 가방(%s)이 조각 정리 가방으로 지정되었습니다.";
GOTSHARDS_AUTOSORTSHARD_BLANKONLY_MSG	= "이제 빈 칸에만 조각을 정리하게 됩니다.";
GOTSHARDS_AUTOSORTSHARD_NOT_BLANKONLY_MSG="이제 아이템과 자리를 바꾸며 조각을 정리하게 됩니다.";

-- for cosmos registration(exchangethings)

GOTSHARDS_EXCHANGETHINGS_HEADER		= "생명석 자동 거래";
GOTSHARDS_EXCHANGETHINGS_HEADER_INFO	= "생명석 자동 거래를 위한 설정입니다.\n단축키 지정 혹은 '/조각 생석거래' 명령으로 사용합니다.";

GOTSHARDS_EXCHANGETHINGS_AUTOACCEPT	= "거래 후 자동으로 수락버튼 누르기";
GOTSHARDS_EXCHANGETHINGS_AUTOACCEPT_INFO= "생명석 자동거래를 사용하여 거래할 때 자동으로 수락버튼을 누를 지의 여부를 결정합니다. \n 생명석 자동거래를 사용할 때에만 적용됩니다.";

GOTSHARDS_EXCHANGETHINGS_SAFEAUTOACCEPT	= "안전한 자동수락(권장)";
GOTSHARDS_EXCHANGETHINGS_SAFEAUTOACCEPT_INFO
					= "생명석을 거래할 때 어느 한 쪽의 거래 품목에 돈이 있다면 자동수락을 하지 않습니다. \n 안전한 거래를 위해 이 기능을 사용하시기를 권장합니다.";


-- Bindings

BINDING_HEADER_GOTSHARDS		= "조각은 챙기셨습니까?";
BINDING_NAME_GOTSHARDS_HEALSTONE	= "생명석 자동 거래";