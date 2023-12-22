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
	scr_npc_interact(12);
	//if (obj_inventory.form_grid[# activate_args, 4] = false)
	//{
	//		sprite_index = active_sprite;
	//		image_speed = 0;
	//		image_index = activate_args;
	//}
	//else
	//{
	//	sprite_index = idle_sprite;
	//	image_speed = 0;
	//}
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
draw_sprite_stretched(spr_menu_circle16,3,120,66,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,84,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,102,80,16);
//draw_sprite_stretched(spr_menu_circle16,3,120,120,80,16);
//draw_sprite_stretched(spr_menu_circle16,3,92,40,16,16);
//draw_sprite_stretched(spr_menu_circle16,3,212,40,16,16);
//draw_sprite_ext(spr_menu_arrow,0,220,48,1,1,0,c_white,1);
//draw_sprite_ext(spr_menu_arrow,2,100,48,1,1,0,c_white,1);
//draw_text_transformed(160,50,"TRADE",1,1,0);
//draw_text_transformed(160,62,"GIVE > RECEIVE (HAVE)",.6,.6,0);


//Submenu Change
if (point_in_rectangle(_mouseX,_mouseY,120,66,200,82))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,65,82,18);
	if (mouse_check_button_pressed(mb_left))
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



//Exit
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
