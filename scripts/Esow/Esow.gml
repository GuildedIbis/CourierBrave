//NPC Esow
//
//
//
//
//
//Esow Night Create
function scr_npc_esow_night_create(){
entity_step = scr_npc_esow_night_step;
sprite_index = spr_npc_esow;
npc_idle = spr_npc_esow;
npc_move = spr_npc_esow_walk;
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
//Esow Night Step
function scr_npc_esow_night_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(interact);
	if (global.dayPhase = 2)
	{
		scr_npc_wander_home_range(180,240,home_x,home_y,64);
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
//Esow Day Create
function scr_npc_esow_day_create(){
entity_step = scr_npc_esow_day_step;
sprite_index = spr_npc_esow;
image_speed = 0;
npc_idle = spr_npc_esow;
npc_move = spr_npc_esow_walk;
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
//Esow Day Step
function scr_npc_esow_day_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(interact);
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_wander_home_range(240,180,home_x,home_y,360);
	}
	if (global.dayPhase = 2)
	{
		scr_npc_exit(832,263);
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
//Esow Text
function scr_text_npc_esow(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_esow,0,261,117);
draw_set_color(c_white);
var _name = "Esow"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Have you been to the old Fortress?\nThe Duke of Wiere sat there for eleven generations." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "They were a family of good kind lords, Courier.\nNow their line is murdered, and their home in ruin..." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 2)
{
	speaker = 1;
	text_string = "I hope you can bring this Acolyte to justice." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter >= 3)
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