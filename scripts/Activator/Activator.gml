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
sound = snd_text01;
interact = true;
}
//
//
//
//
//
//Activator Step
function scr_activator_step(){
sprite_index = spr_activator;
scr_npc_interact(12);

}
//
//
//
//
//
//Habraf Door A Activator Text
function scr_text_activator_door(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);


//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "A button on the pedestal seemed to have\nopened a door somewhere." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}

if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.farwayRoad_map_ary[15][3] = 0 = true;
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
draw_sprite(spr_npc_nisma36,0,258+6,136+6);

}
//
//
//
//
//
//Habraf Door B Activator Text
function HabrafDoorBActivatorText(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);


//Draw Based on String Counter
var _SubString
if (obj_inventory.habraf_lair[1] < 1)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "A button on the pedestal seemed to have\nopened a door somewhere." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.habraf_lair[1] = 1;
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
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}


if (obj_inventory.habraf_lair[1] >= 1)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "This button seemed to have opened a door somewhere." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}
}
//
//
//
//
//
//Activator Menu
function ActivatorMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Courier Shrine"
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_nisma36,0,258+6,136+6);

//Draw Based on String Counter
//Get mouse location on GUI


//draw_text_transformed(68,28,"Press E to Exit",.5,.5,0);

//Lefthand Buttons
draw_sprite_stretched(menu_sprite,3,70,142,88,15);
draw_sprite_stretched(menu_sprite,3,164,142,88,15);
draw_sprite_stretched(menu_sprite,3,70,163,88,15);
draw_sprite_stretched(menu_sprite,3,164,163,88,15);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(114,149,"YES",.5,.5,0);
draw_text_transformed(208,149,"NO",.5,.5,0);
//draw_text_transformed(40,158,"x(ARMOR)x",.5,.5,0);


if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		obj_game.event_live = true;
		obj_inventory.quest_grid[# quest_num, 0] = true; 
		obj_inventory.quest_grid[# quest_num, 1] = 0; 
		obj_player.tracking_quest = obj_inventory.quest_grid[# quest_num, 4]
		text_gui = 0;
		text_string = ""
		string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
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
if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		text_gui = 0;
		text_string = ""
		string_counter = 0;
		//_SubString = string_copy(text_string,1,letter_counter);
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


draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (text_gui = 0) 
{
	
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
}



if (keyboard_check_pressed(ord("E")))
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	//_SubString = string_copy(text_string,1,letter_counter);
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


	
