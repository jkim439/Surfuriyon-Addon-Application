--[[ ---------------------------------------------------------------------------
	
	StopTheSpam
	Hooks the ChatFrame's AddMessage function to stop the AddOn loading spam
	
	Copyright 2006 Tyler Riti (Malreth of Silver Hand)
	
	Nothing in this script or in the comments is to be taken seriously.
	
----------------------------------------------------------------------------- ]]

--[[ ------------------------------------------------------------------------ ]]

local MAX_CHAT_TYPE_ID = ChatTypeInfo.CHANNEL10.id
local ALLOW            = 1
local DENY             = 0

local updateFlag = true
local hooked     = {}
local ruleset    = {}

local frame      = StopTheSpam_Frame

--[[ ------------------------------------------------------------------------ ]]

ruleset.order = {
	"warmup",
	"msgid",
	"bugsack",
	"ace",
	"timeplayed",
	"default"
}
	
ruleset.rules = {
	["warmup"] = {
		test = function (_, _, frame) return WarmupFrame and frame == WarmupFrame end,
		invalidate = true,
		action = ALLOW
	},
	["msgid"] = {
		test = function (_, id) return not id or id > MAX_CHAT_TYPE_ID end,
		action = DENY
	},
	["bugsack"] = {
		test = function (msg) return BugSack and (string.find(msg, BugSack.Const.Misc.ErrorNotice) or false) end,
		invalidate = true,
		action = ALLOW
	},
	["ace"] = {
		test = function (_, _, frame) return AceEventFrame and frame == AceEventFrame end,
		expire = 1,
		invalidate = true,
		action = DENY
	},
	["timeplayed"] = {
		test = function (msg) return string.find(string.lower(msg), string.lower(TIME_PLAYED_MSG)) end,
		action = DENY
	},
	["default"] = {
		action = ALLOW
	}
}

--[[ ------------------------------------------------------------------------ ]]

--[[local function __DEBUG__(msg, r, g, b)
	return -- ChatFrame3:AddMessage(msg, r, g, b)
end -- ]]

local function IsMessageSpam(msg, id, frame)
	--[[__DEBUG__("STS Testing: msg="..string.gsub(tostring(msg), "|", "||").." id="
		..tostring(id).." frame="..((frame and frame.GetName) and frame:GetName()
		or "(no name)"), 0.9, 0.4, 0.1) -- ]]
	if msg then
		for i = 1, table.getn(ruleset.order) do
			--[[local name = ruleset.order[i] -- for debugging ]]
			local rule = ruleset.rules[ruleset.order[i]]
			if not rule.disabled then
				local match = not rule.test or rule.test(msg, id, frame)
				if match then
					--[[local action = rule.action -- for debugging ]]
					--[[__DEBUG__("  Rule "..i.." '"..name.."' MATCHES. Result '"..
						tostring(match).."' Action '"..action.."'") -- ]]
					if rule.expire then
						if rule.expire <= 1 then
							--[[__DEBUG__("    Rule has EXPIRED.") -- ]]
							table.remove(ruleset.order, i)
						else
							rule.expire = rule.expire - 1
							--[[__DEBUG__("    Rule will expire. Expire '"..rule.expire.."'") -- ]]
						end
					end
					return rule.action == DENY
				elseif rule.invalidate and match == nil then -- Must explicitly test for nil!
					--[[__DEBUG__("  Rule "..i.." '"..name.."' is INVALID.") -- ]]
					table.remove(ruleset.order, i)
					i = i - 1
					--[[__DEBUG__("    Rule has been REMOVED.") -- ]]
				--[[else
					__DEBUG__("  Rule "..i.." '"..name.."' does not match. Result '"
						..tostring(match).."'") -- ]]
				end
			--[[else
				__DEBUG__("  Rule "..i.." '"..name.."' is DISABLED.") -- ]]
			end
		end
	end
end

local function HookAddMessage(frame)
	if not hooked[frame] then
		local call = frame.AddMessage
		hooked[frame] = { save = call }
		hooked[frame].hook = function (self, msg, r, g, b, id)
			if not (hooked[frame] and IsMessageSpam(msg, id, this)) then
				return call(self, msg, r, g, b, id)
			end
		end
		--[[hooked[frame].hook = function (self, msg, r, g, b, id)
			if hooked[frame] then
				if IsMessageSpam(msg, id, this) then
					__DEBUG__("STS Discarded: "..tostring(msg), 0.9, 0.2, 0.1)
					return
				else
					__DEBUG__("STS Allowed: "..tostring(msg), 0.1, 0.9, 0.2)
					return call(self, msg, r, g, b, id)
				end
			else
				return call(self, msg, r, g, b, id)
			end
		end -- ]]
		frame.AddMessage = hooked[frame].hook
	end
end

local function UnhookAddMessage(frame)
	if hooked[frame] and frame.AddMessage == hooked[frame].hook then
		--[[__DEBUG__("STS: Successfully unhooked "..frame:GetName()..":AddMessage()") -- ]]
		frame.AddMessage = hooked[frame].save
	--[[else
		__DEBUG__("STS: Unable to unhook "..frame:GetName()..":AddMessage()")
		__DEBUG__("  save = "..tostring(hooked[frame].save)..
			" hook = "..tostring(hooked[frame].hook)..
			" call = "..tostring(frame.AddMessage)) -- ]]
	end
	hooked[frame] = nil
end

--[[ ------------------------------------------------------------------------ ]]

local function OnUpdate()
	--[[__DEBUG__("STS: OnUpdate ("..tostring(updateFlag)..")", 0.8, 0.1, 0.9) -- ]]
	if updateFlag then
		updateFlag = nil
		-- Make the rules a little more lenient.
		ruleset.rules.msgid.disabled = true
	else
		-- All addon loading should be done by now. Disable the filter.
		frame:Hide()
		UnhookAddMessage(ChatFrame1)
		UnhookAddMessage(ChatFrame2)
		--[[__DEBUG__("STS: Frame hidden", 0.8, 0.1, 0.9) -- ]]
		frame:SetScript("OnUpdate", nil)
		ruleset = nil
		IsMessageSpam = nil
		HookAddMessage = nil
		UnnookAddMessage = nil
		OnUpdate = nil
	end
end

--[[ ------------------------------------------------------------------------ ]]

-- No one need know we're here.
StopTheSpam_Frame = nil
-- Hook the default chat frame's AddMessage method.
HookAddMessage(ChatFrame1)
-- Hook the combat log frame's AddMessage method because that crazy Gatherer
-- puts stuff there. Oh, Gatherer. I could give you such a pinch!
HookAddMessage(ChatFrame2)
-- Setup the OnUpdate handler.
frame:SetScript("OnUpdate", OnUpdate)
frame:Show()
-- Spam the user with another addon loaded message.
DEFAULT_CHAT_FRAME:AddMessage("Malreth's StopTheSpam Loaded!")

--[[ ------------------------------------------------------------------------ ]]
