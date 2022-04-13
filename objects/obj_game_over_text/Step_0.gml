/// @description Increase width, create star effect
if(draw_x + 6 < width / 2)
{
	draw_x = lerp(draw_x, width / 2,0.05);

	num = sprite_height / 8;

	for(var i = 0; i <= sprite_height; i += num) // Create stars
	{
		instance_create_depth(start_x + WINDOW_WIDTH / 2 - draw_x, start_y + 224 - sprite_height / 2 + i + random_range(-num, num)/2, depth - 1, obj_bullet_effect);	
		instance_create_depth(start_x + WINDOW_WIDTH / 2 - draw_x + draw_x * 2, start_y + 224 - sprite_height / 2 + i + random_range(-num, num) / 2, depth - 1, obj_bullet_effect);	
	}
}
