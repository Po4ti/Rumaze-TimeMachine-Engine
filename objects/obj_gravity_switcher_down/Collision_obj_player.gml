/// @description Set gravity to normal

if(global.grav == -1)
{
		global.grav = 1;	
		
		with(obj_player)
		{	
			jump_power = abs(jump_power) * global.grav;
			double_jump_power = abs(double_jump_power) * global.grav;
			gravity = abs(gravity) * global.grav;
			y -= 5;
			
			//Flip mask
			if(mask_index == spr_player_hitbox_flipped)
				scr_player_update_mask("normal")
			else if(mask_index == spr_player_hitbox_small_flipped)
				scr_player_update_mask("small")
	}
}
