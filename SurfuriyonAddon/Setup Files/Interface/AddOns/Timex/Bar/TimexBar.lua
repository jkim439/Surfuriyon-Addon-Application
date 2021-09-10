local EMPTY_TABLE = {};
local TIMEX_BAR = "TimexBar";
local DEFAULT_SCALE = 0.8;
local DEFAULT_RES = 0.1;

local strformat = string.format;

local function ARG_ID(t) return t.timexBar.id; end;
local function ARG_ELAPSED(t) return t.timexBar.elapsed; end;
local function ARG_REMAINING(t) return t.timexBar.v; end;

--<< ================================================= >>--
-- Section I: Initialize the AddOn Object.               --
--<< ================================================= >>--

TimexBar = Timex:new({
	ARG_ID = ARG_ID,
	ARG_ELAPSED = ARG_ELAPSED,
	ARG_REMAINING = ARG_REMAINING,
})

function TimexBar:Enable()
	self.barDB  = {};
	self.barMap = setmetatable({}, Timex.weak_mt);
	table.setn(self.barDB, 20);
	for id = 1,20,1 do getglobal(TIMEX_BAR..id):SetScale(DEFAULT_SCALE); end
	for id = 1,20,1 do getglobal(TIMEX_BAR..id):SetFrameStrata("TOOLTIP"); end
end

--<< ================================================= >>--
-- Section II: Private utility functions.                --
--<< ================================================= >>--

--------------------
-- argument stuff
--------------------
local args_switch = {};
args_switch[ARG_ID] = ARG_ID;
args_switch[ARG_ELAPSED] = ARG_ELAPSED;
args_switch[ARG_REMAINING] = ARG_REMAINING;

local function buildArgs(args, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
	local sub = args.sub;
	local f = args_switch[a20]; args[20] = not f and a20 or nil; sub[20] = f;
	f = args_switch[a19]; args[19] = not f and a19 or nil; sub[19] = f;
	f = args_switch[a18]; args[18] = not f and a18 or nil; sub[18] = f;
	f = args_switch[a17]; args[17] = not f and a17 or nil; sub[17] = f;
	f = args_switch[a16]; args[16] = not f and a16 or nil; sub[16] = f;
	f = args_switch[a15]; args[15] = not f and a15 or nil; sub[15] = f;
	f = args_switch[a14]; args[14] = not f and a14 or nil; sub[14] = f;
	f = args_switch[a13]; args[13] = not f and a13 or nil; sub[13] = f;
	f = args_switch[a12]; args[12] = not f and a12 or nil; sub[12] = f;
	f = args_switch[a11]; args[11] = not f and a11 or nil; sub[11] = f;
	f = args_switch[a10]; args[10] = not f and a10 or nil; sub[10] = f;
	f = args_switch[a9]; args[9] = not f and a9 or nil; sub[9] = f;
	f = args_switch[a8]; args[8] = not f and a8 or nil; sub[8] = f;
	f = args_switch[a7]; args[7] = not f and a7 or nil; sub[7] = f;
	f = args_switch[a6]; args[6] = not f and a6 or nil; sub[6] = f;
	f = args_switch[a5]; args[5] = not f and a5 or nil; sub[5] = f;
	f = args_switch[a4]; args[4] = not f and a4 or nil; sub[4] = f;
	f = args_switch[a3]; args[3] = not f and a3 or nil; sub[3] = f;
	f = args_switch[a2]; args[2] = not f and a2 or nil; sub[2] = f;
	f = args_switch[a1]; args[1] = not f and a1 or nil; sub[1] = f;
end

local args_mt = {
	__index = function(t, k)
		local f = t.sub[k];
		if f then return f(t); end
	end,
}

local function newArgs(timexBar)
	local args = { timexBar = timexBar, sub = {} };
	setmetatable(args, args_mt);
	return args;
end

--<< ================================================= >>--
-- Section III: The Time-Event Handler.                  --
--<< ================================================= >>--

local function timexHandler(self, timexBar, elapsed, count)
	--self.cmd:msg("timexHandler: timexBar.n = %s", tostring(timexBar.n));
	local v = timexBar.v;
	if v then
		v = v - elapsed;
		if count <= 0 then
			if timexBar.f then
				timexBar.elapsed = elapsed;
				local a = timexBar.a;
				local status, err = pcall(timexBar.f, a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]);
				if (not status) then
					Timex.cmd:msg("TimexBar function '%s' failed with error: %s", tostring(timexBar.id), tostring(err));
				end
			end
			self:Stop(timexBar.id);
			return;
		elseif timexBar.uf then
			timexBar.elapsed = elapsed;
			local a = timexBar.ua;
			local status, err = pcall(timexBar.uf, a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]);
			if (not status) then
				Timex.cmd:msg("TimexBar update function '%s' failed with error: %s", tostring(timexBar.id), tostring(err));
			end
		end
		-- Update bar
		local settext = ceil(v);
		settext = settext > 60 and (format("%d", settext / 60)..":"..format("%02d", mod(settext, 60))) or settext;
		timexBar.ttxt:SetText(settext);
		timexBar.sbar:SetValue(v);
		timexBar.v = v;
	end
