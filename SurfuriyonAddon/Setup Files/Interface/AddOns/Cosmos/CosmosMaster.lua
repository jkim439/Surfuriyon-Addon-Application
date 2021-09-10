--[[

	The Cosmos Configuration Master

	   This is a set of functions and a window, designed
	to 	accept a list of variables, editable in a simple
	configuration view.

	by Alexander Brazie

	==> Demo at the bottom <==
	
	Revision: $Rev: 2067 $
	Last Author: $Author: Arbi $
	Last Change: $Date: 2006-06-29 18:03:15 +0900 (Thu, 29 June 2006) $
 ]]--

-- Global values
COSMOSMASTER_DISPLAY_LIMIT = 10;
COSMOSMASTER_HEIGHT_LIMIT = 32;
COSMOSMASTER_CHAT_INIT_WAIT = 5;
COSMOSMASTER_CHAT_JOIN_DELAY = 3;
COSMOSMASTER_CHAT_UPDATE_WAIT = 1;
COSMOSMASTER_CHAT_STABLE_CHECK = 3;
COSMOSMASTER_VERSION = "$Rev: 2067 $";
COSMOSMASTER_UPDATE = "$Date: 2006-06-29 18:03:15 +0900 (Thu, 29 June 2006) $";
HANULARIMASTER_UPDATE = "2006년 6월 29일";
HANULARIMASTER_VERSION = "하늘아리 2.22";

-- Debugger Toggles
COSMOSMASTER_DEBUG = 1;
CSM_DEBUG = "COSMOSMASTER_DEBUG";

-- These contain the registered variables, and their respective settings
CosmosMaster_Configurations = { };
CosmosMaster_ChatCommands = { };
CosmosMaster_ChatWatches = { };
CosmosMaster_ChatTypeMap = { };
CosmosMaster_Buttons = { };
CosmosMaster_ChannelOrder = { }; 
CosmosMaster_CosmosUsers = { };

-- Store Cosmos Users between sessions?
--RegisterForSave("CosmosMaster_CosmosUsers");

-- Keywords (for use by anyone)
CSM_VARIABLE = "variable";
CSM_TYPE	= "type";
CSM_STRING	= "string";
CSM_DESCRIPTION = "description";
CSM_HANDLER = "onchange";
CSM_CHECKONOFF = "checked";
CSM_SLIDERSTRING = "substring";
CSM_DEFAULTVALUE = "slidervalue";
CSM_SLIDERVALUE = "slidervalue";
CSM_SLIDERMIN = "slidermin";
CSM_SLIDERMAX = "slidermax";
CSM_SLIDERSTEP = "sliderstep";
CSM_SLIDERVALUETEXTTOGGLE = "slidervaluetexttoggle";
CSM_SLIDERTEXTAPPEND = "append";
CSM_SLIDERVALUETEXTMULTIPLIER = "multiplier";
CSM_SECTION = "section";
CSM_ID = "id";
CSM_NAME = "name";
CSM_ICON = "icon";
CSM_LONGDESCRIPTION = "longdescription";
CSM_CALLBACK = "callback";
CSM_TESTFUNCTION = "testfunction";
CSM_ALIASES = "aliases";
CSM_PREVIOUSFUNCTION = "prevfunction";
CSM_CHAINPRE = "chainpre"; -- Chain commands before you call yourself
CSM_CHAINPOST = "chainpost"; -- Chain commands after you call yourself
CSM_CHAINNONE = "chainnone"; -- Don't chain
CSM_CHAINPREVIOUSONLY = "chainpreviousonly"; -- Ignore yourself if you already exist
CSM_TYPELIST = "typelist";
CSM_CHANNELINDEX = "chanindex";
CSM_CHANNELNAME = "channame";
CSM_CHANNELDESC = "chandesc";
CSM_CHANNELSTATE = "chanstate";
CSM_CHANNELCREATE = "chantimeorder";

-- These contain global variables, used for timing/state checks
CosmosMaster_StartTime = 0;
CosmosMaster_WaitMessage = "";
CosmosMaster_WaitButton = "";
CosmosMaster_CurrentChannel = "";
CosmosMaster_LastChatTime = 0;
CosmosMaster_JoinDelay = COSMOSMASTER_CHAT_JOIN_DELAY;
CosmosMaster_LeaveDelay = COSMOSMASTER_CHAT_JOIN_DELAY;
CosmosMaster_VarsLoaded = nil;
CosmosMaster_LastPlayer = nil;
CosmosMaster_LastRealm = nil;
CosmosMaster_ChansLoaded = nil;
CosmosMaster_ChansWasOnTaxi = nil;
CosmosMaster_LastAsked = nil;
CosmosMaster_ChanList = {};
CosmosMaster_ChanIDList = {};
CosmosMaster_Section = "COS_COS";
CosmosMaster_UseChatFunctions = true;
CosmosMaster_LastSection = CosmosMaster_Section;
CosmosMaster_LastSeparator = nil;
CHANNEL_COSMOS = "COSMOS_CHANNEL";
CHANNEL_PARTY = "COSMOS_PARTY";

-- This registers a variable with the configuration client. --

--[[

   This MUST be called for a variable to appear in the configuration menu.

	ParameterList:
   cos_variable - the global var used and string for the CVar
   cos_type - CHECKBOX, SLIDER, BOTH, BUTTON, SEPARATOR, or SECTION
   cos_string - Associated string
   cos_description -  A three line max description of the variable for the users sake
   cos_handerfunction - Function called with value as first parameter, and second as toggle state when changed.
   cos_defaultcheckedvalue - 1 = Checked, 0 = Unchecked
   cos_defaultvalue - Default value returned when checked
   cos_min - Minimum slider value
   cos_max - Maximum slider value
   cos_substring - Slider or button text
   cos_sliderstep - Increments at which the slider may move
   cos_slidervaluetexton - Toggle for the exact value display of a slider
   cos_slidervalueappend - Whats added to the end of the number
   cos_slidervaluemultiplier - Whats the value multiplied by for display.

  ]]--

