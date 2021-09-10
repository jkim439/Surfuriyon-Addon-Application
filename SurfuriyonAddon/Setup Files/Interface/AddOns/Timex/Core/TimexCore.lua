local weak_mt = {__mode="v"};

local TIMEX_GC_INTERVAL = 30
local TIMEX_TIMER_CACHE = 10;

local TIMEX_UPDATE = 1;
local TIMEX_EVENT = 2;
local FUNCTION = 4;

local TT_UPDATE = "doTimexEvent";

local TT_UPDATE_EVENT = "TIMEX_UPDATE";

local function ARG_ID(t) return t.timer.id; end;
local function ARG_COUNT(t) return t.timer.c; end;
local function ARG_ELAPSED(t) return t.timer.elapsed; end;

--<< ================================================= >>--
-- Section I: Initialize the AddOn Object.               --
--<< ================================================= >>--

Timex             = AceAddonClass:new({
	name          = TimexLocals.Title,
	version       = TimexLocals.Version,
	description   = TimexLocals.Desc,
	author        = "Rowne",
	authorEmail   = "wuffxiii@gmail.com",
	aceCompatible = "100",
	category      = ACE_CATEGORY_OTHERS,
	cmd           = AceChatCmd:new(TimexLocals.ChatCmd, (TimexLocals.ChatOpt or {})),
	db            = AceDatabase:new("TimexDB"),

	timerDB       = {},
	timerMap      = setmetatable({}, weak_mt),
	initDB        = {},
	count         = 0, -- number of active schedules
	last          = 0, -- time of last event update

	gccheck       = 0,
	gc            = nil,

	TT_UPDATE     = TT_UPDATE,
	ARG_ID        = ARG_ID,
	ARG_COUNT     = ARG_COUNT,
	ARG_ELAPSED   = ARG_ELAPSED,

	weak_mt       = weak_mt,
})

--<< ================================================= >>--
-- Section II: Private utility functions.                --
--<< ================================================= >>--

--------------------
-- argument stuff
--------------------
local args_switch = {};
args_switch[ARG_ID] = ARG_ID;
args_switch[ARG_COUNT] = ARG_COUNT;
args_switch[ARG_ELAPSED] = ARG_ELAPSED;

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

local function newArgs(timer)
	local args = { timer = timer, sub = {} };
	setmetatable(args, args_mt);
	return args;
end

--------------------
-- other stuff
--------------------

local function garbageCollect(timex, force)
	if (timex.gc) then
		local now = GetTime();
		if (force or now >= timex.gccheck) then
			-- check gc threshold every 30 seconds - the gc check is awfully cheap though, this is probably overkill
			timex.gccheck = now + TIMEX_GC_INTERVAL;
			local memory, threshold = gcinfo();
			if (memory > 0.95 * threshold) then
				timex.gc = nil;
				for k, v in timex.timerDB do
					if (k > TIMEX_TIMER_CACHE) then
						-- if active then GC is still necessary later
						if v.t then
							timex.gc = TRUE;
						else
							timex.timerDB[k] = nil;
						end
					end
				end
			end
		end
	end
end

local function handleFrame(timex, h)
	if (timex.count == 1 or h) then
		TimexUpdateFrame:Show();
	elseif (timex.count == 0) then
		TimexUpdateFrame:Hide();
		garbageCollect(timex, TRUE);
	end
end

local function runStartupFunctions(timex)
	for k, v in pairs(timex.initDB) do
		if (v.f) then
			v.f(v.a1, v.a2, v.a3, v.a4, v.a5, v.a6, v.a7, v.a8, v.a9, v.a10, v.a11, v.a12, v.a13, v.a14, v.a15, v.a16, v.a17, v.a18, v.a19, v.a20);
		end
		timex.initDB[k] = nil;
	end
end

local function deleteTimer(timex, timer)
	if timer.t then
		timer.t = nil;
		if timer.id then
			timex.timerMap[timer.id] = nil;
		end
		timex.count = timex.count - 1;
		handleFrame(timex);
	end
end

local function deleteTimerArgs(timer)
	-- clear arg table
	local args = timer.a;
	args[1] = nil; args[2] = nil; args[3] = nil; args[4] = nil; args[5] = nil;
	args[6] = nil; args[7] = nil; args[8] = nil; args[9] = nil; args[10] = nil;
	args[11] = nil; args[12] = nil; args[13] = nil; args[14] = nil; args[15] = nil;
	args[16] = nil; args[17] = nil; args[18] = nil; args[19] = nil; args[20] = nil;
