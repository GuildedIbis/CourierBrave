//NPC Gerepht
//Undecided Character
//
//
//
//
//
//NPC Gerepht Create
function GerephtCreate(){
entity_step = GerephtStep;
sound = snd_npc_mouse;
}
//
//
//
//
//
//NPC Gerepht Step
function GerephtStep(){
sprite_index = spr_npc_knightAvita;
PlayerAnimation();
}
//
//
//
//
//
//NPC Gerepht Text
function GerephtText(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Format
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Gerepht, Knight of Avita"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Avita guided us with vitality to survive." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "Train in the teachings of Avita and become greater."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_sprite_stretched(menu_sprite,3,96,36,128,96);
	DrawVitalityMenu();
	//DrawSellMenu(obj_inventory);
	//DrawBuyMenu();
	//DrawSelectedMenu(obj_inventory);
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
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_knightAvita36,0,258+6,136+6);

}