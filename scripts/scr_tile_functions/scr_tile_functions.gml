/// @function scr_get_tile_object(tile, index)
/// @description returns object corresponting to given tile
/// @param tileset
/// @param tile position in tileset
function scr_get_tile_object(tile, index)
{
	if(index == 0)
		return noone;
	
	switch(tile) {
		case "ts_default":
			if(index == 1) // Rocks
				return obj_block;
			if(index == 2) // Grass
				return obj_block;				
			if(index == 3) // Earth
				return obj_block;				
			break;
			
			
		default:
			return noone;
	}	
}