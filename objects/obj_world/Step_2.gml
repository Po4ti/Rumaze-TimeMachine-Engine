/// @description debug overlay

if(global.debug_overlay)
{
	var xx = mouse_x;
	var yy = mouse_y;

	var list = ds_list_create();	
	
	list_size = instance_position_list(xx, yy, all, list, false);
	
	for(var i = 0; i < list_size; i ++)
	{
		var cur_object = list[| i];
		if(variable_instance_exists(cur_object, "ignore_debug_overlay"))
		{
			if(variable_instance_get(cur_object, "ignore_debug_overlay") == true)
			{
				list_size --;
				ds_list_delete(list, i);
				i --;
			}
		}
	}
	
	if(selected_object)
	{
		var current_object_index = ds_list_find_index(list, selected_object);
		if current_object_index == -1 {
			selected_object = noone;
		}
		selected_index = current_object_index;
	}

	if(list_size > 0 && selected_index == -1)
	{
		selected_index = 0;
	}

	if(selected_index >= 0)
	{	
		if(mouse_wheel_up())
		{
			selected_index ++;
		}
		if(mouse_wheel_down())
		{
			selected_index --;
		}
		selected_index = (selected_index + list_size) % list_size;
		selected_object = ds_list_find_value(list, selected_index);
	}

	ds_list_destroy(list);	
	
}
