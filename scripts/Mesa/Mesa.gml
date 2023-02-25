//NPC Mesa the Browi
//Lair: Yakflower Path Camp
//Start, reset, and gather info on Yakflower Path
//
//
//
//
//Mesa Create
function MesaCreate(){
entity_step = MesaStep;
sound = snd_npc_mouse;
}
//
//
//
//
//
//Mesa Step
function MesaStep(){
sprite_index = spr_npc_mesa;
image_speed = 0;
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_index = _cardinalDir
	}
}
}
//
//
//
//
//
//Mesa Text
function MesaText(){

//First Time Speaking to Mesa
if (obj_inventory.quest_grid[# 8, 0] = false)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Mesa of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I heard of your arrival Courier.\nI am Mesa of the Browi, and I have\nbeen here studying the region of Yakflower Path." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "I believe there is a Form Stone\nhidden somewhere in the glade.\nWith it you could use another of your forms."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Yakflower is known as the home of\nOfa Moths, a large powerful create.\nI suspect too a darker precesnce hides in the trees too."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 3)
	{
		obj_inventory.quest_grid[# 8, 0] = true;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
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
	draw_sprite(spr_npc_andor36,0,258+6,136+6);
	
}
//
//
//
//Habraf Lake already started
if (obj_inventory.quest_grid[# 8, 0] = true) and (obj_inventory.quest_grid[# 8, 1] <= 3)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Andor of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I'm sure there is a Form Stone here.\nI think it's past the path south of here,\nbut it's blocked..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_script = AndorMenu;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
		
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
	draw_sprite(spr_npc_andor36,0,258+6,136+6);
}

//
//
//
//Nisma after intiation
if (obj_inventory.quest_grid[# 8, 0] = true) and (obj_inventory.quest_grid[# 8, 1] >= 4)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Andor of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Nice, you did it!" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "You found your Form Stone!\nAnd killed a mother lilly?\nI guess if anyone could, it's you."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}

	if (string_counter >= 2)
	{
		obj_inventory.quest_grid[# 8, 3] = true;
		text_script = AndorMenu;
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
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}

}
//
//
//
//
//
//Andor Menu
function AndorMenu(){
//Translate mouse position to GUI position
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	
//Set
draw_set_font(fnt_text);
draw_set_color(c_white);


//Text and Portriat
draw_set_halign(fa_left);
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);//Textbox
draw_sprite_stretched(menu_sprite,3,258,136,48,48);//Portrait Box
var _name = "Nisma of the Browi"
draw_text_transformed(259,130,_name,.35,.35,0);//Name Above Portrait Box
draw_sprite(spr_npc_nisma36,0,258+6,136+6); //Portrait


//Textbox Buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(button_sprite,3,70,142,88,15);
draw_sprite_stretched(button_sprite,3,164,142,88,15);
draw_text_transformed(114,149,"LAKE HABRAF LAIR",.5,.5,0);
draw_text_transformed(208,149,"RESTART LAIR",.5,.5,0);




if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = AndorHabrafText
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
	}
}
if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = AndorRestartMenu;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
	}
}
//if (point_in_rectangle(_mouseX,_mouseY,70,159,158,174))//Select magic menu 
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,68,157,92,19);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		text_gui = 3;
//		audio_sound_gain(snd_text01,global.volumeMenu,1);
//		audio_play_sound(snd_text01,0,false);
//	}
//}

if (keyboard_check_pressed(ord("E")))
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
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
//
//
//
//
//
//Andor Habraf Text
function AndorHabrafText(){

//Finish Introduction
if (obj_inventory.quest_grid[# 8, 1] < 3)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Andor of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I believe there is a Form Stone\nhidden somewhere in the lake.\nWith it you could use another of your forms."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "I suspect it's in a part of the\nlake I've been unable to reach.\nThere several doors locked and guarded by angry lilies."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Watch for the Ofa Moth here in Yakflower too. "
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 3)
	{
		speaker = 1;
		text_string = "But I must warn you Courier...\nthere is a rumor of a Mother Lilly living here.\nNo small beast those are, Courier."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 4)
	{
		text_string = ""
		string_counter = 0;
		text_script = AndorMenu;
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
	draw_sprite(spr_npc_andor36,0,258+6,136+6);
	
}
//
//
//
//Habraf Lake already started
if (obj_inventory.quest_grid[# 8, 0] = true) and (obj_inventory.quest_grid[# 8, 1] >= 3)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Andor of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Glad you found your Form Stone Courier.\nI hope my knowledge can be of continued use." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_script = AndorMenu;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
	
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
	draw_sprite(spr_npc_andor36,0,258+6,136+6);
}
}
//
//
//
//
//
//Andor Restart 
function AndorRestartMenu(){
//Conver Mouse Coordinates	
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Finish Introduction
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Andor of the Browi"

//Textbox Buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(button_sprite,3,70,159,88,15);
draw_sprite_stretched(button_sprite,3,164,159,88,15);
draw_text_transformed(114,164,"YES",.5,.5,0);
draw_text_transformed(208,164,"NO",.5,.5,0);

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Restart Lair: Habraf Lake?."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
	if (point_in_rectangle(_mouseX,_mouseY,70,159,158,174))//Select Yes: Restart Quest and Close Menu
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,68,157,92,19);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_inventory.habraf_lair[0] = 0;
			obj_inventory.habraf_lair[1] = 0;
			obj_inventory.habraf_lair[2] = 0;
			obj_inventory.habraf_lair[3] = 0;
			obj_inventory.habraf_lair[4] = 0;
			obj_inventory.quest_grid[# 8, 1] = 0;
			obj_inventory.quest_grid[# 8, 3] = false;
			audio_sound_gain(snd_text01,global.volumeMenu,1);
			audio_play_sound(snd_text01,0,false);
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
	if (point_in_rectangle(_mouseX,_mouseY,164,159,252,174))//Select No: Close Menu
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,162,157,92,19);
		if (mouse_check_button_pressed(mb_left))
		{
			
			audio_sound_gain(snd_text01,global.volumeMenu,1);
			audio_play_sound(snd_text01,0,false);
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
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_andor36,0,258+6,136+6);

}



//
//
//
//
//
//Andor Menu
//function AndorHabrafMenu(){
////Translate mouse position to GUI position
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
	
	
////Set
//draw_set_font(fnt_text);
//draw_set_color(c_white);


////Text and Portriat
//draw_set_halign(fa_left);
//draw_set_valign(fa_top)
//draw_sprite_stretched(menu_sprite,3,64,136,192,48);//Textbox
//draw_sprite_stretched(menu_sprite,3,258,136,48,48);//Portrait Box
//var _name = "Nisma of the Browi"
//draw_text_transformed(259,130,_name,.35,.35,0);//Name Above Portrait Box
//draw_sprite(spr_npc_nisma36,0,258+6,136+6); //Portrait


////Textbox Buttons
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_sprite_stretched(button_sprite,3,70,142,88,15);
//draw_sprite_stretched(button_sprite,3,164,142,88,15);
//draw_sprite_stretched(button_sprite,3,70,159,88,15);
//draw_sprite_stretched(button_sprite,3,164,159,88,15);
//draw_text_transformed(114,149,"Liliions",.5,.5,0);
//if (obj_inventory.quest_grid[# 8, 1] > 3) draw_text_transformed(208,149,"Mother Lilion",.5,.5,0);
//else draw_text_transformed(208,149,"???",.5,.5,0);
//if (obj_inventory.quest_grid[# 8, 1] > 0) draw_text_transformed(114,166,"Lily Cultist",.5,.5,0);
//else draw_text_transformed(114,166,"???",.5,.5,0);
//if (obj_inventory.quest_grid[# 8, 1] > 3) draw_text_transformed(208,166,"Ceriver",.5,.5,0);
//else draw_text_transformed(208,166,"???",.5,.5,0);




//if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		text_gui = 1;
//		audio_sound_gain(snd_text01,global.volumeMenu,1);
//		audio_play_sound(snd_text01,0,false);
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		text_gui = 2;
//		audio_sound_gain(snd_text01,global.volumeMenu,1);
//		audio_play_sound(snd_text01,0,false);
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,70,159,158,174))//Select magic menu 
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,68,157,92,19);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		text_gui = 3;
//		audio_sound_gain(snd_text01,global.volumeMenu,1);
//		audio_play_sound(snd_text01,0,false);
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,164,159,252,174))//Select magic menu 
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,162,157,92,19);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		text_gui = 4;
//		audio_sound_gain(snd_text01,global.volumeMenu,1);
//		audio_play_sound(snd_text01,0,false);
//	}
//}

