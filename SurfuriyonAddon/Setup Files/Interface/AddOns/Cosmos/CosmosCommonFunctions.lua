--[[
	CommonFunctions
	
	This file is for commonly used functions available to any
	Cosmos Mod. Thanks to Chitinous, Skrag and Thott for most of
	these functions. :-)

	by Alexander Brazie

  ]]--

DEBUG_CHAT_FRAME = ChatFrame1;

-- Output functions

	-- NOTE***  ChatTimeStamps is completely overloading this function when enabled
function Print(msg, r, g, b, frame, id) 
	if (not r) then r = 1.0; end
	if (not g) then g = 1.0; end
	if (not b) then b = 1.0; end
	if (not frame) then frame = DEFAULT_CHAT_FRAME; end
	if (frame) then
		if (not id) then
			frame:AddMessage(msg,r,g,b);
	else
			frame:AddMessage(msg,r,g,b,id);
		end
	end
end

-- Prints a table in an organized format
function PrintTable(table, rowname, level) 
	if ( rowname == nil ) then rowname = "ROOT"; end
	if ( level == nil ) then level = 1; end

	local msg = "";
	for i=1,level, 1 do 
		msg = msg .. "   ";	
	end

	if ( table == nil ) then Print (msg.."["..rowname.."] := nil "); return end
	if ( type(table) == "table" ) then
		Print (msg..rowname.." { ");
		for k,v in table do
			PrintTable(v,k,level+1);
		end
		Print(msg.."} ");
	elseif (type(table) == "function" ) then 
		Print(msg.."["..rowname.."] => {{FunctionPtr*}}");
	elseif (type(table) == "userdata" ) then 
		Print(msg.."["..rowname.."] => {{UserData}}");
	elseif (type(table) == "boolean" ) then 
		local value = "true";
		if ( not table ) then
			value = "false";
		end
		Print(msg.."["..rowname.."] => "..value);
	else
		Print(msg.."["..rowname.."] => "..table);
	end
end

-- DebugPrint takes a message and a debug key. 
-- 
-- The default is "COSMOS_DEBUG", but you can set it to any 
-- value you like. The result is that if setglobal(debugkey,1); 
-- has been called, your debug message will be output.
--
function DebugPrint(msg, debugkey) 
	if ( not debugkey ) then debugkey = "COSMOS_DEBUG"; end

	if ( type(msg) == "string" ) then 
	if ( getglobal(debugkey) == 1 ) then
				Print("DBG: "..msg, 1, 1, .5, DEBUG_CHAT_FRAME);
	end
end
end

-- Prints an error message
function ErrorPrint(msg)
	local info = ChatTypeInfo["YELL"];
	UIErrorsFrame:AddMessage(msg, info.r, info.g, info.b, 1.0, UIERRORS_HOLD_TIME);
end

-- Table functions
function GetIndexInList(list,item) 
	for k,v in list do 
		if ( v == item ) then return k; end
	end
	return -1;
end
  
-- Clears a tooltip for usage.
function ClearTooltip(TooltipNameBase)
	for i=1, 15, 1 do
		getglobal(TooltipNameBase.."TextLeft"..i):SetText("");
		getglobal(TooltipNameBase.."TextRight"..i):SetText("");
	end

end

function MakeIntFromString(str)
	DebugPrint("MakeIntFromString("..str..")", 4);
	local remain = str;
	local amount = 0;
	while (remain ~= "") do
		amount = amount * 10;
		amount = amount + (string.byte(strsub(remain, 1, 1)) - string.byte("0"));
		remain = strsub(remain, 2);
	end
	DebugPrint("MakeIntFromStr("..str..") = "..amount, 4);
	return amount;
end

function MakeIntFromHexString(str)
	DebugPrint("MakeIntFromHexString("..str..")", 4);
	local remain = str;
	local amount = 0;
	while (remain ~= "") do
		amount = amount * 16;
		local byteVal = string.byte(strupper(strsub(remain, 1, 1)));
		if (byteVal >= string.byte("0") and byteVal <= string.byte("9"))
		then
			amount = amount + (byteVal - string.byte("0"));
		elseif (byteVal >= string.byte("A") and byteVal <= string.byte("F"))
		then
			amount = amount + 10 + (byteVal - string.byte("A"));
		end
		remain = strsub(remain, 2);
	end
	DebugPrint("MakeIntFromHexStr("..str..") = "..amount, 4);
	return amount;
