/// @function scr_make_circle(spawn_x, spawn_y, spawn_layer, spawn_angle, spawn_num, spawn_speed, spawn_obj)
/// @description Spawn circle of given objects, return array of spawned instances ID
/// @param Spawn X
/// @param Spawn Y
/// @param Spawn layer
/// @param Circle angle
/// @param Number of objects
/// @param object speed
/// @param object to spawn
function scr_make_circle(spawn_x, spawn_y, spawn_layer, spawn_angle, spawn_num, spawn_speed, spawn_obj)
{

	var obj;
	var inst_array = array_create(spawn_num, -1);

	for (var i = 0; i < spawn_num; i += 1)
	{
	    obj = instance_create_layer(spawn_x, spawn_y, spawn_layer, spawn_obj);
	    obj.speed = spawn_speed;
	    obj.direction = spawn_angle + i * (360 / spawn_num);
		array_push(inst_array, obj)
	}
	
	return inst_array;


}

/// @function scr_fade_screen(color, start_alpha, end_alpha, fade_frames, destroy = true)
/// @description Creates fade in/out screen effect

function scr_fade_screen(color, start_alpha, end_alpha, fade_frames, destroy = true)
{
	var obj = instance_create_layer(0, 0, "Effects", obj_fade_screen);
	obj.color = color;
	obj.start_alpha = start_alpha;
	obj.end_alpha = end_alpha;
	obj.fade_frames = fade_frames;
	obj.destroy = destroy;
}


