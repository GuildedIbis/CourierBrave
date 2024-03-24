//
//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
if (obj_game.gamePaused = false)
{
	if (place_meeting(x,y,obj_player)) and (interact != -1)
	{
		draw_text_transformed(160,160,"PRESS \"E\" TO INTERACT",.5,.5,0);
	}
}
