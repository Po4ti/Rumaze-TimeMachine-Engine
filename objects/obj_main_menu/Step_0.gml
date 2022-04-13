/// @description Main menu control

var up_press = scr_button_check_pressed(global.menu_up_button) && !frozen;
var down_press = scr_button_check_pressed(global.menu_down_button) && !frozen;
var confirm_press = scr_button_check_pressed(global.menu_accept_button) && !frozen;



if(down_press)
{
	select = (select + 1) % total_options;
	if(select_first == 1 && select == 0)
	{
		select = 1;	
	}
	scr_play_sound(snd_down);
}

if(up_press)
{
	select = (select + total_options - 1) % total_options;	
	if(select_first == 1 && select == 0)
	{
		select = total_options - 1;	
	}	
	scr_play_sound(snd_up);
}

if(confirm_press)
{
	if(select == 0)
	{
		scr_init_save();
		scr_load_game(true);
	}
	
	if(select == 1)
	{
		scr_init_save();
		room_goto(global.start_room)
		global.game_started = true;
		global.autosave = true;
		
	}	
		
	if(select == 2)
	{
		instance_create_layer(0, 0, "Tech_Layer", obj_settings);	
		frozen = true;
	}
	
	if(select == 3)
	{
		game_end();
	}	
}
