/// @description Change vspeed limit, inf jump
var btn = global.grav == 1 ? global.down_button : global.up_button;
var max_vspeed = scr_button_check(btn) ? 4 : 2;
with(obj_player)
{
	if(vspeed * global.grav > max_vspeed)
	{
		vspeed = global.grav * max_vspeed;	
	}
	have_double_jump = true;
}