function Cosmos_RegisterConfiguration(
	cos_variable,
	cos_type,
	cos_string,
	cos_description,
	cos_handlerfunction,
	cos_defaultcheckedvalue,
	cos_defaultvalue,
	cos_min,
	cos_max,
	cos_substring,
	cos_sliderstep,
	cos_slidervaluetexton,
	cos_slidervalueappend,
	cos_slidervaluemultiplier )

    -- Prepare for nil values
	if ( cos_description == nil ) then cos_description = ""; end
	if ( cos_defaultcheckedvalue == nil or cos_defaultcheckedvalue == false or cos_defaultcheckedvalue == 0 ) then cos_defaultcheckedvalue = 0;
	else cos_defaultcheckedvalue = 1; end
	if ( cos_defaultvalue == nil ) then cos_defaultvalue = 1; end
	if ( cos_min == nil  ) then cos_min = 0; end
	if ( cos_max == nil  ) then cos_max = 1; end
	if ( cos_slidervalueappend == nil ) then cos_slidervalueappend = ""; end
	if ( cos_slidervaluemultiplier == nil ) then cos_slidervaluemultiplier = 1; end
	if ( cos_type == nil ) then cos_type = "nil"; end
	if ( cos_substring == nil  ) then cos_substring = ""; end
	if ( cos_sliderstep == nil ) then cos_sliderstep = .01; end
	if ( cos_handlerfunction == nil ) then cos_handlerfunction = function ( x ) return; end; end;
	if ( cos_slidervaluetexton == nil or cos_slidervaluetexton == 0) then cos_slidervaluetexton = 0;
	else cos_slidervaluetexton = 1;
	end

	if (not string.find ( cos_variable, "COS_" )) then
		Sea.io.print ( "Invalid Prefix" );
		return; -- We won't permit CVars that could mess up the game
				-- So they must be prefixed with COS_
	end
	
	-- Check the specified type
	if ( not cos_type == "CHECKBOX" and not cos_type == "SLIDER" and not cos_type == "SEPARATOR" and not cos_type == "BOTH" and not cos_type == "BUTTON" and not cos_type == "SECTION" ) then
		Sea.io.print ( "Invalid Type: "..cos_type );
		return; -- Return if it does not suit our handleable types
	end
        if ( cos_type == "SLIDER" or cos_type == "BOTH" ) then
		if ( cos_defaultvalue == nil) then cos_defaultvalue = 1; end
	end
	if ( cos_type == "SECTION" ) then
		CosmosMaster_LastSection = cos_variable;
	end
	if ( cos_type == "SEPARATOR" ) then
		CosmosMaster_LastSeparator = cos_variable;
	end

	local newRegistrant = {
		[CSM_VARIABLE] = cos_variable,
		[CSM_TYPE]	= cos_type,
		[CSM_STRING]	= cos_string,
		[CSM_DESCRIPTION] = cos_description,
		[CSM_SLIDERSTRING] = cos_substring,
		[CSM_CHECKONOFF] = cos_defaultcheckedvalue,
		[CSM_SLIDERMIN] = cos_min,
		[CSM_SLIDERMAX] = cos_max,
		[CSM_SLIDERVALUE] = cos_defaultvalue,
		[CSM_SLIDERSTEP] = cos_sliderstep,
		[CSM_SLIDERVALUETEXTTOGGLE] = cos_slidervaluetexton,
		[CSM_SLIDERVALUETEXTMULTIPLIER] = cos_slidervaluemultiplier,
		[CSM_SLIDERTEXTAPPEND] = cos_slidervalueappend,
		[CSM_HANDLER] = cos_handlerfunction,
		[CSM_SECTION] = CosmosMaster_LastSection
	}
	
	-- Check if its already been registered and flag an error
	local found = false;
	for k,v in CosmosMaster_Configurations do
		if ( CosmosMaster_Configurations[k][CSM_VARIABLE] == cos_variable ) then
			if (((CosmosMaster_Configurations[k][CSM_TYPE] == "SECTION") and (cos_type == "SECTION")) or ((CosmosMaster_Configurations[k][CSM_TYPE] == "SEPARATOR") and (cos_type == "SEPARATOR"))) then
				return true;
			else
				--Sea.io.print ( " Cosmos Register Configuration Error: Duplicate Configuration - "..cos_variable );
				found = true;
			end
		end
	end
	if ( found == false ) then
		local index = nil;
		if (CosmosMaster_LastSection and (cos_type ~= "SECTION")) then
			local foundSection = false;
			local foundSeparator = false;
			for k in CosmosMaster_Configurations do
				if (foundSeparator and ((CosmosMaster_Configurations[k][CSM_TYPE] == "SECTION") or (CosmosMaster_Configurations[k][CSM_TYPE] == "SEPARATOR"))) then
					break;
				end
			 	if (foundSection and CosmosMaster_LastSeparator and (CosmosMaster_Configurations[k][CSM_VARIABLE] == CosmosMaster_LastSeparator)) then
			 		foundSeparator = true;
			 	end
			 	if (foundSection and (CosmosMaster_Configurations[k][CSM_TYPE] == "SECTION")) then
					break;
				end
				if (CosmosMaster_Configurations[k][CSM_VARIABLE] == CosmosMaster_LastSection) then
			 		foundSection = true;
			 	end
			 	if (foundSection) then
			 		index = k;
			 	end
			end
		end
		-- Add the new registrant to the list
		if (index) then
			table.insert ( CosmosMaster_Configurations, index + 1, newRegistrant );
		else
			table.insert ( CosmosMaster_Configurations, newRegistrant );
		end
	end

	--if ( cos_type=="SLIDER" or  cos_type=="BOTH" ) then
		Cosmos_RegisterCVar(cos_variable, cos_defaultvalue);
	--end
	--if (  cos_type=="CHECKBOX" or  cos_type=="BOTH" ) then
		Cosmos_RegisterCVar(cos_variable.."_X", cos_defaultcheckedvalue);
	--end
			
	return true;

end

--[[
	Cosmos_UpdateValue allows you to manually update a parameter.

	I presume upon the user to use this properly.
	If you break it, tough luck. No error checking here.

	parameter list:

	cos_uniqueid - UniqueID (CVar) (technically it updates every match)
	cos_parameter - Parameter to be updated,
	cos_value - new value to be set.

	Example usage
	Cosmos_UpdateValue( "COS_MYVAR", CSM_TYPE, "BUTTON" );
	Cosmos_UpdateValue( "COS_MYVAR", CSM_SLIDERVALUETEXTMULTIPLIER, UnitHealthMax("player") );
   ]]--

function Cosmos_UpdateValue( cos_uniqueid, cos_parameter, cos_value )
	
	if( cos_parameter == CSM_CHECKONOFF ) then
		if ( cos_value+0 == 0 or cos_value+0 == 1 ) then 
		else return; end
	end
	if( cos_parameter == CSM_TYPE ) then
		if ( cos_value == "SLIDER" or cos_value == "CHECKBOX" or cos_value == "BOTH"
		or  cos_value == "BUTTON" or cos_value == "SEPARATOR" or cos_value == "SECTION" ) then
		else return; end
	end
	if( cos_parameter == CSM_SLIDERSTEP ) then
		if ( cos_value == 0 ) then cos_value = .01;
		else return; end
	end
	
	for index, value in CosmosMaster_Configurations do
		if ( value[CSM_VARIABLE] == cos_uniqueid ) then
			value[cos_parameter] = cos_value; -- Hope the user doesnt break it.
		end
	end

end

