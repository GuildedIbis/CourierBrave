//NPC Mesa
//
//
//
//
//
//Mesa Night Create
function scr_npc_mesa_night_create(){
entity_step = scr_npc_mesa_night_step;
sprite_index = spr_npc_mesa;
npc_idle = spr_npc_mesa;
npc_move = spr_npc_mesa_walk;
sound = snd_npc_mouse;
interact = 20;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Mesa Night Step
function scr_npc_mesa_night_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	if (global.dayPhase = 2)
	{
		scr_npc_wander_home_range(60,240,home_x,home_y,64);
	}
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_exit(144,144);
		if (place_meeting(x,y,obj_door))
		{
			instance_destroy();
		}
	}
	scr_npc_animation();
}
else
{
	sprite_index = npc_idle;
	image_speed = 0;
	path_end();
}
}
//
//
//
//
//
//Mesa Day Create
function scr_npc_mesa_day_create(){
entity_step = scr_npc_mesa_day_step;
sprite_index = spr_npc_mesa;
npc_idle = spr_npc_mesa;
npc_move = spr_npc_mesa_walk;
sound = snd_npc_mouse;
interact = 20;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Mesa Day Step
function scr_npc_mesa_day_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_wander_home_range(60,240,home_x,home_y,360);
	}
	if (global.dayPhase = 2)
	{
		scr_npc_exit(584,407);
		if (place_meeting(x,y,obj_door))
		{
			instance_destroy();
		}
	}
	scr_npc_animation();
}
else
{
	sprite_index = npc_idle;
	image_speed = 0;
	path_end();
}
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
//Start Quest
if (obj_inventory.quest_grid[# 2, 1] <= 0)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_mesa,0,261,117);
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
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		//obj_inventory.quest_grid[# 2, 0] = true;
		//_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
		////Reset Buy/Sell Menu
		//page = 0;
		//selected = -1;
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
//Jewel Found
if (obj_inventory.quest_grid[# 2, 1] = 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_mesa,0,261,117);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I don't believe it...  Thurn, the Courier found your Necklace! " 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 1)
	{
		scr_text_end(false);
		_SubString = string_copy(text_string,1,letter_counter);
		//text_string = ""
		//string_counter = 0;
		obj_inventory.quest_grid[# 2, 1] = 2;
		//_SubString = string_copy(text_string,1,letter_counter);
	
		//Reset Buy/Sell Menu
		//page = 0;
		//selected = -1;
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
//Need Polish
if (obj_inventory.quest_grid[# 2, 1] >= 2) and (obj_inventory.quest_grid[# 2, 1] <= 4)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_mesa,0,261,117);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Thanks for finding her necklace!...\nThough truth be told it's in pretty rough shape." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "You know, Kovalad owes me more than a favor or two for some\nof the trades we've made. Would you take this to his shop\nand ask him to polish it for us?" 
		_SubString = string_copy(text_string,1,letter_counter);
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
		//selected = -1;
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
//Completed
if (obj_inventory.quest_grid[# 2, 1] >= 5)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
	draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
	draw_sprite(spr_npc_portrait_mesa,0,261,117);
	draw_set_color(c_white);
	var _name = "Mesa"
	
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Kovalad's polish has Thurn's necklace shining\nbrilliantly! Thanks again Courier!" 
		_SubString = string_copy(text_string,1,letter_counter);
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
		//selected = -1;
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


