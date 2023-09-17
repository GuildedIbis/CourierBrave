//Quick Swap
//
//
//
//
//
//Inventory Quick Swap - Weapon Wheel
function scr_inventory_quickswap(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 6;
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);

scr_inventory_quickswap_meters();
draw_sprite(spr_quickswap_groupMeter,1,23,48);
draw_sprite(spr_quickswap_groupMeter,1,69,48);
draw_sprite(spr_quickswap_groupMeter,1,115,48);
draw_sprite(spr_quickswap_groupMeter,1,161,48);
draw_sprite(spr_quickswap_groupMeter,1,207,48);
draw_sprite(spr_quickswap_groupMeter,1,253,48);

//Button Mechanics
for (var i = 0; i < 18; i = i + 1)
{
	var _x2 = 26 + (i mod _rowLength) * 46;
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
function scr_inventory_quickswap_meters(){
var _max = obj_player.max_charge

//Magic
var _yellow = (obj_player.yellow_primary/_max) * 100;
var _blue = (obj_player.blue_primary/_max) * 100;
var _purple = (obj_player.purple_primary/_max) * 100;
var _red = (obj_player.red_primary/_max) * 100;
var _green = (obj_player.green_primary/_max) * 100;
var _orange = (obj_player.orange_primary/_max) * 100;
draw_healthbar(48,51,51,111,_yellow,c_black,c_yellow,c_yellow,3,true,true);
draw_healthbar(95,51,98,111,_orange,c_black,c_orange,c_orange,3,true,true);
draw_healthbar(141,51,144,111,_purple,c_black,c_purple,c_purple,3,true,true);
draw_healthbar(187,51,190,111,_blue,c_black,c_blue,c_blue,3,true,true);
draw_healthbar(233,51,236,111,_green,c_black,c_green,c_green,3,true,true);
draw_healthbar(279,51,282,111,_red,c_black,c_red,c_red,3,true,true);

//Special
var _yellowS = (obj_player.yellow_special/_max) * 100;
var _blueS = (obj_player.blue_special/_max) * 100;
var _purpleS = (obj_player.purple_special/_max) * 100;
var _redS = (obj_player.red_special/_max) * 100;
var _greenS = (obj_player.green_special/_max) * 100;
var _orangeS = (obj_player.orange_special/_max) * 100;
draw_healthbar(55,51,58,111,_yellowS,c_black,c_yellow,c_yellow,3,true,true);
draw_healthbar(102,51,105,111,_orangeS,c_black,c_orange,c_orange,3,true,true);
draw_healthbar(148,51,151,111,_purpleS,c_black,c_purple,c_purple,3,true,true);
draw_healthbar(194,51,197,111,_blueS,c_black,c_blue,c_blue,3,true,true);
draw_healthbar(240,51,243,111,_greenS,c_black,c_green,c_green,3,true,true);
draw_healthbar(286,51,289,111,_redS,c_black,c_red,c_red,3,true,true);
//draw_ring_healthbar(85,30,obj_player.yellow_charge,_max,c_yellow,12,1,4);
}
//
//
//
//
//
//Draw Pie Healthbar
function draw_pie_healthbar(_x,_y,_value,_max,_color,_radius,_alpha){
	if (_value > 0)
	{
		var i, len, tx, ty, val;
		var numOfSections = 60;
		var sizeOfSection = 360/numOfSections;
		
		val = (_value/_max) * numOfSections;
		
		if (val > 1) 
		{
			draw_set_color(_color);
			draw_set_alpha(_alpha);
			draw_primitive_begin(pr_trianglefan);
			draw_vertex(_x,_y);
				
			for (i = 0; i < val; i = i + 1)
			{
				len = (i * sizeOfSection) + 90;	
				tx = lengthdir_x(_radius,len);
				ty = lengthdir_y(_radius,len);
				draw_vertex(_x + tx,_y + ty);
			}
			draw_primitive_end();
				
		}
		draw_set_alpha(1);
	}
}
//
//
//
//
//
//Draw Ring Healthbar
function draw_ring_healthbar(_x,_y,_value,_max,_color,_radius,_alpha,_width){
	if (_value > 0)
	{
		var i, len, tx, ty, val;
		var numOfSections = 60;
		var sizeOfSection = 360/numOfSections;
		
		val = (_value/_max) * numOfSections;
		
		if (val > 1) 
		{
			pie_surf = surface_create(_radius*2,_radius*2);
			
			draw_set_color(_color);
			draw_set_alpha(_alpha);
			surface_set_target(pie_surf);
			draw_clear_alpha(c_blue,0.7);
			draw_clear_alpha(c_black,0);
			
			draw_primitive_begin(pr_trianglefan);
			draw_vertex(_radius,_radius);
				
			for (i = 0; i <= val; i = i + 1)
			{
				len = (i * sizeOfSection) + 90;	
				tx = lengthdir_x(_radius,len);
				ty = lengthdir_y(_radius,len);
				draw_vertex(_radius + tx,_radius + ty);
			}
			draw_primitive_end();
			draw_set_alpha(1);
			
			gpu_set_blendmode(bm_subtract);
			draw_set_colour(c_black);
			draw_circle(_radius-1,_radius-1,_radius - _width, false);
			gpu_set_blendmode(bm_normal);
			
			surface_reset_target();
			draw_surface(pie_surf,_x-_radius,_y-_radius);
			surface_free(pie_surf);
				
		}
		
	}
}