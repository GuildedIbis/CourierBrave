/// @description Insert description here
if (place_meeting(x,y,obj_player))
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(34,30,"Press \"E\" to pickup",.5,.5,0)
	draw_sprite(spr_menu_square16,0,16,23)
	draw_set_color(c_white);
	draw_sprite(sprite_index,image_index,24,31)
}