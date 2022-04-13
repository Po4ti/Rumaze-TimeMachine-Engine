/// @description Draw pause menu

var col_current;


// Draw background
gpu_set_blendenable(false);
draw_sprite(global.pause_spr, -1, 0, 0);
gpu_set_blendenable(true);

// Draw fade effect
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT + 64, false);
draw_set_alpha(1);
draw_set_color(c_white);


// Draw menu

if(!surface_exists(menu_surf))
{
	menu_surf = surface_create(surf_width, surf_height);
}

surface_set_target(menu_surf);
draw_clear_alpha(c_white,0);

draw_sprite(spr_main_menu_rectangle, 0, surf_width, surf_height / 2);

draw_set_text(col_text, font, text_halign, text_valign);
draw_text(x_selector, y_selector[state] - y_separator, state_text[state]);

for(i = 0; i < total_options[state]; i ++)
{
	col_current = i == select && !frozen ? col_selected : col;

	draw_set_color(col_current);
	draw_text(x_selector, y_selector[state] + y_separator * i, option[state][i]);
}



surface_reset_target();

draw_surface(menu_surf, surf_x, surf_y + 32);
