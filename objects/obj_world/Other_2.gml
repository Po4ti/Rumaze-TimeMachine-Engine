/// @description Initialize everything needed for the game

room_goto(rm_main_menu); //Go to main menu after initializing	


scr_load_config(); //Load Config
scr_init_engine(); //Load constant engine variables
scr_init_game(); //Load game variables

scr_load_music(); //Load music

fnt_grapple = font_add_sprite(spr_fnt_grapple, 32, 0, 0); //Create HUD font

//Set window mode

if(global.screen_mode == 0)
{
	window_set_fullscreen(true);
}
else
{
		window_set_fullscreen(false);
			
		var w = WINDOW_WIDTH * global.screen_mode;
		var h = (WINDOW_HEIGHT + 64) * global.screen_mode;
		
		window_set_size(w,h);
			
		alarm[0] = 2		
}