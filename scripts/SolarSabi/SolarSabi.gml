//NPC Solar Sabi
//Spread throughout the world, only active during Dual Star days
//
//
//
//
//Solar Sabi 1 Create
function scr_npc_solarSabi_00_create(){
entity_step = scr_npc_solarSabi_step;
sound = snd_solarSabi;
active_sprite = spr_solarSabi1_active;
stone_sprite = spr_solarSabi1_stone;
}
//
//
//
//
//
//Solar Sabi 2 Create
function scr_npc_solarSabi_01_create(){
entity_step = scr_npc_solarSabi_step;
sound = snd_solarSabi;
active_sprite = spr_solarSabi2_active;
stone_sprite = spr_solarSabi2_stone;
}
//
//
//
//
//
//Solar Sabi 3 Create
function scr_npc_solarSabi_02_create(){
entity_step = scr_npc_solarSabi_step;
sound = snd_solarSabi;
active_sprite = spr_solarSabi3_active;
stone_sprite = spr_solarSabi3_stone;
}
//
//
//
//
//
//Solar Step
function scr_npc_solarSabi_step(){
if (global.dayPhase = 1)
{
	scr_npc_interact(12);
	sprite_index = active_sprite;
	image_speed = 1;
}
else 
{
	sprite_index = stone_sprite;
	image_speed = 0;
}
}
//
//
//
//
//
//Solar Sabi 1 Text
function scr_text_solarSabi_00(){
//Stone
if (global.dayPhase != 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mysterious Stone"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Nothing happened." 
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

if (global.dayPhase = 1)
{
//Quest Started
obj_inventory.quest_grid[# 6, 0] = true;

//First Interact
if (obj_inventory.quest_grid[# 6, 1] < 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Hmmmm... ancient too...\nYou could find for me the others..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "But who is where...\nyes- but they must be in order..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Go then...\nand return before the day ends... a gift."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 3)
	{
		obj_inventory.quest_grid[# 6, 0] = true;
		obj_inventory.quest_grid[# 6, 1] = 1;
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_set_valign(fa_middle);
	draw_text_transformed(64,132,_name,.5,.5,0);
	draw_set_halign(fa_right);
	draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
	
}

//Second and After Interact
if (obj_inventory.quest_grid[# 6, 1] >= 1) and (obj_inventory.quest_grid[# 6, 1] <= 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I am one of three,\nwho only wake under two stars..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Find the second, then the third.\nIt must be in order... so I know...\nGo then... return before days end."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
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

//Final Interact
if (obj_inventory.quest_grid[# 6, 1] >= 3)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "How pleasing... you have found the others.\nFar far awy they are." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "An orb, seed of stars... a fine gift of Vesial."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		if (obj_inventory.quest_grid[# 6, 3] = false)
		{
			obj_inventory.quest_grid[# 6, 0] = true;
			obj_inventory.quest_grid[# 6, 3] = true;
			obj_inventory.star_orb = obj_inventory.star_orb + 1;
		}
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
}
}
//
//
//
//
//
//Solar Sabi 2 Text
function scr_text_solarSabi_01(){
//Stone
if (global.dayPhase != 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mysterious Stone"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Nothing happened." 
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

if (global.dayPhase = 1)
{
//Toon Soon Interact
if (obj_inventory.quest_grid[# 6, 1] < 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "The first...\nThe third..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "So far far away..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 2)
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_set_valign(fa_middle);
	draw_text_transformed(64,132,_name,.5,.5,0);
	draw_set_halign(fa_right);
	draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
	
}


//Correct Interact
if (obj_inventory.quest_grid[# 6, 1] = 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I smell...\nYou spoke with the first." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Yes... please tell the first I am here..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 2)
	{
		obj_inventory.quest_grid[# 6, 1] = 2;
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


//After Interact
if (obj_inventory.quest_grid[# 6, 1] >= 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "How pleasing... you tell the first I am here..." 
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
}
//
//
//
//
//
//Solar Sabi 3 Text
function scr_text_solarSabi_02(){
//Stone
if (global.dayPhase != 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mysterious Stone"


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Nothing happened." 
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

//Too Soon Interact
if (global.dayPhase = 1) 
{
if (obj_inventory.quest_grid[# 6, 1] < 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "The first...\nThe second..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "So far far away..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 2)
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_set_valign(fa_middle);
	draw_text_transformed(64,132,_name,.5,.5,0);
	draw_set_halign(fa_right);
	draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
	
}


//Correct Interact
if (obj_inventory.quest_grid[# 6, 1] = 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I smell...\nYou spoke with the first and the second." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Yes... please tell the first I am here..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 2)
	{
		obj_inventory.quest_grid[# 6, 1] = 3;
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


//After Interact
if (obj_inventory.quest_grid[# 6, 1] >= 3)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "How pleasing... you tell the first I am here..." 
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
}