/// @description Pause control
surf_x = lerp(surf_x, surf_x_to, 0.1);
fade_alpha = lerp(fade_alpha, fade_alpha_to, 0.06);

var up_press = scr_button_check_pressed(global.menu_up_button) && !frozen;
var down_press = scr_button_check_pressed(global.menu_down_button) && !frozen;
var confirm_press = scr_button_check_pressed(global.menu_accept_button) && !frozen;
var escape_press = scr_button_check_pressed(global.menu_back_button) && !frozen;


if(down_press)
{
	select = (select + 1) % total_options[state];	
	scr_play_sound(snd_down);
}

if(up_press)
{
	select = (select + total_options[state] - 1) % total_options[state];	
	scr_play_sound(snd_up);
}

if(escape_press)
{
	instance_destroy();
	instance_activate_all();	
}

if(confirm_press)
{
	if(state == 0)
	{
		if(select == 0)
		{
		
			instance_destroy();
			instance_activate_all();
		}
	
		
		if(select == 1)
		{
			instance_create_depth(0, 0, depth - 1, obj_settings);	
			frozen = true;
		}
	
		if(select == 2)
		{
			state = 1;
			select = 1;
		}
	}
	else if(state == 1)
	{
		if(select == 0)
		{		
			scr_save_game(false);
			instance_destroy(obj_player);
			global.game_started = false;
			room_goto(rm_main_menu);
		}
	
		
		if(select == 1)
		{
			state = 0;
			select = 2;
		}		
	}
}
