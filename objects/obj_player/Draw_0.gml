var draw_x = round(x);
var draw_y = round(y);
var cape_y = crouching ? 2 : 6;
var wings_y = crouching ? -4 : 8;

if(have_wings)
	draw_sprite_ext(spr_player_wings, wings_index, draw_x, draw_y - wings_y * global.grav, x_scale * image_xscale, global.grav * image_yscale, image_angle, image_blend, image_alpha);
else
	draw_sprite_ext(spr_player_cape, cape_index, draw_x, draw_y - cape_y * global.grav, x_scale * image_xscale, global.grav * image_yscale, image_angle, image_blend, image_alpha);

if(!crouching)
{
	draw_sprite_ext(legs_sprite, legs_index, draw_x, draw_y, x_scale, global.grav, image_angle, image_blend, image_alpha);
}
draw_sprite_ext(body_sprite, body_index, draw_x, draw_y - 1, x_scale, global.grav, image_angle, image_blend, image_alpha);

if(global.debug_show_hitbox)
	draw_sprite(mask_index,-1,x,y)



