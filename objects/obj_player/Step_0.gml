/// @description General player physics

var up_button = global.grav == 1 ? global.up_button : global.down_button;
var down_button = global.grav == 1 ? global.down_button : global.up_button;

//Check player inputs
var left = scr_button_check(global.left_button) && !frozen;
var right = scr_button_check(global.right_button) && !frozen;
var up = scr_button_check(up_button) && !frozen;
var down = scr_button_check(down_button) && !frozen;
var slide_press = (scr_button_check_pressed(global.jump_button) && global.slide_mode != 2 || scr_button_check_pressed(global.slide_button)) && !frozen;
var shoot = scr_button_check_pressed(global.shoot_button) && !frozen;
var jump = scr_button_check_pressed(global.jump_button) && !frozen;
var jump_release = scr_button_check_released(global.jump_button) || frozen;


//Check if player is standing on a block
on_block = place_meeting(x, y + global.grav, obj_block);
if(!on_block)
{
	was_on_block = false;	
}




looking = 0;

if(up && !crouching)
{
	looking = 1;		
}

//Behaviour when down button is pressed
if(down)
{
	
	if(on_block) //Start crouching if on a block
	{
		if(!crouching)
		{
			scr_player_crouch();	
			scr_play_sound(snd_crouch);
		}
	}
	else if(!sliding) //Look down if in air
	{
		looking = -1;	
	}
}


if(!down || !on_block)
{
	if(crouching && !sliding) //Stop crouching if not pressing down and not sliding
	{
		var success = scr_player_check_recrouch();	
		
		if(success) // Update horizontal speed if no longer crouching
		{
			scr_player_stop_crouch();
			current_horizontal_speed = abs(hspeed);			
		}

	}
}

//Update horizontal direction, making sure only one button is pressed
hspeed_sign = 0;
if(left && !right)
{
	hspeed_sign = -1;
	x_scale = hspeed_sign;
}
else if(!left && right)
{
	hspeed_sign = 1;	
	x_scale = hspeed_sign;
}

if (sliding == true)
{
		
	if(slide_scale = x_scale)
	{
		slide_current -= 0.25;
	} else {
		slide_current -= 0.5;				
	}

	hspeed = slide_current * slide_scale;
	
    if (slide_current <= 0)
        sliding = false;
}


if(!crouching) //Horizontal movement when standing
{
	if(hspeed_sign != 0)
	{
		current_horizontal_speed = lerp(current_horizontal_speed, max_horizontal_speed, acceleration_power);
		hspeed = hspeed_sign * current_horizontal_speed;
		if(on_block)
		{
			if(step_sound_timer % step_sound_delay == 0)
			{
				scr_play_sound(snd_step);	
			}
			step_sound_timer ++;
		}
	}
	else
	{
		current_horizontal_speed = lerp(current_horizontal_speed, 0, deceleration_power);
		hspeed = x_scale * current_horizontal_speed;
		step_sound_timer = 0;
	}
	if(current_horizontal_speed < 0.1)
	{
		current_horizontal_speed = 0
	}
}
else
{
	if(slide_press && on_block && down && (right || left || global.slide_mode != 1))
	{
		if(!sliding || (slide_current < slide_new)) // Start sliding
		{
			current_horizontal_speed = 0;
		    slide_current = slide_max;
		    sliding = true;
			slide_scale = x_scale;
		    hspeed = slide_current * x_scale;	
			scr_play_sound(snd_slide);
		}
	}
	if(!sliding)
	{
		if(shooting)
		{
			hspeed = 0;
			crouch_sound_timer = 0;
		}
		else
		{
			hspeed = hspeed_sign * max_crouch_speed;
			if(hspeed_sign != 0)
			{
				if(crouch_sound_timer % crouch_sound_delay == 0)
				{
					scr_play_sound(snd_crouch);	
				}
				crouch_sound_timer ++;
			}
		}
	}
}



if(jump)
{
	if((!sliding || (!down || !on_block) && slide_current < slide_jump) && scr_player_check_recrouch()) // Do jump if able to
	{	
		if(on_block || have_double_jump || have_mega_jump || global.debug_inf_jump)
		{
			scr_player_jump(!on_block)
		}
	}
}

if(jump_release) // Decrease vertical speed if player just released jump button
{
	if(vspeed * global.grav < 0)
	{
		vspeed = vspeed * vertical_speed_cancel;
	}
}

vspeed = min(max_vertical_speed, vspeed); // Set maximum falling speed

if(shoot && !shooting)
{
	shooting = true;
}

if(shooting)
{
	if(shot_timer % shot_delay == 0)
	{
		shot_count ++;	
		if(shot_count <= shot_max)
		{
			var shoot_dir;
			var shoot_offset_x = 0;
			var shoot_offset_y = 0;
			if(looking == 1)
			{
				shoot_dir = 90;	
				shoot_offset_y = -22 * global.grav;
				shoot_offset_x = -4 * x_scale;			
			}
			else if(looking == -1)
			{
				shoot_dir = 270;	
				shoot_offset_x = 3 * x_scale;
				shoot_offset_y = 12 * global.grav;
			}		
			else if(x_scale == 1)
			{
				shoot_dir = 0;
				shoot_offset_x = 8 * x_scale;	
			}
			else
			{
				shoot_dir = 180;
				shoot_offset_x = 8 * x_scale;			
			}
		
			if(!crouching && looking == 0)
			{
				shoot_offset_y = -11 * global.grav;	
			}
			
			if(sliding && looking == 0)
			{
				shoot_offset_y = 5 * global.grav;	
			}			
			
		
		    var proj = instance_create_layer(x + shoot_offset_x, y + shoot_offset_y, "Player" , obj_player_bullet);	
			if(global.grav == -1 && shoot_dir % 180 != 0)
			{
				shoot_dir = (shoot_dir + 180) % 360	
			}
		    proj.direction = shoot_dir
		    proj.speed = 12;	
		
			scr_play_sound(snd_shoot);
		}
		
	}
	if(shot_count == shot_max + 1)
	{
		shooting = false;
		shot_timer = 0;
		shot_count = 0;
		body_index = 0;
	}
	else
	{
		shot_timer ++;
	}
}
