
TitanModMenu_BaseMenu = {
	TITAN_MODMENU_CAT_RAID,
	
	TITAN_MODMENU_SPACER,
	TITAN_MODMENU_CAT_TRADESKILLS,
	TITAN_MODMENU_CAT_HANDY,
	TITAN_MODMENU_CAT_EMOTES,

	
	TITAN_MODMENU_SPACER,
	TITAN_MODMENU_CAT_GAMEMENU,
	TITAN_MODMENU_CAT_SYSTEM,
	TITAN_MODMENU_CAT_MMSETTINGS,
};
-------------------------------------------------------------------
TitanModMenu_MenuItems = {
["USEmotemenu 0"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 1", submenu = {
	{text = "/동의 ", cmd = "/동의"}, {text = "/아연실색 ", cmd = "/아연실색"}, {text = "/화남 (A)", cmd = "/화남"}, {text = "/사과 ", cmd = "/사과"}, {text = "/박수 (AV)", cmd = "/박수"}, {text = "/공격 (AV)", cmd = "/공격"}, {text = "/손짓 ", cmd = "/손짓"}, {text = "/간청 (A)", cmd = "/간청"}, {text = "/트림 ", cmd = "/트림"}, {text = "/깨물어 ", cmd = "/깨물어"}, {text = "/출혈 ", cmd = "/출혈"}, {text = "/깜빡 ", cmd = "/깜빡"}, {text = "/키스 (AV)", cmd = "/키스"}, {text = "/붉혀 (A)", cmd = "/붉혀"}, {text = "/깜짝 (A)", cmd = "/깜짝"}, {text = "/어처구니 ", cmd = "/어처구니"}, {text = "/지루 (V)", cmd = "/지루"}, {text = "/뛰어 ", cmd = "/뛰어"}, {text = "/안녕 (AV)", cmd = "/안녕"}, {text = "/모욕 (A)", cmd = "/모욕"},
}},
["USEmotemenu 1"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 2", submenu = {
	{text = "/절 (A)", cmd = "/절"}, {text = "/환호 (AV)", cmd = "/환호"}, {text = "/인사 ", cmd = "/인사"}, {text = "/바이 (AV)", cmd = "/바이"}, {text = "/우쭐 (AV)", cmd = "/우쭐"}, {text = "/진정 ", cmd = "/진정"}, {text = "/긁어 ", cmd = "/긁어"}, {text = "/용기 (AV)", cmd = "/용기"}, {text = "/냠냠 (A)", cmd = "/냠냠"}, {text = "/킬킬 (AV)", cmd = "/킬킬"}, {text = "/박수갈채 (AV)", cmd = "/박수갈채"}, {text = "/추워 ", cmd = "/추워"}, {text = "/위로 ", cmd = "/위로"}, {text = "/칭찬 (AV)", cmd = "/칭찬"}, {text = "/어리둥절 (A)", cmd = "/어리둥절"}, {text = "/축하 (AV)", cmd = "/축하"}, {text = "/기침 ", cmd = "/기침"}, {text = "/축하 (AV)", cmd = "/축하"}, {text = "/기침 ", cmd = "/기침"}, {text = "/무례 ", cmd = "/무례"}, {text = "/소개 ", cmd = "/소개"}, {text = "/무릎 (A)", cmd = "/무릎"},
}},
["USEmotemenu 2"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 3", submenu = {
	{text = "/움츠려 ", cmd = "/움츠려"}, {text = "/손마디 ", cmd = "/손마디"}, {text = "/움찔 ", cmd = "/움찔"}, {text = "/엉엉 (AV)", cmd = "/엉엉"}, {text = "/안겨 ", cmd = "/안겨"}, {text = "/궁금 (A)", cmd = "/궁금"}, {text = "/인사 (A)", cmd = "/인사"}, {text = "/춤 (A)", cmd = "/춤"}, {text = "/실망 ", cmd = "/실망"}, {text = "/노려봐 ", cmd = "/노려봐"}, {text = "/분노 ", cmd = "/분노"}, {text = "/건배 (A)", cmd = "/건배"}, {text = "/군침 ", cmd = "/군침"}, {text = "/흥분 (A)", cmd = "/흥분"}, {text = "/훑어보기 ", cmd = "/훑어보기"}, {text = "/방귀 ", cmd = "/방귀"}, {text = "/두려움 ", cmd = "/두려움"}, {text = "/애원 ", cmd = "/애원"}, {text = "/하하 (AV)", cmd = "/하하"}, {text = "/찬사 ", cmd = "/찬사"},
}},
["USEmotemenu 3"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 4", submenu = {
	{text = "/초조 ", cmd = "/초조"}, {text = "/힘자랑 (A)", cmd = "/힘자랑"}, {text = "/기다려 ", cmd = "/기다려"}, {text = "/킁킁 ", cmd = "/킁킁"}, {text = "/손짓 (AV)", cmd = "/손짓"}, {text = "/배고파 ", cmd = "/배고파"}, {text = "/찡그려 ", cmd = "/찡그려"}, {text = "/헐떡 (A)", cmd = "/헐떡"}, {text = "/응시 ", cmd = "/응시"}, {text = "/키득 (AV)", cmd = "/키득"}, {text = "/행복 ", cmd = "/행복"}, {text = "/눈초리 ", cmd = "/눈초리"}, {text = "/고소 (AV)", cmd = "/고소"}, {text = "/경례 (A)", cmd = "/경례"}, {text = "/환영 (A)", cmd = "/환영"}, {text = "/사악 ", cmd = "/사악"}, {text = "/불만 ", cmd = "/불만"}, {text = "/비굴 (A)", cmd = "/비굴"}, {text = "/누워 (A)", cmd = "/누워"}, {text = "/오우거 ", cmd = "/오우거"},
}},
["USEmotemenu 4"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 5", submenu = {
	{text = "/입맛 ", cmd = "/입맛"}, {text = "/안마 ", cmd = "/안마"}, {text = "/애도 ", cmd = "/애도"}, {text = "/조롱 ", cmd = "/조롱"}, {text = "/외면 ", cmd = "/외면"}, {text = "/아니 (AV)", cmd = "/아니"}, {text = "/끄덕 (AV)", cmd = "/끄덕"}, {text = "/허둥대 ", cmd = "/허둥대"}, {text = "/귀찮아 ", cmd = "/귀찮아"}, {text = "/후비적 ", cmd = "/후비적"}, {text = "/사정 (A)", cmd = "/사정"}, {text = "/찔러 ", cmd = "/찔러"}, {text = "/곰곰 (A)", cmd = "/곰곰"}, {text = "/기도 (A)", cmd = "/기도"}, {text = "/만족 ", cmd = "/만족"}, {text = "/아리송 (A)", cmd = "/아리송"}, {text = "/질문 ", cmd = "/질문"}, {text = "/준비 ", cmd = "/준비"}, {text = "/엉덩이 ", cmd = "/엉덩이"}, {text = "/고함 (A)", cmd = "/고함"},
}},
["USEmotemenu 5"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 6", submenu = {
	{text = "/섹시 ", cmd = "/섹시"}, {text = "/와들 ", cmd = "/와들"}, {text = "/외쳐 ", cmd = "/외쳐"}, {text = "/으쓱 (A)", cmd = "/으쓱"}, {text = "/수줍 (A)", cmd = "/수줍"}, {text = "/한숨 (V)", cmd = "/한숨"}, {text = "/쿨쿨 (A)", cmd = "/쿨쿨"}, {text = "/휘파람 (V)", cmd = "/휘파람"}, {text = "/냄새 ", cmd = "/냄새"}, {text = "/음흉 ", cmd = "/음흉"}, {text = "/으르렁 ", cmd = "/으르렁"}, {text = "/큭큭 ", cmd = "/큭큭"}, {text = "/야단 ", cmd = "/야단"}, {text = "/달래 ", cmd = "/달래"}, {text = "/미안 ", cmd = "/미안"}, {text = "/항복 (A)", cmd = "/항복"}, {text = "/안됨 ", cmd = "/안됨"}, {text = "/도발 (AV)", cmd = "/도발"}, {text = "/놀려 ", cmd = "/놀려"}, {text = "/고마워 (AV)", cmd = "/고마워"},
}},
["USEmotemenu 6"] = {loc = TITAN_MODMENU_LOC_KR, cat = TITAN_MODMENU_CAT_EMOTES, text = "Set 7", submenu = {
	 {text = "/피곤 ", cmd = "/피곤"}, {text = "/기차 (AV)", cmd = "/기차"}, {text = "/반대 ", cmd = "/반대"}, {text = "/승리 (A)", cmd = "/승리"}, {text = "/바이올린 (AV)", cmd = "/바이올린"}, {text = "/손인사 ", cmd = "/손인사"}, {text = "/천만 (AV)", cmd = "/천만"}, {text = "/푸념 ", cmd = "/푸념"}, {text = "/사악 ", cmd = "/사악"}, {text = "/일 ", cmd = "/일"}, {text = "/꼬르륵 ", cmd = "/꼬르륵"}, {text = "/목말러 ", cmd = "/목말러"}, {text = "/간질 ", cmd = "/간질"}, {text = "/말해 ", cmd = "/말해"},
}},
-------------------------------------------------------------------

	["Sysmenu0"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = "그래픽 ".. TITAN_MODMENU_OPTIONS, toggle = "OptionsFrame"},
	["Sysmenu1"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = "소리 ".. TITAN_MODMENU_OPTIONS, toggle = "SoundOptionsFrame"},
	["Sysmenu2"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = "게임 ".. TITAN_MODMENU_OPTIONS, toggle = "UIOptionsFrame"},
	["Sysmenu3"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = TITAN_MODMENU_KEY, toggle = "KeyBindingFrame"},
	["Sysmenu4"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = "매크로 설정", cmd = "/macro"},
	["Sysmenu5"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = TITAN_MODMENU_GM, func = "ToggleHelpFrame"},
	["Sysmenu6"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = TITAN_MODMENU_SPACER},
	["Sysmenu7"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = "UI 재시작", func = "ReloadUI"},
	["Sysmenu8"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = TITAN_MODMENU_LOGOUT, cmd = "/logout"},
	["Sysmenu9"] = {cat = TITAN_MODMENU_CAT_SYSTEM, text = TITAN_MODMENU_EXIT, cmd = TITAN_MODMENU_EXIT1},
	
	["Gamemenu1"] = {cat = TITAN_MODMENU_CAT_GAMEMENU, text = "캐릭터 정보", func = "TPMM_TogCharFrame"},
	["Gamemenu2"] = {cat = TITAN_MODMENU_CAT_GAMEMENU, text = TITAN_MODMENU_SPELL, func = "TPMM_TogSpellFrame"},
	["Gamemenu3"] = {cat = TITAN_MODMENU_CAT_GAMEMENU, text = TITAN_MODMENU_TALENTS, func = "ToggleTalentFrame"},
	["Gamemenu4"] = {cat = TITAN_MODMENU_CAT_GAMEMENU, text = TITAN_MODMENU_QUEST, func = "ToggleQuestLog"},
	["Gamemenu5"] = {cat = TITAN_MODMENU_CAT_GAMEMENU, text = TITAN_MODMENU_FRIENDS, func = "ToggleFriendsFrame"},
	["Gamemenu6"] = {cat = TITAN_MODMENU_CAT_GAMEMENU, text = TITAN_MODMENU_WORLD, func = "ToggleWorldMap"},

	["Handymenu1"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(1-100)", cmd = "/주사위 1-100"},
	["Handymenu2"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(100-200)", cmd = "/주사위 100-200"},
	["Handymenu3"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(200-300)", cmd = "/주사위 200-300"},
	["Handymenu4"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(300-400)", cmd = "/주사위 300-400"},
	["Handymenu5"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(400-500)", cmd = "/주사위 400-500"},
	["Handymenu6"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(500-600)", cmd = "/주사위 500-600"},
	["Handymenu7"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(600-700)", cmd = "/주사위 600-700"},
	["Handymenu8"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(700-800)", cmd = "/주사위 700-800"},
	["Handymenu9"] = {cat = TITAN_MODMENU_CAT_HANDY, text = "주사위(800-900)", cmd = "/주사위 800-900"},

	["MMmenu1"] = {cat = TITAN_MODMENU_CAT_MMSETTINGS, text = TITAN_MODMENU_TOGGLEICONTEXT, func = "TitanPanelModMenu_ToggleIconText"},
	["MMmenu3"] = {cat = TITAN_MODMENU_CAT_MMSETTINGS, text = "숨기기", func = "TitanPanelModMenu_Hide"},

-------------------------------------------------------------------
	["Minigroup"] = {
		text = "Minigroup",
		cat = TITAN_MODMENU_CAT_RAID,
		frame = "MGOptionsFrame",
		toggle = "MGOptionsFrame",
	},
	["Atlas"] = {
		frame = "AtlasFrame",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "Atlas",
		submenu = {
			{text = TITAN_MODMENU_TOGGLE, toggle = "AtlasFrame"},
			{text = TITAN_MODMENU_SETUP, func = "AtlasOptions_Toggle"},
		},
	},
	["E-캐스팅 바"] = {
		frame = "eCastingBar",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "E-캐스팅 바 메뉴",
		cmd = "/캐스팅"
	},
	["팝바"] = {
		frame = "cPopBar_Options",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "팝바 메뉴",
		cmd = "/팝바 메뉴"
	},
	["채집 도우미"] = {
		frame = "GathererUI_IconFrame",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "채집도우미",
		cmd = "/gather options",
	},
	["전투 메시지 확장"] = {
		frame = "SCT_HEALTHTEXT",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "전투 메시지 확장",
		cmd = "/sct ",
	},
	["AF툴팁"] = {
		frame = "AF_ToolTipFrame",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "AF툴팁 메뉴",
		func = "aftt_toggleFrames",
	},
	["국밥퀵액션"] = {
		frame = "BabQuickActionOptions",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "국밥퀵액션",
		cmd = "/퀵액션",
	},
	["Minimalist"] = {
		frame = "MinFrame",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "Minimalist 설정",
		cmd = "/미니마",
	},
	["NeoSelfCast"] = {
		frame = "NSCOptions",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "NeoSelfCast 설정",
		cmd = "/nsc",
	},
	["오토바"] = {
		frame = "AutoBar_Options",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "오토바 설정",
		cmd = "/오토바",
	},
	["X-Raid"] = {
--		frame = "XRaid_FrameTemplate",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "X-Raid 설정",
		submenu = {
			{text = "공대창 위치 잠금", cmd = "/엑스 잠금"},
			{text = "공대창 위치 해제", cmd = "/엑스 열기"},
			{text = "공대창 파티별 표시", cmd = "/엑스 표시"},
			{text = "공대창 직업별 표시", cmd = "/엑스 직업"},
			{text = "메인탱커 대상 갱신", cmd = "/엑스 갱신"},
			{text = "파티/대상을 표시", cmd = "/엑스 보기"},	
			{text = "파티/대상을 숨김", cmd = "/엑스 숨김"},
			{text = "체력을 퍼센트로 표시", cmd = "/엑스 체력 비율"},
			{text = "체력을 손실양으로 표시", cmd = "/엑스 체력 손실"},	
			{text = "체력을 절대값으로 표시", cmd = "/엑스 체력 절대"},
			{text = "체력 텍스트 표시 안함", cmd = "/엑스 체력 없음"},
			{text = "공대창 위치 초기화", cmd = "/엑스 리셋 위치"},	
			{text = "구성환경 초기화", cmd = "/엑스 리셋 설정"},	
			{text = "버프 보기(토글)", cmd = "/엑스 버프"},
			{text = "사거리 범위를 색으로 표시(토글)", cmd = "/엑스 범위색"},
			{text = "마나바 비율 표시(토글)", cmd = "/엑스 마나바"},},	
	},

	["마법경고"] = {
		frame = "SAOptions",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "마법경고 설정",
		cmd = "/마법경고",
	},
	["도적트랙커"] = {
		frame = "RogueTracker",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "도적트랙커 설정",
		submenu = {
			{text = "도적트랙커 켜기/끄기(토글)", cmd = "/도적트랙커 토글"},
			{text = "도적트랙커 버튼잠금", cmd = "/도적트랙커 잠김"},
			{text = "도적트랙커 버튼풀림", cmd = "/도적트랙커 해제"},
		},	
	},
	["콤보바"] = {
		frame = "MassoComboBarFrame",
		cat = TITAN_MODMENU_CAT_RAID,
		text = "콤보 바 설정",
		submenu = {
			{text = "콤보바 켜기", cmd = "/콤보바 켜기"},
			{text = "콤보바 끄기", cmd = "/콤보바 끄기"},
			{text = "콤보바 전투중에만 보이기", cmd = "/콤보바 전투"},
		},	
	},

};