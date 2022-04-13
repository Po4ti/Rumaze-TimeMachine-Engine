/// @description Draw HUD

if(global.game_started)
{
	if(!surface_exists(hud_surf_top))
	{
		hud_surf_top = surface_create(WINDOW_WIDTH, 32);
	}
	if(!surface_exists(hud_surf_bottom))
	{
		hud_surf_bottom = surface_create(WINDOW_WIDTH, 32);
	}
	
	//Draw top bar
	surface_set_target(hud_surf_top);
	draw_clear_alpha(c_white, 0);
	draw_set_color(c_black);
	
	draw_rectangle(0, 0, WINDOW_WIDTH, 32, false);
	
	//Death counter
	draw_sprite(spr_hud_skull, 0, 32, 16);
	draw_set_text(c_white, fnt_visitor_14, fa_left, fa_middle)
	var str = " X " + string(global.deaths);
	draw_text(32, 16, str);
	
	//Make sure text will not overlap
	var offset = max(string_width(str) + 64, 128);
	
	//Coin counter
	draw_sprite(spr_hud_coins, coin_index, offset, 16);
	var str = " X " + string(ceil(global.draw_coins));
	draw_text(offset, 16, str);	
	
	draw_set_text(c_white, fnt_grapple, fa_right, fa_top);
	
	//Draw time and FPS
	var t = global.time;
	var time_str = string(t div 3600) + ":";
	t = t % 3600;
	time_str += string(t div 600);
	t = t % 600;
	time_str += string(t div 60) + ":";
	t = t % 60;
	time_str += string(t div 10);
	t = t % 10;
	time_str += string(floor(t));	
	
	draw_text(WINDOW_WIDTH - 2, 2, "TIME: "+ string(time_str) + "  FPS: " + string(fps));	
	
	if(global.debug_mode)
	{
		draw_set_text(c_red, fnt_grapple, fa_right, fa_top);
		draw_text(WINDOW_WIDTH - 2, 16, "DEBUG MODE");			
	}
	
	surface_reset_target();			


	//Draw bottom bar
	surface_set_target(hud_surf_bottom);
	draw_clear_alpha(c_white, 0);
	draw_set_color(c_black);
	
	draw_rectangle(0, 0, WINDOW_WIDTH, 32, false);
	
	if(instance_exists(obj_healthbar))
	{
		var healthbar_width = (WINDOW_WIDTH - 16) / 19;
		var healthbar_scale = obj_healthbar.scale * (WINDOW_WIDTH - 34);
		var healthbar_alpha = obj_healthbar.image_alpha;
		
		draw_sprite_ext(spr_healthbar, 0, 8, 6, healthbar_width, 1, 0, c_white, healthbar_alpha);
		draw_sprite_ext(spr_healthbar_full, 0, 17, 6, healthbar_scale, 1, 0, c_white, healthbar_alpha);
	}
	
	
	surface_reset_target();
	
	draw_set_color(c_white);
	
	//Draw surfaces
	gpu_set_blendenable(false);
	draw_surface(hud_surf_top, 0, hud_pos);	
	draw_surface(hud_surf_bottom, 0, WINDOW_HEIGHT + 32 - hud_pos);	
	gpu_set_blendenable(true);		

	if(!global.game_paused)
	{
		if(global.hud_message != "") // Draw HUD message
		{ 
			draw_set_alpha(0.5);
			draw_set_text(c_black, fnt_segoe_16, fa_center, fa_top);
		
			var h = string_height(global.hud_message);
			draw_rectangle(-1, 40, WINDOW_WIDTH, 40 + h , false);
    
			draw_set_alpha(1);
			
			scr_draw_text_outline(WINDOW_WIDTH / 2, 40, global.hud_message, c_white, c_black);	
		
			global.hud_message = "";

		}		
	}
	
}

if(global.debug_overlay)
{
	var camera_x = camera_get_view_x(view_camera[0]);
	var camera_y = camera_get_view_y(view_camera[0]);

	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_font(fnt_segoe_10);
	
	if(!surface_exists(overlay_surf))
	{
		overlay_surf = surface_create(WINDOW_WIDTH, WINDOW_HEIGHT);			
	}
	
	surface_set_target(overlay_surf);
	draw_clear_alpha(c_white, 0);	
	
	var overlay_width = 0;
	var overlay_height = 4;
		
	draw_set_text(col_text, fnt_segoe_10, fa_left, fa_top);
		
	var text = string(selected_index + 1) + "/" + string(list_size);
	overlay_width = max(overlay_width, string_width(text) + 4);
	draw_text(4, overlay_height, text);
	overlay_height += 16;
		
	if(selected_object && instance_exists(selected_object))
	{
		draw_set_color(col_selected);
		
		text = object_get_name(selected_object.object_index) + ": " + string(selected_object.id);
		overlay_width = max(overlay_width, string_width(text) + 4);
		draw_text(4, overlay_height, text);
		overlay_height += 16;	
			
		text ="Coords: " + string(selected_object.x) + ", " + string(selected_object.y);
		overlay_width = max(overlay_width, string_width(text) + 4);
		draw_text(4, overlay_height, text);
		overlay_height += 16;	
		
		var array = variable_instance_get_names(selected_object);
	    for (var i = 0; i < array_length(array); i ++;)
		{
			text = array[i] + ":" + string(variable_instance_get(selected_object, array[i]));
			overlay_width = max(overlay_width, string_width(text) + 4);
			var w =  max(32, string_width(text) + 6);
			draw_sprite_ext(spr_settings_option_rectangle_left, 0, 4, overlay_height + 1, w/28, 15/10, 0, c_white, 1);
			draw_text(4, overlay_height, text);
			overlay_height += 16;	
		}						
	}
	
	overlay_width += 4;
	overlay_height += 4;
	overlay_height = min(overlay_height, WINDOW_HEIGHT);
	
	surface_reset_target();
	if(selected_object && instance_exists(selected_object))
	{	
		draw_set_color(c_green);

		var draw_left = selected_object.bbox_left - camera_x;
		var draw_right = selected_object.bbox_right - camera_x - 1;
		var draw_top = selected_object.bbox_top - camera_y;
		var draw_bottom = selected_object.bbox_bottom - camera_y - 1;
	
		draw_rectangle(draw_left, draw_top, draw_right, draw_bottom, true);
	
		draw_set_alpha(0.1);
		draw_rectangle(draw_left, draw_top, draw_right, draw_bottom, false);
		draw_set_alpha(1);
	}
	
	draw_sprite_ext(spr_generic_rectangle, 0, overlay_x, overlay_y, overlay_width / 7, overlay_height / 160, 0, c_white, 1);
	//gpu_set_blendenable(false);	
	draw_surface_part(overlay_surf, 0, 0, overlay_width, overlay_height, overlay_x, overlay_y);
	//gpu_set_blendenable(true);	
	
}
