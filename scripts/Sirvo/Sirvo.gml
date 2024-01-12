//NPC Sirvo
//Vostle 00-05
//
//
//
//
//Sirvo Create
function scr_npc_sirvo_create(){
entity_step = scr_npc_sirvo_step;
sprite_index = spr_npc_sirvo;
npc_idle = spr_npc_sirvo;
npc_move = spr_npc_sirvo_walk;
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
//Sirvo Step
function scr_npc_sirvo_step(){
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
//Sirvo Text
function scr_text_npc_sirvo(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_sirvo,0,261,117);
draw_set_color(c_white);
var _name = "Sirvo"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "I've got beds open if you need rest.\nDon't worry about pay- a rat killer is a welcome guest." 
	_SubString = string_copy(text_string,1,letter_counter);
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
	selected = -1;
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