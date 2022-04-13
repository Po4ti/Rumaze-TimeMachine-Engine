/// @function		scr_load_config()
/// @description	Loads settings config
function scr_load_config()
{

	ini_open("config.ini");

	// General settings

	global.music_volume = clamp(floor(ini_read_real("settings","music_level",100)),0,100);
	global.sound_volume = clamp(floor(ini_read_real("settings","sound_level",100)),0,100);
	global.screen_mode = ini_read_real("settings","screen_mode",1);
	global.slide_mode = ini_read_real("settings","slide_mode",0);
	global.language = ini_read_real("settings","language",0);
	
	// Keyboard controls
	global.left_button[0] = ini_read_real("controls","left",vk_left);
	global.right_button[0] = ini_read_real("controls","right",vk_right);
	global.up_button[0] = ini_read_real("controls","up",vk_up);
	global.down_button[0] = ini_read_real("controls","down",vk_down);
	global.jump_button[0] = ini_read_real("controls","jump",vk_shift);
	global.shoot_button[0] = ini_read_real("controls","shoot",ord("Z"));
	global.restart_button[0] = ini_read_real("controls","restart",ord("R"));
	global.save_button[0] = ini_read_real("controls","save",ord("S"));
	global.action_button[0] = ini_read_real("controls","action",ord("A"));	
	global.pause_button[0] = ini_read_real("controls","pause",ord("P"));
	global.slide_button[0] = ini_read_real("controls","slide",ord("X"));
	
	// Keyboard menu keys (not rebindable)
	global.menu_left_button[0] = vk_left;
	global.menu_right_button[0] = vk_right;
	global.menu_up_button[0] = vk_up;
	global.menu_down_button[0] = vk_down;
	global.menu_accept_button[0] = [vk_enter, vk_space, vk_shift];
	global.menu_back_button[0] = vk_escape;

	if (CONTROLLER_ENABLED) {
	    // Controller options/controls
	    global.controller_index = ini_read_real("controller", "index", -1); // -1 sets no controller
	    global.left_button[1] = ini_read_real("controller","left",gp_padl);
	    global.right_button[1] = ini_read_real("controller","right",gp_padr);
	    global.up_button[1] = ini_read_real("controller","up",gp_padu);
	    global.down_button[1] = ini_read_real("controller","down",gp_padd);
	    global.jump_button[1] = ini_read_real("controller","jump",gp_face1);
	    global.shoot_button[1] = ini_read_real("controller","shoot",gp_face3);
	    global.restart_button[1] = ini_read_real("controller","restart",gp_face4);
	    global.save_button[1] = ini_read_real("controller","save", gp_face2);
	    global.action_button[1] = ini_read_real("controller","action",gp_stickl);		
	    global.pause_button[1] = ini_read_real("controller","pause",gp_start);
	    global.slide_button[1] = ini_read_real("controller","slide",gp_shoulderrb);
		
		// Controller menu buttons (not rebindable)
		global.menu_left_button[1] = gp_padl;
		global.menu_right_button[1] = gp_padr;
		global.menu_up_button[1] = gp_padu;
		global.menu_down_button[1] = gp_padd;
		global.menu_accept_button[1] = gp_face1;
		global.menu_back_button[1] = gp_face2;
	}

	ini_close();

	scr_save_config(); // Save the current config settings


}

/// @function		scr_save_config()
/// @description	Saves settings config
function scr_save_config() {

	ini_open("config.ini");

	// General settings
	ini_write_real("settings","music_level",global.music_volume);
	ini_write_real("settings","sound_level",global.sound_volume);	
	ini_write_real("settings","screen_mode",global.screen_mode);
	ini_write_real("settings","slide_mode",global.slide_mode);
	ini_write_real("settings","language",global.language);	
	
	// Keyboard controls
	ini_write_real("controls","left",global.left_button[0]);
	ini_write_real("controls","right",global.right_button[0]);
	ini_write_real("controls","up",global.up_button[0]);
	ini_write_real("controls","down",global.down_button[0]);
	ini_write_real("controls","jump",global.jump_button[0]);
	ini_write_real("controls","shoot",global.shoot_button[0]);
	ini_write_real("controls","restart",global.restart_button[0]);
	ini_write_real("controls","save",global.save_button[0]);
	ini_write_real("controls","action",global.action_button[0]);	
	ini_write_real("controls","pause",global.pause_button[0]);
	ini_write_real("controls","slide",global.slide_button[0]);
	
	if (CONTROLLER_ENABLED) {
	    // Controller options/controls
	    ini_write_real("controller","index",global.controller_index);
	    ini_write_real("controller","left",global.left_button[1]);
	    ini_write_real("controller","right",global.right_button[1]);
	    ini_write_real("controller","up",global.up_button[1]);
	    ini_write_real("controller","down",global.down_button[1]);
	    ini_write_real("controller","jump",global.jump_button[1]);
	    ini_write_real("controller","shoot",global.shoot_button[1]);
	    ini_write_real("controller","restart",global.restart_button[1]);
	    ini_write_real("controller","save",global.save_button[1]);
	    ini_write_real("controller","action",global.action_button[1]);		
	    ini_write_real("controller","pause",global.pause_button[1]);
	    ini_write_real("controller","slide",global.slide_button[1]);		
	}

	ini_close();


}

