-- German localisation

if (GetLocale() == "deDE") then
    BINDING_HEADER_FLIGHTMAP = "Flugkarte";
    BINDING_NAME_FLIGHTMAP   = "Zeige Flugkarte";

    FLIGHTMAP_NAME          = "Flugkarte";
    FLIGHTMAP_DESCRIPTION   = "Fluglinieninfos auf der Weltkarte";
    FLIGHTMAP_ALLIANCE      = "Allianz";
    FLIGHTMAP_HORDE         = "Horde";
    FLIGHTMAP_CONTESTED     = "Umk\195\164mpft";

    -- Zone names
    FLIGHTMAP_MOONGLADE     = "Moonglade";
    FLIGHTMAP_ELWYNN        = "Der Wald von Elwynn";
    FLIGHTMAP_DUNMOROGH     = "Dun Morogh";
    FLIGHTMAP_TIRISFAL      = "Tirisfal";
    FLIGHTMAP_LOCHMODAN     = "Loch Modan";
    FLIGHTMAP_SILVERPINE    = "Der Silberwald";
    FLIGHTMAP_WESTFALL      = "Westfall";
    FLIGHTMAP_REDRIDGE      = "Das Redridgegebirge";
    FLIGHTMAP_DUSKWOOD      = "Duskwood";
    FLIGHTMAP_HILLSBRAD     = "Die Vorgebirge von Hillsbrad";
    FLIGHTMAP_WETLANDS      = "Das Sumpfland";
    FLIGHTMAP_ALTERAC       = "Das Alteracgebirge";
    FLIGHTMAP_ARATHI        = "Das Arathi Hochland";
    FLIGHTMAP_STRANGLETHORN = "Stranglethorn";
    FLIGHTMAP_BADLANDS      = "Das \195\150dland";
    FLIGHTMAP_SORROWS       = "Die S\195\188mpfe des Elends";
    FLIGHTMAP_HINTERLANDS   = "Das Hinterland";
    FLIGHTMAP_SEARINGGORGE  = "Die Sengende Schlucht";
    FLIGHTMAP_BLASTEDLANDS  = "Die verw\195\188steten Lande";
    FLIGHTMAP_BURNINGSTEPPE = "Die brennende Steppe";
    FLIGHTMAP_WESTERNPLAGUE = "Die westlichen Pestl\195\164nder";
    FLIGHTMAP_EASTERNPLAGUE = "Die \195\182stlichen Pestl\195\164nder";
    FLIGHTMAP_DUROTAR       = "Durotar";
    FLIGHTMAP_MULGORE       = "Mulgore";
    FLIGHTMAP_DARKSHORE     = "Dunkelk\195\188ste";
    FLIGHTMAP_BARRENS       = "Das Brachland";
    FLIGHTMAP_STONETALON    = "Das Steinkrallengebirge";
    FLIGHTMAP_ASHENVALE     = "Ashenvale";
    FLIGHTMAP_1KNEEDLES     = "Thousand Needles";
    FLIGHTMAP_DESOLACE      = "Desolace";
    FLIGHTMAP_DUSTWALLOW    = "Die Marschen von Dustwallow";
    FLIGHTMAP_FERALAS       = "Feralas";
    FLIGHTMAP_TANARIS       = "Tanaris";
    FLIGHTMAP_AZSHARA       = "Azshara";
    FLIGHTMAP_FELWOOD       = "Teufelswald";
    FLIGHTMAP_UNGOROCRATER  = "Der Un'Goro Krater";
    FLIGHTMAP_SILITHUS      = "Silithus";
    FLIGHTMAP_WINTERSPRING  = "Winterspring";
    FLIGHTMAP_TELDRASSIL    = "Teldrassil";
    FLIGHTMAP_DEADWINDPASS  = "Der Gebirgspass der Totenwinde";
    FLIGHTMAP_ORGRIMMAR     = "Orgrimmar";
    FLIGHTMAP_THUNDERBLUFF  = "Thunder Bluff";
    FLIGHTMAP_UNDERCITY     = "Undercity";
    FLIGHTMAP_IRONFORGE     = "Ironforge";
    FLIGHTMAP_STORMWIND     = "Stormwind"
    FLIGHTMAP_DARNASSUS     = "Darnassus";

    -- General strings:
    FLIGHTMAP_TIMING        = "(Zeitberechnung)";
    FLIGHTMAP_LEVELS        = "|cff00ff00Zonen-Level: %d - %d|r";
    FLIGHTMAP_NOFLIGHTS     = "Keine bekannt!";
    FLIGHTMAP_NOT_KNOWN     = "(Nicht bekannt)";
    FLIGHTMAP_NO_COST       = "Kostenlos"
    FLIGHTMAP_MONEY_GOLD    = "g";
    FLIGHTMAP_MONEY_SILVER  = "s";
    FLIGHTMAP_MONEY_COPPER  = "k";
    FLIGHTMAP_FLIGHTTIME    = "Flugzeit: ";
    FLIGHTMAP_QUICKEST      = "Schnellste Verbindung";
    FLIGHTMAP_TOTAL_TIME    = "Gesamtdauer";
    FLIGHTMAP_VIA           = "Via ";   -- TODO translate
    FLIGHTMAP_CONFIRM       = "Are you sure you wish to fly to %s?%s";
    FLIGHTMAP_CONFIRM_TIME  = " This flight will take ";

    -- Command strings
    FLIGHTMAP_RESET         = "Zur\195\188cksetzen";
    FLIGHTMAP_SHOWMAP       = "open";   -- TODO translate
    FLIGHTMAP_LOCKTIMES     = "lock";   -- TODO translate
    FLIGHTMAP_GETHELP       = "help";   -- TODO translate

    -- Help text        TODO translate
    FLIGHTMAP_TIMER_HELP    =
        "Hold down SHIFT and drag the timer bar to reposition.";
    FLIGHTMAP_SUBCOMMANDS   = {
        [FLIGHTMAP_RESET]       = "Reset timer bar position",
        [FLIGHTMAP_SHOWMAP]     = "Open flight map window",
        [FLIGHTMAP_GETHELP]     = "Show this text",
    };

    -- Locked/unlocked status           TODO translate
    FLIGHTMAP_TIMESLOCKED   = {
        [true] = "Flight times will no longer be recorded.",
        [false] = "Flight times will now be recorded.",
    };

    -- Option strings:
    FLIGHTMAP_OPTIONS_CLOSE = "Schlie\195\159en";
    FLIGHTMAP_OPTIONS_TITLE = "FlightMap Optionen";
    FLIGHTMAP_OPTIONS = {};
    FLIGHTMAP_OPTIONS[1] = {   -- Option 1: flight path lines
        label = "Flugrouten-Linien",
        option = "showPaths",
        tooltip = "Flougrouten auf der Karte mit Linien anzeigen.",
    };
    FLIGHTMAP_OPTIONS[2] = {   -- Option 2: extra POI buttons
        label = "Flugmeister-Symbole",
        option = "showPOIs",
        tooltip = "Flugmeister auf der Karte mit Symbolen anzeigen.",
    };
    FLIGHTMAP_OPTIONS[3] = {   -- Option 3: Unknown masters
        label = "Zeige alles Infos",
        option = "showAllInfo",
        tooltip = "Alle Infos auf der Weltkarte anzeigen (auch f\195\188r unbesuchte Flugpunkte).",
    };
    FLIGHTMAP_OPTIONS[4] = {   -- Option 4: Auto-Dismount
        label = "Auto dismount",
        option = "autoDismount",
        tooltip = "Automatically dismount when speaking to a flight master",
    };
    FLIGHTMAP_OPTIONS[5] = {   -- Option 5: flight timers
        label = "Restdauer-Anzeige",
        option = "useTimer",
        tooltip = "Zeitanzeige im Flugmodus ein-/ausschalten.",
    };

    FLIGHTMAP_OPTIONS[6] = {   -- Option 6: Show flight destinations
        label = "Show destinations",
        option = "showDestinations",
        tooltip = "Show flight destinations on tooltips",
        children = {7, 8, 9},
    };
    FLIGHTMAP_OPTIONS[7] = {   -- Option 7: Show multi-hop destinations
        label = "Including multi-hop",
        option = "showMultiHop",
        tooltip = "Show multi-hop destinations on tooltips",
    };
    FLIGHTMAP_OPTIONS[8] = {   -- Option 8: Show flight times
        label = "Zeige Flugdauer",
        option = "showTimes",
        tooltip = "Flugzeiten im Tooltip anzeigen.",
    };
    FLIGHTMAP_OPTIONS[9] = {   -- Option 9: Show flight costs
        label = "Zeige Flugkosten",
        option = "showCosts",
        tooltip = "Flugkosten im Tooltip anzeigen.",
    };
    FLIGHTMAP_OPTIONS[10] = {   -- Option 10: Taxi window extras
        label = "Vollst\195\164ndige Flugkarte",
        option = "fullTaxiMap",
        tooltip = "Zeige alle Flugpunkte im Flugmeister-Fenster.",
    };
    FLIGHTMAP_OPTIONS[11] = {   -- Option 11: Confirm flight destinations
        label = "Confirm flights",
        option = "confirmFlights",
        tooltip = "Prompt for confirmation before taking a flight",
    };

    -- These constants determine how "Town, Zone" strings look.
    -- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
    -- is anything that is after Zone.
    FLIGHTMAP_SEP_STRING    = ", ";
    FLIGHTMAP_SEP_POSTAMBLE = "";
end
