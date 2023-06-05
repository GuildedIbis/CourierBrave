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

QuickSwapMenuMeters();
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
//
//
//
//
//Quick Swap Meters
function QuickSwapMenuMeters(){
var _max = 50 + (3 * (obj_player.grace + round(obj_player.grace/15)))
var _yellow = (obj_player.yellow_charge/_max) * 100;
var _blue = (obj_player.blue_charge/_max) * 100;
var _purple = (obj_player.purple_charge/_max) * 100;
var _red = (obj_player.red_charge/_max) * 100;
var _green = (obj_player.green_charge/_max) * 100;
var _orange = (obj_player.orange_charge/_max) * 100;

draw_healthbar(58,51,67,111,_yellow,c_black,c_yellow,c_yellow,3,true,true);
draw_healthbar(101,51,110,111,_blue,c_black,c_blue,c_blue,3,true,true);
draw_healthbar(144,51,153,111,_purple,c_black,c_purple,c_purple,3,true,true);
draw_healthbar(187,51,196,111,_red,c_black,c_red,c_red,3,true,true);
draw_healthbar(230,51,239,111,_green,c_black,c_green,c_green,3,true,true);
draw_healthbar(273,51,282,111,_orange,c_black,c_orange,c_orange,3,true,true);
}