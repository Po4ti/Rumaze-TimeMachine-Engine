/// @description Start cutscene
if(cutscene = false)
{
	cutscene = true;
	with(other)
	{
		frozen = true;	
		hspeed = 0;
		current_horizontal_speed = 0;
		sliding = false;
	}
	scr_play_sound(snd_secret_item);
}
