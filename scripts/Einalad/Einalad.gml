//NPC Einalad
//Vostle 00-05
//
//
//
//
//Einalad Create
function scr_npc_einalad_create(){
entity_step = scr_npc_einalad_step;
sound = snd_npc_mouse;
interact = 20;
}
//
//
//
//
//
//Einalad Step
function scr_npc_einalad_step(){
sprite_index = spr_npc_einalad;
scr_player_animation();
scr_npc_interact(12);
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