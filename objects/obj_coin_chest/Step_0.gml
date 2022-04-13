///@description Chest control


if(active) { //Create coin effect when chest is opened
	t ++
	if(t % 3 == 0)
	{
		if(coins > 0)
		{
			coins --;
			instance_create_depth(x + random_range(-16,16), y - 24, depth - 1, obj_coin);	
			scr_play_sound(snd_coin);
		}
		else
		{
			active = false;
		}
	}
}


if(!open) //Don't do anything else if we already opened this chest
{

	//Animation
	if(image_index < 1)
		image_index += random(0.03)
	else
		image_index += 0.3
	
	if (place_meeting(x, y, obj_player))
	{
	
	    if (scr_button_check_pressed(global.action_button)) //Open chest
	    {
			sprite_index = spr_coin_chest_open;
			open = true;
			global.coins += coins;
			coins = min(coins, 50);
			active = true;
			global.chests[index] = true		
	    }
		else
		{
			if(global.hud_message == "")
				global.hud_message = sprintf(scr_get_string("open_chest"), global.action_button);
		}	
	}
}
