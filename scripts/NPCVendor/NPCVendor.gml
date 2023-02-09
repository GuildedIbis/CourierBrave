//Vendors, Smiths, Alters
//
//
//
//
//
//Draw Inventory
function DrawSellMenu(_object){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


draw_sprite_stretched(menu_sprite,3,68,113,40,13);
draw_sprite_stretched(menu_sprite,3,112,113,40,13);
var _itemSlots = _object.item_slots;
var _rowLengthB = 5;


//Inventory 1-20
if (page = 0)
{
	draw_sprite(spr_highlight_nineslice,0,71,116)
	for (var i = 0; i < 20; i = i + 1)
	{
		var _x2 = 68 + (i mod _rowLengthB) * 18;
		var _y2 = 40 + (i div _rowLengthB) * 18;
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
				draw_sprite_stretched(spr_highlight_nineslice,0,_x2-2,_y2-2,20,20)
				if (mouse_check_button_pressed(mb_left))
				{
					audio_play_sound(snd_text02,0,false);
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
}


//Inventory 21-40
if (page = 1)
{
	draw_sprite(spr_highlight_nineslice,0,115,116)
		
	for (var i = 20; i < _itemSlots; i = i + 1)
	{
		var _x2 = 68 + ((i - 20) mod _rowLengthB) * 18;
		var _y2 = 40 + ((i - 20) div _rowLengthB) * 18;
		draw_sprite(spr_item_box,0,_x2,_y2)
		if (_object.item_grid[# i, 3] = true) 
		{
			if (_object.item_grid[# i, 0] != -1) 
			{
				draw_sprite(spr_item_all,_object.item_grid[# i, 0], _x2 + 8, _y2 + 8);
				draw_set_halign(fa_right);
				draw_text_transformed(_x2 + 14,_y2 + 12, string(item_grid[# i, 2]),.35,.35,0);
				draw_set_halign(fa_left);
			}
			if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+15,_y2+15))
			{
				draw_sprite_stretched(spr_highlight_nineslice,0,_x2-2,_y2-2,20,20)
				if (mouse_check_button_pressed(mb_left))
				{
					audio_play_sound(snd_text02,0,false);
					slot = i;
					item_id = _object.item_grid[# slot, 0];
					item_name = global.items[# item_id, 0];
					sell_price = global.items[# item_id, 1];
					buy_price = 0;
				}
			}
		}
		else draw_sprite(spr_item_all,0, _x2 + 8, _y2 + 8);
	}
}
//draw_text_transformed(68,28,"Press E to Exit",.5,.5,0);
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed(89,119,"Page 1",.35,.35,0);
draw_text_transformed(134,119,"Page 2",.35,.35,0);
if (point_in_rectangle(_mouseX,_mouseY,113,113,153,120))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,110,111,44,17);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_play_sound(snd_text01,0,false);
		page = 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,68,113,108,120))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,111,44,17);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_play_sound(snd_text01,0,false);
		page = 0;
	}
}
}
//
//
//
//
//
//Draw Buy Menu
function DrawBuyMenu(){
var _itemSlots = 8;
var _rowLengthB = 2;


for (var i = 0; i < _itemSlots; i = i + 1)
{
	var _x2 = 167 + (i mod _rowLengthB) * 18;
	var _y2 = 40 + (i div _rowLengthB) * 18;
	draw_sprite(spr_item_box,0,_x2,_y2)
	//if (_object.item_grid[# i, 0] != -1)
	//{
	//	draw_sprite(spr_item_all,_object.item_grid[# i, 0], _x2 + 8, _y2 + 8);
	//}
		//if (inventory[i] != -1)
		//{
		//}
}
draw_sprite_stretched(spr_item_box,0,167,112,34,16)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
//if (point_in_rectangle(_mouseX,_mouseY,113,113,153,120))
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,110,111,44,17);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		page = 1;
//	}
//}

}
//
//
//
//
//
//Draw Selected
function DrawSelectedMenu(_object){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

draw_sprite_stretched(spr_item_box,0,212,40,34,34)
draw_sprite_stretched(menu_sprite,3,209,84,40,13);
draw_sprite_stretched(menu_sprite,3,209,99,40,13);
draw_sprite_stretched(menu_sprite,3,209,114,40,13);

if (item_id != -1)
{
	draw_sprite_stretched(spr_item_all,item_id,212,40,32,32);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(228,79,global.items[# item_id,0],.5,.5,0)
}
if (buy_price != 0)
{
}
if (sell_price != 0)
{
	draw_set_halign(fa_left);
	var _sellPrice = "SELL: " + string(sell_price);
	draw_text_transformed(214,91,_sellPrice,.35,.35,0);
	if (point_in_rectangle(_mouseX,_mouseY,209,84,249,97))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,207,82,44,17);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_play_sound(snd_text03,0,false);
			_object.item_grid[# slot, 2] = _object.item_grid[# slot, 2] - 1;
			obj_player.beans = obj_player.beans + global.items[# item_id , 1];
			LastItemRemove(_object);
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
}
}
//
//
//
//
//
//Draw Smith Weapons Upgrade Menu
function DrawWeaponSmithMenu(_form,_object){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
var _weaponDraw = obj_player.melee_draw;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite_stretched(menu_sprite,3,64,36,192,96);
draw_sprite_stretched(spr_menu_circle16,1,70,56,20,20);
draw_sprite(spr_weapons_allGame,_form,64,56);


script_execute(_weaponDraw);
}
//
//
//
//
//
//Draw Smith Armor Upgrade Menu
function DrawArmorSmithMenu(_form,_object){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
//
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _armorDraw = obj_player.armor_draw;
draw_sprite_stretched(menu_sprite,3,64,36,192,96);
draw_sprite_stretched(spr_menu_circle16,1,70,56,20,20);
draw_sprite(spr_armor_allGame,_form,64,56);
script_execute(_armorDraw);
}
//
//
//
//
//
//Draw Browi Magic Upgade Menu
function DrawMagicBrowiMenu(_form,_object){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
//
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _magicDraw = obj_player.magic_draw;
draw_sprite_stretched(menu_sprite,3,64,36,192,96);
draw_sprite_stretched(spr_menu_circle16,1,70,56,20,20);
draw_sprite(spr_magic_allGame,_form,64,56);
script_execute(_magicDraw);
}
//
//
//
//
//
//Draw Browi Special Upgrade Menu
function DrawSpecialBrowiMenu(_form,_object){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
//
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _specialDraw = obj_player.special_draw;
draw_sprite_stretched(menu_sprite,3,64,36,192,96);
draw_sprite_stretched(spr_menu_circle16,1,70,56,20,20);
draw_sprite(spr_special_allGame,_form,64,56);
script_execute(_specialDraw);
}
//
//
//
//
//
//Draw Browi Magic Upgade Menu
function DrawCGBrowiMenu(_form,_object){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
obj_player.scene = true;
if (point_in_rectangle(_mouseX,_mouseY,16,64,47,79))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,14,62,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		scene = false;
	}
}
}

