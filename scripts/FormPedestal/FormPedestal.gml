//Form Pedestal
//
//
//
//
//
//Form Pedestal Create
function FormStonePedestalCreate(){
entity_step = FormStonePedestalStep;
shadow = true;
shadow_size = 2;
sound = -1;
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
function FormStonePedestalStep(){
if (obj_game.gamePaused = false)
{
	scr_npc_interact(12);
	if (obj_inventory.form_grid[# activate_args, 4] = false)
	{
			sprite_index = active_sprite;
			image_speed = 0;
			image_index = activate_args;
	}
	else
	{
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
//Ceriver's Form Stone Pedestal Text
function FormStonePedestal3Text(){
//Stone
if (obj_inventory.form_grid[# 3, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
		obj_inventory.quest_grid[# 10, 0] = true;
		obj_inventory.quest_grid[# 10, 1] = obj_inventory.quest_grid[# 10, 2];
		obj_inventory.quest_grid[# 10, 3] = true;
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
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
//Adavio's Form Stone Pedestal Text
function FormStonePedestal2Text(){
//Stone
if (obj_inventory.form_grid[# 2, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
//Halofire's Form Stone Pedestal Text
function FormStonePedestal1Text(){
//Stone
if (obj_inventory.form_grid[# 1, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
//Evarel's Form Stone Pedestal Text
function FormStonePedestal4Text(){
//Stone
if (obj_inventory.form_grid[# 4, 4] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white);
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
		obj_inventory.quest_grid[# 15, 0] = true;
		obj_inventory.quest_grid[# 15, 1] = obj_inventory.quest_grid[# 15, 2];
		obj_inventory.quest_grid[# 15, 3] = true;
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
	draw_sprite_stretched(spr_menu,3,64,136,192,48);
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
