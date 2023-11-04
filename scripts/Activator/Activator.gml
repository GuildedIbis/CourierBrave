//Activator
//Where the player activates live events that are turned off on death.
//
//
//
//
//
//Activator Create
function scr_activator_create(){
entity_step = scr_activator_step;
activator_sprite = spr_activator;
activate_sound = snd_text01;
interact = 20;
}
//
//
//
//
//
//Activator Sundial Create
function scr_activator_sundial_create(){
entity_step = scr_activator_step;
activator_sprite = spr_sundial;
activate_sound = snd_text01;
interact = 20;
}
//
//
//
//
//
//Activator Step
function scr_activator_step(){
sprite_index = activator_sprite;
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,12)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		//show_debug_message(string(instance_number(obj_inventory)));
		//show_debug_message(string(instance_number(obj_text)));
		audio_sound_gain(activate_sound,global.volumeEffects,1);
		audio_play_sound(activate_sound,0,false);
		//map_ary[activate_args][3] = 1;
		//direction = 270;
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			if (other.activate_script != -1) text_script = other.activate_script;
			//if (other.activate_args != -1) quest_num = other.activate_args;
			//if (other.map_ary != -1) map_ary = obj_inventory.farwayRoad_map_ary;
		}
		if (activate_script != -1)
		{
			obj_game.gamePaused = true;
			obj_game.textPaused = true;
			if (obj_game.gamePaused)
			{
				with (all)
				{
					game_paused_image_speed = image_speed;
					image_speed = 0;
				}
			}
			else
			{
				with (all)
				{
					image_speed = game_paused_image_speed;
				}
			}
		}
	}
}

}
//
//
//
//
//
//Farway Road Stone Activator Text
function scr_text_activator_farwayRoad_stone_door(){
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Activator"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "A button on the pedestal seemed to have\nopened a door somewhere." 
	_SubString = string_copy(text_string,1,letter_counter);
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	//map_ary[quest_num][3] = 1;
	obj_inventory.farwayRoad_map_ary[14][3] = 1;
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
//Farway Road Cemetary Door Activator Text
function scr_text_activator_farwayRoad_cemetery_door(){
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Activator"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "A button on the pedestal seemed to have\nopened a door somewhere." 
	_SubString = string_copy(text_string,1,letter_counter);
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	//map_ary[quest_num][3] = 1;
	obj_inventory.farwayRoad_map_ary[10][3] = 1;
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
//Yakflower Path Endire Camp Activator Text
function scr_text_activator_yakflowerPath_endireCamp_door(){
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Activator"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "A button on the pedestal seemed to have\nopened a door somewhere." 
	_SubString = string_copy(text_string,1,letter_counter);
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	//map_ary[quest_num][3] = 1;
	obj_inventory.yakflowerPath_map_ary[10][3] = 1;
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
//Yakflower Path Sundial Activator Text
function scr_text_activator_yakflowerPath_sundial(){
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Sun Dial"


//Draw Based on String Counter
var _SubString
if (obj_inventory.quest_grid[# 6, 1] = 0)
{
if (string_counter = 0)
{
	speaker = 1;
	text_string = "It's a sun dial..." 
	_SubString = string_copy(text_string,1,letter_counter);
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_set_valign(fa_middle);
draw_text_transformed(64,132,_name,.5,.5,0);
draw_set_halign(fa_right);
draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}
if (obj_inventory.quest_grid[# 6, 1] >= 1)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "It's the sun dial the Lunar Sabi mentioned.\nThe top of it spins and seems to activate." 
		_SubString = string_copy(text_string,1,letter_counter);
	}

	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		//map_ary[quest_num][3] = 1;
		if (obj_inventory.quest_grid[# 6, 1] = 1)
		{
			obj_inventory.quest_grid[# 6, 1] = 2;
		}
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
}
//
//
//
//
//
//Habraf Lake Mothwing Door Activator Text
function scr_text_activator_habrafLake_mothwing_door(){
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
var _name = "Activator"


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "A button on the pedestal seemed to have\nopened a door somewhere." 
	_SubString = string_copy(text_string,1,letter_counter);
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	//map_ary[quest_num][3] = 1;
	obj_inventory.habrafLake_map_ary[10][3] = 1;
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
	
