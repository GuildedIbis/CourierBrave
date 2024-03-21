//NPC Orodry
//
//
//
//
//
//Orodry Create
function scr_npc_orodry_night_create(){
entity_step = scr_npc_orodry_night_step;
sprite_index = spr_npc_orodry;
npc_idle = spr_npc_orodry;
npc_move = spr_npc_orodry_walk;
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
//Orodry Step
function scr_npc_orodry_night_step(){
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
		scr_npc_exit(160,144);
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
//Orodry Create
function scr_npc_orodry_day_create(){
entity_step = scr_npc_orodry_day_step;
sprite_index = spr_npc_orodry;
npc_idle = spr_npc_orodry;
npc_move = spr_npc_orodry_walk;
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
//Orodry Step
function scr_npc_orodry_day_step(){
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
		scr_npc_exit(184,359);
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
//Orodry Text
function scr_text_npc_orodry(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_orodry,0,261,117);
draw_set_color(c_white);
var _name = "Orodry"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Fairez wouldn't stop rambling on about those red stones\nover by Habraf." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "She kept saying they must mean something, or do something.\nWouldn't be too suprised if she went and got herself lost." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 2)
{
	speaker = 1;
	text_string = "I wouldn't go that way if you don't have to Courier.\nThose wetlands can be perilous, even for the strong...\n\nIf you do see her though, tell her I'm not waiting\nto cook supper."
	_SubString = string_copy(text_string,1,letter_counter);
}

if (string_counter >= 3)
{
	scr_text_end();
	_SubString = string_copy(text_string,1,letter_counter);
	//text_string = ""
	//string_counter = 0;
	//obj_inventory.quest_grid[# 10, 0] = true;
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