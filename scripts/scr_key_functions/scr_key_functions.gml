/// @function		scr_get_key_name(key, index)
/// @description	Returns key name 
/// @param			Key
/// @param			Keyboard(0) or gamepad(1)
function scr_get_key_name(key, index)
{
	if(index == 0)
	{
		switch(key[0]) {
		    // Special keys
		    case vk_space: return "Space";
		    case vk_shift: return "Shift";
		    case vk_control: return "Control";
		    case vk_alt: return "Alt";
		    case vk_enter: return "Enter";
		    case vk_up: return "Up Arrow";
		    case vk_down: return "Down Arrow";
		    case vk_left: return "Left Arrow";
		    case vk_right: return "Right Arrow";
		    case vk_backspace: return "Backspace";
		    case vk_tab: return "Tab";
		    case vk_insert: return "Insert";
		    case vk_delete: return "Delete";
		    case vk_pageup: return "Page Up";
		    case vk_pagedown: return "Page Down";
		    case vk_home: return "Home";
		    case vk_end: return "End";
		    case vk_escape: return "Escape";
		    case vk_printscreen: return "Print Screen";
		    case vk_f1: return "F1";
		    case vk_f2: return "F2";
		    case vk_f3: return "F3";
		    case vk_f4: return "F4";
		    case vk_f5: return "F5";
		    case vk_f6: return "F6";
		    case vk_f7: return "F7";
		    case vk_f8: return "F8";
		    case vk_f9: return "F9";
		    case vk_f10: return "F10";
		    case vk_f11: return "F11";
		    case vk_f12: return "F12";
		    case vk_lshift: return "Left Shift";
		    case vk_rshift: return "Right Shift";
		    case vk_lcontrol: return "Left Control";
		    case vk_rcontrol: return "Right Control";
		    case vk_lalt: return "Left Alt";
		    case vk_ralt: return "Right Alt";
		    // Numpad keys
			case 12: return "Num 5";
		    case 96: return "0";
		    case 97: return "1";
		    case 98: return "2";
		    case 99: return "3";
		    case 100: return "4";
		    case 101: return "5";
		    case 102: return "6";
		    case 103: return "7";
		    case 104: return "8";
		    case 105: return "9";
		    case 106: return "*";
		    case 107: return "+";
		    case 109: return "-";
		    case 110: return ".";
		    case 111: return "/";
			case 144: return "Num Lock"
		    // Misc keys
		    case 186: return ";";
		    case 187: return "=";
		    case 188: return ",";
		    case 189: return "-";
		    case 190: return ".";
		    case 191: return "/";
		    case 192: return "`";
		    case 219: return "[";
		    case 220: return "\\";
		    case 221: return "]";
		    case 222: return "\'";
		    // Other characters
		    default: return chr(key[0]);
		}		
	}
	
	if(index == 1)
	{
		switch (key[1]) {
		    case gp_face1: return "A/Cross";
		    case gp_face2: return "B/Circle";
		    case gp_face3: return "X/Square";
		    case gp_face4: return "Y/Triangle";
		    case gp_shoulderl: return "Left Bumper";
		    case gp_shoulderlb: return "Left Trigger";
		    case gp_shoulderr: return "Right Bumper";
		    case gp_shoulderrb: return "Right Trigger";
		    case gp_select: return "Select/Touch-Pad";
		    case gp_start: return "Start/Options";
		    case gp_stickl: return "Left Stick";
		    case gp_stickr: return "Right Stick";
		    case gp_padu: return "D-Pad Up";
		    case gp_padd: return "D-Pad Down";
		    case gp_padl: return "D-Pad Left";
		    case gp_padr: return "D-Pad Right";
		    default: return "Unknown";
	}
		
	}
}

/// @function		scr_button_check_pressed(button_in)
/// @description	Checks for button press
/// @param			Button to check
function scr_button_check_pressed(button_in)
{
	if(!global.controller_mode) //Keyboard check
	{
		if(is_array(button_in[0])) // Multibutton check
		{
			for(var i = 0; i < array_length(button_in[0]); i ++)
			{
				if(keyboard_check_pressed(button_in[0][i]))
				{
					return true;	
				}
			}
			return false; // None of the buttons are pressed
		}
		else
		{
			return (keyboard_check_pressed(button_in[0])); // One button check
		}
	} else { // Controller check
		if(is_array(button_in[1])) // Multibutton check
		{
			for(var i = 0; i < array_length(button_in[1]); i ++)
			{
				if(gamepad_button_check_pressed(global.controller_index, button_in[1][i]))
				{
					return true;	
				}
			}
			return false; // None of the buttons are pressed
		}
		else
		{
			return (gamepad_button_check_pressed(global.controller_index, button_in[1])); // One button check
		}
	}

}

/// @function		scr_button_check(button_in)
/// @description	Checks whether button is pressed or not
/// @param			Button to check
function scr_button_check(button_in)
{
	if(!global.controller_mode) //Keyboard check
	{
		if(is_array(button_in[0])) // Multibutton check
		{
			for(var i = 0; i < array_length(button_in[0]); i ++)
			{
				if(keyboard_check(button_in[0][i]))
				{
					return true;	
				}
			}
			return false; // None of the buttons are pressed
		}
		else
		{
			return (keyboard_check(button_in[0])); // One button check
		}
	} else { // Controller check
		if(is_array(button_in[1])) // Multibutton check
		{
			for(var i = 0; i < array_length(button_in[1]); i ++)
			{
				if(gamepad_button_check(global.controller_index, button_in[1][i]))
				{
					return true;	
				}
			}
			return false; // None of the buttons are pressed
		}
		else
		{
			return (gamepad_button_check(global.controller_index, button_in[1])); // One button check
		}
	}

}

/// @function		scr_button_check_released(button_in)
/// @description	Checks for button release
/// @param			Button to check
function scr_button_check_released(button_in)
{
	if(!global.controller_mode) //Keyboard check
	{
		if(is_array(button_in[0])) // Multibutton check
		{
			for(var i = 0; i < array_length(button_in[0]); i ++)
			{
				if(keyboard_check_released(button_in[0][i]))
				{
					return true;	
				}
			}
			return false; // None of the buttons are released
		}
		else
		{
			return (keyboard_check_released(button_in[0])); // One button check
		}
	} else { // Controller check
		if(is_array(button_in[1])) // Multibutton check
		{
			for(var i = 0; i < array_length(button_in[1]); i ++)
			{
				if(gamepad_button_check_released(global.controller_index, button_in[1][i]))
				{
					return true;	
				}
			}
			return false; // None of the buttons are released
		}
		else
		{
			return (gamepad_button_check_released(global.controller_index, button_in[1])); // One button check
		}
	}

}

/// @function		scr_any_controller_button_pressed()
/// @description	Checks for any button press on a gamepad
function scr_any_controller_button_pressed()
{
	/// Returns a gamepad button if one is being pressed and -1 if none are pressed (if multiple are pressed at the same time, return whichever has the lowest value)
	// Make an array of all the gamepad buttons to check
	var button_arr = [gp_face1, gp_face2, gp_face3, gp_face4, gp_padu, gp_padd, gp_padl, gp_padr, gp_stickr, gp_stickl, gp_select, gp_start, gp_shoulderr, gp_shoulderrb, gp_shoulderl, gp_shoulderlb];
	var button_arr_length = array_length(button_arr);

	// Check every button in the array
	for (var i = 0; i < button_arr_length; i++) {
	    if (gamepad_button_check_pressed(global.controller_index, button_arr[i]))
		{
	        return button_arr[i]; // Button pressed, return value
		}
	}

	return -1; // No buttons pressed


}
