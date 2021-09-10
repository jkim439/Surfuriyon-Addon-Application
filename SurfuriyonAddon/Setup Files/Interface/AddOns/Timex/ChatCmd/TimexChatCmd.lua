--<< ================================================= >>--
-- Section I: The Global Functions.	                     --
--<< ================================================= >>--

ace:RegisterFunctions(Timex, {
	version	= 1.0,

    ExecuteChatCommand = function(...)
        if not DEFAULT_CHAT_FRAME then return end
        DEFAULT_CHAT_FRAME.editBox:SetText(ace.concat(arg))
        ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox)
    end,

	ParseByName41 = function(i, p, s, q)
		local tmpDB= {}
		p = p or "=" s = s or " " q = q or "\"" i = i..s
		string.gsub(i, "(%a[%a%d_]-)"..p.."("..q.."?)(.-)%2"..s, function(k, _,  v) tmpDB[k] = string.gsub(v, "\\"..s, s) end)
		return tmpDB
	end
})

--<< ================================================= >>--
-- Section II: The Chat Options.                         --
--<< ================================================= >>--

function Timex:ChatExecute(i)
	local p = self.ParseByName41(i)
	if not p.f or not p.t then
		self.cmd:result(TimexLocals.Chat_BadValues)
		return
	end
	p.a = "/script "..p.f.."("..(p.a or "")..")"
	p.f = Timex.ExecuteChatCommand
	self:AddSchedule(p.n, p.t, p.r, p.c, p.f, p.a)
	self.cmd:result(TimexLocals.Chat_Execute)
end

function Timex:ChatDelete(i)
	if not Timex:ScheduleCheck(i) then
		self.cmd:result(format(TimexLocals.Chat_BadDelete, i))
		return
	end
	Timex:DeleteSchedule(i)
	self.cmd:result(format(TimexLocals.Chat_Delete, i))
end

--<< ================================================= >>--
-- Section Omega: Register the AddOn Object.             --
--<< ================================================= >>--
