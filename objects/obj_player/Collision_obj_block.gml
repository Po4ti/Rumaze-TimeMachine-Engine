/// @description Check block collisions
// Move back to perform checks

x = xprevious;
y = yprevious;

//Horizontal collision
if (place_meeting(x + hspeed, y, obj_block)) {
	
    if (hspeed <= 0)
	{
		x = ceil(x);
		while (!place_meeting(x - 1, y, obj_block)) x -= 1;
	}
    if (hspeed > 0)
	{
		x = floor(x);
		while (!place_meeting(x + 1, y, obj_block)) x += 1;
	}
	current_horizontal_speed = 0;
    hspeed = 0;
}

//Vertical collision
if (place_meeting(x, y + vspeed, obj_block)) {

    if (vspeed <= 0) 
	{	
		y = ceil(y);
		while (!place_meeting(x, y - 1, obj_block)) y -= 1;
			
	}
    if (vspeed > 0) {

		y = floor(y);
        while (!place_meeting(x, y + 1, obj_block)) y += 1;
    }
	
	if(sign(vspeed) == sign(global.grav))
	{
		have_double_jump = true;
		have_mega_jump = false;
		if(!was_on_block)
		{
			was_on_block = true;
			scr_play_sound(snd_land);
		}		
	}
	
    vspeed = 0;
}


if (place_meeting(x + hspeed, y + vspeed, obj_block)) hspeed = 0;

//Apply remaining hsp/vsp that we took at the start
x += hspeed;
y += vspeed;
