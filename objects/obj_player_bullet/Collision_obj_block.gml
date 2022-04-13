///@description Create effect and then destroy

instance_create_layer(x+random_range(-8,8), y, layer, obj_bullet_effect);
instance_destroy();
