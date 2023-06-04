//Quick Swap
//
//
//
//
//
//Inventory Quick Swap - Weapon Wheel
function InventoryQuickSwap(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	





var _rowLength = 6;
//draw_sprite_stretched(spr_menu_beveled,3,69,42,90,18);
//draw_sprite_stretched(spr_menu_beveled,3,82,62,64,64);
//Button Mechanics
for (var i = 0; i < 18; i = i + 1)
{
	var _x2 = 84 + (i mod _rowLength) * 22;
	var _y2 = 41 + (i div _rowLength) * 22;
	draw_sprite_stretched(spr_menu_circle16,1,_x2,_y2,20,20)
	if (obj_inventory.form_grid[# i, 4] = true) 
	{
		draw_sprite(spr_formSelect_icons,i,_x2 + 10,_y2 + 12);
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+20,_y2+20))
		{
			draw_sprite_stretched_ext(spr_highlight_circle,1,_x2-1,_y2-1,22,22,c_white,1.0)
			if (mouse_check_button_pressed(mb_left))
			{
				//audio_sound_gain(snd_menu,global.volumeMenu,1);
				//audio_play_sound(snd_menu,0,false);
				//inv_gui = FormMenuGUI;
				//form_menu = obj_inventory.form_grid[# i, 3];
				//selected_info = -1;
				slot = i;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				with (obj_player) 
				{
					form = other.slot;
					script_execute(obj_inventory.form_grid[# form, 2]);
				}
			}
		}
	}
}





//draw_sprite_stretched(menu_sprite,3,64,36,192,96);
////Set Text
//draw_set_font(fnt_text);
//draw_set_color(c_white);
//draw_set_halign(fa_left);
//draw_set_valign(fa_middle);
	
////Draw Text
//draw_text_transformed(64,28,"TAB to resume",.5,.5,0);
//draw_set_halign(fa_center);
//draw_sprite(spr_inventory_tabs,0,66,132)
//draw_text_transformed(80,142,"MAP",.35,.35,0);	
//draw_text_transformed(106,142,"ITEMS",.35,.35,0);	
//draw_text_transformed(132,142,"PLAYER",.35,.35,0);
//draw_text_transformed(158,142,"EQUIPMENT",.35,.35,0);
//draw_text_transformed(184,142,"EXIT",.35,.35,0);

}
