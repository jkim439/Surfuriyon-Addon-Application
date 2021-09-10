-- Rewrite of Blizzard's code to make it function with the new bottom bars added in 1.5

function ActionButton_UpdateHotkeys(action)
	local hotkey = getglobal(this:GetName().."HotKey");
	if ( not action ) then
		if ( this:GetName() ==  "MultiBarBottomLeftButton"..this:GetID() ) then
			action = "MultiActionBar1Button"..this:GetID();
		elseif ( this:GetName() ==  "MultiBarBottomRightButton"..this:GetID() ) then
			action = "MultiActionBar2Button"..this:GetID();
		elseif ( this:GetName() ==  "MultiBarRightButton"..this:GetID() ) then
			action = "MultiActionBar3Button"..this:GetID();
		elseif ( this:GetName() ==  "MultiBarLeftButton"..this:GetID() ) then
			action = "MultiActionBar4Button"..this:GetID();
		else
			action = "ACTIONBUTTON"..this:GetID();
		end
	end
	local text = GetBindingText(GetBindingKey(action), "KEY_")
--	if ( text == "" ) then
--		text = "*";
--	end
	text = string.gsub(text, '(%w)%w-%-', '%1-');
	text = string.gsub(text, '(%w)%.(%w)%.', '%1%2-');
	hotkey:SetText(text);
	hotkey:Show();
end	