end

--<< ================================================= >>--
-- Section IV: The TimexBarClass 'inner' class           --
--<< ================================================= >>--

-- class definition
local TimexBarClass = {
	bR = 0.1, bB = 0.2, bG = 0.8, bA = 1.0,
	tR = 1.0, tB = 1.0, tG = 1.0, tA = 1.0,
	aP = "CENTER", aF = "UIParent", aRP = "CENTER", xO = 0, yO = 0,
};
local TimexBarClass_mt = { __index = TimexBarClass };

do
	local bar = getglobal(TIMEX_BAR.."1");
	TimexBarClass.s = DEFAULT_SCALE;
	TimexBarClass.bW = bar:GetWidth();
	TimexBarClass.bH = bar:GetHeight();
	local ttxt = getglobal(TIMEX_BAR.."1TimerText");
	TimexBarClass.tW = ttxt:GetWidth();
end

-- private constructor
local function newTimexBar(timexBar, b)
	local n = TIMEX_BAR..b;
	local newInst = {
		n = n,
		bar  = getglobal(n),
		sbar = getglobal(n.."StatusBar"),
		txt  = getglobal(n.."Text"),
		ttxt = getglobal(n.."TimerText"),
		btn = getglobal(n.."Button"),
		btnTex = getglobal(n.."ButtonTexture")
	};
	setmetatable(newInst, TimexBarClass_mt);
	return newInst;
end

-- private reset function (only resets the 'functional' attributes, not the formatting ones)
local function resetTimexBar(timexBar)
	-- reset all values to nil
	timexBar.id = nil;

	timexBar.f = nil;
	timexBar.uf = nil;
	-- clear arg tables
	local args = timexBar.a;
	if args then
		args[1] = nil; args[2] = nil; args[3] = nil; args[4] = nil; args[5] = nil;
		args[6] = nil; args[7] = nil; args[8] = nil; args[9] = nil; args[10] = nil;
		args[11] = nil; args[12] = nil; args[13] = nil; args[14] = nil; args[15] = nil;
		args[16] = nil; args[17] = nil; args[18] = nil; args[19] = nil; args[20] = nil;
	end
	args = timexBar.ua;
	if args then
		args[1] = nil; args[2] = nil; args[3] = nil; args[4] = nil; args[5] = nil;
		args[6] = nil; args[7] = nil; args[8] = nil; args[9] = nil; args[10] = nil;
		args[11] = nil; args[12] = nil; args[13] = nil; args[14] = nil; args[15] = nil;
		args[16] = nil; args[17] = nil; args[18] = nil; args[19] = nil; args[20] = nil;
	end
	
	timexBar.elapsed = nil;

	timexBar.v = nil;
	timexBar.t = nil;
end

