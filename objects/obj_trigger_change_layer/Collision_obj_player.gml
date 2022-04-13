/// @description Disables one trigger layout and activates another.
if(old_layer > 0)
{
	instance_deactivate_layer("Triggers_" + string(old_layer));
}
if(new_layer > 0)
{
	instance_activate_layer("Triggers_" + string(new_layer));
}

instance_destroy();
