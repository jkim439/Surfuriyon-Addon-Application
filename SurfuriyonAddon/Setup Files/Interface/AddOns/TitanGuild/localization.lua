-- default (EN)
TITAN_GUILD_MENU_TEXT = "Guild"
TITAN_GUILD_BUTTON_LABEL = "Guild: "
TITAN_GUILD_TOOLTIP = "Guild Info"
TITAN_GUILD_GUILD_CHAT = "Guild Chat";
TITAN_GUILD_GUILD_OFFICER_CHAT = "Guild Officer Chat";
TITAN_GUILD_SHOWOFFLINE = "Show Offline Members";
TITAN_GUILD_NOT_IN_GUILD = "Not a guild member";
TITAN_GUILD_MENU_SHOWADVANCED_TEXT = "Show Advanced Menus";
TITAN_GUILD_MENU_ADVANCED_INVITE_TEXT = "invite";
TITAN_GUILD_MENU_ADVANCED_WHISPER_TEXT = "whisper";
TITAN_GUILD_MENU_ADVANCED_WHO_TEXT = "who";
TITAN_GUILD_MENU_ADVANCED_FRIEND_TEXT = "friend";
TITAN_GUILD_MENU_CHAT_TEXT = "Chat";
TITAN_GUILD_MENU_SORT_TEXT = "Sort";
TITAN_GUILD_MENU_FILTER_TEXT = "Filter";
TITAN_GUILD_MENU_TOOLTIP_TEXT = "Tooltip";
TITAN_GUILD_TOOLTIP_HINT_TEXT = "Hint: Left-click to toggle guild window";
TITAN_GUILD_MENU_PLEASE_WAIT_TEXT = "Please wait...refreshing";
TITAN_GUILD_MENU_HIDE_OPTIONS_TEXT = "Hide options";
TITAN_GUILD_MENU_SHOW_OPTIONS_TEXT = "Show options";
TITAN_GUILD_MENU_HIDE = "|cff999999"..TITAN_PANEL_MENU_HIDE.."|r";
TITAN_GUILD_MENU_FILTER_MYZONE = "within my zone";
TITAN_GUILD_MENU_FILTER_MYLEVEL = "within my level";
TITAN_GUILD_MENU_FILTER_CLASS = "Class";
TITAN_GUILD_MENU_FORWARD_TEXT = "Forward";
TITAN_GUILD_MENU_BACKWARD_TEXT = "Back";
TITAN_GUILD_TOOLTIP_WARNING = "Can not display all members. Use Filters!";
TITAN_GUILD_MENU_DISABLE_UPDATE_TEXT = "Disable auto-roster update";
TITAN_GUILD_MENU_CONFIGURE_UPDATE_TIME = "Set update time";

-- format
TITAN_GUILD_BUTTON_TEXT = "%s"..TitanUtils_GetHighlightText("/").."%s";
TITAN_GUILD_BUTTON_TEXT_FILTERED = "%s"..TitanUtils_GetHighlightText("/").."%s"..TitanUtils_GetHighlightText("/").."%s";
TITAN_GUILD_BUTTON_TEXT_ONLINEONLY_FORMAT = "%s";

-- update time options
updateTimeOptions = {"60", "180", "300"};
updateTimeLabels = {};
-- init updateTimeLabels
if (GetLocale() == "deDE") then
	updateTimeLabels = {"1 min", "3 min", "5 min"};
elseif (GetLocale() == "frFR") then
	updateTimeLabels = {"1 min", "3 min", "5 min"};
elseif (GetLocale() == "koKR") then
	updateTimeLabels = {"1 분", "3 분", "5 분"};
else
	updateTimeLabels = {"1 min", "3 min", "5 min"};
end

-- sort options
sortChoicesValues = {"Name","Zone","Rank","Note","Level","Class"};
sortChoicesLabels = {};
-- init sortChoices
if (GetLocale() == "deDE") then
	sortChoicesLabels = {"Name","Zone","Rang","Hinweis","Stufe","Klasse"};
