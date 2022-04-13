/// @description Draw main menu
var col_current;

draw_sprite(spr_main_menu_rectangle, 0, WINDOW_WIDTH, (WINDOW_HEIGHT + 64) / 2);

draw_set_text(col, font, text_halign, text_valign);

for(i = select_first; i < total_options; i ++)
{
	col_current = i == select && !frozen ? col_selected : col;

	draw_set_color(col_current);
	draw_text(x_selector, y_selector + y_separator * i, option[i]);
}

draw_set_text(col_selected, font, fa_left, fa_bottom);
scr_draw_text_outline(96, WINDOW_HEIGHT + 64, "Version: " + string(GAME_VERSION), col_selected, c_black);


draw_set_text(c_white, fnt_gameplay_12, fa_center, fa_top);

scr_draw_text_outline(WINDOW_HEIGHT, 32, "Rumaze - TimeMachine Engine", c_white, c_black);