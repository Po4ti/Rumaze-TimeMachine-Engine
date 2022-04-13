///@description Follow the player

var offset_x = 0, offset_y = 0;

if(mode == 0)
{

	if instance_exists(obj_player)
	{
		x_follow = obj_player.x;
	    y_follow = obj_player.y;
	} 

	if (!leave_room)
	{
		x_follow = clamp(x_follow, 0, room_width - 1); 
		y_follow = clamp(y_follow, 0, room_height - 1 - height_limit);   
	}
	
	x_follow = floor(x_follow / view_wport[0]) * view_wport[0];
	y_follow = floor(y_follow / (view_hport[0] - 64)) * (view_hport[0] - 64);

}
else if(mode == 1)
{
	offset_x = 320;
	offset_y = 160;
	if (instance_exists(obj_player))
	{
	
		x_follow += (obj_player.x - x_follow) / snap_div;
	    y_follow += (obj_player.y - y_follow) / snap_div;
	}    
	if (!leave_room)
	{
		x_follow = clamp(x_follow, 0, room_width - 1); 
		y_follow = clamp(y_follow, 0, room_height - 1);   
	}

	x_follow = round(clamp(x_follow, WINDOW_WIDTH / 2, room_width - WINDOW_WIDTH / 2));
	y_follow = round(clamp(y_follow, (WINDOW_HEIGHT + 64) / 2 - 32, room_height - (WINDOW_HEIGHT + 64) / 2 + 32 - height_limit));
		
}

camera_set_view_pos(view_camera[0], x_follow - offset_x, y_follow - 32 - offset_y);
	
	
