//NPC Dumire
//Vostle 00-04
//
//
//
//
//Dumire Create
function scr_npc_dumire_create(){
entity_step = scr_npc_dumire_step;
sprite_index = spr_npc_dumire;
npc_idle = spr_npc_dumire;
npc_move = spr_npc_dumire_walk;
sound = snd_npc_mouse;
interact = 20;
npc_spd = 1.0;
path = -1;
}
//
//
//
//
//
//Dumire Step
function scr_npc_dumire_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	scr_npc_wander_home_range(60,240,home_x,home_y,64);
	scr_npc_animation();
}
else path_end();
}
//
//
//
//
//
//dumire Text
function scr_text_npc_dumire(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_dumire,0,261,117);
draw_set_color(c_white);
var _name = "Dumire"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Sure, the rats are a problem, but the economy is what\nscares me. The price of grapes is theft if you ask me." 
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