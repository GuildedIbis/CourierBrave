//Vendors, Smiths, Alters

//
//
//
//
//
//Draw Buy Menu
function xDrawBuyMenu(){
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
function xDrawSelectedMenu(_object){
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
function xDrawWeaponSmithMenu(_form,_object){
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
function xDrawArmorSmithMenu(_form,_object){
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
function xDrawMagicBrowiMenu(_form,_object){
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
function xDrawSpecialBrowiMenu(_form,_object){
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
function xDrawCGBrowiMenu(_form,_object){
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