--[[ 

     Cosmos_RegisterChatCommand 
     
     Allows you to register an in-game chat command with Cosmos's simple registration system.
     It will also cause your command to be listed with the /help or /eshelp command locally.

	usage:
	
	 Cosmos_RegisterChatCommand( GroupID, Array of commands, handler of 1 argument, chaining instructions );
	 
	example:		this.chatFrame.channelList[i] = name;
		this.chatFrame.zoneChannelList[i] = zoneChannel;
	function MyCallback (message) Sea.io.print(message); end
	 MyCommands = { "/testa", "/testb", "/testc" }
	 Cosmos_RegisterChatCommand( "TESTGROUP", MyCommands, MyCallback, "My Function", CSM_CHAINPOST);
	 
	 Will create a command that executes MyCallback, and anything else that was listed for testgroup previously.

	]]--

function Cosmos_RegisterChatCommand( cos_groupid, cos_commands, cos_handler, cos_descriptionstring, cos_chaintype )
	-- Error checking. 
	if ( cos_groupid == nil ) then 
		--Sea.io.print( " No Group ID specified." );
		return;
	end
	if ( cos_commands == nil ) then 
		Sea.io.print( cos_groupid.." No /command specified." );
		return;
	end
	if ( cos_handler == nil ) then 
		Sea.io.print( cos_groupid.." No functions specified." );
		return;
	end
	
	-- Adds the command handler to the chat global pane
	cmdlist = getglobal ( "SlashCmdList" );
	
	local cos_prevfunc = nil;
	
	-- Save the old commands if you're overwriting one
	if ( cmdlist [ cos_groupid ] ~= nil ) then
		cos_prevfunc = cmdlist [ cos_groupid ] ;
	end
	
	-- Error checking
	if ( cos_prevfunc == nil ) then 
		cos_prevfunc = function () return; end;
	end
	
	-- Set the new command
	if ( cos_chaintype == CSM_CHAINPRE ) then
		cmdlist [ cos_groupid ] 
			= function (msg)
				cos_prevfunc(msg);
				cos_handler(msg);
			end;
	end

	if ( cos_chaintype == CSM_CHAINPOST ) then
		cmdlist [ cos_groupid ] 
			= function (msg)
				cos_handler(msg);
				cos_prevfunc(msg);
			end;
	end
	if ( cos_chaintype == CSM_CHAINPREVIOUSONLY ) then
		cmdlist [ cos_groupid ] 
			= function (msg)
				cos_prevfunc(msg);
			end;
	end
	if ( cos_chaintype == nil or cos_chaintype == CSM_CHAINNONE ) then
		cmdlist [ cos_groupid ] 
			= function (msg)
				cos_handler(msg);
			end;
	end
	
	-- Create a new command and save it locally.
	if ( Sky ) then
		Sky.registerSlashCommand(
			{
				id=cos_groupid,
				commands=cos_commands,
				onExecute=cos_handler,
				action=cos_prevfunc,
				helpText=cos_descriptionstring
			} 
		);
	else
		newChatCommand = {};
		newChatCommand[CSM_ID] = cos_groupid;
		newChatCommand[CSM_ALIASES] = cos_commands;
		newChatCommand[CSM_HANDLER] = cos_handler;
		newChatCommand[CSM_DESCRIPTION] = cos_descriptionstring;
		newChatCommand[CSM_PREVIOUSFUNCTION] = cos_prevfunc;

		tinsert(CosmosMaster_ChatCommands, newChatCommand);
	end
end

--[[

	RegisterButton

	 Allow you to create a button of your mod in the Cosmos Features Frame.
	 
	 Usage: 
	 
		Cosmos_RegisterButton ( name, description, ToolTip_description, icon, callback, testfunction ) 
		
	 Example:
		
		Cosmos_RegisterButton ( 
			"Name", 
			"Little Text", 
			"Long Tool Tip Text", 
			"Interface\\Icons\\Spell_Holy_BlessingOfStrength", 
			function()
				if (GamesListFrame:IsVisible()) then 
					HideUIPanel(GamesListFrame); 
				else 
					ShowUIPanel(GamesListFrame); 
				end 
			end,
			function() 
				if (UnitInParty("party1")) then 
					return true; -- The button is enabled
				else
					return false; -- The button is disabled
				end
			end
			);
		
		A button will be created in the Features Frame.
		
		Description must not be more than 2 words, you should put a longer description in the tool tip.
		
	 ]]--

function Cosmos_RegisterButton ( cos_name, cos_description, cos_longdescription, cos_icon, cos_callback, cos_testfunction ) 
	if ( cos_name == nil ) then 
		Sea.io.print ( "Missing a name for the Button.");
	end
	if ( cos_icon == nil ) then 
		Sea.io.print ( "Missing an icon path for the Button.");
	end
	if ( cos_callback == nil ) then 
		Sea.io.print ( "Missing a callback for the Button.");
	end
	if ( cos_testfunction == nil ) then 
		cos_testfunction = function () return true; end;
	end

	temp = { };
	temp[CSM_NAME] = cos_name;
	temp[CSM_DESCRIPTION] = cos_description;
	temp[CSM_LONGDESCRIPTION] = cos_longdescription;
	temp[CSM_ICON] = cos_icon;
	temp[CSM_CALLBACK] = cos_callback;
	temp[CSM_TESTFUNCTION] = cos_testfunction;
	
	tinsert ( CosmosMaster_Buttons, temp );

	local loaded = LoadAddOn("CosmosMenu");
	if ( loaded ) then
		CosmosButton_UpdateButton();
	end
end

--[[

	RegisterChatWatch
	
	 Allows you to register a command to be called when a condition 
	 is met within a block of text in incoming chat messages. 
	 
	 Usage: 
	 
		Cosmos_RegisterChatWatch ( id, typearray, handlerfunction, description );
		
	 Example;
		
		Cosmos_RegisterChatWatch ( "NOYELLS", {"YELL"}, function (msg) return 0; end );
		
		This would create a function which disables yells by returning a 0 
		(indicating to halt all commands) whenever a type 'YELL' is seen.
		
		Description is entirely for debugging and observational purposes.
	 
	    You can watch the cosmos channel, just use CHANNEL_COSMOS instead of the channel type.
	    You can watch the cosmos party channel, just use CHANNEL_PARTY instead of the channel type.

	 ]]--

function Cosmos_RegisterChatWatch ( cos_id, cos_typelist, cos_handler, cos_description ) 
	
	if ( cos_id == nil ) then 
		Sea.io.print ( "Missing an ID for ChatWatch.");
	end
	if ( cos_typelist == nil or getn( cos_typelist) == 0 ) then 
		Sea.io.print ( "No chat types specified for observation");
	end
	if ( cos_handler == nil ) then 
		Sea.io.print ( "No handler function specified to apply to chat messages");
	end

	newChatWatch = {};
	newChatWatch[CSM_ID] = cos_id;
	newChatWatch[CSM_TYPELIST] = cos_typelist;
	newChatWatch[CSM_HANDLER] = cos_handler;
	newChatWatch[CSM_DESCRIPTION] = cos_description;
	
	-- Ignore this really useless line
	tinsert ( CosmosMaster_ChatWatches, newChatWatch );
	for k,v in cos_typelist do
		if ( CosmosMaster_ChatTypeMap[v] == nil ) then CosmosMaster_ChatTypeMap[v] = {}; end
		tinsert ( CosmosMaster_ChatTypeMap[v], {handler=cos_handler;id=cos_id} );
	end
