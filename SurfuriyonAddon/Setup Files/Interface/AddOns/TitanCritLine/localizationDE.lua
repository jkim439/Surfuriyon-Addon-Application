-- German Localization by Nebel, BobTheMage, Sordit, SEmteX

if ( GetLocale() == "deDE" ) then

	NORMAL_HIT_TEXT	= "Normaler Treffer";
	NORMAL_TEXT		= "Normal";
	CRIT_TEXT		= "Kritisch";
	RECORDS_TEXT	= "Rekorde";
	HIT_TEXT		= "Treffer";

	TITAN_CRITLINE_MENU_SETTINGS	= "Einstellungen";
	TITAN_CRITLINE_MENU_POSTGUILD	= "Rekorde in Gildenchat schreiben";
	TITAN_CRITLINE_MENU_POSTPARTY	= "Rekorde in Gruppenchat schreiben";
	TITAN_CRITLINE_MENU_POSTRAID	= "Rekorde in Schlachtzugschat schreiben";

	TITAN_CRITLINE_OPTION_SPLASH_TEXT			= "Splash-Screen bei neuem Rekord";
	TITAN_CRITLINE_OPTION_PLAYSOUNDS_TEXT		= "Sounds bei neuem Rekord";
	TITAN_CRITLINE_OPTION_PVPONLY_TEXT			= "Nur PvP-Treffer z\195\164hlen";
	TITAN_CRITLINE_OPTION_SCREENCAP_TEXT		= "Screenshot bei neuem Rekord";
	TITAN_CRITLINE_OPTION_LVLADJ_TEXT			= "Stufen Anpassung";
	TITAN_CRITLINE_OPTION_FILTER_HEALING_TEXT	= "Heilzauber nicht ber\195\188cksichtigen";
	TITAN_CRITLINE_OPTION_RESET_TEXT			= "Alle Rekorde zur\195\188cksetzen";
	TITAN_CRITLINE_OPTION_FILTER_TEXT			= "Filter";
	TITAN_CRITLINE_OPTION_UPDATE_TEXT			= "Manuelles Update";
	TITAN_CRITLINE_OPTION_SHOW_CRIT_TEXT		= "Zeige Treffer Prozente";
	TITAN_CRITLINE_OPTION_ONCLICK_TEXT			= "Bei Klick, schreibe in Channel";
	TITAN_CRITLINE_OPTION_SHIFT_ONCLICK_TEXT	= "+ Shift";
	TITAN_CRITLINE_OPTION_SHOWHITS_TEXT			= "Zeige alle Treffer an";
	TITAN_CRITLINE_OPTION_MOBFILTER_TEXT		= "Bestimmte Gegner nicht einbeziehen";

	TITAN_CRITLINE_OPTION_SPLASH_HELPTEXT			= "Splash-Screen\nZeigt eine Meldung mittig auf dem Bildschirm \nbei einem neuen Rekord an.";
	TITAN_CRITLINE_OPTION_PLAYSOUNDS_HELPTEXT		= "Sounds\nSpielt einen Ton bei einem neuen Rekord ab.";
	TITAN_CRITLINE_OPTION_PVPONLY_HELPTEXT			= "PvP\nWenn aktiviert, werden nur Rekorde gegen andere \nSpieler gez\195\164hlt.";
	TITAN_CRITLINE_OPTION_SCREENCAP_HELPTEXT		= "Screenshot\nSpeichert ein Bildschirmfoto bei einem \nneuen Rekord ab";
	TITAN_CRITLINE_OPTION_LVLADJ_HELPTEXT			= "Stufen Anpassung\nWenn das Ziel \195\188ber oder unter \nder angegebenen Stufe liegt, wird ein \nneuer Rekord nicht gez\195\164hlt.";
	TITAN_CRITLINE_OPTION_FILTER_HEALING_HELPTEXT	= "Heilzauber filtern\nWenn aktiviert, werden Heilzauber und Tr\195\164nkr \nnicht gez\195\164hlt.";
	TITAN_CRITLINE_OPTION_SHOW_CRIT_HELPTEXT		= "Kritische Treffer\nZeigt in Prozent die H\195\164ufigkeit \nder kritischen Treffer an.";
	TITAN_CRITLINE_OPTION_ONCLICK_HELPTEXT			= "Knopf Funktion\nWenn aktiviert, werden die Rekorde bei Klick auf den \nTitanPanel Knopf in den passenden Kanal geschrieben. \nWenn deaktiviert \195\182ffnet sich das Einstellungsfenster.";
	TITAN_CRITLINE_OPTION_SHIFT_ONCLICK_HELPTEXT	= "Die Klick auf den Knopf Funktion, funktioniert nur noch mit gehaltener SHIFT Taste.";
	TITAN_CRITLINE_OPTION_SHOWHITS_HELPTEXT			= "Treffer\nWenn aktiviert, werden alle gespeicherten Treffer \ndes Angriffs angezeigt.";
	TITAN_CRITLINE_OPTION_MOBFILTER_HELPTEXT		= "In einigen Instanzen gibt es spezielle Gegner\ndie sehr verwundbar gegen verschiedene Magierarten sind.\nWenn aktiviert werden diese bei der Berechnung nicht ber\195\188cksichtigt.";

	TITAN_CRITLINE_TOOLTIP_HEADER				= "Zusammenfassung";

	TITAN_CRITLINE_NEW_RECORD_MSG				= "Neuer %s Rekord!";
	TITAN_CRITLINE_NEW_CRIT_RECORD_MSG			= "Neuer kritischer %s Rekord!";

	TITAN_CRITLINE_MOBFILTER_01					= "Chromaggus";
	TITAN_CRITLINE_MOBFILTER_02					= "Death Talon Overseer";
	TITAN_CRITLINE_MOBFILTER_03					= "Death Talon Wyrmguard";

	COMBAT_HIT_MSG			= "Ihr trefft (.+). Schaden: (%d+).";
	COMBAT_CRIT_MSG			= "Ihr trefft (.+) kritisch für (%d+) Schaden.";
	COMBAT_HIT_SCHOOL_MSG	= "Ihr trefft (.+) für (%d+) (.+) Schaden.";
	COMBAT_CRIT_SCHOOL_MSG	= "Ihr trefft (.+) kritisch für (%d+) (.+) Schaden.";

	SPELL_HIT_MSG			= "(.+) von Euch trifft (.+) für (%d+) Schaden.";
	SPELL_CRIT_MSG			= "Euer (.+) trifft (.+) kritisch. Schaden: (%d+).";
	SPELL_HIT_SCHOOL_MSG	= "Euer (.+) trifft (.+). Schaden: (%d+) (.+).";
	SPELL_CRIT_SCHOOL_MSG	= "Euer (.+) trifft (.+) kritisch. Schaden: (%d+) (.+).";

	HEAL_SPELL_HIT_MSG		="(.+) heilt (.+) um (%d+) Punkte.";
	HEAL_SPELL_CRIT_MSG		= "Besondere Heilung: (.+) heilt (.+) um (%d+) Punkte.";

end
