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
sound = snd_menu;
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
		//activate_script = scr_text_pedestal_starorb_00;
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
function scr_text_pedestal_starorb_00(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);
//var _name = "Star Orb Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Star Orb found!\nUse it to upgrade the Courier's stats\nin the inventory."
	_SubString = string_copy(text_string,1,letter_counter);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Quests and Rewards
	obj_inventory.star_orb = obj_inventory.star_orb + 1;
	obj_inventory.starOrb_pedestal_list[0] = true;
	
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
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);




}
//
//
//
//
//
//Star orb Text
function scr_text_pedestal_starorb_01(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);
//var _name = "Star Orb Pedestal"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	e_page = false;
	//draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	text_string = "Star Orb found!\nSelect a stat to permenantly upgrade."
	_SubString = string_copy(text_string,1,letter_counter);
	if (letter_counter >= string_length(text_string))
	{
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_sprite_stretched(spr_menu_circle16,1,70,70,180,20);
		draw_sprite_stretched(spr_menu_circle16,1,70,92,180,20);
		draw_sprite_stretched(spr_menu_circle16,1,70,114,180,20);
		var _buttonString = "Health (+ 20)"
		var _buttonString2 = "Charge (+ 20)"
		var _buttonString3 = "Stamina (+ 50)"
		draw_text_transformed(76,80,_buttonString,.6,.6,0);
		draw_text_transformed(76,102,_buttonString2,.6,.6,0);
		draw_text_transformed(76,124,_buttonString3,.6,.6,0);
		if (point_in_rectangle(_mouseX,_mouseY,70,70,250,90))
		{
			draw_sprite_stretched(spr_highlight_circle,0,69,69,182,22);
			if (mouse_check_button_pressed(mb_left))
			{
				obj_inventory.starOrb_pedestal_list[1] = true;
				obj_player.max_hp = obj_player.max_hp + 20;
				scr_player_reset();
				e_page = true;
				text_string = "";
				letter_counter = 0;
				string_counter = 1;
				page = 0;
			}
		}
		if (point_in_rectangle(_mouseX,_mouseY,70,92,250,112))
		{
			draw_sprite_stretched(spr_highlight_circle,0,69,91,182,22);
			if (mouse_check_button_pressed(mb_left))
			{
				obj_inventory.starOrb_pedestal_list[1] = true;
				obj_player.max_charge = obj_player.max_charge + 20;
				scr_player_reset();
				e_page = true;
				text_string = "";
				letter_counter = 0;
				string_counter = 1;
				page = 1;
			}
		}
		if (point_in_rectangle(_mouseX,_mouseY,70,114,250,134))
		{
			draw_sprite_stretched(spr_highlight_circle,0,69,113,182,22);
			if (mouse_check_button_pressed(mb_left))
			{
				obj_inventory.starOrb_pedestal_list[1] = true;
				obj_player.max_stamina = obj_player.max_stamina + 50;
				scr_player_reset();
				e_page = true;
				text_string = "";
				letter_counter = 0;
				string_counter = 1;
				page = 1;
			}
		}
		draw_set_valign(fa_middle);
		draw_set_halign(fa_right);
		//draw_text_transformed(69,64,"SELECT ONE",.5,.5,0);
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	//draw_text_transformed(259,900,_name,.5,.5,0);
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
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
//draw_set_color(c_white);
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_text_transformed(69,141,_SubString,.6,.6,0);
//draw_set_valign(fa_middle);
//draw_text_transformed(64,132,_name,.5,.5,0);
//draw_set_halign(fa_right);
//draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);




}