end

function MakeHexStringFromInt(intval, minlength)
	return string.format("%"..minlength.."x", intval );
end

function EscapeString(plainString, disallowedChars)
	-- yay URL-encoding
	local str = "";
	local remain = plainString;
	disallowedChars = disallowedChars.."%";
	while (remain ~= "") do
		local char = strsub(remain, 1, 1);
		if (string.find(disallowedChars, char, 1, true))
		then
			str = str.."%";
			local hexRepresentation = string.format("%02x", string.byte(char));
			str = str..hexRepresentation;
		else
			str = str..char;
		end
		remain = strsub(remain, 2);
	end
	return str;
end

function UnescapeString(escapedString)
	local str = "";
	local remain = escapedString;
	while (remain ~= "") do
		local char = strsub(remain, 1, 1);
		if (char == "%")
		then
			str = str..string.char(MakeIntFromHexString(strsub(remain, 2, 3)));
			remain = strsub(remain, 4);
		else
			str = str..char;
			remain = strsub(remain, 2);
		end
	end
	return str;
end

-- Mathematical Functions (yuck!)
function CheckBits(field, bits)
	local result = true;
	while (bits > 0) do
		if (mod(bits, 2) > 0)
		then
			if (mod(field, 2) == 0)
			then
				result = false;
				break;
			end
		end
		field = floor(field / 2);
		bits = floor(bits / 2);
	end
	return result;
end


function SetBit(field, bit)
	local source = 2^31; -- 1 in highest-order bit
	local shiftCount = 1;
	local result = 0;
	while (bit > 0) do
		result = floor(result / 2);
		-- if we're about to shift off a 1, put a 1 on the destination.
		if ((mod(bits, 2) == 1) or (mod(field, 2) == 1))
		then
			result = result + source;
		end
		field = floor(field / 2);
		bits = floor(bits / 2);
		shiftCount = shiftCount + 1;
	end
	for i = shiftCount, 32, 1 do
		result = floor(result / 2);
		-- if we're about to shift off a 1, put a 1 on the destination.
		if (mod(bits, 2) == 1)
		then
			result = result + source;
		end
		field = floor(field / 2);
	end
	return result;
end

function ClearBit(field, bit)
	local source = 2^31; -- 1 in highest-order bit
	local shiftCount = 1;
	local result = 0;
	while (bit > 0) do
		result = floor(result / 2);
		-- if we're about to shift off a 1, put a 1 on the destination. AS LONG AS this is not the bit to clear
		if ((mod(field, 2) == 1) and not (mod(bit, 2) == 1))
		then
			result = result + source;
		end
		field = floor(field / 2);
		bits = floor(bits / 2);
		shiftCount = shiftCount + 1;
	end
	for i = shiftCount, 32, 1 do
		result = floor(result / 2);
		-- if we're about to shift off a 1, put a 1 on the destination.
		if (mod(bits, 2) == 1)
		then
			result = result + source;
		end
		field = floor(field / 2);
	end
	return result;
end

function BaseConversion(input, inputBase, outputBase)
-----------------------------------------------------------
--               Function made by KaTTaNa !              -- 
--               --------------------------              --
--   http://www.wc3sear.ch/index.php?p=JASS&ID=37&sid=   --
--               --------------------------              --
--               Converted in LUA by vjeux               --
--                                                       --
-- Usage : BaseConversion(255, 10, 16)                   --
-- => Return "ff"                                        --
--                                                       --
-- Usage : BaseConversion("ff", 16, 10)                  --
-- => Return "10"                                        --
-----------------------------------------------------------
    local charMap = "0123456789abcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+-=[]";
    local s;
    local result = "";
    local val = 0;
    local i;
    local p = 0;
    local pow = 1;
    local sign = "";

    if ( inputBase < 2 or inputBase > strlen(charMap) or outputBase < 2 or outputBase > strlen(charMap) ) then
        -- Bases are invalid or out of bounds
        return "Invalid bases given";
    end
    if ( strsub(input, 1, 1) == "-" ) then
        sign = "-";
        input = strsub(input, 1, strlen(input));
    end
    i = strlen(input);
    -- Get the integer value of input
    while (i > 0) do
        s = strsub(input, i, i);
        p = 0;
		local bool = false;
        while (bool == false) do
            if ( p >= inputBase ) then
                -- Input cannot match base
                return "Input does not match base!\n P = "..p;
            end
			if ( s == strsub(charMap, p+1, p+1) ) then
                val = val + pow * p;
                pow = pow * inputBase;
                bool = true;
            end
            p = p + 1;
        end
        i = i - 1;
    end
    while (val > 0) do
        p = mod(val, outputBase);
        result = strsub(charMap, p+1, p+1)..result;
        val = val / outputBase;
    end

	for i = 1, strlen(result), 1 do
		if (strsub(result, 1, 1) == "0") then
			result = strsub(result, 2, strlen(result));
		else
			return sign..result
		end
	end

	if (strlen(sign..result) == 0) then 
		return "0";
	else
		return sign..result.."-"..strlen(sign..result);
	end
