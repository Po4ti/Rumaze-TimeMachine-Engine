instance_deactivate_layer("Triggers_" + string(old_layer));
instance_activate_layer("Triggers_" + string(new_layer));

instance_destroy();
