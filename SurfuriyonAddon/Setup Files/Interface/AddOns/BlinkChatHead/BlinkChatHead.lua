-------------------------------------------------------------------------------
--
--  Mod Name : Blink Chat Header
--  Author   : Blink
--  Date     : 2004/10/11
--  LastUpdate : 2006/03/30
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

ChatHeadType = {};
ChatHeadType[1] = {"SAY",TEXT(BLINK_CHAT_HEAD_SAY)};
ChatHeadType[2] = {"WHISPER",TEXT(BLINK_CHAT_HEAD_WHISPER)};
ChatHeadType[3] = {"GUILD",TEXT(BLINK_CHAT_HEAD_GUILD)};
ChatHeadType[4] = {"PARTY",TEXT(BLINK_CHAT_HEAD_PARTY)};
ChatHeadType[5] = {"YELL",TEXT(BLINK_CHAT_HEAD_YELL)};
ChatHeadType[6] = {"CHANNEL",TEXT(BLINK_CHAT_HEAD_CHANNEL)};
ChatHeadType[7] = {"RAID",TEXT(BLINK_CHAT_HEAD_RAID)};

-- PagerMessagePrefix is variable of Pager.
PagerMessagePrefix = getglobal("PagerMessagePrefix");

-- BPCMessagePrefix is variable of BlinkPlayerControl.
BPCMessagePrefix = getglobal("BPCMessagePrefix");

-- overriding function
BCH_OriginalSendChatMessage = nil;

BCH_ChatHead = {};
BCH_loaded = 0;

BCH_BM_TYPE = "ALL";
BCH_BM_CURRENT_CHAT_HEAD = "";

-------------------------------------------------------------------------------
-- BlinkPrint
-------------------------------------------------------------------------------
if( not BlinkPrint ) then
	BlinkPrint = function(msg)
		if(ChatFrame1) then
			ChatFrame1:AddMessage(msg, 1.0, 1.0, 0.0);
		end
	end
end


-------------------------------------------------------------------------------
function BlinkChatHead_OnLoad()
	BCH_DATA = {} ;
	--RegisterForSave('BLINK_CHATHEAD');
	--RegisterForSave('BCH_DATA');

--	this:RegisterEvent("UNIT_NAME_UPDATE");
	this:RegisterEvent("VARIABLES_LOADED");

	-- overriding..
	BCH_OriginalSendChatMessage = getglobal("SendChatMessage");
	setglobal("SendChatMessage",BCH_SendChatMessage);

	if( Cosmos_RegisterChatCommand ~= nil ) then
		-- using Cosmos
		local id = "BLINK_CH_CMD";
		local func = function(msg)
			local ctype = gsub(msg, "%s*([^%s]+).*", "%1");
			local headmsg = gsub(msg, "%s*([^%s]+)%s*(.*)", "%2");
			if(strlen(ctype) <= 0) then
				BlinkPrint( TEXT(getglobal("BLINK_CHAT_HEAD_DESC")) );
			else
				ChatHead(ctype,headmsg);
			end
		end
		Cosmos_RegisterChatCommand ( id, BLINK_CHATHEAD_COMMAND, func, BLINK_CHAT_HEAD_DESC );

		local id = "BLINK_CH_CMD_LIST";
		local func = function(msg)
			ChatHeadList();
		end
		Cosmos_RegisterChatCommand ( id, BLINK_CHATHEAD_LIST_COMMAND, func, BLINK_CHATHEAD_LIST_COMMAND_DESC );
	else
		-- standalone
		SlashCmdList["CHAT_HEAD"] = function(msg)
			local ctype = gsub(msg, "%s*([^%s]+).*", "%1");
			local headmsg = gsub(msg, "%s*([^%s]+)%s*(.*)", "%2");
			if(strlen(ctype) <= 0) then
				BlinkPrint( TEXT(getglobal("BLINK_CHAT_HEAD_DESC")) );
			else
				ChatHead(ctype,headmsg);
			end
		end
		for i=1,getn(BLINK_CHATHEAD_COMMAND),1 do
			setglobal("SLASH_CHAT_HEAD"..i,BLINK_CHATHEAD_COMMAND[i]);
		end

		SlashCmdList["CHAT_HEAD_LIST"] = function(msg)
			ChatHeadList();
		end
		for i=1,getn(BLINK_CHATHEAD_LIST_COMMAND),1 do
			setglobal("SLASH_CHAT_HEAD_LIST"..i,BLINK_CHATHEAD_LIST_COMMAND[i]);
		end
	end

	BCH_BlinkModRegister();
