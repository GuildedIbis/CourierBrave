//Form Pedestal
//
//
//
//
//
//Form Pedestal Create
function scr_pedestal_form_create(){
entity_step = scr_pedestal_form;
shadow = true;
shadow_size = 2;
sound = snd_text01;
interact = 30;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
}
//
//
//
//
//
//Form Stone Pedestal Step
function scr_pedestal_form(){
if (obj_game.gamePaused = false)
{
	
	if (obj_inventory.form_grid[# activate_args, 4] = false)
	{
		scr_npc_interact(12);
		sprite_index = active_sprite;
		image_speed = 0;
		image_index = activate_args mod 6;
	}
	else
	{
		interact = -1;
		sprite_index = idle_sprite;
		image_speed = 0;
	}
}
}
//
//
//
//
//
//Halofire's Form Stone Pedestal Text
function scr_text_pedestal_form_orange(){
//Convert Mouse to GUI
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Form Pedestal"
//
//
//
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Orange Form Stone found!\nSelect one to permenantly unlock it for use.\nPress \"R\" during play to open the quick swap menu and\nselect any unlocked form." 
	_SubString = string_copy(text_string,1,letter_counter);
	page = 0;
}
if (string_counter = 1)
{
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	text_script = scr_menu_form_unlock_orange;
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
draw_text_transformed(259,110,_name,.5,.5,0);
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
}
//
//
//
//
//
//Draw Inventory
function scr_menu_form_unlock_orange(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//
//Tinted Background
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
//
//Menu and Buttons
draw_sprite_stretched(spr_menu_beveled,3,115,40,90,100);
draw_sprite_stretched(spr_menu,8,110,40,100,16);
draw_sprite_stretched(spr_menu_circle16,3,120,60,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,78,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,96,80,16);
draw_text_transformed(160,51,"ORANGE FORM STONE",1,1,0);
//
//Halofire
if (obj_inventory.form_grid[# 1, 4] = false)
{
	//Unlock Button
	draw_sprite(spr_formSelect_icons,1,128,71);
	draw_text_transformed(160,69,"HALOFIRE",.75,.75,0);
	if (point_in_rectangle(_mouseX,_mouseY,120,60,200,76))
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,59,82,18);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_inventory.form_grid[# 1, 4] = true;
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
	
	//Info Button
	draw_sprite_stretched(spr_menu_circle16,3,206,60,16,16);
	draw_text_transformed(214,68,"i",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,206,60,222,76))
	{
		draw_sprite_stretched(spr_highlight_circle,0,205,59,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			text_script = scr_menu_form_unlock_halofire_info;
		}
	}
	
}
else 
{
	draw_text_transformed(160,69,"UNLOCKED",.75,.75,0);
}
//
//Sepirel
draw_text_transformed(160,87,"COMING SOON",.75,.75,0);
//if (obj_inventory.form_grid[# 7, 4] = false)
//{
//	//Unlock Button
//	draw_sprite(spr_formSelect_icons,7,128,86);
//	draw_text_transformed(160,87,"SEPIREL",.75,.75,0);
//	if (point_in_rectangle(_mouseX,_mouseY,120,78,200,94))
//	{
//		draw_sprite_stretched(spr_highlight_circle,0,119,77,82,18);
//		if (mouse_check_button_pressed(mb_left))
//		{
//			text_string = ""
//			string_counter = 0;
//			_SubString = string_copy(text_string,1,letter_counter);
//			obj_game.gamePaused = false;
//			obj_game.textPaused = false;
	
//			//Reset Buy/Sell Menu
//			page = 0;
//			slot = -1;
//			item_id = -1;
//			item_name = -1;
//			sell_price = 0;
//			buy_price = 0;
//		}
//	}
//	
//	//Info Button
//}
//else 
//{
//	draw_text_transformed(160,87,"UNLOCKED",.75,.75,0);
//}
//
//3rd Orange Form
draw_text_transformed(160,105,"COMING SOON",.75,.75,0);
//if (obj_inventory.form_grid[# 13, 4] = false)
//{
//	draw_sprite(spr_formSelect_icons,13,128,104);
//	draw_text_transformed(160,105,"???",.75,.75,0);
//	if (point_in_rectangle(_mouseX,_mouseY,120,96,200,112))
//	{
//		draw_sprite_stretched(spr_highlight_circle,0,119,95,82,18);
//		if (mouse_check_button_pressed(mb_left))
//		{
//			text_string = ""
//			string_counter = 0;
//			_SubString = string_copy(text_string,1,letter_counter);
//			obj_game.gamePaused = false;
//			obj_game.textPaused = false;
	
//			//Reset Buy/Sell Menu
//			page = 0;
//			slot = -1;
//			item_id = -1;
//			item_name = -1;
//			sell_price = 0;
//			buy_price = 0;
//		}
//	}
//}
//else 
//{
//	draw_text_transformed(160,105,"UNLOCKED",.75,.75,0);
//}


//Exit
//draw_set_halign(fa_center);
//draw_text_transformed(160,160,"PRESS \"E\" TO RESUME",.5,.5,0);
//if (keyboard_check_pressed(ord("E")))
//{
//	text_string = ""
//	string_counter = 0;
//	_SubString = string_copy(text_string,1,letter_counter);
//	obj_game.gamePaused = false;
//	obj_game.textPaused = false;
	
//	//Reset Buy/Sell Menu
//	page = 0;
//	slot = -1;
//	item_id = -1;
//	item_name = -1;
//	sell_price = 0;
//	buy_price = 0;
//}
}
//
//
//
//
//
//Halofire Unlock Info
function scr_menu_form_unlock_halofire_info(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//
//Tinted Background
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
//
//Return Button
draw_sprite_stretched(spr_menu_circle16,3,40,86,32,16);
draw_sprite(spr_menu_arrow,2,40,94);
draw_text_transformed(48,92,"RETURN",.5,.5,0); 
if (point_in_rectangle(_mouseX,_mouseY,32,86,48,102))
{
	draw_sprite_stretched(spr_highlight_circle,0,31,85,18,18);
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = scr_menu_form_unlock_orange;
	}
}
//
//Armor
draw_sprite_stretched(spr_menu_circle16,3,107,24,16,16);
draw_sprite_stretched(spr_menu_beveled,3,125,24,90,32);
draw_sprite(spr_armor_allGame,1,99,22);
var _armor = "A warded tunic that blocks a\nlow amount of damage.";
draw_text_transformed(129,29,_armor,.5,.5,0); 
//
//Melee
draw_sprite_stretched(spr_menu_circle16,3,107,58,16,16);
draw_sprite_stretched(spr_menu_beveled,3,125,58,90,32);
draw_sprite(spr_weapons_allGame,1,99,56);
var _melee = "A slow swinging axe that does\nhigh damage and knockback.";
draw_text_transformed(129,63,_melee,.5,.5,0); 
//
//Primary Magic
draw_sprite_stretched(spr_menu_circle16,3,107,92,16,16);
draw_sprite_stretched(spr_menu_beveled,3,125,92,90,32);
draw_sprite(spr_primary_allGame,1,99,90);
var _primary = "Slowly fire meteors that have\nlow accuracy but deal high\ndamage.";
draw_text_transformed(129,97,_primary,.5,.5,0); 
//
//Special Magic
draw_sprite_stretched(spr_menu_circle16,3,107,128,16,16);
draw_sprite_stretched(spr_menu_beveled,3,125,128,90,32);
draw_sprite(spr_special_allGame,1,99,126);
var _special = "Summon a flame seed that fires\nrandomly or selects a traget\nwhen in range.";
draw_text_transformed(129,133,_special,.5,.5,0); 
}










//
//
//
//
//
//Halofire's Form Stone Pedestal Text
function scr_text_pedestal_form_01(){
//Stone
if (obj_inventory.form_grid[# 1, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Halofire's Form Stone Found.\nComplete: Lavos of Star Fire"
		_SubString = string_copy(text_string,1,letter_counter);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.form_grid[# 1, 4] = true;
		obj_inventory.quest_grid[# 1, 0] = true;
		obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 2];
		obj_inventory.quest_grid[# 1, 3] = true;
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

//Active
if (obj_inventory.form_grid[# 1, 4] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Halofire's Form Stone was here." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 1, 0] = true;
		obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 2];
		obj_inventory.quest_grid[# 1, 3] = true;
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_set_valign(fa_middle);
	draw_text_transformed(64,132,_name,.5,.5,0);
	draw_set_halign(fa_right);
	draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
	
}


}
//
//
//
//
//
//Adavio's Form Stone Pedestal Text
function scr_text_pedestal_form_02(){
//Stone
if (obj_inventory.form_grid[# 2, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Adavio's Form Stone Found" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.form_grid[# 2, 4] = true;
		obj_inventory.quest_grid[# 5, 0] = true;
		obj_inventory.quest_grid[# 5, 1] = obj_inventory.quest_grid[# 5, 2];
		obj_inventory.quest_grid[# 5, 3] = true;
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

//Active
if (obj_inventory.form_grid[# 2, 4] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Adavio's Form Stone was here." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 5, 0] = true;
		obj_inventory.quest_grid[# 5, 1] = obj_inventory.quest_grid[# 5, 2];
		obj_inventory.quest_grid[# 5, 3] = true;
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_set_valign(fa_middle);
	draw_text_transformed(64,132,_name,.5,.5,0);
	draw_set_halign(fa_right);
	draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
	
}

}
//
//
//
//
//
//Ceriver's Form Stone Pedestal Text
function scr_text_pedestal_form_03(){
//Stone
if (obj_inventory.form_grid[# 3, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Ceriver's Form Stone Found" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.form_grid[# 3, 4] = true;
		obj_inventory.quest_grid[# 9, 0] = true;
		obj_inventory.quest_grid[# 9, 1] = obj_inventory.quest_grid[# 9, 2];
		obj_inventory.quest_grid[# 9, 3] = true;
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
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);	
}

//Active
if (obj_inventory.form_grid[# 3, 4] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Ceriver's Form Stone was here." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.form_grid[# 3, 4] = true;
		obj_inventory.quest_grid[# 9, 0] = true;
		obj_inventory.quest_grid[# 9, 1] = obj_inventory.quest_grid[# 9, 2];
		obj_inventory.quest_grid[# 9, 3] = true;
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
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	
}

}
//
//
//
//
//
//Evarel's Form Stone Pedestal Text
function scr_text_pedestal_form_04(){
//Stone
if (obj_inventory.form_grid[# 4, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Evarel's Form Stone Found" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.form_grid[# 4, 4] = true;
		obj_inventory.quest_grid[# 13, 0] = true;
		obj_inventory.quest_grid[# 13, 1] = obj_inventory.quest_grid[# 13, 2];
		obj_inventory.quest_grid[# 13, 3] = true;
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
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);	
}

//Active
if (obj_inventory.form_grid[# 4, 4] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Form Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Evarel's Form Stone was here." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 15, 0] = true;
		obj_inventory.quest_grid[# 15, 1] = obj_inventory.quest_grid[# 15, 2];
		obj_inventory.quest_grid[# 15, 3] = true;
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
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	
}


}
