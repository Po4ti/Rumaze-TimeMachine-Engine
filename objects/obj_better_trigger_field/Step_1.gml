if(active) //Connect signal with other connectors, activate trigger spikes
{
	
	with(obj_better_trigger_field)
	{
		if(place_meeting(x, y, other))
		{
			if(other.layer == layer && !active)
			{
			    active = true;
				event_perform(ev_step, ev_step_begin);	//Perform this check on the same frame from other side	
			}
		}		
	}
	
	with(obj_spike_parent) //Activate trigger spikes
	{
		if(is_trigger && place_meeting(x, y, other))
		{
			vspeed = v;
			hspeed = h;
		}
	}
	
	instance_destroy();
	exit;
}
