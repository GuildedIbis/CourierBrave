//
if (place_meeting(x,y,obj_player))
{
	if (global.aggroCounter = 0)
	{
		draw_set_font(xfnt_text);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_text_transformed(x+8,y+2,"Enter",.25,.25,0);
	}
	else
	{
		draw_set_font(xfnt_text);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_text_transformed(x+8,y+2,"In Combat",.25,.25,0);
	}
}
