/// @description Trigger checks

if(is_trigger)
{
	if(speed != 0) // Collision with trigger stopper
	{
		var stopper = instance_place(x + hspeed, y + vspeed, obj_trigger_stopper);
		if(stopper == noone) // Stop chain of objects
		{
			stopper = instance_place(x + hspeed, y + vspeed, obj_spike_parent);
			if(stopper != noone)
			{
				if(!stopper.did_stop)
					stopper = noone;
			}
		}
		if(stopper != noone)
		{
            var bbox_l, bbox_r, bbox_u, bbox_d;
    
            with(stopper)
			{
                bbox_l = x;
                bbox_r = x + 32 * image_xscale;
                bbox_u = y;
                bbox_d = y + 32 * image_yscale;
            }
			
			
			yprevious = y;
			xprevious = x;
            
            if(hspeed > 0)
			{
                x = bbox_l - 32 * image_xscale;
            }
            
            if(hspeed < 0)
			{
                x = bbox_r;
            }
            
            if(vspeed > 0)
			{
                y = bbox_u - 32 * image_yscale;
            }
            
            if(vspeed < 0)
			{
                y = bbox_d;
            }
			
			speed = 0;
			is_trigger = false;
			did_stop = true;
			v = 0;
			h = 0;
            			
		}
	}
}
