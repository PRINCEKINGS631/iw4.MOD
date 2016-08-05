#define QUICKBIND_OPTION( rectW, rectH, commandArg, textArg ) \
	itemDef \
	{ \
		rect rectW rectH 252 20 2 1 \
		visible 1 \
		style 1 \
		forecolor 1 1 1 1 \
		background "white" \
		type 14 \
		textfont 3 \
		textalign 4 \
		textalignx 180 \
		textscale 0.375 \
		dvar commandArg \
		visible when ( 1 ) \
		action \
		{ \
			play "mouse_click"; \
		} \
		onFocus \
		{ \
			setItemColor self backcolor 0 0 0 1 play "mouse_over"; \
			show "keyBindStatus"; \
		} \
		leaveFocus \
		{ \
			setItemColor self backcolor 0 0 0 0; \
			hide "keyBindStatus"; \
		} \
	} \
	itemDef \
	{ \
		rect rectW rectH 252 20 2 1 \
		decoration \
		visible 1 \
		forecolor 1 1 1 1 \
		textfont 3 \
		textalign 8 \
		textalignx 5 \
		textscale 0.25 \
		text textArg \
		visible when ( 1 ) \
	}

QUICKBIND_OPTION( 10, 30, "+strafe", "Spawn a Teammate Bot" )
QUICKBIND_OPTION( 10, 50, "+fakenac", "Fakenac" )
QUICKBIND_OPTION( 10, 70, "+skreenac", "Skreenac" )
QUICKBIND_OPTION( 10, 90, "+drop", "Weapondrop" )
QUICKBIND_OPTION( 10, 110, "+bounce", "Bounce" )
QUICKBIND_OPTION( 10, 130, "+hm", "Fake Hostmigration" )
QUICKBIND_OPTION( 10, 150, "+floor", "Spawn a Care Package over you" )
QUICKBIND_OPTION( 10, 170, "+fastload", "Fast Position loading" )
QUICKBIND_OPTION( 10, 190, "map_restart", "Restart the Map" )
