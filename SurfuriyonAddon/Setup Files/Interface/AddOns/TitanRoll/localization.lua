
-- Last update: 14/10/2005


TITANROLL_NAME		= "TitanPanel[Roll]"
TITANROLL_VERSION 	= "0.42"
TITANROLL_NAMEVERSION	= TITANROLL_NAME.." v"..TITANROLL_VERSION


-- Version: English
-- Last update: 14/10/2005

TITANROLL_MENUTEXT	= "Roll"
TITANROLL_LABELTEXT	= "Last roll: "
TITANROLL_LABELWINNER	= "Winner: "
TITANROLL_TOOLTIP	= "Latest rolls"
TITANROLL_NOROLL	= "No rolls yet!"
TITANROLL_HINT		= "Hint: Left-click to perform roll."

TITANROLL_TOGWINNER	= "Show winner on the bar";
TITANROLL_TOGREPLACE	= "Replace bad rolls when rerolled"
TITANROLL_TOGSORTLIST	= "Sort rolls by value"
TITANROLL_TOGHIGHLIGHT	= "Highlight group members rolls"
TITANROLL_ERASELIST	= "Erase list"

TITANROLL_PERFORMED	= "Change performed roll"
TITANROLL_CHANGELENGTH	= "Change list length"
TITANROLL_SETTIMEOUT	= "Set timeout"
TITANROLL_CURRENTACTION = "Current boundaries: "

TITANROLL_TIMEOUTS_TEXT = {
	"10 sec",
	"20 sec",
	"30 sec",
	"1 min",
	"2 min",
	"3 min",
	"None"
	}
TITANROLL_TOGERASETO	= "Erase timed out rolls from list"


TITANROLL_SEARCHPATTERN	= "(.+) rolls (%d+) %((%d+)%-(%d+)%)"

TITANROLL_TOGGOODWIN	= "Only accept 1-100 rolls as winner"
TITANROLL_TOGGROUPACC	= "Process group members rolls only"
TITANROLL_TOGIGNOREMUL	= "Ignore multirolls"
TITANROLL_ANNOUNCE	= "Change announcement text"
TITANROLL_CHATFORHELP	= "Look at the chatbox for help"

TITANROLL_ANNPATT	= "[Roll]: $aNo active rolls.$b$w won with a roll of $r. There were $n rolls.$c Invalid rolls were made by: $i"
TITANROLL_ANNHELP01	= "TitanPanel[Roll] announcement change..."
TITANROLL_ANNHELP02	= "Current announcement pattern:\n "
TITANROLL_ANNHELP03	= "Useable tags: "
TITANROLL_ANNHELP04	= " $a - following text displays when there's no active roll"
TITANROLL_ANNHELP05	= " $b - following text displays when there's at least one active roll. Use following tags here:"
TITANROLL_ANNHELP06	= "     $w - winners name "
TITANROLL_ANNHELP07	= "     $r - winners dice roll"
TITANROLL_ANNHELP08	= "	$l - a list of the rolls"
TITANROLL_ANNHELP09	= "     $n - number of total rolls"
TITANROLL_ANNHELP10	= " $c - following text displays when there's at least one invalid roll. Use the following tag here: "
TITANROLL_ANNHELP11	= "     $i - a list of players with invalid rolls"


if ( GetLocale() == "deDE" ) then

-- Version: Deutsch (German)
-- Last update: 21/6/2005
-- Thanks to Max Power for this!

TITANROLL_MENUTEXT = "W\195\188rfeln"
TITANROLL_LABELTEXT = "Letzter W\195\188rf: "
TITANROLL_LABELWINNER = "Sieger: "
TITANROLL_TOOLTIP = "Letzte W\195\188rfe"
TITANROLL_NOROLL = "Keine W\195\188rfe !"
TITANROLL_HINT = "Links klicken zum w\195\188rfeln"

TITANROLL_TOGWINNER = "Zeige Gewinner in der Leiste";
TITANROLL_TOGREPLACE = "Entferne schlechte W\195\188rfe"
TITANROLL_TOGSORTLIST = "W\195\188rfe nach h\195\182he sortieren"
TITANROLL_TOGHIGHLIGHT = "Highlight W\195\188rfe der Gruppenmitglieder"
TITANROLL_ERASELIST = "Liste l\195\182schen"

TITANROLL_PERFORMED = "W\195\188rfelbereich"
TITANROLL_CHANGELENGTH = "L\195\164nge der Liste"
TITANROLL_SETTIMEOUT = "Timeout einstellen"
TITANROLL_CURRENTACTION = "Momentane Grenze: "

TITANROLL_TIMEOUTS_TEXT = {
	"10 Sek",
	"20 Sek",
	"30 Sek",
	"1 Min",
	"2 Min",
	"3 Min",
	"Kein"
	}

TITANROLL_SEARCHPATTERN	= "(.+) w\195\188rfelt. Ergebnis: (%d+) %((%d+)%-(%d+)%)"

end


if ( GetLocale() == "frFR" ) then

-- Version: Francais (French)
-- Last update: 19/6/2005
-- Thanks to Toblerone and Sasmira for this!

