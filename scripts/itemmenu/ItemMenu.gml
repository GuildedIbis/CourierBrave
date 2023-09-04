//Item Menu 
function scr_items_create(){
//Create Items
beans = 0;
star_orb = 0;
rog_array = array_create(6,0);
ps_array = array_create(10,0);
resource_array = array_create(40,0);

}
//
//
//
//
//
//Items GUI
function scr_menu_upgrade_items(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 5;

//Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite(spr_menu_rope,3,91,75);
draw_sprite(spr_menu_rope,3,188,75);
draw_sprite(spr_menu_rope,3,219,75);
draw_sprite_stretched(spr_menu_beveled,3,70,35,179,42);
draw_sprite_stretched(spr_menu,8,65,35,189,16);
draw_sprite_stretched(spr_menu_beveled,3,86,83,111,42);
draw_sprite_stretched(spr_menu,8,81,83,121,16);
draw_sprite_stretched(spr_menu_beveled,3,208,83,26,42);
draw_sprite_stretched(spr_menu,8,203,83,36,16);
draw_sprite_stretched(spr_menu_circle16,8,142,132,36,16);
draw_set_color(c_black)
draw_text_transformed(160,43,"POWER STONE",.5,.5,0);	
draw_text_transformed(141,91,"ROG STONE",.5,.5,0);	
draw_text_transformed(221,91,"STAR ORB",.35,.35,0);	
draw_set_color(c_white)
draw_text_transformed(159,43,"POWER STONE",.5,.5,0);	
draw_text_transformed(140,91,"ROG STONE",.5,.5,0);	
draw_text_transformed(220,91,"STAR ORB",.35,.35,0);	
//Item Grid
for (var i = 0; i < 10; i = i + 1)
{
	var _x = 75 + (i * 17);
	var _y = 53;
	draw_sprite(spr_item_box,0,_x,_y)
	draw_sprite(spr_powerstone_all,i, _x + 8, _y + 8);
	draw_text_transformed(_x + 8,_y + 18,_object.ps_array[i],.35,.35,0);		
}
for (var j = 0; j < 6; j = j + 1)
{
	var _x2 = 91 + (j  * 17);
	var _y2 = 101;
	draw_sprite(spr_item_box,0,_x2,_y2)
	draw_sprite(spr_rog_all,j, _x2 + 8, _y2 + 8);
	draw_text_transformed(_x2 + 8,_y2 + 18,_object.rog_array[j],.35,.35,0);		
}
draw_sprite(spr_item_box,0,213,101)
draw_sprite(spr_starOrb,0, 217, 105);
draw_text_transformed(221,119,_object.star_orb,.35,.35,0);	
//Spacer Line
if (point_in_rectangle(_mouseX,_mouseY,142,132,178,148))
{
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = scr_menu_resource_items;
		page = 0;
	}
}
//Draw Selected Item
//DrawSelectedItem(item_grid,spr_item_all);

}
//
//
//
//
//
//Items GUI
function scr_menu_resource_items(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 5;

//Text
draw_set_font(global.fnt_main_gold);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite(spr_menu_rope,3,91,75);
draw_sprite(spr_menu_rope,3,188,75);
draw_sprite(spr_menu_rope,3,219,75);
draw_sprite_stretched(spr_menu_beveled,3,70,35,179,42);
draw_sprite_stretched(spr_menu,8,65,35,189,16);
draw_sprite_stretched(spr_menu_beveled,3,86,83,111,42);
draw_sprite_stretched(spr_menu,8,81,83,121,16);
draw_sprite_stretched(spr_menu_beveled,3,208,83,26,42);
draw_sprite_stretched(spr_menu,8,203,83,36,16);
draw_set_color(c_white)
draw_text_transformed(159,43,"RESOURCES",1,1,0);	

//Item Grid
for (var i = 0; i < 10; i = i + 1)
{
	var _x = 75 + (i * 17);
	var _y = 53;
	draw_sprite(spr_item_box,0,_x,_y)
	draw_sprite(spr_powerstone_all,i, _x + 8, _y + 8);
	draw_text_transformed(_x + 8,_y + 18,_object.ps_array[i],.35,.35,0);		
}
for (var j = 0; j < 6; j = j + 1)
{
	var _x2 = 91 + (j  * 17);
	var _y2 = 101;
	draw_sprite(spr_item_box,0,_x2,_y2)
	draw_sprite(spr_rog_all,j, _x2 + 8, _y2 + 8);
	draw_text_transformed(_x2 + 8,_y2 + 18,_object.rog_array[j],.35,.35,0);		
}
draw_sprite(spr_item_box,0,213,101)
draw_sprite(spr_starOrb,0, 217, 105);
draw_text_transformed(221,119,_object.star_orb,.35,.35,0);	
//Spacer Line
//draw_line_width_color(217,36,217,136,1,c_black,c_black)
draw_text_transformed(140,129,_object.resource_array[0],.35,.35,0);	
draw_text_transformed(150,129,_object.resource_array[1],.35,.35,0);	
draw_text_transformed(160,129,_object.resource_array[2],.35,.35,0);	
draw_text_transformed(170,129,_object.resource_array[3],.35,.35,0);	
//Draw Selected Item
//DrawSelectedItem(item_grid,spr_item_all);

}
//
//
//
//
//
//Items GUI
function xItemsMenuGUI(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLengthB = 10;

//Lefthand Buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


//Item Grid
for (var i = 0; i < 40; i = i + 1)
{
	var _x2 = 74 + (i mod _rowLengthB) * 17;
	var _y2 = 42 + (i div _rowLengthB) * 17;
	draw_sprite(spr_item_box,0,_x2,_y2)
	if (_object.item_grid[# i, 3] = true) 
	{
		if (_object.item_grid[# i, 0] != -1) 
		{
			draw_sprite(spr_item_all,_object.item_grid[# i, 0], _x2 + 8, _y2 + 8);
			draw_set_halign(fa_right);
			draw_text_transformed(_x2 + 13,_y2 + 12, string(_object.item_grid[# i, 2]),.35,.35,0);
			draw_set_halign(fa_left);
		}
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+15,_y2+15))
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,_x2-1,_y2-1,18,18)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				slot = i;
				item_id = _object.item_grid[# i, 0];
				item_name = global.items[# item_id, 0];
				sell_price = global.items[# item_id, 1];
				buy_price = 0;
			}
		}
	}
	else draw_sprite(spr_item_all,0, _x2 + 8, _y2 + 8);
}

//Spacer Line
//draw_line_width_color(217,36,217,136,1,c_black,c_black)
draw_text(32,32,_object.rog_array[0]);
draw_text(48,32,_object.rog_array[1]);
draw_text(64,32,_object.rog_array[2]);
draw_text(80,32,_object.rog_array[3]);
draw_text(96,32,_object.rog_array[4]);
draw_text(112,32,_object.rog_array[5]);
draw_text(128,32,_object.ps_array[0]);
//Draw Selected Item
DrawSelectedItem(item_grid,spr_item_all);

}
//
//
//
//
//
//Draw Selected
function DrawSelectedItem(_gearType,_gearSprite){
//Convert Mouse to GUI 1834
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

draw_sprite_stretched(spr_menu_circle16,1,70,110,16,16);
draw_sprite_stretched(spr_menu,3,88,111,72,14);
draw_sprite_stretched(spr_menu,3,162,111,40,14);
draw_sprite_stretched(spr_menu,3,204,111,40,14);

if (item_id != -1)
{
	var _gearName = string(global.items[# item_id,0]);
	var _quantity = string(_object.item_grid[# slot, 2]);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_stretched(spr_item_all,item_id,70,110,16,16);
	draw_text_transformed(83,122,_quantity,.35,.35,0);
	draw_text_transformed(124,118,_gearName,.35,.35,0);
	draw_text_transformed(182,118,"Drop 1",.35,.35,0);
	draw_text_transformed(224,118,"Drop All",.35,.35,0);
	
	if (point_in_rectangle(_mouseX,_mouseY,162,111,202,125))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,160,109,44,18);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			with (instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_item))
			{
				item_id = other.item_id;
				amount = 1;
				sprite_index = spr_item_all;
				image_index = item_id;
				direction = irandom_range(0,359);
				spd = .75 + (.3) + random(0.1);
				game_paused_image_speed = 0;
			}
			_object.item_grid[# slot, 2] = _object.item_grid[# slot, 2] - 1;
			LastItemRemove(obj_inventory);
			//Reset Buy/Sell Menu
			if (_object.item_grid[# slot, 2] <= 0)
			{
				page = 0;
				slot = -1;
				item_id = -1;
				item_name = -1;
				sell_price = 0;
				buy_price = 0;
			}
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,204,111,244,125))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,202,109,44,18);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			with (instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_item))
			{
				item_id = other.item_id;
				amount = obj_inventory.item_grid[# other.slot, 2];
				sprite_index = spr_item_all;
				image_index = item_id;
				direction = irandom_range(0,359);
				spd = .75 + (.3) + random(0.1);
				game_paused_image_speed = 0;
			}
			_object.item_grid[# slot, 2] = _object.item_grid[# slot, 2] - _object.item_grid[# slot, 2];
			LastItemRemove(obj_inventory);
			//Reset Buy/Sell Menu
			if (_object.item_grid[# slot, 2] <= 0)
			{
				page = 0;
				slot = -1;
				item_id = -1;
				item_name = -1;
				sell_price = 0;
				buy_price = 0;
			}
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,240,114,316,127))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,238,112,80,17);
		if (mouse_check_button_pressed(mb_left))
		{
		}
	}
}
}
