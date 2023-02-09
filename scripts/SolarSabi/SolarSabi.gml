//NPC Solar Sabi
//Spread throughout the world, only active during Dual Star days
//
//
//
//
//Solar Sabi 1 Create
function SolarSabi1Create(){
entity_step = SolarSabiStep;
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
function SolarSabi2Create(){
entity_step = SolarSabiStep;
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
function SolarSabi3Create(){
entity_step = SolarSabiStep;
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
function SolarSabiStep(){
if (global.dayPhase = 1)
{
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
function SolarSabi1Text(){
//Stone
if (global.dayPhase != 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);


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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);	
}

//First Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] < 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
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
		obj_inventory.quest_grid[# quest_num, 0] = true;
		obj_inventory.quest_grid[# quest_num, 1] = 1;
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}


//Second and After Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] >= 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "First Solar Sabi"

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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}


//Final Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] >= 3)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "First Solar Sabi"

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
		text_string = "A Crull Stone... a fine gift of Vesial."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		if (obj_inventory.quest_grid[# quest_num, 3] = false)
		{
			obj_inventory.quest_grid[# quest_num, 3] = true;
			obj_player.max_crull_stone = obj_player.max_crull_stone + 1;
			obj_player.crull_stone = obj_player.crull_stone + 1;
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}

}
//
//
//
//
//
//Solar Sabi 2 Text
function SolarSabi2Text(){
//Stone
if (global.dayPhase != 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);


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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);	
}

//Too Soon Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] < 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}


//Correct Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] = 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Second Solar Sabi"

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
		obj_inventory.quest_grid[# quest_num, 1] = 2;
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}


//After Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] >= 2)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Second Solar Sabi"

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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}

}
//
//
//
//
//
//Solar Sabi 3 Text
function SolarSabi3Text(){
//Stone
if (global.dayPhase != 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);


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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);	
}

//Too Soon Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] < 2)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}


//Correct Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] = 2)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Second Solar Sabi"

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
		obj_inventory.quest_grid[# quest_num, 1] = 3;
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}


//After Interact
if (global.dayPhase = 1) and (obj_inventory.quest_grid[# quest_num, 1] >= 3)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Second Solar Sabi"

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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_solarSabi1_portrait36,0,258+6,136+6);
	
}

}