end
-------------------------------------------------------------------------------
function BlinkChatHead_OnEvent(event)
	if ( event == "VARIABLES_LOADED" ) then
		BCH_loaded = 1;
		BCH_ChatHead = BCH_GetPlayerInfo();
--	elseif ( event == "UNIT_NAME_UPDATE" and arg1 == "player" ) then
--		local playerName = UnitName("player");
--		if ( BCH_loaded == 1 and playerName ~= nil and playerName ~= UKNOWNBEING and playerName ~= UNKNOWNOBJECT) then
--			BCH_ChatHead = BCH_GetPlayerInfo();
--		end
	end
end

-- override SendChatMessage function //////////////////////////////////////////

function BCH_SendChatMessage( text, ctype, lang, ... )

	if( text == nil ) then
		return;
	end
	local h = "";
	if ( BCH_ChatHead ~= nil ) then
		if( ctype == "WHISPER" )then
			if( PagerMessagePrefix ~= nil and strsub(text, 1, strlen(PagerMessagePrefix)) == PagerMessagePrefix ) then
			elseif ( BPCMessagePrefix ~= nil and strsub(text, 1, strlen(BPCMessagePrefix)) == BPCMessagePrefix ) then
			else
				h = BCH_ChatHead["WHISPER"];
			end
		elseif ( ctype == "CHANNEL" ) then
			if( IsAllowedChannel( arg[1] ) ) then
				h = BCH_ChatHead["CHANNEL"];
			end
		else
			h = BCH_ChatHead[ctype];
		end

		if( h ~= nil and h ~= "" ) then
			text = h .. text;
		end
	end

	if( type(BCH_OriginalSendChatMessage) == "function" ) then
		BCH_OriginalSendChatMessage( text, ctype, lang , unpack(arg));
	elseif( SendChatMessage ~= BCH_SendChatMessage ) then
		SendChatMessage( text, ctype, lang, unpack(arg) );
	end
end


-- ////////////////////////////////////////////////////////////////////////////

function ChatHead( ctype, headmsg )
	if( ctype == nil ) then
		return;
	end

	if( headmsg == nil or headmsg == "" or headmsg == " " ) then
		headmsg = "";
		headmsg_desc = BLINK_CHAT_HEAD_EMPTY;
	else
		headmsg_desc = headmsg;
	end

	if( string.upper(ctype) == "ALL" or ctype == TEXT(BLINK_CHAT_HEAD_ALL) ) then
		for i=1,getn(ChatHeadType),1 do
			BCH_SetPlayerInfo(ChatHeadType[i][1],headmsg);
			BlinkPrint( format(BLINK_CHAT_HEAD_OK, ChatHeadType[i][2], headmsg_desc) );
		end
		BCH_ChatHead = BCH_GetPlayerInfo();
		return;
	end

	for index,value in ChatHeadType do
		if( ctype == index ) then
			BCH_SetPlayerInfo(value[1],headmsg);
			BlinkPrint( format(BLINK_CHAT_HEAD_OK, ChatHeadType[index][2], headmsg_desc) );
			BCH_ChatHead = BCH_GetPlayerInfo();
			return;
		else
			for i=1,table.getn(value),1 do
				if( value[i] == string.upper(ctype) ) then
					BCH_SetPlayerInfo(value[1],headmsg);
					BlinkPrint( format(BLINK_CHAT_HEAD_OK, ChatHeadType[index][2], headmsg_desc) );
					BCH_ChatHead = BCH_GetPlayerInfo();
					return;
				end
			end
		end
	end
	BlinkPrint( BLINK_CHAT_HEAD_DESC );
end

function ChatHeadList()
	for index,value in ChatHeadType do
		local headmsg; -- = BCH_ChatHead[value[1]];
		if( BCH_ChatHead == nil or BCH_ChatHead[value[1]] == nil or BCH_ChatHead[value[1]] == "" ) then
			headmsg = BLINK_CHAT_HEAD_EMPTY;
		else
			headmsg = BCH_ChatHead[value[1]];
		end
		BlinkPrint( format(BLINK_CHATHEAD_LIST,value[2],headmsg) );
	end
end