/// @function		scr_save_game(save_position)
/// @description	Saves the game
/// @param			Need to save position
function scr_save_game(save_position, save_x = 0, save_y = 0)
{

	// Save the player's current location variables if the script is currently set to (we don't want to save the player's location if we're just updating death/time)
	if (save_position)
	{
	    global.save_room = room_get_name(room);
		
		if(PRECISE_SAVE || save_x == 0 && save_y == 0)
		{
		    global.save_player_x = obj_player.x;    
		    global.save_player_y = obj_player.y;
			
		    // Check if the player is saving inside of a wall or in the ceiling when the player's position is floored to prevent save locking
		    with (obj_player)
			{
		        if (!place_free(global.save_player_x, global.save_player_y))
				{
		            global.save_player_x += 1;
		            global.save_player_y += 1;
		        }
		    }			
		}
		else
		{
		    global.save_player_x = save_x;    
		    global.save_player_y = save_y;	
			
			
		}
	    global.save_grav = global.grav;
    

  
    
		array_copy(global.save_item, 0, global.item, 0, ITEM_TOTAL);		

	    global.save_coins = global.coins;

		array_copy(global.save_chests, 0, global.chests, 0, ITEM_TOTAL);

	    global.save_game_clear = global.game_clear;
	}

	// Create scruct for save data
	var save_struct;	
	
	save_struct = 
	{
		deaths : global.deaths,
		time : global.time,
		time_micro : global.time_micro,
		
		save_room : global.save_room,
		player_x : global.save_player_x,
		player_y : global.save_player_y,
		gravity : global.save_grav,
		
		items : global.save_item,
		coins : global.save_coins,
		chests : global.save_chests,
		
		game_clear : global.game_clear,
	}
	
	var string_map = json_stringify(save_struct);	
	
	var hash = sha1_string_utf8(string_map + SHA1_STR_ADD);
	string_map += "#" + hash + "#";
	
	var buffer = buffer_create(string_byte_length(string_map) + 1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, string_map);
	buffer = buffer_compress(buffer, 0, buffer_tell(buffer));
	buffer_save(buffer, "SaveFile");

	buffer_delete(buffer);

}

/// @function		scr_load_game(load_file)
/// @description	Loads the game
/// @param			Use saved variables or load variables from file
function scr_load_game(load_file)
{
	var save_valid = true; // Keeps track of whether or not the save being loaded is valid

	// Only load save data from the save file if the script is currently set to (we should only need to read the save file on first load because the game stores them afterwards)
	if (load_file) {
		
		var buffer = buffer_load("SaveFile");
		buffer = buffer_decompress(buffer);
		var string_map = buffer_read(buffer, buffer_string);
		buffer_delete(buffer);
	
		var prev_hash = string_copy(string_map, string_length(string_map) - 40, 40);
		string_map = string_copy(string_map, 1, string_length(string_map) - 42);
	
		var hash = sha1_string_utf8(string_map + SHA1_STR_ADD);		

		var save_struct = json_parse(string_map);		
		
		if(save_struct != -1)
		{
			global.deaths = save_struct.deaths;
			global.time = save_struct.time;
			global.time_micro = save_struct.time_micro;
			
			global.save_room = save_struct.save_room;
			global.save_player_x = save_struct.player_x;
			global.save_player_y = save_struct.player_y;
			global.save_grav = save_struct.gravity;
			
	        if (is_string(global.save_room)) // Check if the saved room string loaded properly
			{
	            if (!room_exists(asset_get_index(global.save_room))) // Check if the room index in the save is valid
				{
	                save_valid = false;
				}
	        } else {
	            save_valid = false;
	        }
			
			global.save_item = save_struct.items;
			global.save_chests = save_struct.chests;
			global.save_coins = save_struct.coins;
			global.save_game_clear = save_struct.game_clear;
			
	        if (!is_string(hash))
			{
	            save_valid = false; // SHA1 is not a string, save is invalid
			} else {
				// Check if SHA1 hash is invalid
		        if (hash != prev_hash) {
		            save_valid = false;
				}
			}			
		}
	}
	
	if(save_valid)
	{
		// Set game variables and the player's position
		instance_destroy(obj_player); // Destroy the player if it exists

		global.game_started = true; // Sets game in progress (enables saving, restarting, etc.)
		global.no_pause = false; // Disable no pause mode
		global.autosave = false; // Disable autosaving since we're loading the game

		global.grav = global.save_grav;

		array_copy(global.item, 0, global.save_item, 0, ITEM_TOTAL);	
	
		global.coins = global.save_coins;
	
		global.draw_coins = global.coins;

		array_copy(global.chests, 0, global.save_chests, 0, CHESTS_TOTAL);

		global.game_clear = global.save_game_clear;
		
		// Check if the player's layer exists, if it doesn't then create a temporary layer
		var spawn_layer = (layer_exists("Player")) ? layer_get_id("Player") : layer_create(0);
		instance_create_layer(global.save_player_x, global.save_player_y, spawn_layer, obj_player);

		room_goto(asset_get_index(global.save_room));
	}


}
