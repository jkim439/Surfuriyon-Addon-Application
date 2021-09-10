-- SCT localization information
-- Spanish Locale
-- Translation by JSR1976

if ( GetLocale() == "spSP" ) then

	-- Static Messages
	SCT_LowHP= "Salud Baja!";					-- Message to be displayed when HP is low
	SCT_LowMana= "Mana Bajo!";					-- Message to be displayed when Mana is Low
	SCT_SelfFlag = "*";								-- Icon to show self hits
	SCT_Combat = "+Combate";						-- Message to be displayed when entering combat
	SCT_NoCombat = "-Combate";					-- Message to be displayed when leaving combat
	SCT_ComboPoint = "CP";			  		-- Message to be displayed when gaining a combo point
	SCT_FiveCPMessage = "Acabalo!"; -- Message to be displayed when you have 5 combo points
	SCT_ExecuteMessage = "Ejecuta Ahora!"; -- Message to be displayed when time to execute
	SCT_WrathMessage = "Martillo de la Cólera Ahora!"; -- Message to be displayed when time Wrath
	
	--Option messages
	SCT_STARTUP = "Scrolling Combat Text "..SCT_Version.." AddOn cargado. Escribe /sct para opciones.";
	SCT_Option_Crit_Tip = "Haz aparecer este evento siempre como CRITICO.";
	SCT_Option_Msg_Tip = "Haz aparecer este evento com un MENSAJE. Invalida Criticos.";
	
	--Warnings
	SCT_Version_Warning= "|cff00ff00SCT ADVIRTIENDO|r\n\nsus variables ahorradas son de una versi\195\179n anticuada de SCT. Si usted encuentra errores o comportamiento extra\195\177o, REAJUSTE por favor sus opciones usando el bot\195\179n del reajuste o por /sctreset que mecanograf\195\173a";
	SCT_Load_Error = "|cff00ff00Error Loading SCT Options. It may be disabled.|r";
	
	--nouns
	SCT_TARGET = "Objetivo ";
	SCT_PROFILE = "SCT Profile Cargado: |cff00ff00";
	SCT_PROFILE_DELETE = "SCT Profile Borrado: |cff00ff00";
	SCT_PROFILE_NEW = "SCT New Profile Creado: |cff00ff00";
	SCT_WARRIOR = "Guerrero";
	SCT_ROGUE = "Picaro";
	SCT_HUNTER = "Cazador";
	SCT_MAGE = "Mago";
	SCT_WARLOCK = "Brujo";
	SCT_DRUID = "Druida";
	SCT_PRIEST = "Clerigo";
	SCT_SHAMAN = "Chaman";
	SCT_PALADIN = "Paladin";
	
	--Useage
	SCT_DISPLAY_USEAGE = "Uso: \n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "/sctdisplay 'message' (for white text)\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "/sctdisplay 'message' red(0-10) green(0-10) blue(0-10)\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "Example: /sctdisplay 'Heal Me' 10 0 0\nThis will display 'Heal Me' in bright red\n";
	SCT_DISPLAY_USEAGE = SCT_DISPLAY_USEAGE .. "Some Colors: red = 10 0 0, green = 0 10 0, blue = 0 0 10,\nyellow = 10 10 0, magenta = 10 0 10, cyan = 0 10 10";
	
	--Event and Damage option values
	SCT_OPTION_EVENT1 = {name = "Daño", tooltipText = "Activa o desactiva daño melee y varios. (fuego, caida, etc...)"};
	SCT_OPTION_EVENT2 = {name = "Fallos", tooltipText = "Activa o desactiva fallos melee"};
	SCT_OPTION_EVENT3 = {name = "Regates", tooltipText = "Activa o desactiva los regates melee"};
	SCT_OPTION_EVENT4 = {name = "Parries", tooltipText = "Activa o desactiva melee parries"};
	SCT_OPTION_EVENT5 = {name = "Bloqueos", tooltipText = "Activa o desactiva los bloqueos melee o los bloqueos parciales melee"};
	SCT_OPTION_EVENT6 = {name = "Daño Hechizos", tooltipText = "Activa o desactiva el daño de hechizos"};
	SCT_OPTION_EVENT7 = {name = "Hecizos Curativos", tooltipText = "Activa o desactiva los hechizos curativos"};
	SCT_OPTION_EVENT8 = {name = "Resistencia Hechizos", tooltipText = "Activa o desactiva la Resistencia a hechizos"};
	SCT_OPTION_EVENT9 = {name = "Debuffs", tooltipText = "Activa o desactiva mostrar cuando tienes debuffs"};
	SCT_OPTION_EVENT10 = {name = "Absorber", tooltipText = "Activa o desactiva mostrar el daño absorbido de monstruos"};
	SCT_OPTION_EVENT11 = {name = "Salud Baja", tooltipText = "Activa o desactiva mostrar cuando tengas salud baja"};
	SCT_OPTION_EVENT12 = {name = "Mana Bajo", tooltipText = "Activa o desactiva mostrar cuando tienes el mana bajo"};
	SCT_OPTION_EVENT13 = {name = "Ganando Poder", tooltipText = "active o desactiva mostrar cuando ganas Mana, Furia o Energia de pociones, objetos, buffs, etc...(No regeneraciñn regular)"};
	SCT_OPTION_EVENT14 = {name = "Coletillas Combate", tooltipText = "Activa o desactiva mostrar cuando entras o sales de combate"};
	SCT_OPTION_EVENT15 = {name = "Puntos Combo", tooltipText = "Activa o desactiva mostrar cuando ganas puntos de combo"};
	SCT_OPTION_EVENT16 = {name = "Honor Ganado", tooltipText = "Activa o desactiva mostrar cuando ganas Puntos de contribucion de Honor"};
	SCT_OPTION_EVENT17 = {name = "Buffs", tooltipText = "Activa o desactiva mostrar cuando ganas bufss"};
	SCT_OPTION_EVENT18 = {name = "Buff Fades", tooltipText = "Activa o desactiva mostrar cuando pierdes buffs"};
	SCT_OPTION_EVENT19 = {name = "Ejecuta/Cólera", tooltipText = "Activa o desactiva alerter cuando Ejecutar o Martillo de Cólera (Guerrero/Paladin solo)"};
	SCT_OPTION_EVENT20 = {name = "Reputación", tooltipText = "Activa o desactiva mostrar cuando ganas o pierdes reputación"};
	SCT_OPTION_EVENT21 = {name = "Tus Curas", tooltipText = "Activa o desactiva mostrar cuando curas a otros por"};
	SCT_OPTION_EVENT22 = {name = "Habilidades", tooltipText = "Activa o desactiva mostrar cuando ganas puntos de habilidades"};
	
	--Check Button option values
	SCT_OPTION_CHECK1 = { name = "Activa Scrolling Combat Text", tooltipText = "Activa o desactiva Scrolling Combat Text"};
	SCT_OPTION_CHECK2 = { name = "Coletilla Texto Combate", tooltipText = "Activa o desactiva poner un * alrededor de todos all Scrolling Combat Text"};
	SCT_OPTION_CHECK3 = { name = "Muestra Curadores", tooltipText = "Activa o desactiva quien o que te cura."};
	SCT_OPTION_CHECK4 = { name = "Scroll Texto Abajo", tooltipText = "Activa o desactiva scrolling texto hacia abajo"};
	SCT_OPTION_CHECK5 = { name = "Sticky Crits", tooltipText = "Activa o desactiva poner golpes/curas criticas sobre tu cabeza"};
	SCT_OPTION_CHECK6 = { name = "Tipo Daño Hechizo", tooltipText = "Activa o desactiva mostrar tipo daño de hechizo"};
	SCT_OPTION_CHECK7 = { name = "Aplica Letra a Daño", tooltipText = "Activa o desactiva cambiar la letra de daño del juego por la letra usada por SCT .\n\nIMPORTANTE: TIENES QUE SALIR Y VOLVER A ENTRAR PARA QUE FUNCIONE. RECARGANDO EL UI NO FUNCIONARA"};
	SCT_OPTION_CHECK8 = { name = "Show all Power Gain", tooltipText = "Enables or Disables showing all power gain, not just those from the chat log\n\nNOTE: This is dependent on the regular Power Gain event being on, is VERY SPAMMY, and sometimes acts strange for Druids just after shapeshifting back to caster form."};
	SCT_OPTION_CHECK9 = { name = "FPS Independent Mode", tooltipText = "Enables or Disables making the animation speed use your FPS or not. When on, makes the animations more consistent and greatly speeds them up on slow machines or in laggy situations."};
	SCT_OPTION_CHECK10 = { name = "Show Overhealing", tooltipText = "Enables or Disables showing how much you overheal for against you or your targets. Dependent on 'Your Heals' being on."};
	
	--Slider options values
	SCT_OPTION_SLIDER1 = { name="Velocidad Animación Texto", minText="Rapido", maxText="Lento", tooltipText = "Controla la velocidad de la animacion del texto"};
	SCT_OPTION_SLIDER2 = { name="Tamaóo Texto", minText="Pequeóo", maxText="Grande", tooltipText = "Controla el tamaóo del texto"};
	SCT_OPTION_SLIDER3 = { name="HP %", minText="10%", maxText="90%", tooltipText = "Controla el % de salud necesario para dar aviso"};
	SCT_OPTION_SLIDER4 = { name="Mana %",  minText="10%", maxText="90%", tooltipText = "Controla el % de mana necesario para dar aviso"};
	SCT_OPTION_SLIDER5 = { name="Opacidad Texto", minText="0%", maxText="100%", tooltipText = "Controla la opcaidad del texto"};
	SCT_OPTION_SLIDER6 = { name="Distancia Movimiento Texto", minText="Pequeóo", maxText="Grande", tooltipText = "Controla la distancia de movimiento entre cada actualización de texto"};
	SCT_OPTION_SLIDER7 = { name="Centro Posición X Texto", minText="-300", maxText="300", tooltipText = "Controla el emplazamiento del centro del texto"};
	SCT_OPTION_SLIDER8 = { name="Centro Posición Y Texto", minText="-300", maxText="300", tooltipText = "Controla el emplazamiento del centro del texto"};
	SCT_OPTION_SLIDER9 = { name="Centro Posición X Mensajes", minText="-600", maxText="600", tooltipText = "Controla el emplazamiento de los mensaje de texto"};
	SCT_OPTION_SLIDER10 = { name="Centro Posición Y Mensajes", minText="-600", maxText="600", tooltipText = "Controla el emplazamiento de los mensajes de texto"};
	SCT_OPTION_SLIDER11 = { name="Velocidad Mensajes Fade", minText="Rapido", maxText="Lento", tooltipText = "Controla la velocidad de los mensajes fade"};
	SCT_OPTION_SLIDER12 = { name="Tamaño Mensajes", minText="Pequeño", maxText="Grande", tooltipText = "Controla el tamaño de los mensajes de texto"};
	
	--Misc option values
	SCT_OPTION_MISC1 = {name="SCT Opciones "..SCT_Version};
	SCT_OPTION_MISC2 = {name="Opciones Eventos"};
	SCT_OPTION_MISC3 = {name="Opciones Texto"};
	SCT_OPTION_MISC4 = {name="Opciones Varios"};
	SCT_OPTION_MISC5 = {name="Opciones Avisos"};
	SCT_OPTION_MISC6 = {name="Opciones Animación"};
	SCT_OPTION_MISC7 = {name="Selecciona Archivo"};
	SCT_OPTION_MISC8 = {name="Guarda y Cierra", tooltipText = "Guarda todos los ajustes actuales y cierra las opciones"};
	SCT_OPTION_MISC9 = {name="Resetea", tooltipText = "-Aviso-\n\nEstas seguro de querer resetear el SCT por defecto?"};
	SCT_OPTION_MISC10 = {name="Selecciona", tooltipText = "Selecciona otros archive de personaje"};
	SCT_OPTION_MISC11 = {name="Carga", tooltipText = "Carga otro archive de personaje"};
	SCT_OPTION_MISC12 = {name="Borra", tooltipText = "Borra archive personaje"}; 
	SCT_OPTION_MISC13 = {name="Cancela", tooltipText = "Cancela Selección"};
	SCT_OPTION_MISC14 = {name="Texto", tooltipText = ""};
	SCT_OPTION_MISC15 = {name="Mensajes", tooltipText = ""};
	SCT_OPTION_MISC16 = {name="Opciones Mensaje"};
	SCT_OPTION_MISC17 = {name="Spell Options"};
	SCT_OPTION_MISC18 = {name="Misc.", tooltipText = ""};
	SCT_OPTION_MISC19 = {name="Spells", tooltipText = ""};
	
	--Fonts
	SCT_FONTS = { 
		[1] = { name="Por Defecto", path="Fonts\\FRIZQT__.TTF"},
		[2] = { name="TwCenMT", path="Interface\\Addons\\sct\\fonts\\Tw_Cen_MT_Bold.TTF"},
		[3] = { name="Adventura", path="Interface\\Addons\\sct\\fonts\\Adventure.ttf"},
		[4] = { name="Enigma", path="Interface\\Addons\\sct\\fonts\\Enigma__2.TTF"},
	}
	
	--Animation Types
	SCT_OPTION_SELECTION1 = { name="Tipo Animación", tooltipText = "Que tipo de animación usar", table = {[1] = "Vertical (Normal)",[2] = "Arcoiris",[3] = "Horizontal",[4] = "Angled Down"}};
	SCT_OPTION_SELECTION2 = { name="Estilo Lateral", tooltipText = "Como mostrar el lado scrolling texto", table = {[1] = "Alternando",[2] = "Daño Izq.",[3] = "Daño Dcha."}};
	SCT_OPTION_SELECTION3 = { name="Letra", tooltipText = "Que letra usar", table = {[1] = SCT_FONTS[1].name,[2] = SCT_FONTS[2].name,[3] = SCT_FONTS[3].name,[4] = SCT_FONTS[4].name}};
	SCT_OPTION_SELECTION4 = { name="Controno Letra", tooltipText = "Que contorno letra usar", table = {[1] = "Ninguno",[2] = "Fino",[3] = "Grueso"}};
	SCT_OPTION_SELECTION5 = { name="Letra Mensaje", tooltipText = "Que letra usar para mensajes", table = {[1] = SCT_FONTS[1].name,[2] = SCT_FONTS[2].name,[3] = SCT_FONTS[3].name,[4] = SCT_FONTS[4].name}};
	SCT_OPTION_SELECTION6 = { name="Controno Letra Mensajes", tooltipText = "Que contorno de letra usar para mensajes", table = {[1] = "Ninguno",[2] = "Fino",[3] = "Grueso"}};
	
	-- Cosmos button
	SCT_CB_NAME			= "Scrolling Combat Text".." "..SCT_Version;
	SCT_CB_SHORT_DESC	= "Traducido por Jsr1976";
	SCT_CB_LONG_DESC	= "Pops up useful combat messages above your head - try it!";
	SCT_CB_ICON			= "Interface\\Icons\\Spell_Shadow_EvilEye"; -- "Interface\\Icons\\Spell_Shadow_FarSight"

end