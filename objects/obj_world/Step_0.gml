/// @description Global game checks

if(global.show_hud)
{
	hud_pos = lerp(hud_pos, 0, 0.12);
		
}
else
{
	hud_pos = lerp(hud_pos, -32, 0.12);
}

global.game_timer = get_timer();

if(!global.game_paused && global.game_started)
{
	coin_index = (global.game_timer / 80000) % sprite_get_number(spr_hud_coins);
	if(ceil(global.draw_coins) < global.coins) // Increase coin counter smoothly
	{
		global.draw_coins = lerp(global.draw_coins, global.coins, 0.05);
	} 	
}



if (CONTROLLER_ENABLED && global.controller_index != -1) {
    if (!global.controller_mode) { // Check if we should switch to controller mode
        if (keyboard_check_pressed(vk_anykey)) {
            global.controller_delay = -1;
        } else if (scr_any_controller_button_pressed() != -1) {
            if (global.controller_delay == -1) {
                global.controller_delay = CONTROLLER_DELAY_LENGTH; // Controller button pressed while in keyboard mode, set delay to switch
			}
        }
    } else { // Check if we should switch to keyboard mode
        if (keyboard_check_pressed(vk_anykey)) {
            if (global.controller_delay == -1) {
                global.controller_delay = CONTROLLER_DELAY_LENGTH; // Keyboard button pressed while in controller mode, set delay to switch
			}
        } else if (scr_any_controller_button_pressed() != -1) {
            global.controller_delay = -1;
        }
    }
    
    if (global.controller_delay != -1) { // Check if delay for switching between keyboard/controller is active
        if (global.controller_delay == 0) { // Delay over, toggle controller mode
            global.controller_mode = !global.controller_mode;
            global.controller_delay = -1;
        } else {
            global.controller_delay -= 1;
        }
    }
}

if(global.game_started) {
    // Handle pausing
    if (scr_button_check_pressed(global.pause_button) || keyboard_check_pressed(vk_escape)) {
		if (!global.game_paused) { // Game is currently not paused, pause the game
			if (!global.no_pause) {
				global.game_paused = true; // Set the game to paused
				
				// Copy the current screen to a new sprite
				global.pause_spr = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
				
                instance_deactivate_all(true); // Deactivate everything
				
				instance_create_layer(0,0,layer,obj_pause); //Create pause menu
				
              
            }
        }
    }
    
    if (!global.game_paused) { // Make sure the game is currently unpaused
        // Check for restart button
	
		if (scr_button_check_pressed(global.restart_button)) {	
			
			global.show_hud = true;
			hud_pos = 0;
			
            // Stop death sound/music

            
            // Resume room music
            audio_stop_sound(global.game_over_music);
			audio_resume_sound(global.current_music);
			
            scr_save_game(false); // Save deaths/time
            scr_load_game(false); // Load the game
        }
        
		// Increment timer
        if (instance_exists(obj_player)) {
            global.time_micro += delta_time;
            global.time += global.time_micro div 1000000;
            global.time_micro = global.time_micro % 1000000;
        }
		

    }
    
}

if(global.debug_mode) //Debug features
{
	global.debug_no_death = keyboard_check_pressed(vk_home) ? !global.debug_no_death : global.debug_no_death;
	global.debug_inf_jump = keyboard_check_pressed(vk_end) ? !global.debug_inf_jump : global.debug_inf_jump;	
	global.debug_overlay = keyboard_check_pressed(vk_backspace) ? !global.debug_overlay : global.debug_overlay;	
	global.debug_show_hitbox = keyboard_check_pressed(vk_delete) ? !global.debug_show_hitbox : global.debug_show_hitbox;	
	var player_alpha = global.debug_no_death ? 0.5 : 1;	
	with(obj_player)
	{
		image_alpha = player_alpha;
	}
	
	if(keyboard_check_pressed(vk_insert))
	{
			scr_play_sound(snd_save_1);	
		    scr_save_game(true);		
	}
	
	if(keyboard_check_pressed(vk_pageup))
	{
		if(room != room_last)
		{
			room_goto_next();	
			instance_destroy(obj_player);
		}
	}
	
	if(keyboard_check_pressed(vk_pagedown))
	{
		if(room != room_first)
		{
			room_goto_previous();	
			instance_destroy(obj_player);
		}
	}	
	
	if(keyboard_check(vk_tab))
	{
		instance_deactivate_object(obj_camera);	
		with(obj_player)
		{
			x = mouse_x;
			y = mouse_y;
			speed = 0;
		}
	}
	if(keyboard_check_released(vk_tab))
	{
		instance_activate_object(obj_camera);
	}
	
	
}
