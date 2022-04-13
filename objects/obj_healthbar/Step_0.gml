/// @description scale change, destroy when hp below zero
if(!destroy)
{
	image_alpha = min(1, image_alpha + 1/20);
	if(instance_exists(my_parent) && my_parent.hp > 0)
	{
		scale = my_parent.hp / my_parent.maxhp;	
	}
	else
	{
		scale = 0;
		destroy = true;
	}
}

if(destroy)
{
	image_alpha -= 1/100;
	if(image_alpha <= 0)
	{
		instance_destroy();	
	}
}