end

-- this function iterates through the list and processes all commands that match and return not 0
function CosmosMaster_PreprocessChat(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, loops, frame)
	local type = strsub(event, 10);
	local info = ChatTypeInfo[type];

	-- Rename the arguments
	local message, player, language, channel, arg5, arg6, arg7, channelNumber, channelNameWithoutNumber, loops, frame = arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, loops, frame;
	
	-- Handle overloading chatlist
	if (CosmosMaster_UseChatFunctions and (type == "CHANNEL_LIST")) then
		if (strlen(channel) == 0) then
			CosmosMaster_ListChannels();
		else
			CosmosMaster_ListChannels(message, channelNameWithoutNumber);
		end
		return false;
	end
	
	if (not frame) then
		frame = this;
	end
	
	-- Handle overloading of join/leaves for modified channel order.
	if (CosmosMaster_UseChatFunctions and channelNameWithoutNumber and (type == "CHANNEL_NOTICE") and ((message == "YOU_JOINED") or (message == "SUSPENDED") or (message == "YOU_LEFT"))) then
		local chanID = CosmosMaster_GetChannelID(channelNameWithoutNumber);
		if ((message == "YOU_JOINED") and (chanID == 0)) then
			CosmosMaster_WatchChatOrder();
			if (not loops) then
				loops = 0;
			end
			if (loops > 10) then
				return true;
			end
			Cosmos_Schedule(1, CosmosMaster_PreprocessChat, event, message, player, language, channel, arg5, arg6, arg7, channelNumber, channelNameWithoutNumber, loops+1, frame);
			return false;
		end
		
		if (((message == "YOU_LEFT") or (message == "SUSPENDED")) and (chanID ~= 0)) then
			CosmosMaster_ChanList[chanID] = nil;
		end

		if (chanID and (not string.find(channelNameWithoutNumber, "ZParty")) and (channelNameWithoutNumber ~= CosmosMaster_GetChannelName())) then
			info = ChatTypeInfo["CHANNEL"..channelNumber];
			if (info) then
				Sea.io.printfc(frame, info, format(TEXT(getglobal("CHAT_"..message.."_NOTICE")), chanID..". "..channelNameWithoutNumber) );
			end
		end		
		
		return false;
	end
	
	-- Start PPC Code
	local time = GetTime();
	time = time - (math.mod(time,1.5));
	local frameID = 0;
	if (frame) then
		local typeFunction = getglobal("type");
		if ( typeFunction(frame) == "number" ) then
			frameID = frame;
		else
			frameID = frame:GetID();
			if (not frameID) then
				frameID = 0;
			end
		end
	end

	local continue = true; -- becomes false if it should not continue.
	--print1("PP: ", type, message, player, time, ",", arg5, " 6: ", arg6, " 7:", arg7, " 8:", channelNumber, " 9:", channelNameWithoutNumber);
	if (not player) then
		player = '';
	end
	if (not message) then
		message = '';
	end
	local PPC; 
	if (message) then
		local typeFunction = getglobal("type");
		if ( typeFunction(message) == "table" ) then
			local messageStr = "";
			for k, v in message do
				messageStr = messageStr..format("[%s] => %s\n", k, v);
			end
			PPC = ("PP: "..type..","..messageStr..';'..player.." T{"..time.."}");
		else
			PPC = ("PP: "..type..","..message..';'..player.." T{"..time.."}");
		end
	end

	if (not CosmosMaster_PPC) then
		CosmosMaster_PPC = {last="",lastc=true};
	end

	-- This code ensures the same message is not sent twice in a row. 
	if ( CosmosMaster_PPC[frameID] == PPC ) then 
		return false;
	else 
		CosmosMaster_PPC[frameID] = PPC;
	end

	-- end PPC Code
	
	local CNum = "-1";
	local PNum = "-1";

			if ( strfind(type, "CHANNEL") == 1 ) then	
				CNum = CosmosMaster_GetChannelNumber(CosmosMaster_GetChannelName());
				PNum = CosmosMaster_GetChannelNumber(CosmosMaster_GetCurrentPartyChannel());

		if (strlen(channel) > 0) then
			if ( CNum..'' == strsub(channel, 1, strlen(CNum)) ) then
				type = CHANNEL_COSMOS;
				continue = false;
			elseif ( PNum..'' == strsub(channel, 1, strlen(PNum)) ) then
				type = CHANNEL_PARTY;
				continue = false;
			elseif ( strfind(channel, "ZParty") ) then
				continue = false;
			end
		end
	end

	-- Send the message to all watchers who match the current type
	if ( CosmosMaster_PPC.last ~= PPC ) then 
		CosmosMaster_PPC.last = PPC;
		if ( CosmosMaster_ChatTypeMap[type] ~= nil ) then
			for index, value in CosmosMaster_ChatTypeMap[type] do
				local f = value.handler;
				if ( f ( type, info, message, player, language, channel ) == 0 ) then
					continue = false;
				end
			end
		end
		CosmosMaster_PPC.lastc = continue;
	else
		continue = CosmosMaster_PPC.lastc;
	end
	return continue;
end

-- Cleans out cosmos channels
function CosmosMaster_CleanChannels()
	local foundChan = false;
	for i = 1, 10, 1 do
		local channelNum, channelName = GetChannelName(i);
		if (channelNum > 0 and  channelName ~= nil) then
			if ( string.find(channelName, "ZParty") or string.find(channelName, "ZCosmosTemp") or (channelName == CosmosMaster_GetChannelName())) then
				LeaveChannelByName(channelName);
				foundChan = true;
			end
		end
	end
	if (foundChan) then
		Cosmos_Schedule(1, CosmosMaster_CleanChannels);
		return;
	end
	if (UnitOnTaxi("player")) then
		CosmosMaster_ChansWasOnTaxi = true;
		Cosmos_Schedule(1, CosmosMaster_CleanChannels);
		return;
	end
	if (CosmosMaster_ChansWasOnTaxi) then
		CosmosMaster_ChansWasOnTaxi = false;
		Cosmos_Schedule(COSMOSMASTER_CHAT_INIT_WAIT, CosmosMaster_CleanChannels);
		return;
	end
	CosmosMaster_ChansLoaded = true;
end

