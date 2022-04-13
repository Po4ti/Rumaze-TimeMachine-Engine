/// @description Create Player

if (!instance_exists(obj_player))
{
    instance_create_layer(x + 11, y + 15, "Player", obj_player);
}

instance_destroy();
