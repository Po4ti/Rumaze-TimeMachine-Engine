///@description Make sure we never have more than one world object

if (instance_number(object_index) > 1) {
    instance_destroy();
	exit;
}

hud_pos = 0;
hud_surf_top = surface_create(WINDOW_WIDTH, 32);
hud_surf_bottom = surface_create(WINDOW_WIDTH, 32);
coin_index = 0;

selected_object = noone;
selected_index = -1;
list_size = 0;

overlay_x = 0;
overlay_y = 32;

overlay_surf = surface_create(WINDOW_WIDTH, WINDOW_HEIGHT);

col = merge_color(#1D8B91, c_black, 0.3);
col_selected = #1D8B91;
col_text = merge_color(col, col_selected, 0.5);