-- Keeps up with new channels that have been joined, and assigns an appropriate number to them in the virtual number system
function CosmosMaster_WatchChatOrder()
	if ((not CosmosMaster_ChansLoaded) or (not CosmosMaster_UseChatFunctions)) then
		return;
	end

	local cosCount = 0;
	for i = 1, 10 do
		local channelNum, channelName = GetChannelName(i);
		if (channelName ~= nil) then
			local chanID = CosmosMaster_GetChannelID(channelName);
			if (CosmosMaster_ChanIDList[channelName]) then
				cosCount = cosCount - 1;
				if (chanID ~= CosmosMaster_ChanIDList[channelName]) then
					if (chanID > 0) then
						CosmosMaster_ChanIDList[chanID] = nil;
					end
					CosmosMaster_ChanList[CosmosMaster_ChanIDList[channelName]] = channelName;
				end
			else
				local occupied = true;
				while (occupied) do
					occupied = false;
					for curChan in CosmosMaster_ChanIDList do
						if (CosmosMaster_ChanIDList[curChan] == (i + cosCount)) then
							occupied = true;
							break;
						end
					end
					if (occupied) then
						cosCount = cosCount + 1;
					end
				end
				
				CosmosMaster_ChanList[chanID] = nil;
				CosmosMaster_ChanList[i + cosCount] = channelName;
			end
		end
	end
	
	for i = 1, 10 do
		if (CosmosMaster_GetChannelNumber(CosmosMaster_ChanList[i]) == 0) then
			CosmosMaster_ChanList[i] = nil;
		end
	end
end

-- Replacement for the normal channel listing, lists Cosmos numbered channels
function CosmosMaster_ListChannels(message, chanNum)
	local chatstring = nil;
	
	if (not message) then
		for i = 1, 10 do
			if (CosmosMaster_ChanList[i]) then
				if (chatstring) then
					chatstring = chatstring.." ["..i..". "..CosmosMaster_ChanList[i].."]";
				else
					chatstring = "["..i..". "..CosmosMaster_ChanList[i].."]";
				end
			end
		end
	else
		cosNum = CosmosMaster_GetChannelID(chanNum);
		chatstring = "["..cosNum..". "..CosmosMaster_ChanList[cosNum].."] "..message;
	end

	local info = ChatTypeInfo["CHANNEL_LIST"];
	Sea.io.printc( info, chatstring );
end

-- This fuction obtains the number of the specified channel
function CosmosMaster_GetChannelNumber(channel)
	local num = 0;
	for i = 1, 20, 1 do
		local channelNum, channelName = GetChannelName(i);

		if ((channelNum > 0) and channelName and (channelName == channel)) then
			num = channelNum;
			break;
		end
	end

	return num;
end

-- This fuction obtains the number of the specified channel in the cosmos channel list
function CosmosMaster_GetChannelID(name)
	local ret = 0;
	for i = 1, 10 do
		if (CosmosMaster_ChanList[i] == name) then
			ret = i;
			break;
		end
	end
	return ret;
end

-- This Determines the name of the Cosmos channel
function CosmosMaster_GetChannelName()
	return "Hanulari";
end

function CosmosMaster_JoinChannel(channelName)
	if (CosmosMaster_LeaveDelay < 1) then
		if (CosmosMaster_GetChannelNumber(channelName) > 0) then 
			-- Already in this channel
			return;
		end
		if (not CosmosMaster_ChansLoaded) then -- Do it after the initialisation
			Cosmos_Schedule(2, CosmosMaster_JoinChannel, channelName);
			return;
		end

		Cosmos_Schedule(1, JoinChannelByName, channelName, "", DEFAULT_CHAT_FRAME:GetID());
		CosmosMaster_JoinDelay = COSMOSMASTER_CHAT_JOIN_DELAY;
	end
end

-- Joins a channel and assigns it a number in the cosmos channel list
-- Dont pass channelID if you want the channel to no longer have a specified ID
function CosmosMaster_JoinChannelByID(channelName, channelID)
	if ((CosmosMaster_LeaveDelay < 1) and CosmosMaster_UseChatFunctions) then
		if (channelID) then
			if (CosmosMaster_ChanList[channelID]) then
				-- ID is already in use
				return -1;
			end
			if ((channelID < 1) or (channelID > 10)) then
				-- ID is out of range
				return -2;
			end
			CosmosMaster_ChanIDList[channelName] = channelID;
			if (CosmosMaster_GetChannelNumber(channelName) > 0) then
				-- Already in this channel
				return 0;
			end
			if (not CosmosMaster_ChansLoaded) then -- Do it after the initialisation
				Cosmos_Schedule(2, CosmosMaster_JoinChannelByID, channelName, channelID);
				return;
			end
		
			CosmosMaster_ChanList[channelID] = channelName;
			Cosmos_Schedule(1, JoinChannelByName, channelName, "", DEFAULT_CHAT_FRAME:GetID());
			CosmosMaster_JoinDelay = COSMOSMASTER_CHAT_JOIN_DELAY;
		else
			CosmosMaster_ChanIDList[channelName] = nil;
		end
	end
end

function Cosmos_LeaveChannel(channelName, loops)
	if (CosmosMaster_JoinDelay < 1) then
		if (loops) then
			if (loops > 20) then
				return;
			end
		else
			loops = 0;
		end
		if (CosmosMaster_GetChannelNumber(channelName) == 0) then
			loops = loops + 1;
			Cosmos_Schedule(1, Cosmos_LeaveChannel, channelName, loops);
			return;
		end
		local chanID = CosmosMaster_GetChannelID(channelName);
		if (chanID > 0) then
			CosmosMaster_ChanList[chanID] = nil;
		end
		LeaveChannelByName(channelName);
		CosmosMaster_LeaveDelay = COSMOSMASTER_CHAT_JOIN_DELAY;
	end
end

function Cosmos_SendMessage(message)
	if (not CosmosMaster_UseChatFunctions) then return; end
	local channelName = CosmosMaster_GetChannelName();
	local channelNum = CosmosMaster_GetChannelNumber(channelName);
	
	if ( channelNum == 0 ) then
		--channelNum = CosmosMaster_JoinChannelByID(channelName,9);
		if (CosmosMaster_ChansLoaded) then
			CosmosMaster_JoinChannelByID(channelName, 9);
		end
		if (message) then
			CosmosMaster_WaitMessage = message;
		end
		return;
	end
	if (message) then
		SendChatMessage(message, "CHANNEL", GetLanguageByIndex(0), channelNum);
	end
end

function Cosmos_LeaveParty()
	for i = 1, 20, 1 do
		local channelNum, channelName = GetChannelName(i);
		
		if (channelNum > 0 and	channelName ~= nil) then
			if ( string.find(channelName, "ZParty") ~= nil ) then
				Cosmos_LeaveChannel(channelName);
			end
		end
	end
end

function Cosmos_SendPartyMessage(message)
	if (not CosmosMaster_UseChatFunctions) then return; end
	if (GetPartyLeaderIndex() == 0) then
		gleader = UnitName("player");
	else
		gleader = UnitName("party"..GetPartyLeaderIndex());
	end

	--Sea.io.print("gleader "..gleader, CSM_DEBUG);
	-- Scan the channels and make sure no extra ZParty channels exist.
	for i = 1, 20, 1 do
		local channelNum, channelName = GetChannelName(i);
		
		if (channelNum > 0 and  channelName ~= nil) then
			if ( string.find(channelName, "ZParty") ~= nil ) then
				if ( gleader == nil ) then 
					Cosmos_LeaveChannel(channelName);
				elseif ( string.find(channelName, gleader) == nil) then 
					Cosmos_LeaveChannel(channelName);
				end
			end
		end
	end
	
        channelNum = CosmosMaster_GetChannelNumber(CosmosMaster_GetCurrentPartyChannel());
	
	if ( channelNum == 0) then
		CosmosMaster_ChangePartyChannel();
		CosmosMaster_PartyWaitMessage = message;
		return;
	end

	if (message) then
		SendChatMessage(message, "CHANNEL", GetLanguageByIndex(0), channelNum);
	end
