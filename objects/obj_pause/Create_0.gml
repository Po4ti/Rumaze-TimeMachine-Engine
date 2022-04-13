/// @description Initialize text and font

//Set options names
event_user(0);

font = fnt_retro_computer_10;

state = 0;
total_options[0] = array_length(option[0]); //Total option number
total_options[1] = array_length(option[1]); //Yes/no confirm

//Starting coordinates for drawing
surf_x = WINDOW_WIDTH;
surf_x_to = WINDOW_WIDTH - 150;
surf_y = 160 - 80;

x_selector = 150 - 8;
y_selector[0] = 46;
y_selector[1] = 64;

y_separator = 32; //distance between options

//Text align
text_halign = fa_right; 
text_valign = fa_middle;

//Text color
col = merge_color(#1D8B91, c_black, 0.3);
col_selected = #1D8B91;
col_text = merge_color(col, col_selected, 0.5);

select = 0; //Currently selected option;

frozen = false;

snd_up = snd_menu_up;
snd_down = snd_menu_down;


surf_width = sprite_get_width(spr_main_menu_rectangle);
surf_height = sprite_get_height(spr_main_menu_rectangle);
menu_surf = surface_create(surf_width, surf_height);

fade_alpha = 0;
fade_alpha_to = 0.5;

camera_set_view_pos(view_camera[0], 0, 0);


