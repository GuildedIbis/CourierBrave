//Star Orb Pedestal
//
//
//
//
//
//Star Orb Pedestal Create
function scr_inanimate_pedestal_starorb_create(){
entity_step = scr_inanimate_pedestal_starorb;
shadow = true;
shadow_size = 2;
sound = -1;
interact = 30;
active_sprite = spr_starOrb_pedestal;
idle_sprite = spr_starOrb_pedestal_stone;
}

//
//
//
//
//
//Star Orb Pedestal Step
function scr_inanimate_pedestal_starorb(){
if (obj_game.gamePaused = false)
{
	scr_npc_interact(12);
	if (obj_inventory.starOrb_pedestal_list[activate_args] = false)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) sprite_index = active_sprite;
		else sprite_index = idle_sprite;
		image_speed = 1;
		activate_script = scr_text_inanimate_pedestal_starorb;
	}
	else
	{
		sprite_index = spr_starOrb_pedestal_empty;
		image_speed = 0;
		activate_script = -1;
	}
}
}
//
//
//
//
//
//Star orb Text
function scr_text_inanimate_pedestal_starorb(){
//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);
var _name = "Star Orb Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Star Orb Found!\nUse it to level up one of the Courier's stats." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.star_orb = obj_inventory.star_orb + 1;
	obj_inventory.starOrb_pedestal_list[quest_num] = true;
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