end

function CosmosMaster_ChangePartyChannel()
	if ((not CosmosMaster_UseChatFunctions) or (not CosmosMaster_ChansLoaded)) then return; end
	if (CosmosMaster_GetChannelNumber(CosmosMaster_GetCurrentPartyChannel()) == 0) then
		Cosmos_LeaveParty();
		Cosmos_Schedule(2,CosmosMaster_JoinChannelByID,CosmosMaster_GetCurrentPartyChannel(), 10);
	end
end

function CosmosMaster_GetCurrentPartyChannel()
	local gleader = "gg";
	if (GetPartyLeaderIndex() == 0) then
		gleader = UnitName("player");
	else
		gleader = UnitName("party"..GetPartyLeaderIndex());
	end
	if (GetNumRaidMembers() > 1) then
		if (IsRaidLeader()) then
			gleader = UnitName("player");
		else
			for i=1, GetNumRaidMembers(), 1 do
				local name, rank, subgroup = GetRaidRosterInfo(i);
				if (rank == 2) then
					gleader = name;
					break;
				end
			end
		end
	end

	if ( not gleader or gleader == "" ) then
		gleader = UnitName("player");
		if ( not gleader ) then gleader="NoLeader"; end
	end
	return "ZParty"..gleader;
end

-- Basic Initialization of global variables
function CosmosMaster_Init()
	-- Add CVar watching
        this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("PLAYER_LEAVING_WORLD");

	if ( not Hanul_InitLoaded ) then
		CosmosMaster_UseChatFunctions = nil;
		CosmosMaster_ChanList = {};
	end
end
  
-- Event handling
function CosmosMaster_OnEvent(event)
   if ( event == "PARTY_LEADER_CHANGED" or event == "RAID_ROSTER_UPDATE" ) then
	CosmosMaster_ChangePartyChannel();
   end
   if (event == "VARIABLES_LOADED") then
	-- Register Cosmos' chat commands
	if ( Hanul_InitLoaded ) then
		Cosmos_RegisterCosmosChatCommands();
	end

	local comlist = COSMOS_COMM;
	local desc	= COSMOS_DESC;
	local id = "COSMOSOTHER";
	local func = function(msg)
		if (msg) then
			Cosmos_SendMessage('<C>'..msg);
			CosmosMaster_LastAsked = strupper(msg);
			Cosmos_Schedule(5,Cosmos_DontHaveCosmos, msg);
		end
	end
	Cosmos_RegisterChatCommand ( id, comlist, func, desc );

	-- Set Up the timers
	CosmosMaster_StartTime = GetTime();
	CosmosMaster_WaitButton = GetTime() + 0.1;
   end
   if (event == "PLAYER_ENTERING_WORLD") then
	this:RegisterEvent("PARTY_LEADER_CHANGED");
	this:RegisterEvent("RAID_ROSTER_UPDATE");
	CosmosMaster_RunCallBack();
   end
   if (event == "PLAYER_LEAVING_WORLD") then
	this:UnregisterEvent("PARTY_LEADER_CHANGED");
	this:UnregisterEvent("RAID_ROSTER_UPDATE");
   end
end

function CosmosMaster_RunCallBack()
	playername = UnitName("player");
	if (playername) then
		if ((playername ~= UKNOWNBEING) and ( playername ~= UNKNOWNOBJECT )) then
			CosmosMaster_LastPlayer = CosmosMaster_CVars[COS_LAST_PLAYER];
			CosmosMaster_LastRealm = CosmosMaster_CVars[COS_LAST_REALM];
			CosmosMaster_CVars[COS_LAST_PLAYER] = playername;
			CosmosMaster_CVars[COS_LAST_REALM] = GetCVar("realmName");
			CosmosMaster_VarsLoaded = true;
			Cosmos_RegisterMissed();
			Cosmos_SetMissed();
			CosmosMaster_LoadVariables();
			CosmosMaster_SyncVars();
			Cosmos_CallVarsLoaded();
			Cosmos_Schedule(COSMOSMASTER_CHAT_INIT_WAIT, CosmosMaster_CleanChannels);
		end
	end
end

function CosmosMaster_OnUpdate(elapsed)
		CosmosMaster_LastChatTime = CosmosMaster_LastChatTime + elapsed;
		if (CosmosMaster_LastChatTime > COSMOSMASTER_CHAT_UPDATE_WAIT) then
			CosmosMaster_LastChatTime = 0;
			CosmosMaster_JoinDelay = CosmosMaster_JoinDelay - 1;
			CosmosMaster_LeaveDelay = CosmosMaster_LeaveDelay - 1;
			if (CosmosMaster_JoinDelay < 0) then CosmosMaster_JoinDelay = 0; end
			if (CosmosMaster_LeaveDelay < 0) then CosmosMaster_LeaveDelay = 0; end
			if (CosmosMaster_ChansLoaded) then
				Cosmos_SendMessage();
				CosmosMaster_ChangePartyChannel();
				CosmosMaster_WatchChatOrder();
			end
		end
		
	if (GetTime() > CosmosMaster_WaitButton) then
		local loaded = LoadAddOn("CosmosMenu");
		if ( loaded ) then
			CosmosButtons_UpdateColor();
		end
		CosmosMaster_WaitButton = CosmosMaster_WaitButton + 0.1;
		if (not UnitName("party1") and CosmosMaster_CurrentChannel) then
			Cosmos_LeaveChannel(CosmosMaster_CurrentChannel);
			CosmosMaster_CurrentChannel = nil;
		end
	end

	if (CosmosMaster_StartTime == -1) then
		if (CosmosMaster_WaitMessage ~= "") then
			if (CosmosMaster_GetChannelNumber(CosmosMaster_GetChannelName()) > 0) then
				Cosmos_SendMessage(CosmosMaster_WaitMessage);
				CosmosMaster_WaitMessage = "";
			end
		end
		if (CosmosMaster_PartyWaitMessage ~= "") then
			if (CosmosMaster_GetChannelNumber(CosmosMaster_GetCurrentPartyChannel()) > 0) then
				Cosmos_SendPartyMessage(CosmosMaster_PartyWaitMessage);
				CosmosMaster_PartyWaitMessage = "";
			end
		end
               --Check to see that we are in the cosmos channel, and cosmos party channel, and join them if not
		return; -- Already joined
	elseif (GetTime() > CosmosMaster_StartTime + 6.00) then
		Cosmos_SendMessage('<CL>');
		Cosmos_SendPartyMessage('<AC>');
		CosmosMaster_StartTime = -1;		
	end
