//Draw Chest

//Inherit Parent Event: Contains Draw Self
event_inherited();

//Draw Chest Text: "E to Open" or "Opened"
if (point_in_circle(obj_player.x,obj_player.y,x,y,12)) and (global.dayPhase = 2)
{
	draw_set_font(fnt_text);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	if (obj_inventory.chest_list[activate_args] = false) draw_text_transformed(x,y+2,"\"E\" to open.",.25,.25,0)
	if (obj_inventory.chest_list[activate_args] = true) draw_text_transformed(x,y+2,"Chest opened.",.25,.25,0)
}

