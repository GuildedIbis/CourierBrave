//NPC Orodry
//Lenko West: Might Leveling

//
//
//
//Orodry Create
function scr_npc_orodry_create(){
entity_step = scr_npc_orodry_step;
sound = snd_npc_mouse;
interact = 20;
}



//
//
//
//Orodry Step
function scr_npc_orodry_step(){
sprite_index = spr_npc_orodry;
scr_player_animation();
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
	text_string = ""
	string_counter = 0;
	obj_inventory.quest_grid[# 10, 0] = true;
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