//Draw Kephra Stone

// Inherit the parent event
event_inherited();

//Draw Text: "E to Activate"
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	draw_set_font(fnt_text);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_transformed(x,y+2,"\"E\" to activate.",.25,.25,0)
}

