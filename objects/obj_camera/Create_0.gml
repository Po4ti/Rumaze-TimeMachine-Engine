///@description Init variables

//Variable definitions
//mode: 0 - snap camera, 1 - smooth camera
//height_limit - camera maximum height decrement for smooth camera
//leave_room - Should camera be outside room or not


var width = WINDOW_WIDTH;
var height = WINDOW_HEIGHT + 64;


view_enabled = true; //Make sure we have enabled views

//Set up view
view_visible[0] = true; //Making sure this camera is enabled
camera_set_view_size(view_camera[0],width,height);
view_wport[0] = width;
view_hport[0] = height;

if(instance_exists(obj_player))
{
	x_follow = obj_player.x;
    y_follow = obj_player.y;
	
}
else if(instance_exists(obj_player_start))
{
	x_follow = obj_player_start.x + 11;
    y_follow = obj_player_start.y + 15;	
}
else
{
	x_follow = 0;
	y_follow = 0;
}

snap_div = 4;
