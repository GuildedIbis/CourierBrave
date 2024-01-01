// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function xAspectsMenuGUI(){
//var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

draw_sprite_stretched(spr_menu,3,71,44,58,80);
draw_sprite_stretched(spr_menu,3,131,44,58,80);
draw_sprite_stretched(spr_menu,3,191,44,58,80);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(101,54,"ITEMS",.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(100,54,"ITEMS",.5,.5,0);
draw_set_color(c_black);
draw_text_transformed(161,54,"POTIONS",.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(160,54,"POTIONS",.5,.5,0);
draw_set_color(c_black);
draw_text_transformed(221,54,"TREASURE",.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(220,54,"TREASURE",.5,.5,0);
draw_sprite(spr_aspects_icons,0,101,94);
draw_sprite(spr_aspects_icons,1,161,94);
draw_sprite(spr_aspects_icons,2,221,94);

if (point_in_rectangle(_mouseX,_mouseY,71,44,129,124)) //Items Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,69,42,62,84);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = ItemsMenuGUI;	
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,131,44,189,124)) //Items Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,129,42,62,84);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		//inv_gui = PotionsMenuGUI;	
		page = 0;
	}
}
}