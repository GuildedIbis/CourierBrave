//NPC Mesa
//
//
//
//
//Mesa Create
function scr_npc_mesa_create(){
entity_step = scr_npc_mesa_step;
sound = snd_npc_mouse;
interact = 20;
}
//
//
//
//
//
//Orodry Step
function scr_npc_mesa_step(){
sprite_index = spr_npc_mesa;
scr_player_animation();
scr_npc_interact(12);
}
//
//
//
//
//
//Mesa Text
function scr_text_npc_mesa(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Draw Based on String Counter
var _SubString
if (obj_inventory.quest_grid[# 2, 1] <= 0)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Courier!  Perhaps there is hope!  The sun rises at last!...\nCourier, I'm sure you're hands are full but can I ask a favor?" 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "My wife Thurn and I were driven from our home, and it was\nburnt for the pleasure of hateful rats...\nbut if there is any trinket you could find there... any\nreminder of home... It would mean a great deal to us."
		_SubString = string_copy(text_string,1,letter_counter);
	}

	if (string_counter >= 2)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 2, 0] = true;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		page = 0;
		selected = -1;
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
//Jewel Found
if (obj_inventory.quest_grid[# 2, 1] = 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I don't believe it...  Thurn, the Courier found your Necklace! " 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Thank you Courier. Please take this in return...\nI hope it helps."
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Star Orb Received!"
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 3)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 2, 1] = 2;
		obj_inventory.star_orb = obj_inventory.star_orb + 1;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		page = 0;
		selected = -1;
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
//Completed
if (obj_inventory.quest_grid[# 2, 1] = 2) or (obj_inventory.quest_grid[# 2, 1] = 3)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Thanks again for finding her necklace!...\nThough truth be told it's in pretty rough shape." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "You know, Kovalad owes me more than a\nfavor or two for some of the trades we've made." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Would you take this to his shop and\nask him to polish it?" 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 3)
	{
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		page = 0;
		selected = -1;
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
//Completed
if (obj_inventory.quest_grid[# 2, 1] = 4)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Wow! Thurn, look at this!\nYour necklace hasn't had a shine like this\nsince your mother gave it to you!" 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "We really owe you one Courier.\nHere, this should come in handy I hope." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Orine Enchantment received!" 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 3)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.crystal_enchant[2] = true;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		page = 0;
		selected = -1;
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


