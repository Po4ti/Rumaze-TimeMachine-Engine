/// @description Init variables

level = 0;

state_menu_x = 32;
state_menu_y = 128;

state_num = 3;
state_x_selector = 8;
state_y_selector = 8;

state_y_separator = 24;

state_y_position = 0;

state_select = 0;
top_button_select = 0;
fade_y = 15;

menu_x = 170;
menu_y = 96;
//menu_surf = 0;

reset_text_timer = 120;
reset_text_time = 0;

event_user(0); // Get button names

total_options[0] = array_length(option[0]); //General settings

if(global.game_started)
{
	total_options[0] --;	
}
total_options[1] = array_length(option[1]); //Keyboard settings
total_options[2] = array_length(option[2]); //Controller settings

x_selector = 8;
y_selector = 8;

y_separator = 24;

y_position = 0;

select = 0;
top_select = 0;


volume_press = 0;

if(window_get_fullscreen())
{
	window_scale = 0;
}
else {
	if(window_get_width() / 640 == window_get_height() / 384)
	{
		window_scale = window_get_width() / 640;
	}
	else
	{
		window_scale = 0;
	}
}


scale_max = 1 + min(floor(display_get_width() / 640), floor(display_get_height() / 384));
key_setting = -1;

snd_up = snd_menu_up;
snd_down = snd_menu_down;

scr_play_sound(snd_up);

surf_small_width = sprite_get_width(spr_settings_rectangle_small);
surf_small_height = sprite_get_height(spr_settings_rectangle_small);
state_surf = surface_create(surf_small_width, surf_small_height);

surf_width = sprite_get_width(spr_settings_rectangle);
surf_height = sprite_get_height(spr_settings_rectangle);
menu_surf = surface_create(surf_width, surf_height);
