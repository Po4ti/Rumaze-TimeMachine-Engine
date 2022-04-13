/// @description cutscene control
t ++;

if(cutscene)
{
	if(global.hud_message == "")
	{
		global.hud_message = scr_get_string("secret_item_get");
	}
	
	if(cutscene_t < 30)
		darkness_alpha += 1/60;
		
	if(cutscene_t < 120)
		y -= 0.3;
	if(cutscene_t >= 120 && cutscene_t < 220)
	{
		image_alpha -= 1/100;	
	}
	
	if(cutscene_t > 230 && cutscene_t <= 280)
		darkness_alpha -= 1/100;
	
	if(cutscene_t == 280)
	{
		global.item[item_num] = true;
		instance_destroy();		
		with(obj_player)
		{
			frozen = false;	
		}
	}
	
	cutscene_t ++;
}
else
{
	y = ystart + 2 * dsin(t * 4);
}

video_draw()