//draw_set_halign(fa_left)
//draw_set_valign(fa_top)
//if (text_gui = 0) 
//{
	
//	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
//}
//if (text_gui = 1) 
//{
//	draw_sprite_stretched(menu_sprite,3,32,36,256,96);
//	draw_text_transformed(48,28,"Press E to Exit",.5,.5,0);
//}
//if (text_gui = 2) 
//{
//	draw_sprite_stretched(menu_sprite,3,32,36,256,96);
//	draw_text_transformed(48,28,"Press E to Exit",.5,.5,0);
//}
//if (text_gui = 3) 
//{
//	draw_sprite_stretched(menu_sprite,3,32,36,256,96);
//	draw_text_transformed(48,28,"Press E to Exit",.5,.5,0);
//}
//if (text_gui = 4) 
//{
//	draw_sprite_stretched(menu_sprite,3,32,36,256,96);
//	draw_text_transformed(48,28,"Press E to Exit",.5,.5,0);
//}

//if (keyboard_check_pressed(ord("E")))
//{
//	text_gui = 0;
//	text_string = ""
//	string_counter = 0;
//	audio_sound_gain(snd_menu,global.volumeMenu,1);
//	audio_play_sound(snd_menu,0,false);
//	//_SubString = string_copy(text_string,1,letter_counter);
//	obj_game.gamePaused = false;
//	obj_game.textPaused = false;
	
//	//Reset Buy/Sell Menu
//	page = 0;
//	slot = -1;
//	item_id = -1;
//	item_name = -1;
//	sell_price = 0;
//	buy_price = 0;
		
//}

//}
