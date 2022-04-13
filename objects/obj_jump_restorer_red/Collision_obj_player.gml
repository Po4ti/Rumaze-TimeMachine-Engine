/// @description Give mega jump
if(visible)
{
    with (obj_player)
    {
		have_mega_jump = true;
    }
    
    scr_play_sound(snd_jump_restorer);
    available = false;
	alarm[0] = refresh_time;
	image_xscale = 0;
	image_yscale = 0;
    var obj = instance_create_layer(x, y, layer, obj_jump_restorer_effect);
	obj.sprite_index = spr_jump_restorer_red_effect;
}
