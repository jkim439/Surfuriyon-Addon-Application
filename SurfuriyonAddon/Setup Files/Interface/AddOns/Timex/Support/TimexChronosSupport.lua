--<< ================================================= >>--
-- Section I: Chronos Support.                           --
--<< ================================================= >>--

local EMPTY_TABLE = {};
local DEFAULT_TASK_LIMIT = 100;

local function doTask(task, name)
	if (not task[1]) then
		if (task.before) then
			task.before(unpack(task.beforeArgs));
		end
		task[1] = 0;
	end
	task.step(unpack(task.stepArgs));
	task[1] = task[1] + 1;
	if (task.isDone(unpack(task.doneArgs))) then
		Timex:DeleteSchedule(name);
		task[1] = nil;
		if task.after then
			task.after(unpack(task.afterArgs));
		end
	elseif (task[1] > task.limit) then
		Timex:DeleteSchedule(name);
		task[1] = nil;
	end
end

if (not Chronos) then
	Chronos = {
		isScheduledByName    = function(n)
			return Timex:ScheduleCheck(n);
		end,
		schedule             = function(t, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
			Chronos.scheduleByName(nil, t, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
		end,
		scheduleByName       = function(n, t, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
			Timex:AddSchedule(n, t, nil, nil, f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
		end,
		unscheduleByName     = function(n)
			Timex:DeleteSchedule(n);
		end,
		getTimer             = function(n)
			return (Timex:ScheduleCheck(n, TRUE) or 0);
		end,
		startTimer           = function(n)
			Chronos.scheduleByName(n);
		end,
		endTimer             = function(n)
			local r = Chronos.getTimer(n);
			Timex:DeleteSchedule(n);
			return r;
		end,
		afterInit            = function(f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20)
			Timex:AddStartupFunc(f, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
		end,
		scheduleRepeating    = function(n, t, f)
			Timex:AddSchedule(n, t, TRUE, nil, f);
		end,
		unscheduleRepeating  = function(n)
			Timex:DeleteSchedule(n);
		end,
		IsScheduledRepeating = function(n)
			return Timex:ScheduleCheck(n);
		end,
		flushByName          = function(n, w)
			Timex:ChangeDuration(n, w);
		end,
		performTask          = function(t, n)
			if not n then
				n = t;
			end
			if not t.step then
				error("step function is required for Chronos.performTask");
			elseif not t.isDone then
				error("isDone function is required for Chronos.performTask");
			end
			t.stepArgs = t.stepArgs or EMPTY_TABLE;
			t.doneArgs = t.doneArgs or EMPTY_TABLE;
			t.beforeArgs = t.beforeArgs or EMPTY_TABLE;
			t.afterArgs = t.afterArgs or EMPTY_TABLE;
			t.limit = t.limit or DEFAULT_TASK_LIMIT;
			Timex:AddSchedule(n, 0, TRUE, nil, doTask, t, n);
		end
	}
end;

--<< ================================================= >>--
-- Section Omega: Closure.                               --
--<< ================================================= >>--