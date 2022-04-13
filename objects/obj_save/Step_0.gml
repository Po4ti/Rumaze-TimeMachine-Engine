/// @description Saving and setting HUD message
if(saved && (img_index + img_speed >= img_num))
{
	instance_destroy();	
}

img_index = (img_index + img_speed) % img_num;

y_offset = dsin(t * 4) * 2;

t = (t + 1) % 360;



if(!saved) {
	if(place_meeting(x,y,obj_player))
	{
	
		if global.hud_message == "" {
			global.hud_message = sprintf(scr_get_string("press_to_save"), global.save_button);
		}
		if(scr_button_check_pressed(global.save_button) && !saved && !obj_player.frozen) {
			img_index = 0;
			img_num = sprite_get_number(spr_save_used_colored);
			
			audio_stop_sound(snd_save_1);
			audio_stop_sound(snd_save_2);
	
			scr_play_sound(snd_save_1);
			scr_play_sound(snd_save_2);			
	
			saved = true
		    scr_save_game(true, x + 16, y + 47 * image_yscale);

		}
	}
} else {
	if global.hud_message == "" {
		global.hud_message = scr_get_string("saved")	
	}
}