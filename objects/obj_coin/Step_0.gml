if(destroy)
{
	 if(image_alpha > 0)
	 {
		image_alpha -= 0.05;
	 }
	 else
	 {
		instance_destroy();
	 }
}
else
{
	if(image_alpha < 1)
	{
		image_alpha += 0.1;
	}
}


//Bouncing agaist blocks
if(place_meeting(x + hspeed, y, obj_block))
{
	hspeed = -hspeed;	
}
if(place_meeting(x, y + vspeed, obj_block))
{
	vspeed = -vspeed;
}

if(!place_meeting(x, y + vspeed + grav, obj_block))
{
	vspeed += grav;	
}

