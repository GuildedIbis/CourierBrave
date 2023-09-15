//NPC Rhombhail
//Lenko West: Vendor
//
//
//
//
//
//Rombhail Create
function scr_npc_rhombail_create(){
entity_step = scr_npc_rhombail;
sound = snd_npc_reptile;
interact = 20;
}
//
//
//
//
//
//Rombhail Step
function scr_npc_rhombail(){
sprite_index = spr_npc_rhombail;
PlayerAnimation();
scr_npc_interact(12);
}
//
//
//
//
//
//Rombhail Text
function scr_text_rhombail(){

//Formatting
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Rhombail"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Courier... customer...\nGoods at a fair price." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 1)
{
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	text_script = scr_menu_rhombail_trade;
	//DrawBuyMenu();
	//DrawSelectedMenu(obj_inventory);
}

if (string_counter >= 2)
{
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}
//
//
//
//
//
//Draw Inventory
function scr_menu_rhombail_trade(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _object = obj_inventory;
//
//Tinted Background
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
//
draw_sprite_stretched(spr_menu_beveled,3,115,40,90,100);
draw_sprite_stretched(spr_menu,8,110,40,100,16);
draw_text_transformed(160,50,"TRADE",1,1,0);
draw_text_transformed(160,62,"GIVE > RECEIVE (HAVE)",.6,.6,0);
//
//
draw_sprite_stretched(spr_menu_circle16,3,120,66,80,16);
draw_set_halign(fa_left);
draw_text_transformed(124,76,"5 (" + string(obj_inventory.resource_array[4]) + ")",.5,.5,0);
draw_sprite_ext(spr_resource_menu_all,4,142,66,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,76,">",.75,.75,0);
draw_sprite_ext(spr_rog_menu_all,5,162,66,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,76,"1 (" + string(obj_inventory.rog_array[1]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,66,200,82))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,65,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.resource_array[4] >= 5)
		{
			obj_inventory.resource_array[4] = obj_inventory.resource_array[4] - 5;
			obj_inventory.rog_array[1] = obj_inventory.rog_array[1] + 1;
		}
	}
}
//
//
//draw_sprite_ext(spr_resource_menu_all,1,136,84,1,1,0,c_white,1);
//draw_text_transformed(160,94,">",.75,.75,0);
//draw_sprite_ext(spr_resource_menu_all,0,168,84,1,1,0,c_white,1);
draw_sprite_stretched(spr_menu_circle16,3,120,84,80,16);
draw_set_halign(fa_left);
draw_text_transformed(124,94,"1 (" + string(obj_inventory.resource_array[5]) + ")",.5,.5,0);
draw_sprite_ext(spr_resource_menu_all,5,142,84,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,94,">",.75,.75,0);
draw_sprite_ext(spr_rog_menu_all,4,162,84,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,94,"1 (" + string(obj_inventory.rog_array[4]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,84,200,100))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,83,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.resource_array[5] >= 1)
		{
			obj_inventory.resource_array[5] = obj_inventory.resource_array[5] - 1;
			obj_inventory.rog_array[4] = obj_inventory.rog_array[4] + 1;
		}
	}
}
//
//
draw_sprite_stretched(spr_menu_circle16,3,120,102,80,16);
draw_set_halign(fa_left);
draw_text_transformed(124,112,"1 (" + string(obj_inventory.rog_array[1]) + ")",.5,.5,0);
draw_sprite_ext(spr_rog_menu_all,1,142,102,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,112,">",.75,.75,0);
draw_sprite_ext(spr_resource_menu_all,3,162,102,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,112,"1 (" + string(obj_inventory.resource_array[3]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,102,200,118))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,101,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[1] >= 1)
		{
			obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
			obj_inventory.resource_array[3] = obj_inventory.resource_array[3] + 1;
		}
	}
}
//
//

draw_sprite_stretched(spr_menu_circle16,3,120,120,80,16);
if (obj_inventory.crull_recipe[2] = false)
{
	draw_set_halign(fa_left);
	draw_text_transformed(124,130,"10 (" + string(obj_inventory.rog_array[2]) + ")",.5,.5,0);
	draw_sprite_ext(spr_rog_menu_all,2,142,120,1,1,0,c_white,1);
	draw_set_halign(fa_center);
	draw_text_transformed(160,130,">",.75,.75,0);
	draw_sprite_ext(spr_menu_crull_recipe,3,162,120,1,1,0,c_white,1);
	draw_set_halign(fa_right);
	draw_text_transformed(196,130,"RECIPE",.5,.5,0); 
	if (point_in_rectangle(_mouseX,_mouseY,120,120,200,136))
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,119,82,18);
		if (mouse_check_button_pressed(mb_left))
		{
			if (obj_inventory.rog_array[2] >= 10)
			{
				obj_inventory.rog_array[2] = obj_inventory.rog_array[2] - 10;
				obj_inventory.crull_recipe[2] = true;
			}
		}
	}
}
//
draw_set_halign(fa_center);
draw_text_transformed(160,160,"PRESS \"E\" TO RESUME",.5,.5,0);
if (keyboard_check_pressed(ord("E")))
{
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
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