end


-- Thott's personalized functions
function dbanner(...)
  if ( (Thottbot) and (Thottbot.Debug) ) then
    UIErrorsFrame:AddMessage(join(arg,""), 0.9, 0.9, 0.0, 1.0, UIERRORS_HOLD_TIME);			  					
    dprint(join(arg,""));
  end
end
function banner(...)
  UIErrorsFrame:AddMessage(join(arg,""), 0.9, 0.9, 0.0, 1.0, UIERRORS_HOLD_TIME);			  					
end
function dbyte(c)
  return string.format("<%02X>",string.byte(c));
end
--function dprint_runqueue()
--  if(dprint_nextmsg) then
--    print2(dprint_nextmsg);
--    dprint_nextmsg = nil;
--  end
--  if(dprint_queue and dprint_queue[1]) then
--    local msg = table.remove(dprint_queue,1);
--    dprint_nextmsg = msg;
--    msg = string.gsub(msg,"([^%w%s])",dbyte)
--    print2("Next: ",msg);
--    Cosmos_Schedule(0.01,dprint_runqueue);
--    dprint_queue_scheduled = true;
--  else
--    dprint_queue_scheduled = false;
--  end
--end
function dprint(...)
  if ( ( Thottbot ) and (Thottbot.Debug) ) then
    local msg = join(arg,"");
    msg = string.gsub(msg,"|","<pipe>");
    msg = string.gsub(msg,"([^%w%s%a%p])",dbyte);
    if(Thottbot.DebugFrame) then
      printframe(Thottbot.DebugFrame,msg);
    else
      print2(msg);
    end
--    if(not dprint_queue) then
--      dprint_queue = {};
--    end
--    table.insert(dprint_queue,join(arg,""));
--    if(not dprint_queue_scheduled) then
--      dprint_queue_scheduled = true;
--      Cosmos_Schedule(0.01,dprint_runqueue);
--      -- 68.94.173.94
--    end
  end
end
--    Thottbot.PrintCount = Thottbot.PrintCount + 1;
--    if(Thottbot.PrintCount < 60) then
--      for key,value in arg do
--        arg[key] = string.gsub(value,"[^%w%s%p]",".");
--      end
--      print2(Thottbot.PrintCount,":",join(arg,""));
function dprint1(...)
  if ( (Thottbot) and (Thottbot.Debug) ) then
    print1(join(arg,""));
  end
end
function split(s,seperator)
  local t = {};
  t.n = 0;
  for value in string.gfind(s,"[^"..seperator.."]+") do
    t.n = t.n + 1;
    t[t.n] = value;
  end
  return t;
end
function join(list,seperator)
  local i;
  local c = "";
  local msg = "";
  if(type(list) ~= "table") then
    dbanner("unknown type ",type(list)," table passed to join, seperator ",seperator);
    return;
  end
  if(not list.n) then
    dbanner("ERROR: no .n variable in list!");
    return "";
  end
  for i=1, list.n, 1 do
    if(list[i]) then
      if(type(list[i]) ~= "string" and type(list[i]) ~= "number") then
        dbanner("found ",type(list[i])," in list!");
        msg = msg .. c .. "(" .. type(list[i]) .. ")";
      else
	msg = msg .. c .. list[i];
      end
    else
      msg = msg .. c .. "(nil)";
    end
    c = seperator;
  end
  return msg;
end
function dprintlist(list)
  if ( (Thottbot) and (Thottbot.Debug) ) then
    if(list) then
      dprint(join(list,","));
    else
      dprint("nil list");
    end
  end
end
function dprintcomma(...)
  dprint(join(arg,","));
end
function printframe(frame,...)
  if(frame) then
    frame:AddMessage(join(arg,""), 1.0, 1.0, 0.0);
  end
