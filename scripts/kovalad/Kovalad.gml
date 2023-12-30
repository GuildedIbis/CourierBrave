//NPC Kovalad
//Kovalads House North of Lenko Main
//Weapon and Armor Upgrading
//
//
//
//
//
//Kovalad Create
function scr_npc_kovalad_create(){
entity_step = scr_npc_kovalad_step;
sound = snd_npc_mouse;
animation_counter = 0;
animation_timer = 180;
interact = 20;
}
//
//
//
//
//
//Kovalad Step
function scr_npc_kovalad_step(){
sprite_index = spr_npc_kovalad;
scr_npc_interact(12);
if (animation_counter <= 2)
{
	var _totalFrames = sprite_get_number(sprite_index);
	image_index = local_frame;
	local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
	//Cuts the degree by 90 to give you a number between 0 and 3
	//The 0-3 is multiplied by the 1/4 frame number because all four sprites are within a single sprite.
	//Local frame then increments in the speed of the animation
	if (local_frame >= _totalFrames)
	{
		animation_counter = animation_counter + 1;
		animation_end = true;
		local_frame = local_frame - _totalFrames
	}
	else animation_end = false;
}
else 
{
	image_speed = 0;
	image_index = 0;
	animation_timer = animation_timer - 1;
	if (animation_timer <= 0)
	{
		animation_timer = 180;
		animation_counter = 0;
	}
}
}
//
//
//
//
//
//Kovalad Text
function scr_text_kovalad(){
//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_kovalad,0,261,117);
draw_set_color(c_white);
var _name = "Kovalad the Smith"

//Draw Based on String Counter
var _SubString
if (obj_inventory.quest_grid[# 2, 1] < 2) or (obj_inventory.quest_grid[# 2, 1] >= 5)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Courier, What an honor!\nWelcome to my humble shop. If I can be of assistance in any way\nyou need only mention it." 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	//if (string_counter = 1)
	//{
	//	text_string = ""
	//	string_counter = 0;
	//	_SubString = string_copy(text_string,1,letter_counter);
	//	text_script = scr_menu_kovalad_trade;
	//}

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
if (obj_inventory.quest_grid[# 2, 1] = 2)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Mesa? He thinks I owe him for that junk?\nAnd what does he think I owe him?" 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Polish? That fool, I'm a smith not a jewler!" 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Well, I do know one recipe...\nHmmm... fine, but he owes me- and I'm going to need some\nDulen Flower." 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	if (string_counter >= 3)
	{
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
		obj_inventory.quest_grid[# 2, 1] = 3;
		
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
if (obj_inventory.quest_grid[# 2, 1] = 3)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Courier, if you're out in your travels and you see a Dulen\nFlower, bring it for me, would you?" 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Dulen flowers are a rare bright orange bulb that only\ngrows on the southern half the valley." 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	//if (string_counter = 2)
	//{
	//	text_string = ""
	//	string_counter = 0;
	//	_SubString = string_copy(text_string,1,letter_counter);
	//	text_script = scr_menu_kovalad_trade;
	//}

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
if (obj_inventory.quest_grid[# 2, 1] = 4)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "This is it! Thanks Courier!\nI'll run this over to Mesa right away." 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Here, take this Power Stone-\nI'm no mage even with it." 
		_SubString = string_copy(text_string,1,letter_counter);
		page = 0;
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Blue Skill Stone Received!" 
		_SubString = string_copy(text_string,1,letter_counter);	
		page = 0;
	}

	if (string_counter >= 3)
	{
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
		obj_inventory.quest_grid[# 2, 1] = 5;
		obj_inventory.quest_grid[# 2, 3] = true;
		obj_inventory.skill_stone[2] = obj_inventory.skill_stone[2] + 1; //Blue 1/12
		obj_inventory.skill_stone_list[3] = true;
	
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

}
