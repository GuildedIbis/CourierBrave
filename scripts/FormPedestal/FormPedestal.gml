//Form Pedestal
//
//
//
//
//
//Form Pedestal 1 Create
function scr_pedestal_form_1_create(){
entity_step = scr_pedestal_form_step;
shadow = true;
shadow_size = 2;
sound = snd_text01;
interact = 30;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 1;
}
//
//
//
//
//
//Form Pedestal 2 Create
function scr_pedestal_form_2_create(){
entity_step = scr_pedestal_form_step;
shadow = true;
shadow_size = 2;
sound = snd_text01;
interact = 30;
active_sprite = spr_form_pedestal;
idle_sprite = spr_form_pedestal_empty;
pedestal_index = 2;
}
//
//
//
//
//
//Form Stone Pedestal Step
function scr_pedestal_form_step(){
if (obj_game.gamePaused = false)
{
	
	if (obj_inventory.form_stone_list[activate_args] = false)
	{
		scr_npc_interact(12);
		sprite_index = active_sprite;
		image_speed = 0;
		image_index = pedestal_index;
	}
	else
	{
		interact = -1;
		sprite_index = idle_sprite;
		image_speed = 0;
	}
}
}
//
//
//
//
//
// Form Pedestal 1 Text
function scr_text_pedestal_form_1(){
//Convert Mouse to GUI
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Form Pedestal"
//
//
//
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Orange Form Stone found!\nSpend Form Stones in the Form Menu of the Inventory." 
	_SubString = string_copy(text_string,1,letter_counter);
	page = 0;
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.form_stone[1] = obj_inventory.form_stone[1] + 1;
	obj_inventory.form_stone_list[1] = true;
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
draw_text_transformed(259,110,_name,.5,.5,0);
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
}
//
//
//
//
//
// Form Pedestal 2 Text
function scr_text_pedestal_form_2(){
//Convert Mouse to GUI
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Form Pedestal"
//
//
//
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Purple Form Stone found!\nSpend Form Stones in the Form Menu of the Inventory." 
	_SubString = string_copy(text_string,1,letter_counter);
	page = 0;
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.form_stone[2] = obj_inventory.form_stone[2] + 1;
	obj_inventory.form_stone_list[2] = true;
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
draw_text_transformed(259,110,_name,.5,.5,0);
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
}