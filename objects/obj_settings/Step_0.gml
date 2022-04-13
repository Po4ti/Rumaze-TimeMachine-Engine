/// @description menu controls

var up_press = scr_button_check_pressed(global.menu_up_button) && key_setting == -1;
var down_press = scr_button_check_pressed(global.menu_down_button) && key_setting == -1;
var left = scr_button_check(global.menu_left_button) && key_setting == -1;
var right = scr_button_check(global.menu_right_button) && key_setting == -1;
var left_press = scr_button_check_pressed(global.menu_left_button) && key_setting == -1;
var right_press = scr_button_check_pressed(global.menu_right_button) && key_setting == -1;
var escape_press = scr_button_check_pressed(global.menu_back_button) && key_setting == -1;

var confirm_press = scr_button_check_pressed(global.menu_accept_button) && key_setting == -1;

#region global control

if(escape_press)
{
	level --;
	scr_play_sound(snd_down);	
	if(level == -1)
	{
		instance_destroy();
		with(obj_main_menu)
		{
			frozen = false;
		}
		with(obj_pause)
		{
			alarm[0] = 1;
		}
			
	}
}

if(!left && !right)
	volume_press = 0;
	
state_y_position = lerp(state_y_position, -top_button_select * state_y_separator, 0.12);
y_position = lerp(y_position, -top_select * y_separator, 0.12);

if(reset_text_time > 0)
{
	reset_text_time --;
	if(reset_text_time == 0)
		event_user(0);
}
#endregion


#region Setting sections

if(level == 0)
{
	if(up_press)
	{
		if(state_select > 0)
		{
			select = 0;
			y_position = 0;
			top_select = 0;
			state_select --;
			reset_text_time = 0;
			scr_play_sound(snd_up);
		}
		if(top_button_select - state_select > 0)
		{
			top_button_select --;	
		}	
	}
	if(down_press)
	{
		if(state_select < state_num - 1)	
		{
			select = 0;
			y_position = 0;
			top_select = 0;
			state_select ++;
			reset_text_time = 0;
			scr_play_sound(snd_down);
		}

		if(state_select - top_button_select > 3)
		{
			top_button_select ++;	
		}
	}
	
	if(confirm_press)
	{
		level ++;	
		scr_play_sound(snd_up);
		confirm_press = false;
	}
}

#endregion


