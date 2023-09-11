//NPC Orodry
//Lenko West: Might Leveling

//
//
//
//Orodry Create
function scr_npc_orodry_create(){
entity_step = scr_npc_orodry_step;
sound = snd_npc_mouse;

}



//
//
//
//Orodry Step
function scr_npc_orodry_step(){
sprite_index = spr_npc_orodry;
PlayerAnimation();
scr_npc_interact(12);
}



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
//draw_set_halign(fa_left)
//draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
//draw_set_color(c_white);
//draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Orodry"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "I'm not sure what good it did them, but those rats\nblocked the road going West." 
	_SubString = string_copy(text_string,1,letter_counter);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "A shame... the fishing's much better on that side of the lake."
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
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}