TITANROLL_MENUTEXT = "Roll"
TITANROLL_LABELTEXT = "Dernier Roll : "
TITANROLL_LABELWINNER = "Gagnant : "
TITANROLL_TOOLTIP = "Les Derniers Rolls"
TITANROLL_NOROLL = "Aucun Roll Actuellement !"
TITANROLL_HINT = "Usage : Clic-Gauche pour Roll."

TITANROLL_TOGWINNER = "Voir le gagnant dans la barre";
TITANROLL_TOGREPLACE = "Remplacez les mauvais Rolls quand ils sont reroll\195\169s"
TITANROLL_TOGSORTLIST = "Trier les rolls par valeur"
TITANROLL_TOGHIGHLIGHT = "Highlight sur les membres du groupe rollants"
TITANROLL_ERASELIST = "R\195\169initialiser la liste"

TITANROLL_PERFORMED = "Changer la valeur du Roll"
TITANROLL_CHANGELENGTH = "Taille de la liste"
TITANROLL_SETTIMEOUT = "Selection de la Dur\195\169e"
TITANROLL_CURRENTACTION = "Limites courantes : "

TITANROLL_TIMEOUTS_TEXT = {
	"10 sec",
	"20 sec",
	"30 sec",
	"1 min",
	"2 min",
	"3 min",
	"Aucune"
	}

TITANROLL_SEARCHPATTERN = "(.+) obtient un (%d+) %((%d+)%-(%d+)%)"

end

if ( GetLocale() == "koKR" ) then
	TITANROLL_MENUTEXT	= "주사위"
	TITANROLL_LABELTEXT	= "마지막 주사위: "
	TITANROLL_LABELWINNER	= "승자: "
	TITANROLL_TOOLTIP	= "마지막 주사위"
	TITANROLL_NOROLL	= "아직 주사위를 굴리지 않았습니다!"
	TITANROLL_HINT		= "클릭: /주사위 100."

	TITANROLL_TOGWINNER	= "패널에 승자 표시";
	TITANROLL_TOGREPLACE	= "주사위를 다시 굴리면 낮은 쪽으로 등록"
	TITANROLL_TOGSORTLIST	= "주사위 값으로 따라 정렬"
	TITANROLL_TOGHIGHLIGHT	= "파티원, 공격대원의 주사위를 강조"
	TITANROLL_ERASELIST	= "리스트 삭제"

	TITANROLL_PERFORMED	= "주사위 범위 변경"
	TITANROLL_CHANGELENGTH	= "목록의 길이를 지정"
	TITANROLL_SETTIMEOUT	= "시간 제한을 지정"
	TITANROLL_CURRENTACTION = "현재: "

	TITANROLL_TIMEOUTS_TEXT = {
		"10 초",
		"20 초",
		"30 초",
		"1 분",
		"2 분",
		"3 분",
		"없음"
		}
	TITANROLL_TOGERASETO	= "시간이 초과된 주사위는 리스트에서 지웁니다."

	TITANROLL_SEARCHPATTERN	= "(.+)님이 주사위를 굴려 (%d+)|1이;가; 나왔습니다. %((%d+)%-(%d+)%)"

	TITANROLL_TOGGOODWIN	= "(1-100) 으로 굴린 주사위만 인정합니다."
	TITANROLL_TOGGROUPACC	= "같은 파티, 공격대원의 주사위만 등록"
	TITANROLL_TOGIGNOREMUL	= "다시 굴린 주사위는 무시"
	TITANROLL_ANNOUNCE	= "알림 메세지 변경"
	TITANROLL_CHATFORHELP	= "채팅창의 도움말을 참고하세요."

	TITANROLL_ANNPATT	= "[Roll]: $a아직 아무도 주사위를 굴리지 않았습니다.$b$w님께서 $r로 승리하셨습니다. $n 명이 주사위를 굴렸습니다.$c 다음 분들은 주사위를 잘못 굴리셨습니다.: $i"
	TITANROLL_ANNHELP01	= "TitanPanel[Roll] 알림 메세지 변경..."
	TITANROLL_ANNHELP02	= "현재 알림 메세지:\n "
	TITANROLL_ANNHELP03	= "사용 가능한 태그: "
	TITANROLL_ANNHELP04	= " $a - 아무도 주사위를 굴리지 않았을 때 뒤따르는 메세지가 출력됩니다."
	TITANROLL_ANNHELP05	= " $b - 한명이라도 주사위를 굴리기 시작했을 때 뒤따르는 메세지가 출력됩니다. 다음의 태그를 사용할 수 있습니다.:"
	TITANROLL_ANNHELP06	= "     $w - 승자의 이름"
	TITANROLL_ANNHELP07	= "     $r - 승자의 주사위 값"
	TITANROLL_ANNHELP08	= "     $n - 주사위를 굴린 사람 수"
	TITANROLL_ANNHELP09	= " $c - 한명이라도 주사위를 잘못 굴리면 뒤따르는 메세지가 출력됩니다. 다음의 태그를 사용할 수 있습니다.: "
	TITANROLL_ANNHELP10	= "     $i - 주사위를 잘못 굴린 플레이어의 목록"
end