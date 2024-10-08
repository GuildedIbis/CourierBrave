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
if (global.dayPhase < 2) and (obj_inventory.quest_grid[# 6, 1] >= 2)
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
//Start Quest
obj_inventory.quest_grid[# 6, 0] = true;

if (global.dayPhase = 2)
{
	//Before Quest Started
	if (obj_inventory.quest_grid[# 6, 1] = 0)
	{
		
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
		draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
		draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
		draw_set_color(c_white);
		var _name = "First Solar Sabi"


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
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			//text_string = "";
			//string_counter = 0;
			//_SubString = string_copy(text_string,1,letter_counter);
			//obj_game.gamePaused = false;
			//obj_game.textPaused = false;

			////Reset Buy/Sell Menu
			//page = 0;
			//slot = -1;
			//item_id = -1;
			//item_name = -1;
			//sell_price = 0;
			//buy_price = 0;
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_transformed(69,141,_SubString,.6,.6,0);
		draw_text_transformed(259,110,_name,.5,.5,0);
		draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	}
	//Stone
	if (obj_inventory.quest_grid[# 6, 1] >= 1)
	{
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
		draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
		draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
		draw_set_color(c_white);
		var _name = "First Solar Sabi"


		//Draw Based on String Counter
		var _SubString
		if (string_counter = 0)
		{
			speaker = 1;
			text_string = "It's a Solar Sabi.\nThey will wake during the day, if the curse is lifted." 
			_SubString = string_copy(text_string,1,letter_counter);
			draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		}
	
		if (string_counter >= 1)
		{
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			//text_string = ""
			//string_counter = 0;
			//_SubString = string_copy(text_string,1,letter_counter);
			//obj_game.gamePaused = false;
			//obj_game.textPaused = false;

			////Reset Buy/Sell Menu
			//page = 0;
			//slot = -1;
			//item_id = -1;
			//item_name = -1;
			//sell_price = 0;
			//buy_price = 0;
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_transformed(69,141,_SubString,.6,.6,0);
		draw_text_transformed(259,110,_name,.5,.5,0);
		draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);	
	}
}
if (global.dayPhase < 2) and (obj_inventory.quest_grid[# 6, 1] >= 2)
{
//First Interact
if (obj_inventory.quest_grid[# 6, 1] = 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "First Solar Sabi"

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
		text_string = "Three of us snakes from fiery stars.\nI am the first, yes- and we must be in order..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Go then- find second then third whose lines make\nan arrow due West."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 3)
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		obj_inventory.quest_grid[# 6, 1] = 3;
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
		////Revert if broken^
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//Second and After Interact
if (obj_inventory.quest_grid[# 6, 1] = 3) or (obj_inventory.quest_grid[# 6, 1] = 4)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "First Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I am one of three, but we are lost from each other.\nFind the second, then the third, whose lines make an arrow\ndue West.\n\nThen a gift for Couier our friend." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//	text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//Quest Complete
if (obj_inventory.quest_grid[# 6, 1] = 5)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "First Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "How pleasing... you have found the others.\nFar far away they are." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "A skill stone, power of stars and crystals...\na gift for Courier our friend."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Orange Skill Stone Received!"
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		
	}
	if (string_counter >= 3)
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		obj_inventory.quest_grid[# 6, 0] = true;
		obj_inventory.quest_grid[# 6, 1] = 6;
		obj_inventory.quest_grid[# 6, 3] = true;
		obj_inventory.skill_stone[1] = obj_inventory.skill_stone[1] + 1; //Orange 2/12
		obj_inventory.skill_stone_list[7] = true;
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//Post-Quest Complete
if (obj_inventory.quest_grid[# 6, 1] >= 6)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "First Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "How pleasing... you have found the others.\nFar far away they are." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 1)
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
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
//Start Quest
obj_inventory.quest_grid[# 6, 0] = true;

if (global.dayPhase = 2)
{
	//Before Quest Started
	if (obj_inventory.quest_grid[# 6, 1] = 0)
	{
		
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
		draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
		draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
		draw_set_color(c_white);
		var _name = "Second Solar Sabi"


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
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			//text_string = ""
			//string_counter = 0;
			//_SubString = string_copy(text_string,1,letter_counter);
			//obj_game.gamePaused = false;
			//obj_game.textPaused = false;

			////Reset Buy/Sell Menu
			//page = 0;
			//slot = -1;
			//item_id = -1;
			//item_name = -1;
			//sell_price = 0;
			//buy_price = 0;
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_transformed(69,141,_SubString,.6,.6,0);
		draw_text_transformed(259,110,_name,.5,.5,0);
		draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);	
	}
	//Stone
	if (obj_inventory.quest_grid[# 6, 1] >= 1)
	{
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
		draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
		draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
		draw_set_color(c_white);
		var _name = "Second Solar Sabi"


		//Draw Based on String Counter
		var _SubString
		if (string_counter = 0)
		{
			speaker = 1;
			text_string = "It's a Solar Sabi.\nThey will wake during the day, if the curse is lifted." 
			_SubString = string_copy(text_string,1,letter_counter);
			draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		}
	
		if (string_counter >= 1)
		{
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			//text_string = ""
			//string_counter = 0;
			//_SubString = string_copy(text_string,1,letter_counter);
			//obj_game.gamePaused = false;
			//obj_game.textPaused = false;

			////Reset Buy/Sell Menu
			//page = 0;
			//slot = -1;
			//item_id = -1;
			//item_name = -1;
			//sell_price = 0;
			//buy_price = 0;
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_transformed(69,141,_SubString,.6,.6,0);
		draw_text_transformed(259,110,_name,.5,.5,0);
		draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);	
	}
}
if (global.dayPhase < 2) and (obj_inventory.quest_grid[# 6, 1] >= 2)
{
//Toon Soon Interact
if (obj_inventory.quest_grid[# 6, 1] < 3) or (obj_inventory.quest_grid[# 6, 1] > 3)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Second Solar Sabi"

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
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
		////Revert if broken^
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//Correct Interact
if (obj_inventory.quest_grid[# 6, 1] = 3)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Second Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Sharp as the Courier's blade is their mind.\nYou spoke with the first, now me, next the third." 
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
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		obj_inventory.quest_grid[# 6, 1] = 4;
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//After Complete
if (obj_inventory.quest_grid[# 6, 1] >= 6)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Second Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "How pleasing... the Solar Sabi united in voice..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 1)
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
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
//Start Quest
obj_inventory.quest_grid[# 6, 0] = true;

if (global.dayPhase = 2)
{
	//Before Quest Started
	if (obj_inventory.quest_grid[# 6, 1] = 0)
	{
		
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
		draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
		draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
		draw_set_color(c_white);
		var _name = "Third Solar Sabi"


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
			
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			//text_string = ""
			//string_counter = 0;
			//_SubString = string_copy(text_string,1,letter_counter);
			//obj_game.gamePaused = false;
			//obj_game.textPaused = false;

			////Reset Buy/Sell Menu
			//page = 0;
			//slot = -1;
			//item_id = -1;
			//item_name = -1;
			//sell_price = 0;
			//buy_price = 0;
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_transformed(69,141,_SubString,.6,.6,0);
		draw_text_transformed(259,110,_name,.5,.5,0);
		draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);	
	}
	//Stone
	if (obj_inventory.quest_grid[# 6, 1] >= 1)
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
			text_string = "It's a Solar Sabi.\nThey will wake during the day, if the curse is lifted." 
			_SubString = string_copy(text_string,1,letter_counter);
			draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		}
	
		if (string_counter >= 1)
		{
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			//text_string = ""
			//string_counter = 0;
			//_SubString = string_copy(text_string,1,letter_counter);
			//obj_game.gamePaused = false;
			//obj_game.textPaused = false;

			////Reset Buy/Sell Menu
			//page = 0;
			//slot = -1;
			//item_id = -1;
			//item_name = -1;
			//sell_price = 0;
			//buy_price = 0;
		}
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_transformed(69,141,_SubString,.6,.6,0);
		draw_text_transformed(259,110,_name,.5,.5,0);
		draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);	
	}
}
if (global.dayPhase < 2) and (obj_inventory.quest_grid[# 6, 1] >= 2)
{
//Too Soon
if (obj_inventory.quest_grid[# 6, 1] < 4)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Third Solar Sabi"

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
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
		////Revert if broken^
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//Correct Interact
if (obj_inventory.quest_grid[# 6, 1] = 4) or (obj_inventory.quest_grid[# 6, 1] = 5)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Third Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Like an echo of a scent...\nYou spoke with the first and the second." 
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
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		obj_inventory.quest_grid[# 6, 1] = 5;
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}

//After Interact
if (obj_inventory.quest_grid[# 6, 1] >= 6)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_solarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Third Solar Sabi"

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
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
	
}
}
}