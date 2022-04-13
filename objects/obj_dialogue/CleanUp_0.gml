/// @description unfreeze player, bring back HUD

global.show_hud = true;
with(obj_player)
{
	frozen = false;	
}
