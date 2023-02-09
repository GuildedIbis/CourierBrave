// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerScene01(){
sprite_index = spr_player_scene01;
//Convert Mouse to GUI
}
//
//
//
//
//
//Player Scene Text 01
function PlayerSceneText01(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "The good creatures called the earth Omlio, and\ntheir goddess Kephra vowed to protect it." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,132,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "Ages ago a great evil had devoured Omlio,\nand Kephra sent a mighty warrior to destroy the evil."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,132,"Press E to Continue",.5,.5,0);
}
if (string_counter = 2)
{
	speaker = 1;
	text_string = "The mighty warrior was called the Courier,\nan undying protector of Omlio."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,132,"Press E to Continue",.5,.5,0);
}
if (string_counter = 3)
{
	speaker = 1;
	text_string = "The Courier was the master of mundane weapons\n and magical skills both, and took many physical forms."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,132,"Press E to Continue",.5,.5,0);
}
if (string_counter = 4)
{
	speaker = 1;
	text_string = "Now the time has come again.\nEvil has returned, and so too must the Courier..."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,132,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 5)
{
	obj_game.scene = false;
	obj_player.scene = false;
	obj_player.state_script = obj_player.free_state;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	room_goto(rm_lenko_tutorial);
	obj_player.x = 88;
	obj_player.y = 92;
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
}