//NPC Storage
//Kovalads House North of Lenko Main
//Store Infinite Items
//
//
//
//
//
//Storage Create
function xStorageCreate(){
entity_step = StorageStep;
sound = snd_chest;
animation_counter = 0;
animation_timer = 180;
}
//
//
//
//
//
//Storage Step
function xStorageStep(){
sprite_index = spr_chest;
image_index = 0;
}
//
//
//
//
//
//Storage Text
function xStorageText(){
//Before Talking to Nisma
if (obj_inventory.quest_grid[# 1, 0] = false)
{
	//Quest info
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "STORAGE\nBetter ask Nisma first." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
		//Revert if broken^
	
		//Reset Buy/Sell Menu
		page = 0;
		slot = -1;
		item_id = -1;
		item_name = -1;
		sell_price = 0;
		buy_price = 0;
	}
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//After First Conversation with Nisma
if (obj_inventory.quest_grid[# 1, 0] = true)
{
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "STORAGE\nUnlimited storage for items." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 1)
	{
		text_script = StorageMenu;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
	
		//Reset Buy/Sell Menu
		page = 0;
		slot = -1;
		item_id = -1;
		item_name = -1;
		sell_price = 0;
		buy_price = 0;
	}
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
}
}
//
//
//
//
//
//Storage Menu
function xStorageMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);


//Lefthand Buttons
draw_sprite_stretched(button_sprite,3,70,142,88,15);
draw_sprite_stretched(button_sprite,3,162,142,88,15);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(114,149,"INVENTORY",.5,.5,0);
draw_text_transformed(208,149,"STORAGE",.5,.5,0);


if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 1;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		
		//Reset Buy/Sell Menu
		page = 0;
		slot = -1;
		item_id = -1;
		item_name = -1;
		sell_price = 0;
		buy_price = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,162,142,250,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 2;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		
		//Reset Buy/Sell Menu
		page = 0;
		slot = -1;
		item_id = -1;
		item_name = -1;
		sell_price = 0;
		buy_price = 0;
		
	}
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (text_gui = 0) 
{
	
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
}
if (text_gui = 1) 
{
	draw_sprite_stretched(menu_sprite,3,64,36,192,96);
	draw_text_transformed(64,28,"Press E to Exit",.5,.5,0);
	//DrawWeaponSmithMenu(obj_player.form,obj_inventory);
	DrawItemSMenu();
}
if (text_gui = 2) 
{
	draw_sprite_stretched(menu_sprite,3,64,36,192,96);
	draw_text_transformed(64,28,"Press E to Exit",.5,.5,0);
	DrawStorageMenu();
}

if (keyboard_check_pressed(ord("E")))
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
		
}

}
//
//
//
//
//
//Items GUI from Storage
function xDrawItemSMenu(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLengthB = 10;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

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

//Draw Selected Item
DrawStoreSelectedItem(_object.item_grid,spr_item_all);

}	
//
//
//
//
//
//Draw Selected
function xDrawStoreSelectedItem(_gearType,_gearSprite){
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
	draw_text_transformed(182,118,"Store 1",.35,.35,0);
	draw_text_transformed(224,118,"Store All",.35,.35,0);
	
	if (point_in_rectangle(_mouseX,_mouseY,162,111,202,125))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,160,109,44,18);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			_object.item_grid[# slot, 2] = _object.item_grid[# slot, 2] - 1;
			_object.storage_array[item_id] = _object.storage_array[item_id] + 1;
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
			var _amount = _object.item_grid[# slot, 2]
			_object.item_grid[# slot, 2] = _object.item_grid[# slot, 2] - _amount;
			_object.storage_array[item_id] = _object.storage_array[item_id] + _amount;
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
//
//
//
//
//
//Stroage GUI
function xDrawStorageMenu(){
//Variable Declaration
var _object = obj_inventory;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLengthB = 10;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Lefthand Buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


//Item Grid
for (var i = 0; i < 40; i = i + 1)
{
	var _x2 = 74 + (i mod _rowLengthB) * 17;
	var _y2 = 42 + (i div _rowLengthB) * 17;
	draw_sprite(spr_item_box,0,_x2,_y2)
	if (_object.storage_array[i+1] > 0) 
	{
		draw_sprite(spr_item_all,i+1, _x2 + 8, _y2 + 8);
		draw_set_halign(fa_right);
		draw_text_transformed(_x2 + 13,_y2 + 12, string(_object.storage_array[i+1]),.35,.35,0);
		draw_set_halign(fa_left);
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+15,_y2+15))
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,_x2-1,_y2-1,18,18)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				//slot = i;
				item_id = i+1;
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

//Draw Selected Item
DrawTakeSelectedItem(_object.item_grid,spr_item_all);

}
//
//
//
//
//
//Draw Selected
function xDrawTakeSelectedItem(_gearType,_gearSprite){
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
	var _quantity = string(_object.storage_array[item_id]);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_stretched(spr_item_all,item_id,70,110,16,16);
	draw_text_transformed(83,122,_quantity,.35,.35,0);
	draw_text_transformed(124,118,_gearName,.35,.35,0);
	draw_text_transformed(182,118,"Take 1",.35,.35,0);
	draw_text_transformed(224,118,"Take All",.35,.35,0);
	
	if (point_in_rectangle(_mouseX,_mouseY,162,111,202,125))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,160,109,44,18);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			if (ItemsAdd(obj_inventory,item_id,1) = true)
			{
				_object.storage_array[item_id] = _object.storage_array[item_id] - 1;
			}
			//Reset Buy/Sell Menu
			if (_object.storage_array[item_id] <= 0)
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
	if (point_in_rectangle(_mouseX,_mouseY,204,111,250,121))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,202,109,44,18);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			var _amount = _object.storage_array[item_id];
			if (ItemsAdd(obj_inventory,item_id,_amount) = true)
			{
				_object.storage_array[item_id] = _object.storage_array[item_id] - _amount;
			}
			//Reset Buy/Sell Menu
			if (_object.storage_array[item_id] <= 0)
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
	//if (point_in_rectangle(_mouseX,_mouseY,240,114,316,127))
	//{
	//	draw_sprite_stretched(spr_highlight_nineslice,0,238,112,80,17);
	//	if (mouse_check_button_pressed(mb_left))
	//	{
	//	}
	//}
}
}