elseif (GetLocale() == "frFR") then
	sortChoicesLabels = {"Nom","Zone","Rang","Note","Niveau","Classe"};
elseif (GetLocale() == "koKR") then
	sortChoicesLabels = {"이름","지역","계급","쪽지","레벨","직업"};
else
	sortChoicesLabels = {"Name","Zone","Rank","Note","Level","Class"};
end

-- class filter options
hordeClassValues = {"All", "Warrior", "Mage", "Rogue", "Druid", "Hunter", "Shaman", "Priest", "Warlock"};
allianceClassValues = {"All", "Warrior", "Mage", "Rogue", "Druid", "Hunter", "Priest", "Warlock", "Paladin"};
if (GetLocale() == "deDE") then
	hordeClassLabels = {"Alle", "Krieger", "Magier", "Schurke", "Druide", "J\195\164ger", "Schamane", "Priester", "Hexenmeister", "Paladin"};
	allianceClassLabels = {"Alle", "Krieger", "Magier", "Schurke", "Druide", "J\195\164ger", "Priester", "Hexenmeister", "Paladin"};
elseif (GetLocale() == "frFR") then
	hordeClassLabels= {"All", "Guerrier", "Mage", "Voleur", "Druide", "Chasseur", "Chaman", "Prêtre", "Démoniste", "Paladin"};
	allianceClassLabels = {"All", "Guerrier", "Mage", "Voleur", "Druide", "Chasseur", "Prêtre", "Démoniste", "Paladin"};
elseif (GetLocale() == "koKR") then
	hordeClassLabels = {"모두", "전사", "마법사", "도적", "드루이드", "사냥꾼", "주술사", "사제", "흑마법사"};
	allianceClassLabels = {"모두", "전사", "마법사", "도적", "드루이드", "사냥꾼", "사제", "흑마법사", "성기사"};
else
	hordeClassLabels = {"All", "Warrior", "Mage", "Rogue", "Druid", "Hunter", "Shaman", "Priest", "Warlock"};
	allianceClassLabels = {"All", "Warrior", "Mage", "Rogue", "Druid", "Hunter", "Priest", "Warlock", "Paladin"};
end

TITAN_GUILD_CLASSINDEX = {
	["드루이드"] = 1,
	["사냥꾼"] = 2,
	["마법사"] = 3,
	["성기사"] = 4,
	["사제"] = 5,
	["도적"] = 6,
	["주술사"] = 7,
	["흑마법사"] = 8,
	["전사"] = 9,
	["Druid"]   = 1,
	["Hunter"]  = 2,
	["Mage"]    = 3,
	["Paladin"] = 4,
	["Priest"]  = 5,
	["Rogue"]   = 6,
	["Shaman"]  = 7,
	["Warlock"] = 8,
	["Warrior"] = 9,
	["Druide"] = 1,
	["J\195\164ger"] = 2,
	["Magier"] = 3,
	["Paladin"] = 4,
	["Priester"] = 5,
	["Schurke"] = 6,
	["Schamane"] = 7,
	["Hexenmeister"] = 8,
	["Krieger"] = 9,
	["Druide"] = 1,
	["Chasseur"] = 2,
	["Mage"] = 3,
	["Paladin"] = 4,
	["Pr\195\170tre"] = 5,
	["Voleur"] = 6,
	["Chaman"] = 7,
	["D\195\169moniste"] = 8,
	["Guerrier"] = 9,
};

