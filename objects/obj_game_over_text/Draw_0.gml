/// @description Draw Game Over Text

//Attract to current camera

start_x = camera_get_view_x(view_camera[0]);
start_y = camera_get_view_y(view_camera[0]) - 32;

var xx = WINDOW_WIDTH / 2 - draw_x;
var yy = 224 - sprite_height / 2;
draw_sprite_part(sprite_index, image_index, width / 2 - draw_x, 0, draw_x * 2, sprite_height, start_x + xx, start_y + yy);