-- private formatting function
local function resetTimexBarFormat(timexBar)
	local bar  = timexBar.bar;
	local txt  = timexBar.txt;
	local ttxt = timexBar.ttxt;
	
	if not timexBar.sColor and timexBar.rColor then
		timexBar.bR = nil; timexBar.bB = nil; timexBar.bG = nil; timexBar.bA = nil;
		timexBar.sbar:SetStatusBarColor(timexBar.bR, timexBar.bB, timexBar.bG, timexBar.bA);
		timexBar.rColor = nil;
	end
	
	if not timexBar.sTextColor and timexBar.rTextColor then
		timexBar.tR = nil; timexBar.tB = nil; timexBar.tG = nil; timexBar.tA = nil;
		txt:SetTextColor(timexBar.tR, timexBar.tB, timexBar.tG, timexBar.tA);
		ttxt:SetTextColor(timexBar.tR, timexBar.tB, timexBar.tG, timexBar.tA);
		timexBar.rTextColor = nil;
	end
	
	if not timexBar.sPoint and timexBar.rPoint then
		timexBar.aP = nil; timexBar.aF = nil; timexBar.aRP = nil; timexBar.xO = nil; timexBar.yO = nil;
		bar:ClearAllPoints();
		bar:SetPoint(timexBar.aP, timexBar.aF, timexBar.aRP, timexBar.xO, timexBar.yO);
		timexBar.rPoint = nil;
	end
		
	if not timexBar.sWidth and timexBar.rWidth then
		timexBar.bW = nil;
		bar:SetWidth(timexBar.bW);
		timexBar.rWidth = nil;
	end

	if not timexBar.sHeight and timexBar.rHeight then
		timexBar.bH = nil;
		bar:SetHeight(timexBar.bH);
		timexBar.rHeight = nil;
	end
	
	if not timexBar.sScale and timexBar.rScale then
		timexBar.s = nil;
		bar:SetScale(timexBar.s);
		timexBar.rScale = nil;
	end
	
	if not timexBar.sTimeWidth and timexBar.rTimeWidth then
		timexBar.tW = nil;
		ttxt:SetWidth(timexBar.tW);
		txt:SetPoint("TOPLEFT", bar, "LEFT", timexBar.tW, 13);
		timexBar.rTimeWidth = nil;
	end

	if not timexBar.sText and timexBar.rText then
		timexBar.text = nil;
		if timexBar.text then 
			timexBar.txt:SetText("| "..timexBar.text);
		else
			timexBar.txt:SetText("");
		end
		timexBar.rText = nil;
	end

	if not timexBar.sTexture and timexBar.rTexture then
		timexBar.tex = nil;
		if timexBar.tex then
			timexBar.btnTex:SetTexture(timexBar.tex);
			timexBar.btn:Show();
		else
			timexBar.btn:Hide();
		end
		timexBar.rTexture = nil;
	end
end

local function clearSetFlags(timexBar)
	timexBar.sColor = nil;
	timexBar.sTextColor = nil;
	timexBar.sPoint = nil;
	timexBar.sWidth = nil;
	timexBar.sHeight = nil;
	timexBar.sScale = nil;
	timexBar.sTimeWidth = nil;
	timexBar.sText = nil;
	timexBar.sTexture = nil;
end

--<< ================================================= >>--
-- Section V: The Start and Stop Bar Functions.          --
--<< ================================================= >>--

-- Assigns a bar to id
function TimexBar:Get(id)
	if id and id ~= "" then
		local timexBar = self.barMap[id];
		-- if not found
		if not timexBar then
			-- find first available
			local b = 1;
			timexBar = self.barDB[b];
			while (timexBar) do
				if (not timexBar.v) then
					break;
				end
				b = b + 1;
				timexBar = self.barDB[b];
			end
			if timexBar then
				clearSetFlags(timexBar);
			elseif (b <= 20) then
				timexBar = newTimexBar(self, b);
				self.barDB[b] = timexBar;
			else
				error("No more bars available!");
			end
			-- assign id
			timexBar.id = id;
			self.barMap[id] = timexBar;
		end
		return timexBar.n;
	end
end

function TimexBar:Start(id, time, res)
	if (time) then
		local timexBar = self.barMap[id];
		if timexBar then
			res = res or DEFAULT_RES;
			-- check if bar is currently running
			timexBar.v = time;
			timexBar.t = timexBar.v;
			
			-- reset bar format and show
			resetTimexBarFormat(timexBar);

			local settext = ceil(timexBar.v);
			settext = settext > 60 and format("%d:%02d", settext/60, mod(settext, 60)) or settext;
			timexBar.ttxt:SetText(settext);
			local sbar = timexBar.sbar;
			sbar:SetMinMaxValues(0, timexBar.t);
			sbar:SetValue(timexBar.v);

			timexBar.bar:Show();
			
			Timex:AddSchedule(timexBar, res, nil, time/res, timexHandler, self, timexBar, Timex.ARG_ELAPSED, Timex.ARG_COUNT);
			return timexBar.n;
		else
			error(strformat("TimexBar '%s' not found.", id));
		end
	end
end

function TimexBar:Stop(id)
	local timexBar = self.barMap[id];
	if timexBar then
		Timex:DeleteSchedule(timexBar);
		timexBar.bar:Hide();
		resetTimexBar(timexBar);
		self.barMap[id] = nil;
	end
end

function TimexBar:Check(id, r)
	local timexBar = self.barMap[id];
	if timexBar then
		return (r and timexBar.n) or TRUE;
	end
end

