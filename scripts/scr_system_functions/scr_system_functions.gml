/// @function		scr_init_engine()
/// @description	Initializes engine variables
function scr_init_engine()
{

	global.debug_mode = true; // Enables debug keys (check objWorld step event to see all of them), make sure to set this to "false" before releasing your game
	global.debug_overlay = false; // Enables showing the debug text overlay (shows player location, room, etc.)
	global.debug_no_death = false; // Enables debug god mode (toggle with Home key)
	global.debug_inf_jump = false; // Enables debug infinite jump (toggle with End key)
	global.debug_show_hitbox = false; // Enables showing the player's hitbox (toggle with Del key)

	global.window_caption_def = "Rumaze - TimeMachine Engine"; // Sets the default window caption
	window_set_caption(global.window_caption_def);
	
	global.start_room = rm_sample_01; // Sets which room for the game to begin with
	
	#macro GAME_VERSION "Beta 1" // Sets current game version

	#macro SHA1_STR_ADD "Bottomless Abyss" // Sets what to add to the end of SHA1 input string to make saves harder to hack, should be set to something unique and hard to predict (similar to setting a password)

	#macro ITEM_TOTAL 40 // Sets how many secret items for the game to save/load

	#macro CHESTS_TOTAL 40 // Sets how many chests for the game to save/load

	#macro CONTROLLER_ENABLED true // Sets whether controllers are supported
	#macro CONTROLLER_DELAY_LENGTH 5 // Sets the delay in frames in which the player can switch between keyboard/controller (can be set to 0 to disable delay)
	
	#macro WINDOW_WIDTH 640 // Sets window resolution 
	#macro WINDOW_HEIGHT 320
	
	#macro PRECISE_SAVE true //Sets whether to use precise saving 
	
}
/// @function		scr_init_save()
/// @description	Initializes fresh save
function scr_init_save()
{
	global.deaths = 0;
	global.time = 0;
	global.time_micro = 0;
	global.save_room = "";	
	
	global.save_player_x = 0;
	global.save_player_y = 0;
	
	global.grav = 1;
	global.save_grav = 1;

	global.item = array_create(ITEM_TOTAL,false);
	global.save_item = array_create(ITEM_TOTAL,false);

	global.coins = 0;
	global.save_coins = 0;	

	global.chests = array_create(CHESTS_TOTAL,false);
	global.save_chests = array_create(CHESTS_TOTAL,false);
	

	global.game_clear = false;
	global.save_game_clear = false;		
}

/// @function		scr_init_game()
/// @description	Initializes game variables
function scr_init_game()
{
	global.draw_coins = 0;	
	global.trigger = array_create(50,false);
	global.game_timer = 0;


	global.game_started = false; // Determines whether the game is currently in progress (enables saving, restarting, etc.)
	global.no_pause = false; // Sets whether or not to allow pausing (useful for bosses to prevent desync)
	global.autosave = false; // Keeps track of whether or not to autosave the game the next time the player is created
	global.game_paused = false; // Keeps track of whether the game is paused or not
	global.pause_spr = -1; // Copies the application surface when the game is paused
	
	global.current_music	= -1;
	global.current_music_id = -1; // Keeps track of the current main music instance
	global.game_over_music = -1;

	display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface)); // Set the correct GUI size for the Draw GUI event

	global.controller_mode = false; // Keeps track of whether to use keyboard or controller for inputs
	global.controller_delay = -1; // Handles delay for switching between keyboard/controller so that the player can't use both at the same time
	
	global.show_hud = true;
	global.hud_message = "";
	
	randomize(); // Make sure the game starts with a random seed for RNG
	
	global.localization_data = load_csv("localization");
	var height = ds_grid_height(global.localization_data);
	global.localization = ds_map_create();
	
	for(var i = 0; i < height; i ++)
	{
		ds_map_add(global.localization,global.localization_data[# 0, i], i);	
	}
	
}