function IsAllowedChannel(cn)
	local channelNum, channelName = GetChannelName(cn);
	local ret = false;
	if (channelNum > 0 and  channelName ~= nil) then
		for i=1, getn(BLINK_CHAT_HEAD_ALLOWED_CHANNELS), 1 do
			if( string.find(channelName,BLINK_CHAT_HEAD_ALLOWED_CHANNELS[i]) ) then
				ret = true;
			end
		end
	end

	return ret;
end

-- usage : /script ViewChannels()
function ViewChannels()
	for i = 1, 10, 1 do
		local channelNum, channelName = GetChannelName(i);
		if (channelNum > 0 and  channelName ~= nil) then
			BlinkPrint("Channel Number : " .. channelNum .. ", Name : [" .. channelName .. "]");
		end
	end
end

function BCH_GetPlayerInfo()
	local player = GetCVar("realmName") .. " - " .. UnitName("player");
	if ( not BCH_DATA ) then
		return nil;
	end
	return BCH_DATA[player];
end

function BCH_SetPlayerInfo(ctype,head)
	local player = GetCVar("realmName") .. " - " .. UnitName("player");
	if ( not BCH_DATA ) then
		BCH_DATA = {};
	end
	if ( not BCH_DATA[player] ) then
		BCH_DATA[player] = {};
	end
	BCH_DATA[player][ctype] = head;
--	RegisterForSave('BCH_DATA');
end

