/// @description Warp the player
if (other.bbox_right <= 0 || other.bbox_left >= room_width || other.bbox_bottom <= 0 || other.bbox_top >= room_height)
{
	global.autosave = autosave;

	var obj = instance_create_layer(0, 0, "Tech_Layer",obj_transition_effect);
	obj.room_to = room_to;
	obj.music_fade = music_fade;
	
	
	if(warp_x != 0 || warp_y != 0)
	{
		obj.scale = other.scale;
		obj.warp_x = warp_x;
		obj.warp_y = warp_y;
	}
	
	instance_destroy(other);
}	

