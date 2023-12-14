//NPC Nisma
//Vostle 03-00
//
//
//
//
//Nisma Create
function scr_npc_nisma_create(){
entity_step = scr_npc_nisma_step;
sound = snd_npc_mouse;
interact = 20;
}
//
//
//
//
//
//Nisma Step
function scr_npc_nisma_step(){
sprite_index = spr_npc_nisma;
scr_player_animation();
scr_npc_interact(12);
}
//
//
//
//
//
//Nisma Text
function scr_text_npc_nisma(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_nisma,0,261,117);
draw_set_color(c_white);
var _name = "Nisma"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "The pedestal came to life with orange, and we knew you\nhad arrived... What can I do for you Courier?" 
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