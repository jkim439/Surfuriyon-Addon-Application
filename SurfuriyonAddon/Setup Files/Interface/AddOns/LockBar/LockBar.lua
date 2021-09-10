
LockBar_IsLocked = 0;
LockBar_IsEnabled = true;
LockBar_Mode = 0;

LockBar_Saved_PickupAction = nil;

-- hooked function
function LockBar_PickupAction(id)
	if ( LockBar_ShouldAllowPickupAction() ) then
		LockBar_Saved_PickupAction(id);
	end
end

function LockBar_ShouldAllowPickupAction()
	if ( ( LockBar_IsLocked ~= 1 ) or ( IsShiftKeyDown() ) ) then
		return true;
	else
		return false;
	end
end

function LockBar_Setup_Hooks(toggle)
	if ( toggle ) then
		if ( ( PickupAction ~= LockBar_PickupAction ) and (LockBar_Saved_PickupAction == nil) ) then
			LockBar_Saved_PickupAction = PickupAction;
			PickupAction = LockBar_PickupAction;
		end
	else
		if ( PickupAction == LockBar_PickupAction) then
			PickupAction = LockBar_Saved_PickupAction;
			LockBar_Saved_PickupAction = nil;
		end
	end
end

function LockBar_OnClick()
	LockBar_SetState(this:GetChecked());
end

function LockBar_OnEvent(event)
	if ( event == "VARIABLES_LOADED" ) then
		LockBar_Setup_Hooks(LockBar_IsLocked);
		LockBar_SetState(LockBar_IsLocked);
		if ( LockBar_Mode == 0 ) then
			LockBar_LowRes();
		else
			LockBar_HiRes();
		end
	end
end

function LockBar_SetState(toggle)
	if ( toggle == 1 or toggle == true ) then
		LockBar_IsLocked = 1;
		LOCK_ACTIONBAR = 1;
		LockBar_Setup_Hooks(true);
		ActionLockButton:SetChecked(1);
	else
		LockBar_IsLocked = 0;
		LOCK_ACTIONBAR = 0;
		LockBar_Setup_Hooks(false);
		ActionLockButton:SetChecked(0);
	end
end

function LockBar_Toggle(toggle)
	if ( toggle == 1 or toggle == true ) then
		LockBar_SetState(LockBar_IsLocked);
		getglobal("ActionLockButton"):Show();
		LockBar_IsEnabled = true;
	else
		getglobal("ActionLockButton"):Hide();
		LockBar_Setup_Hooks(false);
		LockBar_IsEnabled = nil;
	end
end

function LockBar_OnLoad()
-- Start Added by Gryphen
  if (Cosmos_RegisterConfiguration) then
	  Cosmos_RegisterConfiguration(
	  	"COS_LOCKBAR",
	  	"SECTION",
	  	TEXT(LOCKBAR_OPTION_SEP),
	  	TEXT(LOCKBAR_OPTION_SEP_INFO)
	  );
	  Cosmos_RegisterConfiguration(
	  	"COS_LOCKBAR_SEP",
	  	"SEPARATOR",
	  	TEXT(LOCKBAR_OPTION_SEP),
	  	TEXT(LOCKBAR_OPTION_SEP_INFO)
	  );
	  Cosmos_RegisterConfiguration(
	  	"COS_LOCKBAR_USECUSTOM",
	  	"CHECKBOX",
	  	TEXT(LOCKBAR_OPTION_CHECK),
	  	TEXT(LOCKBAR_OPTION_CHECK_INFO),
	  	LockBar_Toggle,
	  	1
	  );
	  Cosmos_RegisterConfiguration(
	  	"COS_LOCKBAR_LOWRES",
	  	"BUTTON",
	  	TEXT(LOCKBAR_OPTION_LOWRES),
	  	TEXT(LOCKBAR_OPTION_LOWRES_INFO),
	  	LockBar_LowRes,
		0,
		0,
		0,
		0,
		TEXT(LOCKBAR_OPTION_BUTTON_TEXT)
	  );
	  Cosmos_RegisterConfiguration(
	  	"COS_LOCKBAR_HIRES",
	  	"BUTTON",
	  	TEXT(LOCKBAR_OPTION_HIRES),
	  	TEXT(LOCKBAR_OPTION_HIRES_INFO),
	  	LockBar_HiRes,
		0,
		0,
		0,
		0,
		TEXT(LOCKBAR_OPTION_BUTTON_TEXT)
	  );
  end
-- End Added by Gryphen
	--RegisterForSave("LockBar_IsLocked");
	this:RegisterEvent("VARIABLES_LOADED");
end

function LockBar_LowRes()
	LockBar_Mode = 0;
	local lockbarframe = getglobal("ActionLockButton");
	lockbarframe:ClearAllPoints();
	lockbarframe:SetFrameStrata("LOW");
	lockbarframe:SetPoint("BOTTOMRIGHT","MinimapCluster",1,20);
end

function LockBar_HiRes()
	LockBar_Mode = 1;
	local lockbarframe = getglobal("ActionLockButton");
	lockbarframe:ClearAllPoints();
	lockbarframe:SetFrameStrata("HIGH");
	lockbarframe:SetPoint("BOTTOMLEFT","UIParent",-18,10);
end

function LockBar_OnEnter()
	if ( LockBar_Mode == 0 ) then
		GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	else
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
	end
	GameTooltip:SetText(TEXT(LOCKBAR_BUTTON_TOOLTIP), 1.0, 1.0, 1.0);
end

function LockBar_OnLeave()
	if ( GameTooltip:IsOwned(this) ) then
		GameTooltip:Hide();
	end 
end

