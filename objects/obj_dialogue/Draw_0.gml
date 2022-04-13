/// @description Draw dialogue

var draw_x = camera_get_view_x(view_camera[0]);
var draw_y = camera_get_view_y(view_camera[0]);

// Fade effect
draw_set_color(c_black);
draw_set_alpha(fade_alpha);

draw_rectangle(draw_x, draw_y, draw_x + WINDOW_WIDTH, draw_y + WINDOW_HEIGHT + 64, false);

draw_set_alpha(1);

// Portraits
var portrait_alpha = portrait_fade[0] * 0.7 + 0.3;
var portrait_x = portrait_fade[0] * 8;
var portrait_y = 176 + portrait_fade[0] * -16;


gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(spr_dialogue_portraits, portrait_index[0], portrait_x, portrait_y, 1, 1, 0, c_black, 1);
gpu_set_fog(false, c_black, 0, 0);
draw_sprite_ext(spr_dialogue_portraits, portrait_index[0], portrait_x, portrait_y, 1, 1, 0, c_white, portrait_alpha);


var portrait_alpha = portrait_fade[1] * 0.7 + 0.3;
var portrait_x = 640 - (portrait_fade[1] * 8);
var portrait_y = 176 + portrait_fade[1] * -16;


gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(spr_dialogue_portraits, portrait_index[1], portrait_x, portrait_y, -1, 1, 0, c_black, 1);
gpu_set_fog(false, c_black, 0, 0);
draw_sprite_ext(spr_dialogue_portraits, portrait_index[1], portrait_x, portrait_y, -1, 1, 0, c_white, portrait_alpha);

// Text rectangles
var rect_width = 480;
var rect_height = 128;

var rect_x = (WINDOW_WIDTH - rect_width) / 2;
var rect_y = WINDOW_HEIGHT - rect_height - 8;

var draw_rect_text = string_copy(dialogue_text[dialogue_current], 1, letters_total);
draw_sprite_ext(spr_generic_rectangle, 0, rect_x, rect_y, rect_width / 7, rect_height / 160, 0, c_white, 1);
draw_set_text(col, fnt_segoe_10, fa_left, fa_top);
draw_text_ext(rect_x + 4, rect_y + 4, draw_rect_text, -1, rect_width - 8);

// Name rectangles
if(dialogue_index[dialogue_current] == 0)
{
	draw_set_text(col, fnt_segoe_10, fa_left, fa_top);
	var name_width = string_width(portrait_name[0]) + 16;
	var name_height = string_height(portrait_name[0]);

	draw_sprite_ext(spr_generic_rectangle, 0, rect_x, rect_y - name_height, name_width / 7, name_height / 160, 0, c_white, 1);
	draw_text(rect_x + 8, rect_y - name_height, portrait_name[0]);
}
else
{
	draw_set_text(col, fnt_segoe_10, fa_right, fa_top);
	var name_width = string_width(portrait_name[1]) + 16;
	var name_height = string_height(portrait_name[1]);

	draw_sprite_ext(spr_generic_rectangle, 0, rect_x + rect_width - name_width, rect_y - name_height, name_width / 7, name_height / 160, 0, c_white, 1);
	draw_text(rect_x + rect_width - 8, rect_y - name_height, portrait_name[1]);	
}
