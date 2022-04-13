/// @description Checking for player, teleporting

var eff = instance_create_layer(x + random_range(-30,30), y + random_range(32,42), "Above_Player", obj_portal_bubble);
eff.image_blend = image_blend;

global.hud_message = hud_text;

if(scr_button_check_pressed(global.action_button))
{
	instance_destroy(obj_player);	
	
	scr_fade_screen(c_white, 1, 0, 10);
	
	var obj = instance_create_layer(0, 0, "Tech_Layer",obj_transition_effect);
	obj.room_to = room_to;
	obj.music_fade = music_fade;
	
	
	if(warp_x != 0 || warp_y != 0)
	{
		obj.scale = scale;
		obj.warp_x = warp_x;
		obj.warp_y = warp_y;
	}
	
	instance_destroy(other);	
}

