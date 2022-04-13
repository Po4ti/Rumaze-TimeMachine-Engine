/// @description Warp the player

if (warp_x == 0 && warp_y == 0) // No coordinates set, go to where player start object is
{ 
	instance_destroy(obj_player);
	
} else // Coordinates set, move player to them
{
	with(obj_player)
	{
		x = other.warp_x;
		y = other.warp_y;
	}
}

global.autosave = autosave;
room_goto(room_to);
