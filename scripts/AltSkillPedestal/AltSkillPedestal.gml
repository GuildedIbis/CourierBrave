//Alt Magic Pedestal
//
//
//
//
//
//Alt Magic Pedestal Create
function scr_pedestal_alt_create(){
entity_step = scr_pedestal_altMagic_step;
sound = -1;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 0;
}
//
//
//
//
//
//Alt magic Pedestal Step
function scr_pedestal_alt_step(){
scr_npc_interact(12);
if (obj_inventory.quest_grid[# activate_args, 3] = false)
{
		sprite_index = active_sprite;
		image_speed = 0;
		image_index = pedestal_index;
}
else
{
	sprite_index = idle_sprite;
	image_speed = 0;
}
}
//
//
//
//
//
//Regaliare's Alt Magic Pedestal Text
function scr_text_pedestal_alt_00(){
//Stone
if (obj_inventory.quest_grid[# 3, 3] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Regaliare's alternate magic skill found.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 3, 0] = true;
		obj_inventory.quest_grid[# 3, 1] = obj_inventory.quest_grid[# 3, 2];
		obj_inventory.quest_grid[# 3, 3] = true;
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
if (obj_inventory.quest_grid[# 3, 3] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Regaliare's alternate magic skill was here.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 3, 0] = true;
		obj_inventory.quest_grid[# 3, 1] = obj_inventory.quest_grid[# 3, 2];
		obj_inventory.quest_grid[# 3, 3] = true;
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
//Halofire's Alt Magic Pedestal Text
function scr_text_pedestal_alt_01(){
//Stone
if (obj_inventory.quest_grid[# 7, 3] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Halofire's alternate magic skill Found.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 7, 0] = true;
		obj_inventory.quest_grid[# 7, 2] = 1;
		obj_inventory.quest_grid[# 7, 3] = true;
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
if (obj_inventory.quest_grid[# 7, 3] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Halofire's alternate magic skill was here.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 7, 0] = true;
		obj_inventory.quest_grid[# 7, 2] = 1;
		obj_inventory.quest_grid[# 7, 3] = true;
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
//Adavio's Alt Magic Pedestal Text
function scr_text_pedestal_alt_02(){
//Stone
if (obj_inventory.quest_grid[# 12, 3] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Adavio's alternate magic skill found.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 12, 0] = true;
		obj_inventory.quest_grid[# 12, 2] = 1;
		obj_inventory.quest_grid[# 12, 3] = true;
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
if (obj_inventory.quest_grid[# 12, 3] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Adavio's alternate magic skill was here.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 12, 0] = true;
		obj_inventory.quest_grid[# 12, 2] = 1;
		obj_inventory.quest_grid[# 12, 3] = true;
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
//Ceriver's Alt Magic Pedestal Text
function scr_text_pedestal_alt_03(){
//Stone
if (obj_inventory.quest_grid[# 17, 3] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Ceriver's alternate magic skill found.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 17, 0] = true;
		obj_inventory.quest_grid[# 17, 2] = 1;
		obj_inventory.quest_grid[# 17, 3] = true;
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
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);	
}

//Active
if (obj_inventory.quest_grid[# 17, 3] = true)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	var _name = "Magic Skill Pedestal"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Ceriver's alternate magic skill was here.\nPress \"F\" to switch magic skills." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 17, 0] = true;
		obj_inventory.quest_grid[# 17, 2] = 1;
		obj_inventory.quest_grid[# 17, 3] = true;
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
	
