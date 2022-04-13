/// @description Set trigger
var player = instance_place(x,y + image_yscale, obj_player);

if (player != noone)
{
    if ((player.vspeed * image_yscale) >= 0 && !triggered)
    {
        triggered = true;
        sprite_index = spr_trigger_used;
        scr_fade_screen(c_white, 1, 0, 10);
        global.trigger[trg] = true;
		scr_play_sound(snd_trigger);
    }
}
