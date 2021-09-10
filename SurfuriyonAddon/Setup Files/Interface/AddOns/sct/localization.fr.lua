-- SCT localization information
-- French Locale
-- Initial translation by Juki <Unskilled>
-- Translation by Sasmira
-- Date 04/03/2006

if ( GetLocale() == "frFR" ) then

	-- Static Messages
	SCT_LowHP= "Vie Faible !"; -- Message to be displayed when HP is low
	SCT_LowMana= "Mana Faible !"; -- Message to be displayed when Mana is Low
	SCT_SelfFlag = "*"; -- Icon to show self hits
	SCT_Combat = "+ Combat"; -- Message to be displayed when entering combat
	SCT_NoCombat = "- Combat"; -- Message to be displayed when leaving combat
	SCT_ComboPoint = "Points de Combo "; -- Message to be displayed when gaining a combo point
	SCT_FiveCPMessage = " ... A Mooort !!!"; -- Message to be displayed when you have 5 combo points
	SCT_ExecuteMessage = "Ex\195\169cution ... Meuuurt !!!"; -- Message to be displayed when time to execute
	SCT_WrathMessage = "Marteau du courroux ... Ainsi soit-il !!!"; -- Message to be displayed when time Wrath
	
	--startup messages
	SCT_STARTUP = "Scrolling Combat Text "..SCT_Version.." charg\195\169. Tapez /sctmenu pour les options.";
	SCT_Option_Crit_Tip = "Mettre cet \195\169v\195\168nement toujours apparent lors d\'un CRITIQUE.";
	SCT_Option_Msg_Tip = "Mettre cet 195\169v\195\168nement toujours apparent lors d\'un MESSAGE. Surpasse les Critiques.";
	
	--Warnings
	SCT_Version_Warning= "|cff00ff00SCT AVERTISSANT|r\n\n vos variables sauv\195\169 es sont d\'une version p\195\169rim\195\169e de SCT. Si vous rencontrez des erreurs ou le comportement \195\169trange, REMETTEZ \195\160 Z\195\169ro svp vos options \195\160 l\'aide du bouton de remise ou par /sctreset de dactylographie";
	SCT_Load_Error = "|cff00ff00Error Loading SCT Options. It may be disabled.|r";
	
	--nouns
	SCT_TARGET = "La cible";
	SCT_PROFILE = "SCT Profil charg\195\169: |cff00ff00";
	SCT_PROFILE_DELETE = "SCT Profil supprim\195\169: |cff00ff00";
	SCT_PROFILE_NEW = "SCT Nouveau Profil Cr\195\169e: |cff00ff00";
	SCT_WARRIOR = "Guerrier";
	SCT_ROGUE = "Voleur";
	SCT_HUNTER = "Chasseur";
	SCT_MAGE = "Mage";
	SCT_WARLOCK = "D\195\169moniste";
	SCT_SHAMAN = "Chaman";
	SCT_PALADIN = "Paladin";
	SCT_DRUID = "Druide";
	SCT_PRIEST = "Pr\195\170tre";
	
	--Useage
	SCT_DISPLAY_USEAGE = "Utilisation : \n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "/sctdisplay 'message' (pour du texte blanc)\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "/sctdisplay 'message' rouge(0-10) vert(0-10) bleu(0-10)\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "Exemple : /sctdisplay 'Soignez Moi' 10 0 0\nCela affichera 'Soignez Moi' en rouge vif\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "Quelques Couleurs : rouge = 10 0 0, vert = 0 10 0, bleu = 0 0 10,\njaune = 10 10 0, violet = 10 0 10, cyan = 0 10 10";
	
	--Event and Damage option values
	SCT_OPTION_EVENT1 = {name = "D\195\169g\195\162ts", tooltipText = "Activer/D\195\169sactiver les d\195\169g\195\162ts de m\195\169l\195\169e et divers (feu, chute, etc...)."};
	SCT_OPTION_EVENT2 = {name = "Rat\195\169s", tooltipText = "Activer/D\195\169sactiver les coups rat\195\169s"};
	SCT_OPTION_EVENT3 = {name = "D\195\169vi\195\169s", tooltipText = "Activer/D\195\169sactiver les coups d\195\169vi\195\169s"};
	SCT_OPTION_EVENT4 = {name = "Parades", tooltipText = "Activer/D\195\169sactiver les coups par\195\169s"};
	SCT_OPTION_EVENT5 = {name = "Bloqu\195\169s", tooltipText = "Activer/D\195\169sactiver les coups bloqu\195\169s"};
	SCT_OPTION_EVENT6 = {name = "D\195\169g\195\162ts Sorts", tooltipText = "Activer/D\195\169sactiver les d\195\169g\195\162ts de sorts"};
	SCT_OPTION_EVENT7 = {name = "Sorts Soins", tooltipText = "Activer/D\195\169sactiver les sorts de soins"};
	SCT_OPTION_EVENT8 = {name = "Sorts Resist\195\169s", tooltipText = "Activer/D\195\169sactiver les sorts r\195\169sist\195\169s"};
	SCT_OPTION_EVENT9 = {name = "D\195\169buffs", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque vous \195\170tes debuffs"};
	SCT_OPTION_EVENT10 = {name = "Absorb\195\169s", tooltipText = "Activer/D\195\169sactiver les d\195\169g\195\162ts absorb\195\169s"};
	SCT_OPTION_EVENT11 = {name = "Vie Faible", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque votre vie est faible"};
	SCT_OPTION_EVENT12 = {name = "Mana Faible", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque votre mana est faible"};
	SCT_OPTION_EVENT13 = {name = "Gains d\'Energie", tooltipText = "Activer/D\195\169sactiver l\'affichage des gains de Mana, Rage, Energie\ndes potions, obejts, buffs, etc...(pas des r\195\169g\195\169ration naturelle)"};
	SCT_OPTION_EVENT14 = {name = "Mode Combat", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque vous rentrez ou sortez d\'un combat"};
	SCT_OPTION_EVENT15 = {name = "Points de Combo", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque vous gagnez des points de combo"};
	SCT_OPTION_EVENT16 = {name = "Points d\'Honneur", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque vous gagnez des points d\'Honneur"};
	SCT_OPTION_EVENT17 = {name = "Buffs", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque vous \195\170tes buffs"};
	SCT_OPTION_EVENT18 = {name = "Fin des Buffs", tooltipText = "Activer/D\195\169sactiver l\'affichage lorsque les buffs se dissipent"};
	SCT_OPTION_EVENT19 = {name = "Ex\195\169cution/Courroux", tooltipText = "Activer/D\195\169sactiver l\'affichage de l\'alerte pour Ex\195\169cution et Marteau de Courroux (Guerrier/Paladin Seulement)"};
	SCT_OPTION_EVENT20 = {name = "R\195\169putation", tooltipText = "Activer/D\195\169sactiver l\'affichage du Gain ou de la perte de R\195\169putation"};
	SCT_OPTION_EVENT21 = {name = "Vos Soins", tooltipText = "Activer/D\195\169sactiver l\'affichage des soins que vous faites aux les autres"};
	SCT_OPTION_EVENT22 = {name = "Comp\195\169tences", tooltipText = "Activer/D\195\169sactiver l\'affichage du Gain de points de Comp\195\169tences"};
	
	--Check Button option values
	SCT_OPTION_CHECK1 = { name = "Scrolling Combat Text", tooltipText = "Activer/D\195\169sactiver Scrolling Combat Text"};
	SCT_OPTION_CHECK2 = { name = "Mode Combat", tooltipText = "Activer/D\195\169sactiver l\'affichage de * autour de tous les Scrolling Combat Text"};
	SCT_OPTION_CHECK3 = { name = "Voir Soigneurs", tooltipText = "Activer/D\195\169sactiver l\'affichage de qui ou par quoi vous \195\170tes soign\195\169s."};
	SCT_OPTION_CHECK4 = { name = "Affichage vers le Bas", tooltipText = "Activer/D\195\169sactiver le d\195\169roulement du texte vers le bas"};
	SCT_OPTION_CHECK5 = { name = "Critiques", tooltipText = "Activer/D\195\169sactiver les coups/soins critiques au dessus de votre t\195\170te"};
	SCT_OPTION_CHECK6 = { name = "Type de Sorts", tooltipText = "Activer/D\195\169sactiver l\'affichage du type de dommage caus\195\169 par les Sorts"};
	SCT_OPTION_CHECK7 = { name = "Valider Font: Dommage", tooltipText = "Activer/D\195\169sactiver le changement de la Font sur les dommages dans le jeu par rapport \195\160 la Font us\195\169e par SCT.\n\nIMPORTANT: VOUS DEVEZ VOUS DECONNECTER ET VOUS RECONNECTER POUR QUE CELA PRENNE EFFET. RELANCER L\'INTERFACE NE FONCTIONNE PAS"};
	SCT_OPTION_CHECK8 = { name = "Show all Power Gain", tooltipText = "Enables or Disables showing all power gain, not just those from the chat log\n\nNOTE: This is dependent on the regular Power Gain event being on, is VERY SPAMMY, and sometimes acts strange for Druids just after shapeshifting back to caster form."};
	SCT_OPTION_CHECK9 = { name = "FPS Independent Mode", tooltipText = "Enables or Disables making the animation speed use your FPS or not. When on, makes the animations more consistent and greatly speeds them up on slow machines or in laggy situations."};
	SCT_OPTION_CHECK10 = { name = "Show Overhealing", tooltipText = "Enables or Disables showing how much you overheal for against you or your targets. Dependent on 'Your Heals' being on."};
	
	--Slider options values
	SCT_OPTION_SLIDER1 = { name="Vitesse du Texte", minText="Rapide", maxText="Lent", tooltipText = "Contr\195\180le la vitesse d\'animation du texte d\195\169roulant"};
	SCT_OPTION_SLIDER2 = { name="Taille Texte", minText="Petit", maxText="Grand", tooltipText = "Contr\195\180le la taille du texte d\195\169roulant"};
	SCT_OPTION_SLIDER3 = { name="PV %", minText="10%", maxText="90%", tooltipText = "Contr\195\180le le % de vie n\195\169cessaire pour donner un avertissement"};
	SCT_OPTION_SLIDER4 = { name="Mana %", minText="10%", maxText="90%", tooltipText = "Contr\195\180le le % de mana n\195\169cessaire pour donner un avertissement"};
	SCT_OPTION_SLIDER5 = { name="Transparence", minText="0%", maxText="100%", tooltipText = "Contr\195\180le la transparence du texte"};
	SCT_OPTION_SLIDER6 = { name="Distance du Texte", minText="Petite", maxText="Grande", tooltipText = "Contr\195\180le la distance de d\195\169placement du texte"};
	SCT_OPTION_SLIDER7 = { name="Centrer position X ", minText="-300", maxText="300", tooltipText = "Contr\195\180le la position du texte au centre"};
	SCT_OPTION_SLIDER8 = { name="Centrer position Y ", minText="-300", maxText="300", tooltipText = "Contr\195\180le la position du texte au centre"};
	SCT_OPTION_SLIDER9 = { name="Centrer Position X ", minText="-600", maxText="600", tooltipText = "Contr\195\180le la position du message au centre"};
	SCT_OPTION_SLIDER10 = { name="Centrer Position Y ", minText="-600", maxText="600", tooltipText = "Contr\195\180le la position du message au centre"};
	SCT_OPTION_SLIDER11 = { name="Temps d\'affichage: ", minText="Rapide", maxText="Lent", tooltipText = "Contr\195\180le le temps d\'affichage des messages"};
	SCT_OPTION_SLIDER12 = { name="Taille: ", minText="Petite", maxText="Grande", tooltipText = "Contr\195\180le la taille des messages"};
	
	--Misc option values
	SCT_OPTION_MISC1 = {name="Options SCT "..SCT_Version};
	SCT_OPTION_MISC2 = {name="Options: Ev\195\168nement"};
	SCT_OPTION_MISC3 = {name="Options: Texte"};
	SCT_OPTION_MISC4 = {name="Options: Divers"};
	SCT_OPTION_MISC5 = {name="Options: Alerte"};
	SCT_OPTION_MISC6 = {name="Options: Animation"};
	SCT_OPTION_MISC7 = {name="S\195\169lection: Profil"};
	SCT_OPTION_MISC8 = {name="Sauver & Fermer", tooltipText = "Sauvegarde la configuration en cours et ferme les options"};
	SCT_OPTION_MISC9 = {name="R.\195\160.Z.", tooltipText = "-ATTENTION-\n\nEtes vous certain de vouloir remettre SCT par d\195\169faut ?"};
	SCT_OPTION_MISC10 = {name="S\195\169lection", tooltipText = "S\195\169lectionner le profil d\'un autre personnage"};
	SCT_OPTION_MISC11 = {name="Lancer", tooltipText = "Lancer le profil d\'un autre personnage pour ce personne"};
	SCT_OPTION_MISC12 = {name="Suppr.", tooltipText = "Supprimer le profil du personnage"}; 
	SCT_OPTION_MISC13 = {name="Abandonner", tooltipText = "Abandonner la S\195\169lection"};
	SCT_OPTION_MISC14 = {name="Texte", tooltipText = ""};
	SCT_OPTION_MISC15 = {name="Messages", tooltipText = ""};
	SCT_OPTION_MISC16 = {name="Options: Message"};
	SCT_OPTION_MISC17 = {name="Spell Options"};
	SCT_OPTION_MISC18 = {name="Misc.", tooltipText = ""};
	SCT_OPTION_MISC19 = {name="Spells", tooltipText = ""};
		
	--Fonts
	SCT_FONTS = { 
	[1] = { name="Default", path="Fonts\\FRIZQT__.TTF"},
	[2] = { name="TwCenMT", path="Interface\\Addons\\sct\\fonts\\Tw_Cen_MT_Bold.TTF"},
	[3] = { name="Adventure", path="Interface\\Addons\\sct\\fonts\\Adventure.ttf"},
	[4] = { name="Enigma", path="Interface\\Addons\\sct\\fonts\\Enigma__2.TTF"},
	}
	
	--Animation Types
	SCT_OPTION_SELECTION1 = { name="Type d\'Animation", tooltipText = "Le type d\'animation que vous voulez utiliser", table = {[1] = "Vertical (Normal)",[2] = "Rainbow",[3] = "Horizontal",[4] = "Angled Down"}};
	SCT_OPTION_SELECTION2 = { name="Style de C\195\180t\195\169", tooltipText = "Choix du C\195\180t\195\169 ou vous voulez afficher le d\195\169rouler le texte", table = {[1] = "Alternating",[2] = "Damage Left",[3] = "Damage Right"}};
	SCT_OPTION_SELECTION3 = { name="Font", tooltipText = "Choix de la font que vous voulez utiliser", table = {[1] = SCT_FONTS[1].name,[2] = SCT_FONTS[2].name,[3] = SCT_FONTS[3].name,[4] = SCT_FONTS[4].name}};
	SCT_OPTION_SELECTION4 = { name="Contour de Font", tooltipText = "Choix du contour de font que vous voulez utiliser", table = {[1] = "None",[2] = "Thin",[3] = "Thick"}};
	SCT_OPTION_SELECTION5 = { name="Font Message", tooltipText = "Choix de la font Message que vous voulez utiliser", table = {[1] = SCT_FONTS[1].name,[2] = SCT_FONTS[2].name,[3] = SCT_FONTS[3].name,[4] = SCT_FONTS[4].name}};
	SCT_OPTION_SELECTION6 = { name="Contour de la Font", tooltipText = "Choix du contour de font Message que vous voulez utiliser", table = {[1] = "None",[2] = "Thin",[3] = "Thick"}};
	
	-- Cosmos button
	SCT_CB_NAME = "Scrolling Combat Text".." "..SCT_Version;
	SCT_CB_SHORT_DESC = "Par Grayhoof";
	SCT_CB_LONG_DESC = "Affiche les messages de combat au dessus du personnage";
	SCT_CB_ICON = "Interface\\Icons\\Spell_Shadow_EvilEye"; -- "Interface\\Icons\\Spell_Shadow_FarSight"

end
