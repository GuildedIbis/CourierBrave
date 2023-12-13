//NPC Basre
//Vostle 00-05
//
//
//
//
//Basre Create
function scr_npc_basre_create(){
entity_step = scr_npc_basre_step;
sound = snd_npc_mouse;
interact = 20;
}
//
//
//
//
//
//Basre Step
function scr_npc_basre_step(){
sprite_index = spr_npc_basre;
scr_player_animation();
scr_npc_interact(12);
}
//
//
//
//
//
//Basre Text
function scr_text_npc_basre(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_basre,0,261,117);
draw_set_color(c_white);
var _name = "Basre"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "My father was a farmer, and his father before him.\nMe- well my heart is in the West." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "The city calls to me Courier, and some day I will go." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter >= 2)
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