/// @description Draw screen
var draw_x = camera_get_view_x(view_camera[0]);
var draw_y = camera_get_view_y(view_camera[0]) + 32;

draw_set_color(color);
draw_set_alpha(alpha);

draw_rectangle(draw_x, draw_y, draw_x + WINDOW_WIDTH, draw_y + WINDOW_HEIGHT, false);

draw_set_alpha(1);
