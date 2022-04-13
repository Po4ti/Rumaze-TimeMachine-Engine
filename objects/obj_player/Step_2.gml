/// @description update animations

var on_block = place_meeting(x,y + global.grav, obj_block);
if(crouching) //Crouching animations
{
	if(sliding)
	{
		scr_set_player_animation("body", spr_player_crouch_slide, 0);
	}
	else if(shooting)
	{
		scr_set_player_animation("body", spr_player_crouch_shoot, 1/3);
	}
	else if(hspeed_sign == 0)
	{
		scr_set_player_animation("body", spr_player_crouch_idle, 0);
	}
	else
	{
		scr_set_player_animation("body", spr_player_crouch, 1/4);
	}
}
else
{
	//Legs
	if(on_block)
	{
		if(hspeed_sign == 0)
		{
			scr_set_player_animation("legs", spr_player_legs_idle, 0);
		}
		else
		{
			scr_set_player_animation("legs", spr_player_legs_run, 1/4);
		}
	}
	else
	{
		scr_set_player_animation("legs", spr_player_legs_jump, 0);
	}
	
	//Body
	if(looking == 1)
	{
		var img_speed = shooting ? 1/4 : 0
		scr_set_player_animation("body", spr_player_body_shoot_up, img_speed);
	}
	else if(looking == 0)
	{
		if(shooting)
		{
			scr_set_player_animation("body", spr_player_body_shoot, 1/2);
		}
		else
		{
			var img_speed = on_block ? 1/15 : 0;
			scr_set_player_animation("body", spr_player_body_idle, img_speed);
		}
	}
	else if(looking == -1)
	{
		scr_set_player_animation("body", spr_player_body_shoot_down, 0);
	}
}



legs_index = (legs_index + legs_speed) % sprite_get_number(legs_sprite);
body_index = (body_index + body_speed) % sprite_get_number(body_sprite);
cape_index = (cape_index + cape_speed) % sprite_get_number(spr_player_cape);
wings_index = (wings_index + wings_speed * abs(vspeed) / 5) % sprite_get_number(spr_player_wings);
have_wings = global.debug_inf_jump;
if(vspeed == 0)
	wings_index = 1;
	

///Kill self if touching killer object or outside room
if(place_meeting(x, y, obj_player_killer) ||
	(bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height))

{
	scr_kill_player();
}
