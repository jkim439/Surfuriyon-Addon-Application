-- French Localization by ArKoS, Franael, Feu

if ( GetLocale() == "frFR" ) then

	NORMAL_HIT_TEXT	= "Coup Normal";
	NORMAL_TEXT		= "Coup Normal";
	CRIT_TEXT		= "Coup Critique";
	RECORDS_TEXT	= "Records";
	HIT_TEXT		= "Coups";

	TITAN_CRITLINE_MENU_SETTINGS	= "Options";
	TITAN_CRITLINE_MENU_POSTGUILD	= "Rapporter sur le canal guilde";
	TITAN_CRITLINE_MENU_POSTPARTY	= "Rapporter sur le canal groupe";
	TITAN_CRITLINE_MENU_POSTRAID	= "Rapporter sur le canal raid";

	TITAN_CRITLINE_OPTION_SPLASH_TEXT				= "Afficher les nouveaux records \195\160 l\'\195\169cran";
	TITAN_CRITLINE_OPTION_PLAYSOUNDS_TEXT			= "Jouer un son.";
	TITAN_CRITLINE_OPTION_PVPONLY_TEXT				= "Compter seulement les attaques JcJ.";
	TITAN_CRITLINE_OPTION_SCREENCAP_TEXT			= "Faire un screenshot lors d'un nouveau record.";
	TITAN_CRITLINE_OPTION_LVLADJ_TEXT				= "Ajustement du niveau.";
	TITAN_CRITLINE_OPTION_FILTER_HEALING_TEXT		= "Ne pas compter les sorts de soin.";
	TITAN_CRITLINE_OPTION_RESET_TEXT				= "Mise \195\160 z\195\169ro de tous les records.";
	TITAN_CRITLINE_OPTION_FILTER_TEXT				= "Filtrer";
	TITAN_CRITLINE_OPTION_UPDATE_TEXT				= "Manuel Update";
	TITAN_CRITLINE_OPTION_SHOW_CRIT_TEXT			= "Afficher le pourcentage de critique";
	TITAN_CRITLINE_OPTION_ONCLICK_TEXT				= "Cliquez pour afficher les stats sur le canal";
	TITAN_CRITLINE_OPTION_SHIFT_ONCLICK_TEXT		= "+ Shift";
	TITAN_CRITLINE_OPTION_SHOWHITS_TEXT				= "Afficher tous les coups dans l'infobulle";
	TITAN_CRITLINE_OPTION_MOBFILTER_TEXT			= "Don't count damage on special mobs";

	TITAN_CRITLINE_OPTION_SPLASH_HELPTEXT			= "Splash Screen\nShows the new record on the middle of the screen.";
	TITAN_CRITLINE_OPTION_PLAYSOUNDS_HELPTEXT		= "Sounds\nPlays a sound on a new record.";
	TITAN_CRITLINE_OPTION_PVPONLY_HELPTEXT			= "PvP\nIf marked only hits against other players are recorded.";
	TITAN_CRITLINE_OPTION_SCREENCAP_HELPTEXT		= "Screenshot\nSaves a screenshot on new record.";
	TITAN_CRITLINE_OPTION_LVLADJ_HELPTEXT			= "Level Adjustment\nIf the level difference between you and the target \nis higher or lower then this setting, the reocord will \nnot be saved.";
	TITAN_CRITLINE_OPTION_FILTER_HEALING_HELPTEXT	= "Filter Healing\nIf marked all heals (incl. potions) will not recorded.";
	TITAN_CRITLINE_OPTION_SHOW_CRIT_HELPTEXT		= "Crits\nShows the critical percentage of each attack.";
	TITAN_CRITLINE_OPTION_ONCLICK_HELPTEXT			= "Button Function\nIf marked, a click on the button will post your highest \nrecord to a channel.\nIf unmarked, the click will open the settings.";
	TITAN_CRITLINE_OPTION_SHIFT_ONCLICK_HELPTEXT	= "The On Click function only works if you hold down the SHIFT key.";
	TITAN_CRITLINE_OPTION_SHOWHITS_HELPTEXT			= "Overall Hits\nIf marked, all hits for each attack will be shown.";
	TITAN_CRITLINE_OPTION_MOBFILTER_HELPTEXT		= "In some high end instances are special mobs that are very vulnarable against\nspecial magical attacks, if you activate this option\nthey are not counted in CritLine.";

	TITAN_CRITLINE_TOOLTIP_HEADER				= "Summary";

	TITAN_CRITLINE_NEW_RECORD_MSG				= "! Nouveau Record pour %s !";
	TITAN_CRITLINE_NEW_CRIT_RECORD_MSG			= "! Nouveau critique Record pour %s !";

	TITAN_CRITLINE_MOBFILTER_01					= "Chromaggus";
	TITAN_CRITLINE_MOBFILTER_02					= "Death Talon Overseer";
	TITAN_CRITLINE_MOBFILTER_03					= "Death Talon Wyrmguard";

	COMBAT_HIT_MSG			= "Vous touchez (.+) et infligez (%d+) points de dégâts.";
	COMBAT_CRIT_MSG			= "Vous infligez un coup critique \195\160 (.+) %((%d+) points de dégâts%).";
	COMBAT_HIT_SCHOOL_MSG	= "Vous touchez (.+) et infligez (%d+) points de dégâts de (.+).";
	COMBAT_CRIT_SCHOOL_MSG	= "Vous infligez un coup critique \195\160 (.+) %((%d+) points de dégâts de (.+)%).";

	SPELL_HIT_MSG			= "Votre (.+) touche (.+) et inflige (%d+) points de dégâts.";
	SPELL_CRIT_MSG			= "Votre (.+) inflige un coup critique \195\160 (.+) %((%d+) points de dégâts%).";
	SPELL_HIT_SCHOOL_MSG	= "Votre (.+) touche (.+) et lui inflige (%d+) points de dégâts de (.+).";
	SPELL_CRIT_SCHOOL_MSG	= "Votre (.+) inflige un coup critique \195\160 (.+) %((%d+) points de dégâts de (.+)%).";

	HEAL_SPELL_HIT_MSG		= "Votre (.+) vous soigne pour (%d+) points de vie.";
	HEAL_SPELL_CRIT_MSG		= "Votre (.+) soigne (.+) avec un effet critique et lui rend (%d+) points de vie.";

end