end
function print2(...)
  if(ChatFrame2) then
    ChatFrame2:AddMessage(join(arg,""), 1.0, 1.0, 0.0);
  end
end
function print1(...)
  if(ChatFrame1) then
    ChatFrame1:AddMessage(join(arg,""), 1.0, 1.0, 0.0);
  end
end
function push(t,v)
  if(not t or not t.n) then
    dbanner("Bad table passed to push");
    return nil;
  end
  t.n = t.n+1;
  t[t.n] = v;
end
function pop(t)
  if(not t or not t.n) then
    dbanner("Bad table passed to push");
    return nil;
  end
  local v = t[t.n];
  t.n = t.n - 1;
  return v;
end
function push2(t,x,y)
  if(not t or not t.n) then
    dbanner("Bad table passed to push2");
    return nil;
  end
  t.n = t.n+1;
  t[t.n] = x;
  t.n = t.n+1;
  t[t.n] = y;
end
function pop2(t)
  if(not t or not t.n) then
    --dbanner("Bad table passed to pop2");
    return nil;
  end
  if(t.n < 2) then
    return nil;
  end
  local tt = {};
  tt.n = 2;
  tt[1] = t[t.n-1];
  tt[2] = t[t.n];
  t.n = t.n - 2;
  return tt;
end
function fixnil(...)
  for i=1, arg.n, 1 do
    if(not arg[i]) then
      arg[i] = "(nil)";
    end
  end
  return arg;
end
function fixnilempty(...)
  for i=1, arg.n, 1 do
    if(not arg[i]) then
      arg[i] = "";
    end
  end
  return arg;
end
function fixnilzero(...)
  for i=1, arg.n, 1 do
    if(not arg[i]) then
      arg[i] = 0;
    end
  end
  return arg;
end

-- Thanks to George Warner for suggesting this refactoring suggestion... as always, I modified it a bit :) /sarf
-- Source : http://www.cosmosui.org/cgi-bin/bugzilla/show_bug.cgi?id=158
function Cosmos_IsCosmosUser(name)
	if ( not name ) then return false; end
	if ( CosmosMaster_CosmosUsers ) then
		if ( CosmosMaster_CosmosUsers[name] ) then 
			return true;
		end
	end
	return false;
end

-- helper function - returns value as a byte
function Cosmos_GetByteValue(pValue)
	local value = tonumber(pValue);
	if ( value <= 0 ) then return 0; end
	if ( value >= 255 ) then return 255; end
	return value;
end


-- Yet another function from George Warner, modified a bit to fit my own nefarious purposes. 
-- It can now accept r, g and b specifications, too (leaving out a), as well as handle 255 255 255
-- Source : http://www.cosmosui.org/cgi-bin/bugzilla/show_bug.cgi?id=159
function Cosmos_GetColorFormatString(a, r, g, b)
	local percent = false;
	if ( ( ( not b ) or ( b <= 1 ) ) and ( a <= 1 ) and ( r <= 1 ) and ( g <= 1) ) then percent = true; end
	if ( ( not b ) and ( a ) and ( r ) and ( g ) ) then b = g; g = r; r = a; if ( percent ) then a = 1; else a = 255; end end
	if ( percent ) then a = a * 255; r = r * 255; g = g * 255; b = b * 255; end
	a = Cosmos_GetByteValue(a); r = Cosmos_GetByteValue(r); g = Cosmos_GetByteValue(g); b = Cosmos_GetByteValue(b);
	
	return format("|c%02X%02X%02X%02X%%s|r", a, r, g, b);
end


-- global localization string functions START

function loc_format(...)
  ret = arg[1];
  for i=2, arg.n, 1 do
    ret = string.gsub (ret, "<"..(i-1)..">", arg[i]);
  end
  return ret;
end

function loc_read(str, fmt, ord, n)
  local ret = {};
  fmt1 = string.gsub (fmt, "%b<>", "(.+)");
  for i=1, n, 1 do
    ret[ord[i]] = string.gsub(str, fmt1, "%"..i);
  end
  return unpack(ret);
end

-- global localization string functions END

--Returns true if variable is not nill and a table
function isTable(var)
	if (var and (type(var) == "table")) then
		return true;
	end
	return false;	
end

function MakeHyperLink(type, name, color)
	local link = "["..name.."]";
	if (color) then
		link = "|cFF"..color.."["..name.."]|r";
	end
	return "|H"..type.."|h"..link.."|h";
end