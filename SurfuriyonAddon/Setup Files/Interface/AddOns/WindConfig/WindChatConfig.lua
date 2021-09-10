function WindChatConfig_OnShow()
	for i=1,7 do WindChatConfig_init(i); end
	if (WindChatConfigAll[8]) then WindChatConfigTop:SetChecked(1);
	else WindChatConfigTop:SetChecked(0); end
end

function WindChatConfig_init(index)
	getglobal("WindChatConfig"..index):SetText(WindChatConfigAll[index][1]);
	if (WindChatConfigAll[index][2]) then getglobal("WindChatConfig"..index.."Border"):SetChecked(1);
	else getglobal("WindChatConfig"..index.."Border"):SetChecked(0); end
end

function WindChatConfig_changeScale(index)
	WindChatConfigAll[index][1] = WindConfig_validScale(this:GetNumber());
	WindChat_setScale(index);
	if (index ~= 7) then getglobal("WindChatConfig"..index+1):SetFocus();
	else this:ClearFocus(); end
end

function WindChatConfig_changeBorder(index)
	if (this:GetChecked()) then
		this:SetChecked(1);
		WindChatConfigAll[index][2] = true;
	else
		this:SetChecked(0);
		WindChatConfigAll[index][2] = false;
	end
	WindChat_setBorder(index);
end

function WindChatConfig_changeTop()
	if (this:GetChecked()) then
		this:SetChecked(1);
		WindChatConfigAll[8] = true;
	else
		this:SetChecked(0);
		WindChatConfigAll[8] = false;
	end
	WindChatEditBox_setLocation();
end