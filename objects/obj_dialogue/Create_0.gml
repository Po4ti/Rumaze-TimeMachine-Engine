/// @description Init dialogue

with(obj_player)
{
	frozen = true;	
}

fade_alpha = 0;
fade_alpha_to = 0.4;
fade_frames = 20;


portrait_index[0] = 0;
portrait_index[1] = 0;

portrait_name[0] = "Left speaker"
portrait_name[1] = "Right speaker"

portrait_fade[0] = 0;
portrait_fade[1] = 0;

col = #1D8B91;

dialogue_current = 0;
dialogue_index = [0];
dialogue_text = ["Placeholder"];
dialogue_total = 3;

letters_total = 0;
t = 0;

global.show_hud = false;
