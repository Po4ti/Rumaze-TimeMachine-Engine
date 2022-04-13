/// @description Initialize text and font

//Set options names
event_user(0);

font = fnt_retro_computer_10;

total_options = array_length(option); // Total option number

// Starting coordinates for drawing
x_selector = 626;
y_selector = 160;

y_separator = 22; // Distance between options

// Text align
text_halign = fa_right; 
text_valign = fa_middle;

// Text color
col = merge_color(#1D8B91, c_black, 0.3);
col_selected = #1D8B91;

select_first = !file_exists("SaveFile");
select = select_first; // Currently selected option;


frozen = false;

snd_up = snd_menu_up;
snd_down = snd_menu_down;
