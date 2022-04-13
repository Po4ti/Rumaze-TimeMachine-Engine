/// @description Draw settings
var draw_x, draw_y, text_color = #11A5AD;

#region draw setting sections

if(!surface_exists(state_surf))
{
	state_surf = surface_create(surf_small_width, surf_small_height);
}


surface_set_target(state_surf);
draw_clear_alpha(c_white,0);

draw_sprite(spr_settings_rectangle_small, 0, 0, 0);

for(var i = 0; i < state_num; i ++)
{
	draw_x = state_x_selector;
	draw_y = state_y_selector + i * state_y_separator + state_y_position;
	var draw_alpha = clamp((draw_y + 6) / (fade_y), 0, 1);	
	draw_alpha = min(draw_alpha, clamp((100 - draw_y - 6) / fade_y, 0, 1));
	
	var chosen = i == state_select && level == 0;
	draw_set_alpha(draw_alpha);
	draw_sprite_ext(spr_settings_option_rectangle_right, chosen, 120 - draw_x, draw_y, 105/28, 15/10, 0, c_white, draw_alpha);	
	
	draw_set_text(text_color, fnt_segoe_10, fa_right, fa_middle);
	draw_text(draw_x + 100, draw_y + 8, state[i]);
	
	draw_set_alpha(1);
}

surface_reset_target();

gpu_set_blendenable(false);
draw_surface(state_surf, state_menu_x, state_menu_y);
gpu_set_blendenable(true);

#endregion

if(!surface_exists(menu_surf))
{	
	menu_surf = surface_create(surf_width, surf_height);
}

surface_set_target(menu_surf);
draw_clear_alpha(c_white,0);

draw_sprite(spr_settings_rectangle, 0, 0, 0);

draw_set_text(text_color, fnt_segoe_10, fa_left, fa_middle);
for(var i = 0; i < total_options[state_select]; i ++)
{
		
	draw_x = x_selector;
	draw_y = y_selector + i * y_separator + y_position;
	var chosen = i == select && level == 1;	
	
	draw_set_halign(fa_left);	
	var text = option[state_select][i];
	var w = max(32, string_width(text) + 16);
	draw_sprite_ext(spr_settings_option_rectangle_left, chosen, draw_x, draw_y, w/28, 15/10, 0, c_white, 1);
	draw_text(draw_x + 4, draw_y + 8, text);
	
	
	draw_set_halign(fa_right);
	var text = option_text[state_select][i];
	if(text != "")
	{
		var w = max(32, string_width(text) + 16);	
		draw_sprite_ext(spr_settings_option_rectangle_right, chosen, 300 - draw_x, draw_y, w/28, 15/10, 0, c_white, 1);	
		draw_text(300 - (draw_x + 4), draw_y + 8, text);
	}


}


surface_reset_target();
gpu_set_blendenable(false);
draw_surface(menu_surf, menu_x, menu_y);
gpu_set_blendenable(true);
