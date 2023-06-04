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
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite(spr_quickswap_groupMeter,1,32,48);
draw_sprite(spr_quickswap_groupMeter,1,75,48);
draw_sprite(spr_quickswap_groupMeter,1,118,48);
draw_sprite(spr_quickswap_groupMeter,1,161,48);
draw_sprite(spr_quickswap_groupMeter,1,204,48);
draw_sprite(spr_quickswap_groupMeter,1,247,48);

//Button Mechanics
for (var i = 0; i < 18; i = i + 1)
{
	var _x2 = 35 + (i mod _rowLength) * 43;
	var _y2 = 51 + (i div _rowLength) * 22;
	//draw_sprite_stretched(spr_menu_circle16,1,_x2,_y2,20,20)
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
				with (all)
				{
					image_speed = game_paused_image_speed;
				}
				with (obj_inventory)
				{
					quick_swap = !quick_swap;
				}
				with (obj_game)
				{
					gamePaused = !gamePaused;
					invPaused = !invPaused;
				}
			}
		}
	}
}

}
