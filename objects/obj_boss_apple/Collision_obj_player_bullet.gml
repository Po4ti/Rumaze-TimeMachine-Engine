/// @description Get hit

instance_destroy(other);
scr_play_sound(snd_hit);

hp --;
if(hp <= 0)
{
	instance_destroy();	
}
