/// @description transition control

if(music_fade)
{
	if(t < 165)
	{
		audio_sound_gain(global.current_music, global.music_volume / 100 * (165 - t) / 165, 0);	
	}
	if(t == 165)
	{
		scr_stop_music();	
	}
}

if(t == 165)
{
	if(warp_x != 0 || warp_y != 0)
	{
		var player = instance_create_layer(warp_x, warp_y, "Player", obj_player);
		player.x_scale = scale;
	}
	room_goto(room_to);
	
	
}

if(t == 210)
{
	instance_destroy();
	with(obj_player)
	{
		frozen = false;	
	}
}

t ++;