end

-- Basic Saving
function CosmosMaster_Save()
	CosmosMaster_StoreVariables();
	CosmosMaster_SyncVars();
	--RegisterForSave('CosmosMaster_CVars');
end

-- Basic Reverting
function CosmosMaster_Reset()
	CosmosMaster_LoadVariables();
	CosmosMaster_SyncVars();
end

-- Displays the commands help list  
function CosmosMaster_ChatCommandsHelpDisplay (msg) 
	Sea.io.print ( "하늘아리 도움말: " );
	for index, value in CosmosMaster_ChatCommands do
		if ( value[CSM_DESCRIPTION] == "" ) then 
		else 
			local aliases = value[CSM_ALIASES];
			if ( aliases and value[CSM_DESCRIPTION]) then 
				local helpmsg = "- "..aliases[1].." - "..value[CSM_DESCRIPTION];
				Sea.io.printc ( {r=.7,g=.6,b=.8}, helpmsg );
			end
		end
	end
	
end

-- Shows the current version.
function CosmosMaster_ChatVersionDisplay(msg)
	 Sea.io.print ( "하늘아리 버전: "..HANULARIMASTER_VERSION.."\n".."제작: 와우메카(http://wow.gamemeca.com)" );
	 Sea.io.print ( "만든날: "..HANULARIMASTER_UPDATE );
end

-- Returns the command alias list for a registered command.
function CosmosMaster_GetCommandAliases ( cos_id ) 
	--Sea.io.print(cos_id, .5, .5, .5); -- Debug:  This will list all commands passed through

	for index, value in CosmosMaster_ChatCommands do
		if ( value[CSM_ID] == cos_id ) then
			return value[CSM_ALIASES];
		end
	end
	-- If none was found, return nil
	return nil;
end

-- Gets the prior functions for a registered command
function CosmosMaster_GetPreviousCommand ( cos_id ) 
	for index, value in CosmosMaster_ChatCommands do
		if ( value[CSM_ID] == cos_id ) then
			return value[CSM_PREVIOUSFUNCTION];
		end
	end
	-- If none was found, return nil
	return nil;

end

-- Turns channel management on/off
function CosmosMaster_ToggleChannelManager ( toggle, value ) 
	CosmosMaster_ChannelManager = toggle;
end 

-- Default behaviour
function CosmosMaster_CheckGui( slot )
	--SendChatMessage( "Error, invalid value at slot" + slot );
end

function Cosmos_UserMessage(message)
	Sea.IO.print(message);
end

function Cosmos_DontHaveCosmos(user)
	if (strupper(CosmosMaster_LastAsked) == strupper(user)) then
		Cosmos_UserMessage(format(COSMOS_DONTHAVE,user));
	end
end

-- Updates the cosmos user list
function CosmosMaster_CosmosUsers_Update( type, info, message, player, language ) 
	if ( not Hanul_InitLoaded ) then
		return;
	end
	if ( message == "<CL>" ) then
		CosmosMaster_CosmosUsers[player] = GetTime();
		if (strupper(player) == CosmosMaster_LastAsked) then
			Cosmos_UserMessage(format(COSMOS_HAVE,player));
		end

		return 0;
	end
	
	if ( "<C>" == strsub(message, 1, 3) ) then
		local name = strsub(message, 4, strlen(message));
		if (strupper(UnitName("player")) == strupper(name)) then
			CosmosMaster_CosmosUsers[player] = GetTime();
			Cosmos_SendMessage('<CL>');
		end

		return 0;
	end
end

-- Synchronizes all global variables
function CosmosMaster_SyncVars()
	for index, value in CosmosMaster_Configurations do
		if ( value[CSM_TYPE] == "SEPARATOR" or value[CSM_TYPE] == "BUTTON" or value[CSM_TYPE] == "SECTION" ) then
		else 
			setglobal(value[CSM_VARIABLE], value[CSM_SLIDERVALUE] );
			setglobal(value[CSM_VARIABLE]..'_X',value[CSM_CHECKONOFF]);
			local callback = value[CSM_HANDLER];
			local slidervalue =  value[CSM_SLIDERVALUE];
			callback(value[CSM_CHECKONOFF],slidervalue);
		end
	end
end

-- Load all variables from CVars
function CosmosMaster_LoadVariables()

	for index, value in CosmosMaster_Configurations do
		-- Ignore separators
		if ( value[CSM_TYPE] == "SEPARATOR" or value[CSM_TYPE] == "BUTTON" or value[CSM_TYPE] == "SECTION" ) then
		else 
			if ( value[CSM_TYPE]=="SLIDER" or value[CSM_TYPE]=="BOTH" ) then
				val = Cosmos_GetCVar(value[CSM_VARIABLE]);
				if ( val ~= nil ) then 
					value[CSM_SLIDERVALUE] = val + 0;
				else
                                       Cosmos_SetCVar(value[CSM_VARIABLE], value[CSM_SLIDERVALUE]);
				end
			end
			if ( value[CSM_TYPE]=="CHECKBOX" or value[CSM_TYPE]=="BOTH" ) then
				val = Cosmos_GetCVar(value[CSM_VARIABLE].."_X");
				if ( val ~= nil ) then 
					value[CSM_CHECKONOFF] = val + 0;
				else
                               		Cosmos_SetCVar(value[CSM_VARIABLE], value[CSM_CHECKONOFF]);
				end
			end
		end
	end
end

-- Store all variables to CVars
function CosmosMaster_StoreVariables()
	for index, value in CosmosMaster_Configurations do
		if (not ( value[CSM_TYPE]=="SEPARATOR") and not (value[CSM_TYPE] == "BUTTON") and not (value[CSM_TYPE] == "SECTION") ) then
			if ( value[CSM_TYPE]=="SLIDER" or value[CSM_TYPE]=="BOTH" ) then
				local slidervalue =  value[CSM_SLIDERVALUE] ;
				
				Cosmos_SetCVar(value[CSM_VARIABLE], slidervalue);
			end
			if ( value[CSM_TYPE]=="CHECKBOX" or value[CSM_TYPE]=="BOTH" ) then				
				Cosmos_SetCVar(value[CSM_VARIABLE].."_X", value[CSM_CHECKONOFF]);
			end
		end
	end

end

-- Notify all stored methods
function CosmosMaster_NotifyAll()
	for index, value in CosmosMaster_Configurations do
		if (not ( value[CSM_TYPE] == "SEPARATOR") and not (value[CSM_TYPE] == "BUTTON") and not (value[CSM_TYPE] == "SECTION") ) then
			f = value[CSM_HANDLER];
			local slidervalue =  value[CSM_SLIDERVALUE];
			
			f(value[CSM_CHECKONOFF],slidervalue);
		end
	end
end

