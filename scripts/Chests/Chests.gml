//Chest Scripts
//
//
//
//
//
//Chest Create
function scr_chest_create(){
entity_step = scr_chest_free;
shadow = true;
shadow_size = 1;
sound = snd_chest;
interact = 20;
}
//
//
//
//
//Chest Free
function scr_chest_free(){
sprite_index = spr_chest;

if (activate_args != -1)
{
	if (obj_inventory.chest_list[activate_args] = false)
	{
		image_index = 0;
		interact = 20;
		scr_npc_interact(12);
	
	}
	if (obj_inventory.chest_list[activate_args] = true)
	{
		interact = -1;
		image_index = 1;
	}
}
}
//
//
//
//
//
//Chest 00 Text
function scr_text_chest_00(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);

if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\nEinalad's Key Found"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{
	obj_inventory.chest_list[0] = true;
	obj_inventory.quest_grid[# 14, 1] = 2;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
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
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 01 Text
function scr_text_chest_01(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);

if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (obj_inventory.quest_grid[# 14, 1] < 2)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "CHEST LOCKED"
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
		with (all)
		{
			image_speed = game_paused_image_speed;
		}
	
		//Reset Buy/Sell Menu
		page = 0;
		slot = -1;
		item_id = -1;
		item_name = -1;
		sell_price = 0;
		buy_price = 0;
	}
}

if (obj_inventory.quest_grid[# 14, 1] >= 2)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "CHEST OPENED:\nRed Skill Stone Received!"
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		obj_inventory.skill_stone[5] = obj_inventory.skill_stone[5] + 1; //Red 2/12
		obj_inventory.skill_stone_list[15] = true;
		obj_inventory.quest_grid[# 14, 0] = true;
		obj_inventory.quest_grid[# 14, 1] = 3;
		obj_inventory.quest_grid[# 14, 3] = true;
		obj_inventory.chest_list[1] = true;
		text_string = "";
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
		with (all)
		{
			image_speed = game_paused_image_speed;
		}
	
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
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);

}