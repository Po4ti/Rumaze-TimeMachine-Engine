/// @description Init variables

img_index = 0;
img_speed = 1/6;
img_num = sprite_get_number(spr_save_colored);

image_index = irandom(img_num);

color = c_lime;

saved = false;

t = 0;