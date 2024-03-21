//NPC Lunar Sabi
//Yakflower Path 05
//
//
//
//
//Lunar Sabi Create
function scr_npc_lunarSabi_create(){
entity_step = scr_npc_lunarSabi_step;
sound = snd_solarSabi;
active_sprite = spr_npc_lunarSabi;
stone_sprite = spr_npc_lunarSabi_stone;
sprite_index = stone_sprite;
animation_end = false;
local_frame = 0;
interact = 12;
direction = 270;
}
//
//
//
//
//
//Lunar Sabi Step
function scr_npc_lunarSabi_step(){
if (global.dayPhase = 2)
{
	scr_npc_interact(interact);
	scr_npc_animation();
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
//Lunar Sabi Text
function scr_text_lunarSabi(){
//Stone
if (global.dayPhase != 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_lunarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Lunar Sabi"


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
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);	
}

if (global.dayPhase = 2)
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
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_lunarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Lunar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Courier! What an honor!\nThough no suprise I must admit. Each year, more and more of\nthe Ranth arrive under the flag of your enemies." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Your duty is to protect all good creatures. Very noble and\nbrave. You might suffer a thousand deaths, and still carry\non if your job isn't done."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Hmmm not the Sabi's problem, but only not yet I suppose...\nI could help, but it would take some work on your part."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 3)
	{
		speaker = 1;
		text_string = "The Solar Sabi have an enchantment they can share,\nbut they are cursed with silence.\nOrdinarily they would wake during the day- but long ago\ntheir rambling finally got the best of me."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 4)
	{
		speaker = 1;
		text_string = "If you want that enchantment, you'll have to wake them at\nthe Sun Dial that is north and east of here.\nEven then, then probably won't just give it to you..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 5)
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		obj_inventory.quest_grid[# 6, 0] = true;
		obj_inventory.quest_grid[# 6, 1] = 1;
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

//Before Solar Sabi Wakened
if (obj_inventory.quest_grid[# 6, 1] = 1) //and (obj_inventory.quest_grid[# 6, 1] <= 2)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_lunarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Lunar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "The Solar Sabi have an enchantment they can share,\nbut they are cursed with silence.\nOrdinarily they would wake during the day- but long ago\ntheir rambling finally got the best of me."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "If you want that enchantment, you'll have to wake them at\nthe Sun Dial that is north and east of here.\nEven then, then probably won't just give it to you..."
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

//After Solar Sabi Wakened
if (obj_inventory.quest_grid[# 6, 1] >= 2) and (obj_inventory.quest_grid[# 6, 1] <= 5)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_lunarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Yes, I thought I heard the echo of their nonesense...\nYou woke the Solar Sabi." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "It's been more than a hundred years, but when I last\spoke to them they had simple lost track\nof each other- good luck sorting that out."
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

//After Quest Complete
if (obj_inventory.quest_grid[# 6, 1] = 6)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_lunarSabi,0,261,117);
	draw_set_color(c_white);
	var _name = "Solar Sabi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Can't believe you actually got something out of those\nfried old worms..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "May balance perserve."
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