-- Watch CVars
function CosmosMaster_HandleCVarUpdate(cvar, val, checked) 
	--[[
	for index, value in CosmosMaster_Configurations do
		if ( cvar == value[CSM_VARIABLE] ) then
			-- this function now works for checkbox types, but
			-- probably not much else --Thott
			if(value[CSM_TYPE] == "CHECKBOX") then
				value[CSM_CHECKONOFF] = val+0;
			end

			value[CSM_SLIDERVALUE] = val;
		end
	end
	CosmosMaster_NotifyAll();
	CosmosMaster_DrawData();
	]]
end

-- Helper function to get Offset
function CosmosMaster_GetOffsetValue(offset)
	local curList = {};
	local curIndex = 1;
	for dex, curVal in CosmosMaster_Configurations do
		if (curVal and (curVal[CSM_TYPE] ~= "SECTION") and (curVal[CSM_SECTION] == CosmosMaster_Section)) then
			table.insert(curList, curVal);
		end
	end	
	return curList[offset];
end

-- Helper function to get the number of configurations for the current header
function CosmosMaster_GetConfCount()
	confCount = 0;
	for dex, curVal in CosmosMaster_Configurations do
		if (curVal and (curVal[CSM_TYPE] ~= "SECTION") and (curVal[CSM_SECTION] == CosmosMaster_Section)) then
			confCount = confCount + 1;
		end
	end
	return confCount;
end

-- Helper function to sort the list of the sections
function CosmosMaster_SectionComparator(section1, section2)
	if ( ( section1 ) and ( section2 ) ) then
		if ( ( section1[CSM_STRING] ) and ( section2[CSM_STRING] ) ) then
			if ( section1[CSM_STRING] == TEXT(COSMOS_CONFIG_SEP) ) then
				return true;
			elseif ( section2[CSM_STRING] == TEXT(COSMOS_CONFIG_SEP) ) then
				return false;
			else
				return (section1[CSM_STRING] < section2[CSM_STRING]);
			end
		elseif ( section1[CSM_STRING] ) then
			return false;
		elseif ( section2[CSM_STRING] ) then
			return true;
		end
	elseif ( section1 ) then
		return false;
	elseif ( section2 ) then
		return true;
	end
end

-- Helper function to get a list of the sections
function CosmosMaster_GenerateSectionList()
	local curList = {};
	for dex, curVal in CosmosMaster_Configurations do
		if (curVal and (curVal[CSM_TYPE] == "SECTION")) then
			table.insert(curList, curVal);
		end
	end
	table.sort(curList, CosmosMaster_SectionComparator);
	return curList;
end

-- Helper function to get Offset
function CosmosMaster_GetOffsetSection(offset)
	local curList = CosmosMaster_GenerateSectionList();
	return curList[offset];
end

-- Helper function to get the number of sections
function CosmosMaster_GetSectCount()
	sectCount = 0;
	for dex, curVal in CosmosMaster_Configurations do
		if (curVal[CSM_TYPE] == "SECTION") then
			sectCount = sectCount + 1;
		end
	end
	return sectCount;
end

-------------------------------------------------------------------------------
-- Example Code
-------------------------------------------------------------------------------

--[[
  An Example of how this could be used :

-- Example Callback Functions
function CombatCaller_HealthEnabledCallback (state, onoff)
	if( onoff == 1) then
		SendChatMessage ( state );
	end
end
function CombatCaller_ManaEnabledCallback (state, onoff)
	if ( onoff == 1) then
		SendChatMessage ( state );
	end
end

 All you have to do is call:

	Cosmos_RegisterConfiguration("COS_MYMOD_MYVALUE", "BOTH", "Abc ShortDescription", "Abc Long description\n line12",CombatCaller_HealthEnabledCallback, 0, .5, 0, 1, "BarName", 1, 1, "%");

 And I'll call CombatCaller_HealthEnabledCallback(value); every time the value changes!

 If you need to read the value regularly, just check the variable COSMOS_MYMOD_MYVALUE.

	Example arrays stored:
	(You dont have to create these, I make them in Register)

Cosmos_CombatCallerEnableHealthConfig = {
	[CSM_VARIABLE]="COS_COMBATCALLER_HEALTHENABLED", -- The CVar and global value that is updated
	[CSM_TYPE]="BOTH", -- CHECKBOX, SLIDER or BOTH
	[CSM_STRING]="Enable Auto Low Health Shout", -- The Text string
	[CSM_DESCRIPTION]="Long description here\n moretext";
	[CSM_CHECKONOFF]=1,	-- Starts off checked = true (1)
	[CSM_HANDLER]=CombatCaller_HealthEnabledCallback, -- The Function called when the value changes.
	[CSM_SLIDERMIN]=0,		-- Min value on slider
	[CSM_SLIDERMAX]=1,		-- Max value on slider
	[CSM_SLIDERVALUE]=.5,	-- Default value on slider
	[CSM_SLIDERSTEP]=.01,	-- Increments on slider
	[CSM_SLIDERSTRING]="Health Limit",	-- Slider Text (optional)
	[CSM_SLIDERVALUETEXTTOGGLE]=1,				-- Slider Text On/Off toggle
	[CSM_SLIDERTEXTAPPEND]="\%",
	[CSM_SLIDERVALUETEXTMULTIPLIER]=100
}
CosmosMaster_CombatCallerThankYouConfig = {
	[CSM_VARIABLE]="COS_COMBATCALLER_THANKYOUENABLED",
	[CSM_TYPE]="CHECKBOX",
	[CSM_STRING]="Enable Auto Thank You Shout",
	[CSM_DESCRIPTION]="",
	[CSM_CHECKONOFF]=1,	-- Default on?
	[CSM_HANDLER]=CombatCaller_HealthEnabledCallback,
	[CSM_SLIDERMIN]=0,	-- Everything below is useless for checkbox only.
	[CSM_SLIDERMAX]=1,
	[CSM_SLIDERVALUE]=1,
	[CSM_SLIDERSTEP]=.01, --Unimportant for checkboxes
	[CSM_SLIDERSTRING]="",
	[CSM_SLIDERVALUETEXTTOGGLE]=0 -- 0 for off!
}

	Please use this wisely.

	-Alex

	------------------------------------------------------------------

	How to register a chat command:
	
	--Create a function for your command:
	function myfunc () return 4; end
	
	--Create a list of /commands you want applied. 
	mycommands = { "/mycommand", "/mycommands" };
	
	--Create a help description 
	local mydesc = "This is my command!";
	
	--Pick a name or an action you are overwriting.
	local myfuncname = "CUSTOMMINE";
	
	--Choose how to handle a command if you overwrite it. (usually CSM_CHAINNONE)
	local mychain = CSM_CHAINNONE; 
	
	--Register it
	CosmosMaster_RegisterChatCommand( myfuncname, mycommands, myfunc, mydesc, mychain );
	
	-- Thats it!

]]--


-- Compatability stuffs
Cosmos_Schedule = Chronos.schedule;
Cosmos_ScheduleByName = Chronos.scheduleByName;
Cosmos_AfterInit = Chronos.afterInit;
