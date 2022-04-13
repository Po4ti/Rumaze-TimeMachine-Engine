if (destroy == true)
{
    image_alpha -= 0.1;
	if (image_alpha < 0)
	{
	    instance_destroy();
	}	
}
else
{
	if (image_xscale < 0.5)
	{
	    image_xscale += 0.02;
	    image_yscale += 0.02;
	}

	if (image_xscale > 0.2)
	{
	    obj = instance_create_depth(x,y,depth,obj_portal_bubble_effect);
	    obj.speed = random_range(2,3);
	    obj.direction = gravity_direction + 180 + random_range(-10,10);
		obj.image_blend = image_blend
	}	
}

