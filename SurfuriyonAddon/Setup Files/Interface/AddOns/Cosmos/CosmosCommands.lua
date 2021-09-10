--[[
	Extra common usage commands not significant enough for a new module.
	--Thott
	
	Refactored it so that it uses the localization.lua. Added save settings by class.
	--sarf
]]

function Cosmos_RegisterCosmosChatCommands()
	--------------------------------------------------------------------------------
	-- Register the help command.
	local comlist = COSMOS_HELP_COMM;
	local desc = COSMOS_HELP_COMM_INFO;
	local id = "COSMOSHELP";
	local func = function (msg) CosmosMaster_ChatCommandsHelpDisplay(); end
	Cosmos_RegisterChatCommand ( id, comlist, func, desc, CSM_CHAINNONE );
	-- Overwrite old help command.
	Cosmos_RegisterChatCommand ( "HELP", comlist, func, "", CSM_CHAINPRE );
	--------------------------------------------------------------------------------

	--------------------------------------------------------------------------------
	-- Register the version command.
	comlist = COSMOS_VERSION_COMM;
	desc = COSMOS_VERSION_COMM_INFO;
	id = "COSMOSVERSION";
	func = function (msg) CosmosMaster_ChatVersionDisplay(); end
	Cosmos_RegisterChatCommand ( id, comlist, func, desc, CSM_CHAINNONE );
	--------------------------------------------------------------------------------

	--------------------------------------------------------------------------------
	-- Register the class CVar settings commands.
	comlist = COSMOS_CLASS_SETTINGS_COMM;
	desc	= format(COSMOS_CLASS_SETTINGS_COMM_INFO, COSMOS_CLASS_SETTINGS_PARAM_SAVE, COSMOS_CLASS_SETTINGS_PARAM_LOAD);
	id = "SETTINGSBYCLASS";
	func = function(msg)
		if ( ( not msg ) or ( strlen(msg) <= 0 ) ) then
			Sea.io.print(format(COSMOS_CLASS_SETTINGS_HELP1, COSMOS_CLASS_SETTINGS_PARAM_LOAD, COSMOS_CLASS_SETTINGS_PARAM_SAVE));
			return;
		end
		--local command = strlower(msg);
		local command = msg;
		local class = UnitClass("player");
		if( strfind("저장", command) ) then
			CosmosMaster_StoreVariables()
			if ( Cosmos_SaveDefaultSettingsForClass(class) ) then
				Sea.io.print(format(COSMOS_CLASS_SETTINGS_SAVED, class));
			else
				Sea.io.print(format(COSMOS_CLASS_SETTINGS_SAVED_ERROR, class));
			end
		elseif( strfind("로드", command) ) then
			if ( Cosmos_LoadDefaultSettingsForClass(class) ) then
				CosmosMaster_LoadVariables();
				Sea.io.print(format(COSMOS_CLASS_SETTINGS_LOADED, class));
			else
				Sea.io.print(format(COSMOS_CLASS_SETTINGS_LOADED_ERROR, class));
			end
		else
			Sea.io.print(COSMOS_CLASS_SETTINGS_HELP2);
		end
	end
	Cosmos_RegisterChatCommand ( id, comlist, func, desc );
	--------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------
	-- Register the /f x command
	if (SLASH_FOLLOW1 == "/f") then
		SLASH_FOLLOW1 = "/fol";
		SLASH_FOLLOW4 = "/foll";
	end

	comlist = FCOMMAND_COMM;
	desc	= FCOMMAND_COMM_INFO;
	id = "FRIENDSCOMMAND";
	func = function(msg)
		local tbl = split(msg, " ");
		--if (not tbl[1]) then return; end

		if (tbl[1] == "l" or tbl[1] == "목록" or not tbl[1]) then
			local m = ""
			local bool = 0;
			local numFriends = GetNumFriends();
			for i = 1, numFriends, 1 do
				local name, level, class, area, connected = GetFriendInfo(i);
				if (not connected) then
					if (bool == 0) then
						bool = 1;
						print1(FCOMMAND_ONLINE);
						print1(m);
						m = "";
					end
					m = m..MakeHyperLink("player:"..name, name, "FF0000").." ";
				else
					m = m..MakeHyperLink("player:"..name, name, "00FF00").." ";
				end
			end
			print1(FCOMMAND_OFFLINE);
			print1(m);
		elseif (tbl[1] == "a" or tbl[1] == "추가") then
			if (tbl[2]) then
				AddFriend(tbl[2]);
			end
		elseif (tbl[1] == "r" or tbl[1] == "삭제") then
			if (tbl[2]) then
				RemoveFriend(tbl[2]);
			end
		elseif (tbl[1] == "m" or tbl[1] == "귓말") then
			local m = strsub(msg, strlen(tbl[1]) + 1);
			if (not m or strlen(m) < 1) then return; end
			local numFriends = GetNumFriends();
			for i = 1, numFriends, 1 do
				local name, level, class, area, connected = GetFriendInfo(i);
				if (not connected) then
					break;
				end
				SendChatMessage(m, "WHISPER", this.language, name);
			end
		end
	end
	Cosmos_RegisterChatCommand ( id, comlist, func, desc );
	--------------------------------------------------------------------------------

	--------------------------------------------------------------------------------
	-- Register the show UI memory command.
	local comlist = COSMOS_UIMEM_COMM;
	local desc = COSMOS_UIMEM_COMM_INFO;
	local id = "SHOWUIMEMORY";
	local func = function (msg)
			local uimem = math.floor(gcinfo()*1000/1024)/1000;
			DEFAULT_CHAT_FRAME:AddMessage(COSMOS_UIMEM_NOTE);
			DEFAULT_CHAT_FRAME:AddMessage("사용자 인터페이스 메모리 : " .. uimem .. "MB", 1.0, 1.0, 0.0);
	end
	Cosmos_RegisterChatCommand ( id, comlist, func, desc );
	--------------------------------------------------------------------------------
end