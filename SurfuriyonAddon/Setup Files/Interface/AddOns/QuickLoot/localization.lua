-- Version : English - ?????
-- Version : Korean - Arbi
-- Last Update : 02/17/2005

-- Cosmos Configuration
COSMOS_CONFIG_QLOOT_HEADER		= "빠른루팅";
COSMOS_CONFIG_QLOOT_HEADER_INFO		= "빠른 루팅 기능의 설정을 합니다.";
COSMOS_CONFIG_QLOOT		= "빠른 루팅기능 사용";
COSMOS_CONFIG_QLOOT_INFO	= "루팅시 자동으로 마우스 커서가 아이템으로 이동합니다.";
COSMOS_CONFIG_QLOOT_HIDE			= "루팅할 아이템이 없을때 자동으로 루팅창 닫기";
COSMOS_CONFIG_QLOOT_HIDE_INFO		= "시체에 아무것도 없을경우 자동으로 루팅창을 닫습니다.";
COSMOS_CONFIG_QLOOT_ONSCREEN		= "루팅창을 항상 화면 안쪽으로 유지";
COSMOS_CONFIG_QLOOT_ONSCREEN_INFO	= "화면 밖으로 루팅창이 넘어가지 않게 됩니다.";

COSMOS_CONFIG_QLOOT_MOVE_ONCE		= "루팅시 루팅창 이동하지 않기";
COSMOS_CONFIG_QLOOT_MOVE_ONCE_INFO	= "마우스로 루팅할 때 루팅 창이 마우스 커서 위치로 이동하지 않습니다.";

-- Chat Configuration
QLOOT_LOADED				= "텔로의 퀵루트 기능이 활성화 되었습니다.";
ERR_LOOT_NONE						= "시체에 루팅할 아이템이 없습니다.";

QUICKLOOT_CHAT_COMMAND_INFO		= "빠른 루팅 기능의 사용법을 보시려면 /빠른루팅 명령어를 사용하세요.";
QUICKLOOT_CHAT_COMMAND_USAGE		= "사용법: /빠른루팅 <켜기/자동닫기/화면/한번> [예/아니오]\n옵션만 사용해도 토글이 가능합니다.\n옵션:\n 켜기 - 빠른 루팅을 켜고 끕니다.\n 자동닫기 - 루팅할 아이템이 없을경우 자동으로 창을 닫습니다.\n 화면 - 루팅창이 화면 안쪽에서만 나오게 합니다.";
QUICKLOOT_CHAT_COMMAND_ENABLE		= COSMOS_CONFIG_QLOOT_HEADER;
QUICKLOOT_CHAT_COMMAND_HIDE		= COSMOS_CONFIG_QLOOT_HEADER.."의 자동닫기 기능을 사용합니다.";
QUICKLOOT_CHAT_COMMAND_ONSCREEN		= COSMOS_CONFIG_QLOOT_HEADER.."의 화면 밖에서 루팅창 열리지 않기 기능을 사용합니다.";
QUICKLOOT_CHAT_COMMAND_MOVE_ONCE	= COSMOS_CONFIG_QLOOT_HEADER.." move once";


QUICKLOOT_COMMANDS = {"/빠른루팅", "/ql"};
QUICKLOOT_COMMANDS_ENABLE = "켜기";
QUICKLOOT_COMMANDS_AUTOHIDE = "자동닫기";
QUICKLOOT_COMMANDS_ONSCREEN = "화면";
QUICKLOOT_COMMANDS_MOVEONCE = "한번";

QUICKLOOT_COMMANDS_TRUE = "예";
QUICKLOOT_COMMANDS_FALSE = "아니오";

QUICKLOOT_CHAT_STATE_ENABLED		= " 사용합니다.";
QUICKLOOT_CHAT_STATE_DISABLED		= " 사용하지 않습니다.";

-- default feedback text for options
QUICKLOOT_KHAOS_OPTION_STATE_TEXT	= "Option is";
