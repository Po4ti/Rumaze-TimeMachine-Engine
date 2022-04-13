/// @function		scr_get_string(string)
/// @description	Returns string in current localization
/// @param			String index
function scr_get_string(str)
{
	var text = "undefined";
	
	if(global.localization[? str] != undefined)
	{
		text = global.localization_data[# 1 + global.language, global.localization[? str]];
	}
	
	return text;
}

/// @function		draw_set_text(colour,font,halign,valign)
/// @description	Sets everything you need for drawing
/// @param			Drawing colour
/// @param			Drawing font
/// @param			Drawing halign
/// @param			Drawing valign
function draw_set_text(colour,font,halign,valign)
{
	
	draw_set_colour(colour);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	
}
/// @function		scr_draw_text_outline(text_x, text_y, text_str, text_color, outline_color)
/// @description	Draws any text with an outline
function scr_draw_text_outline(text_x, text_y, text_str, text_color, outline_color)
{

	//draw the text outline
	draw_set_color(outline_color);

	draw_text(text_x-1,text_y+1,text_str);
	draw_text(text_x-1,text_y,text_str);
	draw_text(text_x-1,text_y-1,text_str);
	draw_text(text_x+1,text_y+1,text_str);
	draw_text(text_x+1,text_y,text_str);
	draw_text(text_x+1,text_y-1,text_str);
	draw_text(text_x,text_y+1,text_str);
	draw_text(text_x,text_y-1,text_str);

	//draw the text itself
	draw_set_color(text_color);
	draw_text(text_x,text_y,text_str);
}


/// @function		sprintf(text, format..)
/// @description	C sprintf analogue for game maker
/// @param			Unformatted string
/// @param			Variable to format
function sprintf()
{
	var str = argument[0];
	//%s - string
	//%d - int
	//%f - float
	//%b - button
	
	for(var i = 1; i < argument_count; i ++)
	{
		var pos = string_pos("%", str);
		var format = string_copy(str, pos, 2);
		
		switch(format)
		{
			case "%s":
				str = string_replace(str, format, argument[i]);
				break;
			case "%d":
				str = string_replace(str, format, string(floor(argument[i])));
				break;
			case "%f":
				str = string_replace(str, format, string(argument[i]));
				break;			
			case "%b":
				var btn = scr_get_key_name(argument[i], global.controller_mode);
				str = string_replace(str, format, btn);
				break;							
		}
		
	}
	
	return str;
	
}
