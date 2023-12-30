//Alt Magic Pedestal
//
//
//
//
//
//Skill Pedestal 0 Create
function scr_pedestal_skill_0_create(){
entity_step = scr_pedestal_skill_step;
sound = snd_text01;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 0;
}
//
//
//
//
//
//Skill Pedestal 1 Create
function scr_pedestal_skill_1_create(){
entity_step = scr_pedestal_skill_step;
sound = snd_text01;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 1;
}
//
//
//
//
//
//Skill Pedestal 2 Create
function scr_pedestal_skill_2_create(){
entity_step = scr_pedestal_skill_step;
sound = snd_text01;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 2;
}
//
//
//
//
//
//Skill Pedestal 3 Create
function scr_pedestal_skill_3_create(){
entity_step = scr_pedestal_skill_step;
sound = snd_text01;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 3;
}
//
//
//
//
//
//Skill Pedestal 4 Create
function scr_pedestal_skill_4_create(){
entity_step = scr_pedestal_skill_step;
sound = snd_text01;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 4;
}
//
//
//
//
//
//Skill Pedestal 5 Create
function scr_pedestal_skill_5_create(){
entity_step = scr_pedestal_skill_step;
sound = snd_text01;
shadow = true;
shadow_size = 2;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 5;
}
//
//
//
//
//
//Skill Stone Pedestal Step
function scr_pedestal_skill_step(){
scr_npc_interact(12);
if (obj_inventory.skill_stone_list[activate_args] = false)
{
		sprite_index = active_sprite;
		image_speed = 0;
		image_index = pedestal_index;
}
else
{
	sprite_index = idle_sprite;
	image_speed = 0;
}
}
//
//
//
//
//
//Skill Pedestal 0 Text
function scr_text_pedestal_skill_0(){
//Stone
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Power Stone Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Yellow Skill Stone found!\nSpend Skill Stones in the Form Menu of the Inventory." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.skill_stone[0] = obj_inventory.skill_stone[0] + 1;
	obj_inventory.skill_stone_list[0] = true;
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}
//
//
//
//
//
//Skill Pedestal 1 Text
function scr_text_pedestal_skill_1(){
//Stone
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Power Stone Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Orange Skill Stone found!\nSpend Skill Stones in the Form Menu of the Inventory." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.skill_stone[1] = obj_inventory.skill_stone[1] + 1;
	obj_inventory.skill_stone_list[1] = true;
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}
//
//
//
//
//
//Skill Pedestal 2 Text
function scr_text_pedestal_skill_2(){
//Stone
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Power Stone Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Purple Skill Stone found!\nSpend Skill Stones in the Form Menu of the Inventory." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.skill_stone[2] = obj_inventory.skill_stone[2] + 1;
	obj_inventory.skill_stone_list[2] = true; //Purple Skill Stone 1/12
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}
//
//
//
//
//
//Skill Pedestal 3 Text - Stand-In, 3 actually obtained from Kovalad
function scr_text_pedestal_skill_3(){
//Stone
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Power Stone Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Blue Skill Stone found!\nSpend Skill Stones in the Form Menu of the Inventory." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.skill_stone[3] = obj_inventory.skill_stone[3] + 1;
	obj_inventory.skill_stone_list[3] = true; //Blue Skill Stone 1/12
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}
	