end

--<< ================================================= >>--
-- Section III: The Timex System Functions.              --
--<< ================================================= >>--

function Timex:Enable()
	TimexBar:Enable();
	runStartupFunctions(self);
end

function Timex:AddStartupFunc(f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
	self.initDB[getn(self.initDB) + 1] = {
		f = f,
		a = arg,
		a1 = a1, a2 = a2, a3 = a3, a4 = a4, a5 = a5,
		a6 = a6, a7 = a7, a8 = a8, a9 = a9, a10 = a10,
		a11 = a11, a12 = a12, a13 = a13, a14 = a14, a15 = a15,
		a16 = a16, a17 = a17, a18 = a18, a19 = a19, a20 = a20,
	};
end

-- changed to support max of 20 arguments (to prevent table creation)
function Timex:AddSchedule(id, t, r, c, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
	if id or t then
		local now = GetTime();
		-- look for named schedule
		local v;
		if id then
			v = self.timerMap[id];
		end
		if not v then
			-- find first available
			local i = 1;
			v = self.timerDB[i];
			while v do
				if not v.t then
					break;
				end
				i = i + 1;
				v = self.timerDB[i];
			end
			if not v then
				v = {};
				v.a = newArgs(v);
				self.timerDB[i] = v;
			end
			-- if we insert something higher than the cache limit, GC is necessary later
			if i > TIMEX_TIMER_CACHE then
				self.gc = TRUE;
			end
			self.count = self.count + 1;
			if id then
				self.timerMap[id] = v;
			end
		end
		v.id = id or self.name;
		v.t = t and tonumber(t) or 0;
		v.r = r;
		v.c = c and tonumber(c) or nil;
		if f then
			local fType = type(f);
			if fType == "function" then
				v.f = f;
				v.e = nil;
				v.le = nil;
			elseif fType == "string" then
				if f == TT_UPDATE then
					v.le = TT_UPDATE_EVENT;
					v.e = nil
				else
					v.e = f;
					v.le = nil;
				end
				v.f = nil;
			else
				error("Timex:AddSchedule: param f is not a function or an event name");
			end
		else
			v.f = nil;
			v.e = nil;
			v.le = nil;
		end
		buildArgs(v.a, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
		-- start time, last update, due time
		v.s = now;
		v.l = now;
		v.d = now + v.t;

		handleFrame(self, TRUE);
	end
end

function Timex:ScheduleCheck(id, r)
	local v = self.timerMap[id];
	if (v) then
		if (r) then
			-- hmm...this isn't exactly accurate, it shows the time elapsed when the update last fired.
			return self.last - v.s;
		else
			return TRUE;
		end
	end
end

function Timex:DeleteSchedule(id)
	local v = self.timerMap[id];
	if (v) then
		deleteTimer(self, v);
	end
end

function Timex:ChangeDuration(id, t)
	local v = self.timerMap[id];
	if (v and t) then
		v.t = t;
		v.d = v.s + t;
	end
end

function Timex:Update(dt)
	-- function optimisations
	local triggerEvent = self.TriggerEvent;

	local now = GetTime();
	self.last = now;
	for k, v in pairs(self.timerDB) do
		if v.t then
			if (now >= v.d) then
				local elapsed = now - v.l;
				v.elapsed = elapsed;
				local count = v.c;
				if count then
					count = count - 1;
					v.c = count;
					if (count <= 0) then
						deleteTimer(self, v);
					else
						v.s = v.d;
						v.l = now;
						v.d = v.s + v.t;
					end
				elseif v.r then
					v.s = v.d;
					v.l = now;
					v.d = v.s + v.t;
				else
					deleteTimer(self, v);
				end
				-- trap errors, or else this particular call will just die
				local status, err;
				local a = v.a;
				if v.f then
					status, err = pcall(v.f, a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]);
				elseif v.e then
					status, err = pcall(triggerEvent, self, v.e, a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]);
				elseif v.le then
					status, err = pcall(triggerEvent, self, v.le, a, v.c, v.id, elapsed);
				else
					status = true;
				end
				if (not status) then
					self.cmd:msg("Scheduled function '%s' failed with error: %s", tostring(v.id), tostring(err));
				end
				if not v.t then
					deleteTimerArgs(v);
				end
			end
		end
	end
	-- do garbage collection
	garbageCollect(self);
end

--<< ================================================= >>--
-- Section Omega: Register the AddOn Object.             --
--<< ================================================= >>--

Timex:RegisterForLoad()
