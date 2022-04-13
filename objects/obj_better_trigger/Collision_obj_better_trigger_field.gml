/// @description connect signal

if(active && other.layer == layer) // Making sure trigger is active and signal connector on the same layer.
{
	with(other)
	{
		active = true;	
	}
	
	instance_destroy();
}
