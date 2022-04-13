/// @function scr_init_healthbar()
/// @description Creates healthbar

function scr_init_healthbar()
{
	var healthbar = instance_create_layer(0, 0, "Tech_Layer", obj_healthbar);
	healthbar.my_parent = id;
}