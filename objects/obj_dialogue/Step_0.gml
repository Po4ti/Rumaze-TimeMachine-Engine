/// @description Dialogue control

if(fade_alpha < fade_alpha_to)
{
	fade_alpha += fade_alpha_to / fade_frames;	// Screen fade effect
}



for(i = 0; i < 2; i ++) // Swap portraits
{
	if(dialogue_index[dialogue_current] == i)
	{
		portrait_fade[i] = lerp(portrait_fade[i], 1, 0.1);
	}
	else
	{
		portrait_fade[i] = lerp(portrait_fade[i], 0, 0.1);
	}
}
if(scr_button_check_pressed(global.menu_accept_button))
{
	if(letters_total < string_length(dialogue_text[dialogue_current]))
	{
		letters_total = string_length(dialogue_text[dialogue_current]);
	}
	else
	{
		dialogue_current ++;
		t = 0;
		letters_total = 0;
		if(dialogue_current >= dialogue_total)
		{
			instance_destroy();
		}
	}
}

if(t % 3 == 0 && dialogue_current < dialogue_total && letters_total < string_length(dialogue_text[dialogue_current]))
{
	letters_total ++;
	scr_play_sound(snd_dialogue);
}

t ++;