-- German localization by Crowley and Scarabeus
if ( GetLocale() == "deDE" ) then
	TITAN_GUILD_MENU_TEXT = "Gilde"
	TITAN_GUILD_BUTTON_LABEL = "Gilde: "
	TITAN_GUILD_TOOLTIP = "Liste"
	TITAN_GUILD_GUILD_CHAT = "Chat";
	TITAN_GUILD_GUILD_OFFICER_CHAT = "Offiziers-Chat";
	TITAN_GUILD_SHOWOFFLINE = "Zeige Offline";
	TITAN_GUILD_NOT_IN_GUILD = "Kein Gildenmitglied";
	TITAN_GUILD_MENU_SHOWADVANCED_TEXT = "Erweitertes Men\195\188anzeigen";
	TITAN_GUILD_MENU_ADVANCED_INVITE_TEXT = "Einladen";
	TITAN_GUILD_MENU_ADVANCED_WHISPER_TEXT = "Fl\195\188stern";
	TITAN_GUILD_MENU_ADVANCED_WHO_TEXT = "Wer";
	TITAN_GUILD_MENU_ADVANCED_FRIEND_TEXT = "Freund";	
	TITAN_GUILD_MENU_CHAT_TEXT = "Chat";
	TITAN_GUILD_MENU_SORT_TEXT = "Sortierung";
	TITAN_GUILD_MENU_FILTER_TEXT = "Filter";
	TITAN_GUILD_MENU_TOOLTIP_TEXT = "Tooltip";
	TITAN_GUILD_TOOLTIP_HINT_TEXT = "Hinweiss: Links-Klick zum \195\182ffnen des Gilden-Men\195\188s";
	TITAN_GUILD_MENU_PLEASE_WAIT_TEXT = "Bitte warten...aktualisiere";
	TITAN_GUILD_MENU_HIDE_OPTIONS_TEXT = "Optionen ausblenden";
	TITAN_GUILD_MENU_SHOW_OPTIONS_TEXT = "Optionen anzeigen";
	TITAN_GUILD_MENU_FILTER_MYZONE = "innerhalb meiner Zone";
	TITAN_GUILD_MENU_FILTER_MYLEVEL = "in meinem Level";
	TITAN_GUILD_MENU_FILTER_CLASS = "Klasse";
	TITAN_GUILD_MENU_FORWARD_TEXT = "Vor\195\164rts";
	TITAN_GUILD_MENU_BACKWARD_TEXT = "R\195\188ckw\195\164rts";
	TITAN_GUILD_TOOLTIP_WARNING = "Can not display all members. Use Filters!";
	TITAN_GUILD_MENU_DISABLE_UPDATE_TEXT = "Disable auto-roster update";
	TITAN_GUILD_MENU_CONFIGURE_UPDATE_TIME = "Set update time";				
end

-- French localization by Feu
if ( GetLocale() == "frFR" ) then
	TITAN_GUILD_MENU_TEXT = "Guilde"
	TITAN_GUILD_BUTTON_LABEL = "Guilde : "
	TITAN_GUILD_TOOLTIP = "Information de la guilde"
	TITAN_GUILD_GUILD_CHAT = "Canal de la guilde";
	TITAN_GUILD_GUILD_OFFICER_CHAT = "Canal des officiers de la guilde";
	TITAN_GUILD_SHOWOFFLINE = "Montrer les membres non connect\195\169s";
 	TITAN_GUILD_NOT_IN_GUILD = "Vous n'\195\170tes pas membre d'une guilde !";
	TITAN_GUILD_MENU_SHOWADVANCED_TEXT = "Montrer les menus avanc\195\169s";
	TITAN_GUILD_MENU_ADVANCED_INVITE_TEXT = "Inviter";
	TITAN_GUILD_MENU_ADVANCED_WHISPER_TEXT = "Chuchoter";
	TITAN_GUILD_MENU_ADVANCED_WHO_TEXT = "Qui";
	TITAN_GUILD_MENU_ADVANCED_FRIEND_TEXT = "Ami";
	TITAN_GUILD_MENU_CHAT_TEXT = "Chat";
	TITAN_GUILD_MENU_SORT_TEXT = "Trier";
	TITAN_GUILD_MENU_FILTER_TEXT = "Filtre";
	TITAN_GUILD_MENU_TOOLTIP_TEXT = "Tooltip";
	TITAN_GUILD_TOOLTIP_HINT_TEXT = "Conseil : clic-gauche pour afficher la fen\195\170tre Guilde";
	TITAN_GUILD_MENU_PLEASE_WAIT_TEXT = "Veuillez patienter...actualisation ";
	TITAN_GUILD_MENU_HIDE_OPTIONS_TEXT = "Cacher les options";
	TITAN_GUILD_MENU_SHOW_OPTIONS_TEXT = "Montrer les options";
	TITAN_GUILD_MENU_FILTER_MYZONE = "Dans ma zone";
	TITAN_GUILD_MENU_FILTER_MYLEVEL = "Dans mon niveau";
	TITAN_GUILD_MENU_FILTER_CLASS = "Classe";
	TITAN_GUILD_MENU_FORWARD_TEXT = "Vers l'avant";
	TITAN_GUILD_MENU_BACKWARD_TEXT = "Vers l\'arri\195\168re";
	TITAN_GUILD_TOOLTIP_WARNING = "Impossible d\'afficher tous les membres. Utilisez les filtres !";
	TITAN_GUILD_MENU_DISABLE_UPDATE_TEXT = "D\195\169sactiver la mise-\195\160-jour automatique";
	TITAN_GUILD_MENU_CONFIGURE_UPDATE_TIME = "Set update time";					 
