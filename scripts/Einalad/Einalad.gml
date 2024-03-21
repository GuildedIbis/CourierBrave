//NPC Einalad
//Vostle 00-05
//
//
//
//
//
//Einalad Night Create
function scr_npc_einalad_night_create(){
entity_step = scr_npc_einalad_night_step;
sprite_index = spr_npc_einalad;
npc_idle = spr_npc_einalad;
npc_move = spr_npc_einalad_walk;
sound = snd_npc_mouse;
interact = 12;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Einalad Night Step
function scr_npc_einalad_night_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(interact);
	if (global.dayPhase = 2)
	{
		scr_npc_wander_home_range(60,240,home_x,home_y,64);
	}
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_exit(175,144);
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
//Einalad Day Create
function scr_npc_einalad_day_create(){
entity_step = scr_npc_einalad_day_step;
sprite_index = spr_npc_einalad;
npc_idle = spr_npc_einalad;
npc_move = spr_npc_einalad_walk;
sound = snd_npc_mouse;
interact = 12;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Einalad Day Step
function scr_npc_einalad_day_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(interact);
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_wander_home_range(60,240,home_x,home_y,360);
	}
	if (global.dayPhase = 2)
	{
		scr_npc_exit(959,296);
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
//Einalad Text
function scr_text_npc_einalad(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_einalad,0,261,117);
draw_set_color(c_white);
var _name = "Einalad"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Courier, what an honor! I'm only a humble gravekeeper with\nlittle to give in aid or treasure." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "There is one thing you might find useful though, an\nenchanted stone passed down through my family." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 2)
{
	speaker = 1;
	text_string = "Though I'm afraid to say it cannot be accessed- it is\nlocked in a chest whose key has been taken." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 3)
{
	speaker = 1;
	text_string = "Yet if anyone can find the key, I suppose it is you. Those\ndamned rats made off with it, amongst my other\npossessions, when they drove me from my home." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 4)
{
	speaker = 1;
	text_string = "I have to imagine it's stowed away somewhere in the old\nfortress, but go there with caution Courier. I swear\nI saw them deliver a troll there." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter >= 5)
{
	scr_text_end();
	_SubString = string_copy(text_string,1,letter_counter);
	//text_string = ""
	//string_counter = 0;
	//obj_inventory.quest_grid[# 14, 0] = true;
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