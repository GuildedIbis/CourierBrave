//NPC Thurn
//Vostle Town 00-02
//
//
//
//
//Thurn Create
function scr_npc_thurn_create(){
entity_step = scr_npc_thurn_step;
sprite_index = spr_npc_thurn;
npc_idle = spr_npc_thurn;
npc_move = spr_npc_thurn_walk;
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
//Thurn Step
function scr_npc_thurn_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	scr_npc_wander_home_range(60,240,home_x,home_y,64);
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
function scr_text_npc_thurn(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_thurn,0,261,117);
draw_set_color(c_white);
var _name = "Thurn"

//Draw Based on String Counter
var _SubString
//Start Quest
if (obj_inventory.quest_grid[# 2, 1] = 0)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I had to leave a lot behind when those damn rats\nburned down our house. Most tragic was my necklace,\nan heirloom and a treasure to me..." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "The rats keep us crammed into towns, but you Courier...\nIf you find my necklace, will you bring it back to us?" 
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
//Jewel Found
if (obj_inventory.quest_grid[# 2, 1] = 1)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Thank you Courier! It brings my heart joy to have it again!" 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 2, 1] = 2;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
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
//Needs Polish
if (obj_inventory.quest_grid[# 2, 1] >= 2) and (obj_inventory.quest_grid[# 2, 1] <= 4)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Oh wow, this poor necklace is in pretty rough shape huh?\nCourier, would you ask Mesa if he know's anything about\ngetting this polished?" 
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
//Completed
if (obj_inventory.quest_grid[# 2, 1] >= 5)
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
		text_string = "My beautiful necklace restored!\nThank you Courier, and tell dear\nKovalad thank you too." 
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


