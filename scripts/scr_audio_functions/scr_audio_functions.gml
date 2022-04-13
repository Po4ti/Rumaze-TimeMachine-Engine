/// @function		scr_play_sound(soundID)
/// @description	Plays sound at current volume
/// @param			Sound ID
function scr_play_sound(soundID)
{
	var sound = audio_play_sound(soundID, 0, false);
	audio_sound_gain(sound, global.sound_volume / 100, 0);
}

/// @function		scr_load_music()
/// @description	Loads all music files
function scr_load_music()
{
	global.mus_on_death = audio_create_stream("Music/mus_on_death.ogg");		
	
	global.mus_guy_rock = audio_create_stream("Music/mus_guy_rock.ogg");	
	global.mus_main_menu = audio_create_stream("Music/mus_main_menu.ogg");		
}

/// @function		scr_get_music()
/// @description	Sets music corresponding to the room
function scr_get_music()
{
	// Gets and plays which song is supposed to be playing for the current room
	var room_song;
	switch(room)
	{
		case rm_main_menu:
			room_song = global.mus_main_menu;
			break;
		
		case rm_sample_01:
		case rm_sample_02:		
		case rm_sample_03:				
		case rm_sample_04:				
		case rm_sample_05:					
			room_song = global.mus_guy_rock;
			break;
			
		default: // By default don't play anything in case the room does not have a song set
			room_song = -1;
			break;
	}
	if (room_song != -2) { // Don't change music if roomSong is set to -2 (this is useful for bosses that you want full control of what song is playing)
	    scr_play_music(room_song); // Play the song for the current room
	}	
	
}

/// @function		scr_play_music(song_id)
/// @description	Plays given music
/// @param			Music to play
function scr_play_music(song_id)
{


	if (global.music_volume > 0) // Check if music is currently muted
	{
	    if (global.current_music_id != song_id) // Check if the song to play is already playing
		{
			
			audio_stop_sound(global.game_over_music);
			
	        global.current_music_id = song_id;
        
		
			audio_stop_sound(global.current_music);

        
	        if (song_id != -1)
			{
				global.current_music = audio_play_sound(global.current_music_id, 1, true);
			}			
	    }
		audio_sound_gain(global.current_music, global.music_volume / 100,0)		
	}
	else
	{
		global.current_music_id = -1;	
		audio_stop_sound(global.current_music);			
	}
}


/// @function		scr_stop_music()
/// @description	Stops music if any plays
function scr_stop_music()
{
	global.current_music_id = -1;	
	audio_stop_sound(global.current_music);

}
