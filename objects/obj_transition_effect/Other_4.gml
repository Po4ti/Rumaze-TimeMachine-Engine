/// @description create fadeout effect when new room starts
if(t != 166)
{
	instance_destroy();
	exit;
}
scr_fade_screen(c_black, 1, 0, 60);	
with(obj_player)
{
	frozen = true;	
}
