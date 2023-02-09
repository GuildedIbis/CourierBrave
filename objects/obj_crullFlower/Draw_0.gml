//Draw Crull Flower

// Inherit the parent event
event_inherited();


//Draw Crull Flower World Text
if (moon = true)
{
	sprite_index = spr_crull_moonFlower;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
	{
		draw_set_font(fnt_text);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		if (obj_inventory.crullM_list[activate_args] = false) draw_text_transformed(x,y+2,"\"E\" to use.",.25,.25,0);
		if (obj_inventory.crullM_list[activate_args] = true) draw_text_transformed(x,y+2,"Crull flower used.",.25,.25,0);
	}
}
if (moon = false)
{
	sprite_index = spr_crull_sunFlower;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
	{
		draw_set_font(fnt_text);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		if (obj_inventory.crullS_list[activate_args] = false) draw_text_transformed(x,y+2,"\"E\" to use.",.25,.25,0);
		if (obj_inventory.crullS_list[activate_args] = true) draw_text_transformed(x,y+2,"Crull flower used.",.25,.25,0);
	}
}
