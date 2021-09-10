--[[
--	FileName Localization
--		"English Localization"
--	
--	English By: Mugendai
--	Contact: mugekun@gmail.com
--	
--	$Id: localization.lua 3346 2006-04-02 03:04:53Z mugendai $
--	$Rev: 3346 $
--	$LastChangedBy: mugendai $
--	$Date: 2006-04-01 21:04:53 -0600 (Sat, 01 Apr 2006) $
--]]

--------------------------------------------------
--
-- MCom Versioning System, DO NOT CHANGE!
--
--------------------------------------------------
--MCom version number
MCOM_VERSION = 1.54;

--Should we use this version of MCom
MCom_Update = nil;

--If there is no MCom, make one
if (not MCom) then
	MCom = {};
end

--Check the version, and decide if we should update
if (MCom.VERSION) then
	if (MCOM_VERSION > MCom.VERSION) then
		MCom_Update = true;
		MCom.VERSION = MCOM_VERSION;
	end
else
	MCom_Update = true;
	MCom.VERSION = MCOM_VERSION;
end

--------------------------------------------------
--
-- Copyable locale starts here
--
--------------------------------------------------
--Only overwrite if version is newer, be sure to include this(but not the above part) in localizations
if (MCom_Update) then
	--------------------------------------------------
	--
	-- MCom types
	--
	--------------------------------------------------
	MCOM_BOOLT = "B";
	MCOM_NUMT = "N";
	MCOM_MULTIT = "M";
	MCOM_STRINGT = "S";
	MCOM_SIMPLET = "E";
	MCOM_CHOICET = "C";
	MCOM_COLORT = "K";
	MCOM_HEADERT = "H";
	
	--------------------------------------------------
	--
	-- MCom help text
	--
	--------------------------------------------------
	MCOM_CHAT_COM_HELP_USAGE		=	"현재 설정값 부분을 클릭하면 설정값을 바꿀 수 있습니다.\n명령어 부분을 클릭하면 채팅창에 해당 명령어가 입력됩니다."
	MCOM_CHAT_COM_ALIAS			= "기본 명령어: \124c00FFC000%s\124r";
	MCOM_CHAT_COM_COMMANDS		= "명령어:\n\124c00FFC000명령어/명령어2\124r - type \124c0000FF00(state)\124r\ndetails";
	MCOM_CHAT_COM_SUBCOMMAND_S		= "\124c00FFC000%s\124r - %s\n%s";
	MCOM_CHAT_COM_SUBCOMMAND		= "\124c00FFC000%s\124r - %s \124c0000FF00(%s)\124r\n%s";
	MCOM_CHAT_COM_NOINFO = "추가 정보가 없습니다.";
	MCOM_CHAT_COM_CLIST = "선택: %s";
	MCOM_CHAT_COM_HEADER		= "-----------------------------\n%s\n-----------------------------";
	MCOM_CHAT_COM_LABEL		= "-%s-\n";
	
	MCOM_CHAT_C_M = MCOM_CHOICET.."M";	--Letter indicator that this is a multiple choice option
	MCOM_CHAT_K_O = MCOM_COLORT.."O";	--Letter indicator that this is a color option with opacity
	
	MCOM_CHAT_COM_B		= "[켜기/끄기]";
	MCOM_CHAT_COM_N		= "[숫자]";
	MCOM_CHAT_COM_N_MIN = "최소: %s";
	MCOM_CHAT_COM_N_MAX = "최대: %s";
	MCOM_CHAT_COM_N_RANGE = " \124c0064DCFF[%s]\124r";
	MCOM_CHAT_COM_S		= "[문자열]";
	MCOM_CHAT_COM_C		= "[선택]";
	MCOM_CHAT_COM_C_M		= "[선택[ 다음선택]]";
	MCOM_CHAT_COM_K		= "[적색 녹색 청색]";
	MCOM_CHAT_COM_K_O		= "[적색 녹색 청색 [ 투명도]]";

	MCOM_CHAT_COM_K_R = "적:%s";
	MCOM_CHAT_COM_K_G = "녹:%s";
	MCOM_CHAT_COM_K_B = "청:%s";
	MCOM_CHAT_COM_K_A = "투명도:%s";
	MCOM_CHAT_COM_K_X = "\124r\124c%s예\124r\124c0000FF00";
	
	MCOM_CHAT_COM_USAGE_S_E		= "사용법 %s";
	MCOM_CHAT_COM_USAGE_S_S		= "사용법 %s %s";
	MCOM_CHAT_COM_USAGE_S_M		= "사용법 %s "..MCOM_CHAT_COM_B.." %s";
	
	MCOM_CHAT_COM_USAGE_E	= "("..MCOM_SIMPLET..")에 대한 사용법 %s [옵션]";
	MCOM_CHAT_COM_USAGE_S	= "(%s)에 대한 사용법 %s [옵션] %s";
	MCOM_CHAT_COM_USAGE_M	= "(%s)에 대한 사용법 %s [옵션] "..MCOM_CHAT_COM_B.." %s";
	
	MCOM_CHAT_COM_USAGE		=	"명령어 사용시 괄호나 꺾쇠([])를 넣지 마세요."
	MCOM_CHAT_COM_USAGE_B		=	"켜기/끄기 옵션을 주지 않을경우, 자동으로 현재 설정과 반대의 상태를 적용합니다."
	MCOM_CHAT_COM_USAGE_B_M		=	"설정에서 특정한 켜기/끄기 옵션과 "..MCOM_BOOLT.."%s 형태와 같은 다른 값의 적용이 가능합니다."..
													"켜기/끄기와 %s를 설정하세요. 오직 켜기/끄기 부분만 써넣을 수 있습니다. 그와 같이 두번째 "..
													"부분의 설정을 끝냅니다.";
	MCOM_CHAT_COM_USAGE_B_N		= "숫자";
	MCOM_CHAT_COM_USAGE_B_S		= "문자열";
	MCOM_CHAT_COM_USAGE_B_C		= "선택";
	MCOM_CHAT_COM_USAGE_B_K		= "색상";
	MCOM_CHAT_COM_USAGE_B_E		=	MCOM_BOOLT..MCOM_SIMPLET.." 설정을 켭니다. 다른 옵션을 지정하지 않으면 명령이 실행될 것입니다. 만약 "..MCOM_CHAT_COM_B.." 옵션을 지정한다면 지정한 옵션으로 설정값이 정해질 것입니다.";

	MCOM_CHAT_COM_EXAMPLE	=	"사용 예:";
	
	MCOM_CHAT_COM_EXAMPLE_O_B		= "켜기";
	MCOM_CHAT_COM_EXAMPLE_O_N		= "1";
	MCOM_CHAT_COM_EXAMPLE_O_S		= "문자열";
	MCOM_CHAT_COM_EXAMPLE_O_K		= "20 56 100";
	MCOM_CHAT_COM_EXAMPLE_O_K_O		= "20 56 100 62";
	
	MCOM_CHAT_COM_EXAMPLE_S_E		= "%s";
	MCOM_CHAT_COM_EXAMPLE_S_S		= "%s %s";
	MCOM_CHAT_COM_EXAMPLE_S_M		= "%s "..MCOM_CHAT_COM_EXAMPLE_O_B.." %s";
	
	MCOM_CHAT_COM_EXAMPLE_E		= "%s %s";
	MCOM_CHAT_COM_EXAMPLE_S		= "%s %s %s";
	MCOM_CHAT_COM_EXAMPLE_M		= "%s %s "..MCOM_CHAT_COM_EXAMPLE_O_B.." %s";
	
	MCOM_CHAT_ENABLED = "켜짐";
	MCOM_CHAT_DISABLED = "꺼짐";
	MCOM_CHAT_ON = "켜기";
	MCOM_CHAT_OFF = "끄기";
	MCOM_CHAT_NONE = "선택 없음";
	
	MCOM_CHAT_STATUS_B = "%s %%s";
	MCOM_CHAT_STATUS_N = "%s set to %%s";
	MCOM_CHAT_STATUS_S = "%s set to %%s";
	MCOM_CHAT_STATUS_C = "%s set to %%s";
	MCOM_CHAT_STATUS_K = "%s set to %%s";
	
	MCOM_FEEDBACK_CHECK = "%s %s";
	MCOM_FEEDBACK_RADIO = "%s 셋트를 %s 으로";
	MCOM_FEEDBACK_SLIDER = "%s 셋트를 %s 으로";
	MCOM_FEEDBACK_SLIDER_M = "%s, 그리고 셋트를 %s 으로";
	MCOM_FEEDBACK_EDITBOX = "%s 셋트를 %s 으로";
	MCOM_FEEDBACK_EDITBOX_M = "%s, 그리고 셋트를 %s 으로";
	MCOM_FEEDBACK_COLOR = "|c%s%s 색 변경|r";
	MCOM_FEEDBACK_COLOR_M = "|c%s%s|r";
	MCOM_FEEDBACK_CHOICE = "%s 셋트를 %s 으로";
	MCOM_FEEDBACK_CHOICE_M = "%s, 그리고 셋트를 %s 으로";
	
	MCOM_PAGE_TEXT = "페이지 (%s/%s)";
	MCOM_HELP_COMMAND = "도움말";
	MCOM_HELP_CONFIG = "%s 도움말";
	MCOM_HELP_CONFIG_INFO = "%s에 대한 유용한 정보를 표시합니다.";
	MCOM_HELP_GENERIC = "이 애드온에 대한 유용한 정보를 표시합니다.";
	MCOM_HELP_TITLE = "%s 도움말";
	MCOM_HELP_GENERIC_TITLE = "도움말";
end