end

-- Korean localization
if ( GetLocale() == "koKR" ) then
	TITAN_GUILD_MENU_TEXT = "길드"
	TITAN_GUILD_BUTTON_LABEL = "길드: "
	TITAN_GUILD_TOOLTIP = "길드 정보"
	TITAN_GUILD_GUILD_CHAT = "길드 대화";
	TITAN_GUILD_GUILD_OFFICER_CHAT = "길드관리자 대화";
	TITAN_GUILD_SHOWOFFLINE = "오프라인 길원 보기";
	TITAN_GUILD_NOT_IN_GUILD = "길드원이 아닙니다.";
	TITAN_GUILD_MENU_SHOWADVANCED_TEXT = "확장메뉴 보기";
	TITAN_GUILD_MENU_ADVANCED_INVITE_TEXT = "초대";
	TITAN_GUILD_MENU_ADVANCED_WHISPER_TEXT = "귓속말";
	TITAN_GUILD_MENU_ADVANCED_WHO_TEXT = "누구";
	TITAN_GUILD_MENU_ADVANCED_FRIEND_TEXT = "친구";
	TITAN_GUILD_MENU_CHAT_TEXT = "대화";
	TITAN_GUILD_MENU_SORT_TEXT = "정렬";
	TITAN_GUILD_MENU_FILTER_TEXT = "필터";
	TITAN_GUILD_MENU_TOOLTIP_TEXT = "툴팁";
	TITAN_GUILD_TOOLTIP_HINT_TEXT = "힌트: 왼쪽 클릭하면 길드창이 열립니다.";
	TITAN_GUILD_MENU_PLEASE_WAIT_TEXT = "잠시만 기다려주세요...갱신 중 입니다.";
	TITAN_GUILD_MENU_HIDE_OPTIONS_TEXT = "설정 숨기기";
	TITAN_GUILD_MENU_SHOW_OPTIONS_TEXT = "설정 보기";
	TITAN_GUILD_MENU_HIDE = "|cff999999"..TITAN_PANEL_MENU_HIDE.."|r";
	TITAN_GUILD_MENU_FILTER_MYZONE = "내 영역 안";
	TITAN_GUILD_MENU_FILTER_MYLEVEL = "내 레벨 안";
	TITAN_GUILD_MENU_FILTER_CLASS = "직업";
	TITAN_GUILD_MENU_FORWARD_TEXT = "다음";
	TITAN_GUILD_MENU_BACKWARD_TEXT = "앞";
	TITAN_GUILD_TOOLTIP_WARNING = "모든 길원들 표시 할수 없습니다. 필터를 사용해주세요!";
	TITAN_GUILD_MENU_DISABLE_UPDATE_TEXT = "길드원 자동 갱신 끄기";
	TITAN_GUILD_MENU_CONFIGURE_UPDATE_TIME = "갱신 시간 지정";
end