if(level == 1)
{
	
	//Global controls
	if(up_press)
	{
		if(select > 0)
		{
			select --;
			scr_play_sound(snd_up);
		}

		if(top_select - select > 0)
		{
			top_select --;	
		}	
	}
	if(down_press)
	{
		if(select < total_options[state_select] - 1)
		{
			select ++;
			scr_play_sound(snd_down);
		}

		if(select - top_select > 7)
		{
			top_select ++;	
		}
	}	
	if(state_select == 0)
	{	
		if(select == 0 && (left || right))
		{
			if(volume_press < 10)
			{
				volume_press ++;	
			}

			if(left_press || (volume_press >= 10 && left))	
			{
				global.music_volume = max(0, global.music_volume - 1);
			}
			else if((volume_press >= 10 && right) || right_press)
			{
				global.music_volume = min(100, global.music_volume + 1);
			}
			option_text[0][0] = string(global.music_volume) + "%";
			scr_get_music();
			scr_save_config();
		}
	
		if(select == 1 && (left || right))
		{
			if(volume_press < 10)
			{
				volume_press ++;	
			}

			if(left_press || (volume_press >= 10 && left))	
			{
				global.sound_volume = max(0, global.sound_volume - 1);
			}
			else if((volume_press >= 10 && right) || right_press)
			{
				global.sound_volume = min(100, global.sound_volume + 1);
			}
			option_text[0][1] = string(global.sound_volume) + "%";
			scr_save_config();
		}	

	
		if(select == 2 && (left_press || right_press))
		{
			if(left_press)
				window_scale = (window_scale + scale_max - 1) % scale_max
			else
				window_scale = (window_scale + 1) % scale_max
			global.screen_mode = window_scale

		
			if(window_scale > 0)
			{
				window_set_fullscreen(false);
			
				var w = 640 * window_scale;
				var h = 384 * window_scale;

				window_set_size(w, h);
			
				with(obj_world)
					alarm[0] = 2
			}
			else
			{
				window_set_fullscreen(true);
			}
			option_text[0][2] = global.screen_mode == 0 ? scr_get_string("settings_text_fullscreen") : sprintf(scr_get_string("settings_text_windowed"), global.screen_mode);
			scr_save_config();
		}	
	
		if(select == 3 && (left_press || right_press))
		{
			if(left_press)	
				global.slide_mode = (global.slide_mode + 2) % 3;
			else
				global.slide_mode = (global.slide_mode + 1) % 3;
			
			option_text[0][3] = slide_text[global.slide_mode];
			scr_save_config();
		}
	
		if(select == 4 && (left_press || right_press))
		{
			if(left_press)	
				global.language = (global.language + 1) % 2;
			else
				global.language = (global.language + 1) % 2;
			
			event_user(0);
		
			with(obj_main_menu)
				event_user(0);
				
			scr_save_config();
		}
	}
	
	if(state_select == 1)
	{
		if(confirm_press && key_setting == -1 && select < 11)
		{

			key_setting = select;
			option_text[1][select] = scr_get_string("settings_press_key");			
		}		
		else if(key_setting != -1 && keyboard_check_pressed(vk_anykey))
		{
			if!(keyboard_lastkey == vk_escape)
			{
				switch(key_setting)
				{
					case 0: global.left_button[0] = keyboard_lastkey; break;
					case 1: global.right_button[0] = keyboard_lastkey; break;
					case 2: global.up_button[0] = keyboard_lastkey; break;
					case 3: global.down_button[0] = keyboard_lastkey; break;
					case 4: global.jump_button[0] = keyboard_lastkey; break;	
					case 5: global.shoot_button[0] = keyboard_lastkey; break;
					case 6: global.restart_button[0] = keyboard_lastkey; break;
					case 7: global.save_button[0] = keyboard_lastkey; break;
					case 8: global.action_button[0] = keyboard_lastkey; break;
					case 9: global.pause_button[0] = keyboard_lastkey; break;
					case 10: global.slide_button[0] = keyboard_lastkey; break;
				}
				scr_save_config();
			}
			key_setting = -1;

			event_user(0);
		}
		
		if(confirm_press && select == 11)
		{
			global.left_button[0] = vk_left;
			global.right_button[0] = vk_right;
			global.up_button[0] = vk_up;
			global.down_button[0] = vk_down;
			global.jump_button[0] = vk_shift;
			global.shoot_button[0] = ord("Z");
			global.restart_button[0] = ord("R");
			global.save_button[0] = ord("S");
			global.action_button[0] = ord("A");	
			global.pause_button[0] = ord("P");
			global.slide_button[0] = ord("X");
			scr_save_config();	
			reset_text_time = reset_text_timer;
			event_user(0);
		}
	}
	
	if(state_select == 2)
	{
		if(select == 0)
		{
			if(left_press || right_press)
			{
				if(left_press)
				{
					global.controller_index = max(-1, global.controller_index - 1);	
				}
				else
				{
					global.controller_index = min(10, global.controller_index + 1);	
				}
				option_text[2][0] = global.controller_index == -1 ? scr_get_string("settings_controller_disabled") : gamepad_get_description(global.controller_index);
				if(option_text[2][0] == "")
				{
					option_text[2][0] = global.controller_index
				}				
				if(global.controller_index == -1)
					global.controller_mode = false;
			}
		}
		if(confirm_press && key_setting == -1 && select > 0 && select < 12 )
		{

			key_setting = select;
			option_text[2][select] = scr_get_string("settings_press_key");			
		}			
		else if(key_setting != -1 && scr_any_controller_button_pressed() != -1)
		{
			var last_key = scr_any_controller_button_pressed();
			if(last_key != global.menu_back_button[1])
			{
				switch(key_setting)
				{
					case 1: global.left_button[1] = last_key; break;
					case 2: global.right_button[1] = last_key; break;
					case 3: global.up_button[1] = last_key; break;
					case 4: global.down_button[1] = last_key; break;
					case 5: global.jump_button[1] = last_key; break;	
					case 6: global.shoot_button[1] = last_key; break;
					case 7: global.restart_button[1] = last_key; break;
					case 8: global.save_button[1] = last_key; break;
					case 9: global.action_button[1] = last_key; break;
					case 10: global.pause_button[1] = last_key; break;
					case 11: global.slide_button[1] = last_key; break;
				}
				scr_save_config();
			}
			key_setting = -1;

			event_user(0);
		}	
		if(confirm_press && select == 12)
		{
		    global.left_button[1] = gp_padl;
		    global.right_button[1] = gp_padr;
		    global.up_button[1] = gp_padu;
		    global.down_button[1] = gp_padd;
		    global.jump_button[1] = gp_face1;
		    global.shoot_button[1] = gp_face3;
		    global.restart_button[1] = gp_face4;
		    global.save_button[1] = gp_face2;
		    global.action_button[1] = gp_stickl;		
		    global.pause_button[1] = gp_start;
		    global.slide_button[1] = gp_shoulderrb;
			scr_save_config();	
			reset_text_time = reset_text_timer;
			event_user(0);
		}
	}		
}