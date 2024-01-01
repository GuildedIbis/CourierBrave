//Create Item Array
function xscr_inventory_items_create(){
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
//Menu: Upgrade Items
function xscr_menu_upgrade_items(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 5;

//Text
draw_set_font(global.fnt_main_white);
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
draw_sprite_stretched(spr_menu_circle16,1,256,35,16,16);
draw_set_color(c_white)
draw_text_transformed(159,45,"POWER STONE",1,1,0);	
draw_text_transformed(140,93,"ROG STONE",1,1,0);	
draw_text_transformed(220,93,"STAR ORB",.75,.75,0);	
draw_sprite_ext(spr_resource_all,0,264,45,1,1,0,c_white,1);
//Item Grid
for (var i = 0; i < 10; i = i + 1)
{
	var _x = 75 + (i * 17);
	var _y = 53;
	draw_sprite(spr_item_box,0,_x,_y)
	draw_sprite(spr_powerstone_all,i, _x+8, _y+8)
	draw_text_transformed(_x + 8,_y + 18,_object.ps_array[i],.5,.5,0);		
}
for (var j = 0; j < 6; j = j + 1)
{
	var _x2 = 91 + (j  * 17);
	var _y2 = 101;
	draw_sprite(spr_item_box,0,_x2,_y2)
	draw_sprite(spr_rog_all,j, _x2 + 8, _y2 + 8);
	draw_text_transformed(_x2 + 8,_y2 + 18,_object.rog_array[j],.5,.5,0);		
}
draw_sprite(spr_item_box,0,213,101)
draw_sprite(spr_starOrb,0, 217, 105);
draw_text_transformed(221,119,_object.star_orb,.5,.5,0);	

//Switch Item Menu
if (point_in_rectangle(_mouseX,_mouseY,256,35,272,51))
{
	draw_sprite_stretched(spr_highlight_circle,0,255,34,18,18)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = scr_menu_resource_items;
		page = 0;
	}
}


}
//
//
//
//
//
//Menu: Resource Items
function xscr_menu_resource_items(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 10;

//Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu_beveled,3,70,35,179,102);
draw_sprite_stretched(spr_menu,8,65,35,189,16);
draw_sprite_stretched(spr_menu_circle16,1,256,35,16,16);
draw_set_color(c_white)
draw_text_transformed(159,45,"RESOURCES",1,1,0);	
draw_sprite_ext(spr_starOrb,0,260,39,1,1,0,c_white,1);


//Item Grid
for (var i = 0; i < 40; i = i + 1)
{
	var _x = 75 + ((i mod _rowLength) * 17);
	var _y = 53 + ((i div _rowLength) * 21);
	draw_sprite(spr_item_box,0,_x,_y)
	if (_object.resource_array[i] > 0)
	{
		draw_sprite(spr_resource_menu_all,i, _x, _y);
		draw_text_transformed(_x+8,_y + 18,_object.resource_array[i],.5,.5,0);
	}
	else draw_text_transformed(_x+8,_y+10, "?",1,1,0);
}

//Swith Item Menu
if (point_in_rectangle(_mouseX,_mouseY,256,35,272,51))
{
	draw_sprite_stretched(spr_highlight_circle,0,255,34,18,18)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = scr_menu_upgrade_items;
		page = 0;
	}
};

}
//
//
//
//
//
//Draw Selected
function xDrawSelectedItem(_gearType,_gearSprite){
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
