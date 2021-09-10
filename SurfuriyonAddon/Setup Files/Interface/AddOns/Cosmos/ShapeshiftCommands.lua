--[[
	This is a simple text file to allow players to change stance
	via the chat. 

	By Alexander Brazie	
  ]]

Cosmos_ShapeshiftList = {
	-- Stances
	["전투 태세"] = 1;
	["방어 태세"] = 2;
	["광폭 태세"] = 3;

	-- Rogue Stealth
	["은신"] = 1;

	-- Shapeshifts
	["곰 변신"] = 1;
	["바다표범 변신"] = 2;
	["표범 변신"] = 3;
	["치타 변신"] = 4;

	-- Aliases

	-- Stances
	["전투"] = 1;
	["btl"] = 1;
	["방어"] = 2;
	["defensive"] = 2;
	["beserk"] = 3;
	["광폭"] = 3;

	-- Rogue Stealth
	["은신"] = 1;

	-- Shapeshifts
	["곰"] = 1;
	["바다표범"] = 2;
	["표범"] = 3;
	["치타"] = 4;
};

Cosmos_ShapeshiftList_ByClass = {
	
	["드루이드"] = {
		-- Shapeshifts
		["곰"] = 1,
		["바다표범"] = 2,
		["표범"] = 3,
		["치타"] = 4,

		-- Aliases

		["곰"] = 1,
		["바다표범"] = 2,
		["표범"] = 3,
		["치타"] = 4,

		["tank"] = 1,
		["aqua"] = 2,
		["dps"] = 3;
	},
	
	["도적"] = {
		-- Rogue Stealth
		["은신"] = 1,
	
		-- Aliases

		["은신"] = 1;
	},
	
	["전사"] = {
		-- Stances
		["전투 태세"] = 1,
		["방어 태세"] = 2,
		["광폭 태세"] = 3,

		-- Aliases
	
		["전투"] = 1,
		["btl"] = 1,
		["방어"] = 2,
		["def"] = 2,
		["광폭"] = 3,
		["bzrk"] = 3;
	}
	
};


function ShapeshiftByNumber(id) 
	CastShapeshiftForm(id);
end

function ShapeshiftByName(name)
	local list = Cosmos_ShapeshiftList_ByClass[UnitClass("player")];
	
	if ( not list ) then
		return false;
	end
	
	if ( not name ) then
		return false;
	end
	local text = string.lower(name);
	if ( not text ) then
		return false;
	end
	
	for k,v in list do
		if (text == v) then
			ShapeshiftByNumber(v);
			return true;
		end
	end
	for k,v in list do
		if (string.find(text,v) ~= nil) then
			ShapeshiftByNumber(v);
			return true;
		end
	end
	return false;
end

function ShapeshiftByChat(text)
	local shapeshiftId = tonumber(text);
	if ( shapeshiftId ) then
		ShapeshiftByNumber(text); 
	else
		ShapeshiftByName(text);
	end
	
end	

function ShapeshiftStealth()
	ShapeshiftByNumber(1);
end

function ShapeshiftCommands_Register()
	-- Register the chat bindings
	Cosmos_RegisterChatCommand(
		"SSC_STANCE", 
		SHAPE_COMM1, 
		ShapeshiftByChat,
		SHAPE_COMM1_INFO,
		CSM_CHAINNONE
	);
	Cosmos_RegisterChatCommand(
		"SSC_STEALTH", 
		SHAPE_COMM2, 
		ShapeshiftStealth,
		SHAPE_COMM2_INFO,
		CSM_CHAINNONE
	);
	Cosmos_RegisterChatCommand(
		"SSC_SHAPESHIFT", 
		SHAPE_COMM3, 
		ShapeshiftByChat,
		SHAPE_COMM3_INFO,
		CSM_CHAINNONE
	);
		
end
