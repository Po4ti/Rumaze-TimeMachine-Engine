/// @description Sets trigger state to the spike

with(other)
{
	is_trigger = true;
	h = -other.spd; // Change this in variable definitions
}

instance_destroy();
