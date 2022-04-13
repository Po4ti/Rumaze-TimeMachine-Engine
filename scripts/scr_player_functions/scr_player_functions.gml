/// @function		scr_player_crouch()
/// @description	Sets player state to crouch and updates mask
function scr_player_crouch()
{
	looking = 0;
	crouching = true;
	scr_player_update_mask("small");	
}

/// @function		scr_player_stop_crouch()
/// @description	Stops player crouch and updates mask if possible;
function scr_player_stop_crouch()
{
	if(scr_player_check_recrouch())
	{
		crouching = false;
		sliding = false;
		slide_current = 0;
		scr_player_update_mask("normal");
	}

}

/// @function		scr_player_check_recrouch()
/// @description	Checks if it's possible to stop crouching
function scr_player_check_recrouch()
{
	var mask = mask_index; //Remember mask to return it back
	var out = true;
	scr_player_update_mask("normal"); //Update mask to check for a collision	
	
	if (place_meeting(x,y,obj_block)) //Check ability to stand without crouching
	{
		out = false;
	}	
	mask_index = mask; //Return old mask

	return out; // Return result
	
}

/// @function		scr_player_update_mask(mask)
/// @description	Changes player mask
/// @param			Mask size - "small" or "normal"
function scr_player_update_mask(size)
{
	var new_mask;
	
	if(size == "small") // Mask when crouching
	{	
		new_mask = global.grav == 1 ? spr_player_hitbox_small : spr_player_hitbox_small_flipped;			
	}
	else if(size == "normal") // Default mask
	{
		new_mask = global.grav == 1 ? spr_player_hitbox : spr_player_hitbox_flipped;	
			
	}
	with(obj_player)
	{	
		mask_index = new_mask;	
	}
}

/// @function		scr_player_jump(type)
/// @description	Makes player jump and double jump
/// @param			Jump type - 0 - first jump, 1 - second jump
function scr_player_jump(type)
{
	vspeed = type == 0 ? -jump_power : -double_jump_power; // Change vertical speed
	if(type == 1 && have_mega_jump)
	{
		vspeed *= 1.7;	
	}
	have_mega_jump = false;
	have_double_jump = type != 1; //Take double jump
	scr_play_sound(type == 0 ? snd_jump : snd_djump);
	scr_player_stop_crouch(); // Stop crouching after jump
	repeat(3)
	{
		instance_create_layer(x, y + 6 * global.grav, layer, obj_player_jump_effect);	
	}
}

/// @function		scr_set_player_animation(type, sprite, speed)
/// @description	Makes player jump and double jump
/// @param			Sprite type - "body" or "legs"
/// @param			Sprite index
/// @param			Sprite speed
function scr_set_player_animation(type, sprite, speed)
{
	if(type == "legs")
	{
		if(legs_sprite != sprite) // Update image index if starting new animation
		{
			legs_index = 0;
		}
		legs_speed = speed;
		legs_sprite = sprite;
	}
	
	if(type == "body")
	{
		if(body_sprite != sprite)
		{
			body_index = 0;
		}
		body_speed = speed;
		body_sprite = sprite;
	}	
}

/// @function		scr_kill_player()
/// @description	Kills player and shows death animation
function scr_kill_player()
{
	if(!global.debug_no_death) {
		with(obj_player)
		{
			instance_destroy(); //Destroy player
		
			//Create Game over effects
			instance_create_layer(0, 0, "Tech_Layer", obj_game_over_text);
			scr_make_circle(x, y, "Tech_Layer", 0, 30, 10, obj_game_over_shard);
			instance_create_layer(x, y, "Tech_Layer", obj_game_over_burst);

			audio_pause_sound(global.current_music);
			global.game_over_music = audio_play_sound(global.mus_on_death, 1, false);
			audio_sound_gain(global.game_over_music, global.music_volume / 100, 0)
			
			scr_play_sound(snd_death) //Death sound
			global.deaths ++; // Increment death counter   
			scr_save_game(false); // Save deaths/time		
		}
	}
}

