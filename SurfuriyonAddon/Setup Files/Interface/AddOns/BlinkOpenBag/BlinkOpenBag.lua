--[[///////////////////////////////////////////////////////////////////////////

  Mod Name : Blink Open Bag(or AllInOneInventory) v1.8
  Author   : Blink
  Date     : 2005/01/16
  LastUpdate : 2005/06/07

/////////////////////////////////////////////////////////////////////////////]]

old_BOB_MerchantFrame_OnShow = nil;
old_BOB_MerchantFrame_OnHide = nil;
old_BOB_BankFrame_OnEvent = nil;
old_BOB_MailFrame_OnEvent = nil;
old_BOB_AuctionFrame_OnEvent = nil;
old_BOB_TradeFrame_OnEvent = nil;

function BlinkOpenBag_OnLoad()
	old_BOB_MerchantFrame_OnShow = MerchantFrame_OnShow;
	old_BOB_MerchantFrame_OnHide = MerchantFrame_OnHide;
	old_BOB_BankFrame_OnEvent = BankFrame_OnEvent;
	old_BOB_MailFrame_OnEvent = MailFrame_OnEvent;
	old_BOB_AuctionFrame_OnEvent = AuctionFrame_OnEvent;

	MerchantFrame_OnShow = BOB_MerchantFrame_OnShow;
	MerchantFrame_OnHide = BOB_MerchantFrame_OnHide;
	BankFrame_OnEvent = BOB_BankFrame_OnEvent;
	MailFrame_OnEvent = BOB_MailFrame_OnEvent;
	AuctionFrame_OnEvent = BOB_AuctionFrame_OnEvent;
	TradeFrame_OnEvent = BOB_TradeFrame_OnEvent;
end

function BlinkOpenBag_OpenBagAll()
	if( OpenAllInOneInventoryFrame )then
		OpenAllInOneInventoryFrame();
	else
		OpenBackpack();
		for i=1,10 do
			OpenBag(i);
		end
	end
end

function BlinkOpenBag_CloseBagAll()
	if( CloseAllInOneInventoryFrame )then
		CloseAllInOneInventoryFrame();
	else
		CloseAllBags();
	end
end

-- 상점창 ---------------------------------------------------------------------
function BOB_MerchantFrame_OnShow()
	BlinkOpenBag_OpenBagAll();

	-- Update repair all button status
	if ( MerchantRepairAllIcon ) then
		local repairAllCost, canRepair = GetRepairAllCost();
		if ( canRepair ) then
			SetDesaturation(MerchantRepairAllIcon, nil);
			MerchantRepairAllButton:Enable();
		else
			SetDesaturation(MerchantRepairAllIcon, 1);
			MerchantRepairAllButton:Disable();
		end	
	end
end

function BOB_MerchantFrame_OnHide()
	CloseMerchant();
	BlinkOpenBag_CloseBagAll();
	ResetCursor();
end

-- 은행창 ---------------------------------------------------------------------
function BOB_BankFrame_OnEvent(event)
	if ( event == "BANKFRAME_OPENED" ) then
		BankFrameTitleText:SetText(UnitName("npc"));
		SetPortraitTexture(BankPortraitTexture,"npc");
		ShowUIPanel(this);

		BlinkOpenBag_OpenBagAll();

		if ( not this:IsVisible() ) then
			CloseBankFrame();
		end
		UpdateBagSlotStatus();
	elseif ( event == "BANKFRAME_CLOSED" ) then
		HideUIPanel(this);
		BlinkOpenBag_CloseBagAll();
	elseif ( event == "PLAYER_MONEY" or event == "PLAYERBANKBAGSLOTS_CHANGED" ) then
		UpdateBagSlotStatus();
	end
end

-- 우편함 ---------------------------------------------------------------------
function BOB_MailFrame_OnEvent()
	if ( event == "MAIL_SHOW" ) then
		ShowUIPanel(MailFrame);
		if ( not MailFrame:IsVisible() ) then
			CloseMail();
			return;
		end

		BlinkOpenBag_OpenBagAll();

		SendMailFrame_Update();
		MailFrameTab_OnClick(1);
		CheckInbox();
	elseif ( event == "MAIL_INBOX_UPDATE" ) then
		InboxFrame_Update();
		OpenMail_Update();
	elseif ( event == "MAIL_SEND_INFO_UPDATE" ) then
		SendMailFrame_Update();
	elseif ( event == "MAIL_SEND_SUCCESS" ) then
		SendMailFrame_Reset();
		PlaySound("igAbiliityPageTurn");
		-- If open mail frame is open then switch the mail frame back to the inbox
		if ( SendMailFrame.sendMode == "reply" ) then
			MailFrameTab_OnClick(1);
		end
	elseif ( event == "MAIL_FAILED" ) then
		SendMailMailButton:Enable();
	elseif ( event == "MAIL_CLOSED" ) then
		HideUIPanel(MailFrame);
		BlinkOpenBag_CloseBagAll();
	elseif ( (event == "CLOSE_INBOX_ITEM") and (InboxFrame.openMailID == arg1) ) then
		HideUIPanel(OpenMailFrame);
	end
end

-- 경매창 ---------------------------------------------------------------------
function BOB_AuctionFrame_OnEvent()
	if ( event == "AUCTION_HOUSE_SHOW" ) then
		if ( this:IsVisible() ) then
			AuctionFrameBrowse_Update();
			AuctionFrameBid_Update();
			AuctionFrameAuctions_Update();
		else
			ShowUIPanel(this);
			BlinkOpenBag_OpenBagAll();
			if ( not this:IsVisible() ) then
				CloseAuctionHouse();
--				BlinkOpenBag_CloseBagAll();
			end
		end
	elseif ( event == "AUCTION_HOUSE_CLOSED" ) then
		HideUIPanel(this);
		BlinkOpenBag_CloseBagAll();
	end
end

-- 거래창 ---------------------------------------------------------------------
function BOB_TradeFrame_OnEvent()
	if ( event == "TRADE_SHOW" or event == "TRADE_UPDATE" ) then
		ShowUIPanel(this, 1);
		BlinkOpenBag_OpenBagAll();
		if ( not this:IsVisible() ) then
			CloseTrade();
--			BlinkOpenBag_CloseBagAll();
			return;
		end

		TradeFrameTradeButton:Enable();
		TradeFrame_Update();
	elseif ( event == "TRADE_CLOSED" ) then
		HideUIPanel(this);
		BlinkOpenBag_CloseBagAll();
	elseif ( event == "TRADE_TARGET_ITEM_CHANGED" ) then
		TradeFrame_UpdateTargetItem(arg1);
	elseif ( event == "TRADE_PLAYER_ITEM_CHANGED" ) then
		TradeFrame_UpdatePlayerItem(arg1);
	elseif ( event == "TRADE_ACCEPT_UPDATE" ) then
		TradeFrame_SetAcceptState(arg1, arg2);
	end
end
