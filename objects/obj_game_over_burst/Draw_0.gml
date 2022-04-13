///@description Draw self
gpu_set_blendmode(bm_subtract);

// Draw self many times to prevent pixelating
for(var i = 0; i < 90; i += 90 / 8)
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, i, c_white, 1);	
}

gpu_set_blendmode(bm_normal);
