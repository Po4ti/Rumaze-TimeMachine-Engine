/// @description draw self

var draw_y = y + y_offset;
var uncolored_sprite = saved ? spr_save_used_uncolored : spr_save_uncolored;
var colored_sprite = saved ? spr_save_used_colored : spr_save_colored;

draw_sprite_ext(uncolored_sprite, img_index, x, draw_y, image_xscale, image_yscale, image_angle, color, image_alpha);
draw_sprite_ext(colored_sprite, img_index, x, draw_y, image_xscale, image_yscale, image_angle, c_white, image_alpha);	
