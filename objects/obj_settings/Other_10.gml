/// @description Get button names

state[0] = scr_get_string("settings_general");
state[1] = scr_get_string("settings_keyboard");
state[2] = scr_get_string("settings_controller");

option[0][0] = scr_get_string("settings_music_volume");
option[0][1] = scr_get_string("settings_sound_volume");
option[0][2] = scr_get_string("settings_window_mode");
option[0][3] = scr_get_string("settings_slide_mode");
option[0][4] = scr_get_string("settings_language");

option_text[0][0] = string(global.music_volume) + "%";
option_text[0][1] = string(global.sound_volume) + "%";
option_text[0][2] = global.screen_mode == 0 ? scr_get_string("settings_text_fullscreen") : sprintf(scr_get_string("settings_text_windowed"), global.screen_mode);
slide_text = [scr_get_string("settings_text_slide_1") ,scr_get_string("settings_text_slide_2"), scr_get_string("settings_text_slide_3")];
option_text[0][3] = slide_text[global.slide_mode];
option_text[0][4] = scr_get_string("settings_text_language");

#region Keyboard

option[1][0] = scr_get_string("settings_left_button");
option[1][1] = scr_get_string("settings_right_button");
option[1][2] = scr_get_string("settings_up_button");
option[1][3] = scr_get_string("settings_down_button");
option[1][4] = scr_get_string("settings_jump_button");
option[1][5] = scr_get_string("settings_shoot_button");
option[1][6] = scr_get_string("settings_restart_button");
option[1][7] = scr_get_string("settings_save_button");
option[1][8] = scr_get_string("settings_action_button");
option[1][9] = scr_get_string("settings_pause_button");
option[1][10] = scr_get_string("settings_slide_button");
option[1][11] = scr_get_string("settings_reset_controls");

option_text[1][0] = scr_get_key_name(global.left_button, 0);
option_text[1][1] = scr_get_key_name(global.right_button, 0);
option_text[1][2] = scr_get_key_name(global.up_button, 0);
option_text[1][3] = scr_get_key_name(global.down_button, 0);
option_text[1][4] = scr_get_key_name(global.jump_button, 0);
option_text[1][5] = scr_get_key_name(global.shoot_button, 0);
option_text[1][6] = scr_get_key_name(global.restart_button, 0);
option_text[1][7] = scr_get_key_name(global.save_button, 0);
option_text[1][8] = scr_get_key_name(global.action_button, 0);
option_text[1][9] = scr_get_key_name(global.pause_button, 0);
option_text[1][10] = scr_get_key_name(global.slide_button, 0);
option_text[1][11] = reset_text_time == 0 ? "" : scr_get_string("settings_text_controls_reset");

#endregion

option[2][0] = scr_get_string("settings_controller_index");
option[2][1] = scr_get_string("settings_left_button");
option[2][2] = scr_get_string("settings_right_button");
option[2][3] = scr_get_string("settings_up_button");
option[2][4] = scr_get_string("settings_down_button");
option[2][5] = scr_get_string("settings_jump_button");
option[2][6] = scr_get_string("settings_shoot_button");
option[2][7] = scr_get_string("settings_restart_button");
option[2][8] = scr_get_string("settings_save_button");
option[2][9] = scr_get_string("settings_action_button");
option[2][10] = scr_get_string("settings_pause_button");
option[2][11] = scr_get_string("settings_slide_button");
option[2][12] = scr_get_string("settings_reset_controls");

option_text[2][0] = global.controller_index == -1 ? scr_get_string("settings_controller_disabled") : gamepad_get_description(global.controller_index);
if(option_text[2][0] == "")
{
	option_text[2][0] = global.controller_index
}
option_text[2][1] = scr_get_key_name(global.left_button, 1);
option_text[2][2] = scr_get_key_name(global.right_button, 1);
option_text[2][3] = scr_get_key_name(global.up_button, 1);
option_text[2][4] = scr_get_key_name(global.down_button, 1);
option_text[2][5] = scr_get_key_name(global.jump_button, 1);
option_text[2][6] = scr_get_key_name(global.shoot_button, 1);
option_text[2][7] = scr_get_key_name(global.restart_button, 1);
option_text[2][8] = scr_get_key_name(global.save_button, 1);
option_text[2][9] = scr_get_key_name(global.action_button, 1);
option_text[2][10] = scr_get_key_name(global.pause_button, 1);
option_text[2][11] = scr_get_key_name(global.slide_button, 1);
option_text[2][12] = reset_text_time == 0 ? "" : scr_get_string("settings_text_controls_reset");