function TimexBar:ChangeDuration(id, t)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.v then
			timexBar.v    = t;
		end
	end
end

--<< ================================================= >>--
-- Section VI: The Bar Formatting Functions              --
--<< ================================================= >>--

function TimexBar:SetColor(id, red, blue, green, alpha)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.bR ~= red or timexBar.bB ~= blue or timexBar.bG ~= green or timexBar.bA ~= alpha then
			timexBar.bR = red; timexBar.bB = blue; timexBar.bG = green; timexBar.bA = alpha;
			timexBar.sbar:SetStatusBarColor(timexBar.bR, timexBar.bB, timexBar.bG, timexBar.bA);
			timexBar.rColor = true;
		end
		timexBar.sColor = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetTextColor(id, red, blue, green, alpha)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.tR ~= red or timexBar.tB ~= blue or timexBar.tG ~= green or timexBar.tA ~= alpha then
			timexBar.tR = red; timexBar.tB = blue; timexBar.tG = green; timexBar.tA = alpha;
			timexBar.txt:SetTextColor(timexBar.tR, timexBar.tB, timexBar.tG, timexBar.tA);
			timexBar.ttxt:SetTextColor(timexBar.tR, timexBar.tB, timexBar.tG, timexBar.tA);
			timexBar.rTextColor = true;
		end
		timexBar.sTextColor = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetPoint(id, point, relativeFrame, relativePoint, xOffset, yOffset)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.aP ~= point or timexBar.aF ~= relativeFrame or timexBar.aRP ~= relativePoint or timexBar.xO ~= xOffset or timexBar.yO ~= yOffset then
			timexBar.aP = point; timexBar.aF = relativeFrame; timexBar.aRP = relativePoint; timexBar.xO = xOffset; timexBar.yO = yOffset;
			local bar = timexBar.bar;
			bar:ClearAllPoints();
			bar:SetPoint(timexBar.aP, timexBar.aF, timexBar.aRP, timexBar.xO, timexBar.yO);
			timexBar.rPoint = true;
		end
		timexBar.sPoint = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetWidth(id, width)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.bW ~= width then
			timexBar.bW = width;
			timexBar.bar:SetWidth(timexBar.bW);
			timexBar.rWidth = true;
		end
		timexBar.sWidth = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetHeight(id, height)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.bH ~= height then
			timexBar.bH = height;
			timexBar.bar:SetHeight(timexBar.bH);
			timexBar.rHeight = true;
		end
		timexBar.sHeight = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetScale(id, scale)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.s ~= scale then
			timexBar.s = scale;
			timexBar.bar:SetScale(timexBar.s);
			timexBar.rScale = true;
		end
		timexBar.sScale = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetTimeWidth(id, width)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.tW ~= width then
			timexBar.tW = width;
			timexBar.ttxt:SetWidth(timexBar.tW);
			timexBar.txt:SetPoint("TOPLEFT", timexBar.bar, "LEFT", timexBar.tW, 13);
			timexBar.rTimeWidth = true;
		end
		timexBar.sTimeWidth = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetText(id, text)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.text ~= text then
			timexBar.text = text;
			if timexBar.text then 
				timexBar.txt:SetText("| "..timexBar.text);
			else
				timexBar.txt:SetText("");
			end
			timexBar.rText = true;
		end
		timexBar.sText = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetTexture(id, texturePath)
	local timexBar = self.barMap[id];
	if timexBar then
		if timexBar.tex ~= texturePath then
			timexBar.tex = texturePath;
			if timexBar.tex then
				timexBar.btnTex:SetTexture(timexBar.tex);
				timexBar.btn:Show();
			else
				timexBar.btn:Hide();
			end
			timexBar.rTexture = true;
		end
		timexBar.sTexture = true;
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetFunction(id, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
	local timexBar = self.barMap[id];
	if timexBar then
		timexBar.f = f;
		if not timexBar.a then
			timexBar.a = newArgs(timexBar);
		end
		buildArgs(timexBar.a, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

function TimexBar:SetUpdateFunction(id, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
	local timexBar = self.barMap[id];
	if timexBar then
		timexBar.uf = f;
		if not timexBar.ua then
			timexBar.ua = newArgs(timexBar);
		end
		buildArgs(timexBar.ua, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
	else
		error(strformat("TimexBar '%s' not found.", id));
	end
end

--<< ================================================= >>--
-- Section Omega: Register the AddOn Object.             --
--<< ================================================= >>--

TimexBar:RegisterForLoad()