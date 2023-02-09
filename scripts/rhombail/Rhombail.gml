//NPC Rhombhail
//Lenko West: Vendor
//
//
//
//
//
//Rombhail Create
function RhombailCreate(){
entity_step = RhombailStep;
sound = snd_npc_reptile;

}
//
//
//
//
//
//Rombhail Step
function RhombailStep(){
sprite_index = spr_npc_rhombail;
PlayerAnimation();
}
//
//
//
//
//
//Rombhail Text
function RhombailText(){

//Formatting
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Rhombail, Forest Mander Merchant"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Courier... customer...\nGoods at a fair price." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "Buy... or go."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_sprite_stretched(menu_sprite,3,64,36,192,96);
	DrawSellMenu(obj_inventory);
	DrawBuyMenu();
	DrawSelectedMenu(obj_inventory);
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
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_rhombail36,0,258+6,136+6);



}