function BCH_BlinkModRegister()
	if ( not BlinkMod_RegisterMenu ) then
		return;
	end

	local info;
	local color;
	local chattypes = getglobal("ChatTypeInfo");

	-- tier 1
	info = {};
	info.parentkey = "SELF";
	info.key = "BCHMAIN";
	info.text = "말머리 애드온";
	info.hasArrow = 1;
	info.tooltipTitle = "말머리 애드온";
	info.tooltipText = "채팅창에 지정한 말머리를 표시합니다.";
	info.notCheckable = 1;
	BlinkMod_RegisterMenu( info, 1 );

		-- tier 2 : parent = BCHMAIN
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHTITLE";
		info.text = "말머리 애드온";
		info.isTitle = 1;
		info.notCheckable = 1;
		BlinkMod_RegisterMenu( info, 2 );

		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHEDITALL";
		info.text = "모든 말머리";
		info.tooltipTitle = "모든 말머리";
		info.tooltipText = "대화/파티/귓말/길드/채널/공격대 말머리를 한꺼번에 지정합니다.";
		info.ClickFunction = BCH_BM_EditAllClick;
		info.notCheckable = 1;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["SAY"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHSAY";
		info.text = "대화";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "대화 말머리";
		info.tooltipText = "일반 대화시 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditSayClick;
		info.GetNameFunction = BCH_BM_EditSayName;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["WHISPER"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHWHISPER";
		info.text = "귓말";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "귓말 말머리";
		info.tooltipText = "귓말 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditWhisperClick;
		info.GetNameFunction = BCH_BM_EditWhisperName;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["WHISPER"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHGUILD";
		info.text = "길드";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "길드 말머리";
		info.tooltipText = "길드대화 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditGuildClick;
		info.GetNameFunction = BCH_BM_EditGuildName;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["PARTY"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHPARTY";
		info.text = "파티";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "파티 말머리";
		info.tooltipText = "파티 대화 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditPartyClick;
		info.GetNameFunction = BCH_BM_EditPartyName;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["YELL"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHYELL";
		info.text = "외침";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "외침 말머리";
		info.tooltipText = "외침 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditYellClick;
		info.GetNameFunction = BCH_BM_EditYellName;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["CHANNEL"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHCHANNEL";
		info.text = "채널";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "채널";
		info.tooltipText = "공개채널 대화 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditChannelClick;
		info.GetNameFunction = BCH_BM_EditChannelName;
		BlinkMod_RegisterMenu( info, 2 );

		color = chattypes["RAID"];
		info = {};
		info.parentkey = "BCHMAIN";
		info.key = "BCHRAID";
		info.text = "공격대";
		info.textR = color.r;
		info.textG = color.g;
		info.textB = color.b;
		info.tooltipTitle = "공격대";
		info.tooltipText = "공격대 말머리를 설정합니다.";
		info.notCheckable = 1;
		info.ClickFunction = BCH_BM_EditRaidClick;
		info.GetNameFunction = BCH_BM_EditRaidName;
		BlinkMod_RegisterMenu( info, 2 );
end

-- all
function BCH_BM_EditAllClick()
	--BCH_BM_TYPE = TEXT(BLINK_CHAT_HEAD_ALL);
	setglobal("BCH_BM_TYPE",TEXT(BLINK_CHAT_HEAD_ALL));
	StaticPopupDialogs["EDIT_CHATHEAD"].text = BLINK_FORMAT_STATIC_MSG_ALL; --format("%s\n",TEXT(BLINK_CHAT_HEAD_ALL));
	BCH_BM_CURRENT_CHAT_HEAD = "";
	StaticPopup_Show("EDIT_CHATHEAD");
end

-- template
function BCH_BM_EditClick(h)
	setglobal("BCH_BM_TYPE",ChatHeadType[h][2]);
	StaticPopupDialogs["EDIT_CHATHEAD"].text = format(BLINK_FORMAT_STATIC_MSG,ChatHeadType[h][2]);
	if ( BCH_ChatHead and BCH_ChatHead[ChatHeadType[h][1]] and strlen(BCH_ChatHead[ChatHeadType[h][1]])>0 ) then
		BCH_BM_CURRENT_CHAT_HEAD = BCH_ChatHead[ChatHeadType[h][1]];
	else
		BCH_BM_CURRENT_CHAT_HEAD = "";
	end
	StaticPopup_Show("EDIT_CHATHEAD");
end
function BCH_BM_EditName(h)
	if ( BCH_ChatHead and BCH_ChatHead[ChatHeadType[h][1]] and strlen(BCH_ChatHead[ChatHeadType[h][1]])>0 ) then
		return ChatHeadType[h][2] .. " : " .. BCH_ChatHead[ChatHeadType[h][1]];
	else
		return ChatHeadType[h][2] .. " : " .. BLINK_CHAT_HEAD_EMPTY;
	end
end

-- say
function BCH_BM_EditSayClick() BCH_BM_EditClick(1); end
function BCH_BM_EditSayName() return BCH_BM_EditName(1); end

-- whisper
function BCH_BM_EditWhisperClick() BCH_BM_EditClick(2); end
function BCH_BM_EditWhisperName() return BCH_BM_EditName(2); end

-- guild
function BCH_BM_EditGuildClick() BCH_BM_EditClick(3); end
function BCH_BM_EditGuildName() return BCH_BM_EditName(3); end

-- party
function BCH_BM_EditPartyClick() BCH_BM_EditClick(4); end
function BCH_BM_EditPartyName() return BCH_BM_EditName(4); end

-- yell
function BCH_BM_EditYellClick() BCH_BM_EditClick(5); end
function BCH_BM_EditYellName() return BCH_BM_EditName(5); end

-- channel
function BCH_BM_EditChannelClick() BCH_BM_EditClick(6); end
function BCH_BM_EditChannelName() return BCH_BM_EditName(6); end

-- raid
function BCH_BM_EditRaidClick() BCH_BM_EditClick(7); end
function BCH_BM_EditRaidName() return BCH_BM_EditName(7); end

StaticPopupDialogs["EDIT_CHATHEAD"] = {
	text = format("%s\n",getglobal("BCH_BM_TYPE")),
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 33,
	OnAccept = function()
		local editBox = getglobal(this:GetParent():GetName().."EditBox");
		ChatHead( getglobal("BCH_BM_TYPE"), editBox:GetText() );
	end,
	OnShow = function()
		StaticPopupDialogs["EDIT_CHATHEAD"].text = format("%s\n",getglobal("BCH_BM_TYPE"));
		getglobal(this:GetName().."EditBox"):SetText(BCH_BM_CURRENT_CHAT_HEAD);
		getglobal(this:GetName().."EditBox"):SetFocus();
	end,
	OnHide = function()
		if ( ChatFrameEditBox:IsVisible() ) then
			ChatFrameEditBox:SetFocus();
		end
		getglobal(this:GetName().."EditBox"):SetText("");
	end,
	EditBoxOnEnterPressed = function()
		local editBox = getglobal(this:GetParent():GetName().."EditBox");
		ChatHead( getglobal("BCH_BM_TYPE"), editBox:GetText() );
		this:GetParent():Hide();
	end,
	EditBoxOnEscapePressed = function()
		this:GetParent():Hide();
	end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1
};
