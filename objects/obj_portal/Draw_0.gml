///@description Draw self

draw_self();
gpu_set_blendmode(bm_add);

draw_sprite_ext(spr_portal_outline, outline_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

gpu_set_blendmode(bm_normal);

if(text != "")
{
	draw_set_text(c_white, fnt_visitor_14, fa_middle, fa_top);
	draw_text(x ,y - 60, text);
}
