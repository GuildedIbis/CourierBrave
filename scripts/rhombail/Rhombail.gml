//NPC Rhombhail
//Lenko West: Vendor
//
//
//
//
//
//Rombhail Create
function scr_npc_rhombail_create(){
entity_step = scr_npc_rhombail;
sound = snd_npc_reptile;
interact = 20;
}
//
//
//
//
//
//Rombhail Step
function scr_npc_rhombail(){
sprite_index = spr_npc_rhombail;
PlayerAnimation();
scr_npc_interact(12);
}
//
//
//
//
//
//Rombhail Text
function scr_text_rhombail(){

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
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	text_script = scr_menu_rhombail_trade;
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
//
//
//
//
//
//Draw Inventory
function scr_menu_rhombail_trade(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _object = obj_inventory;

//Tinted Background
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);

draw_sprite_stretched(spr_menu_beveled,3,115,40,90,100);
draw_sprite_stretched(spr_menu,8,110,40,100,16);
draw_text_transformed(160,50,"TRADE",1,1,0);
draw_text_transformed(160,62,"GIVE > RECEIVE",.75,.75,0);
draw_sprite_stretched(spr_menu_circle16,3,120,66,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,84,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,102,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,120,80,16);

draw_text_transformed(150,160,"PRESS \"E\" TO RESUME",.5,.5,0);
if (keyboard_check_pressed(ord("E")))
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
}