//NPC Grezal the Browi
//Dungeon: Beaowire Fortress Camp
//Start, reset, and gather info on Lake Habraf
//
//
//
//
//Grezal Create
function GrezalCreate(){
entity_step = GrezalStep;
sound = snd_npc_mouse;
}
//
//
//
//
//
//Grezal Step
function GrezalStep(){
sprite_index = spr_npc_grezal;
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
//Grezal Text
function GrezalText(){

//First Time Speaking to Grezal
if (obj_inventory.quest_grid[# 14, 0] = false)
{
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Grezal of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I heard of your arrival Courier.\nI am Grezal of the Browi, and I have\nbeen here studying the region of Beaowire Fortress." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "One of the Necromancer's captains are here\nhiding from you and protecting\nan ancient relic of some nature."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "All of the entrances are locked or blocked,\nbut the western door is just south\nof here, and your best bet at getting in."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 3)
	{
		obj_inventory.quest_grid[# 14, 0] = true;
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
	draw_set_font(xfnt_text);
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
//Beaowire already started, not finished
if (obj_inventory.quest_grid[# 14, 0] = true) and (obj_inventory.quest_grid[# 14, 1] <= 12)
{
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Grezal of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "We need whatever relic the captain guards.\nThe western gate is going to be the\neasist way in if you can find a key." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_script = GrezalMenu;
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
	draw_set_font(xfnt_text);
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
//Beaowire fortress finsihed
if (obj_inventory.quest_grid[# 14, 0] = true) and (obj_inventory.quest_grid[# 14, 1] >= 12)
{
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Grezal of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "You found the relic!" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "The necromancer will need more than\nhis puny captains to defeat you, Courier."
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
		obj_inventory.quest_grid[# 14, 3] = true;
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
	draw_set_font(xfnt_text);
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
//Grezal Menu
function GrezalMenu(){
//Translate mouse position to GUI position
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	
//Set
draw_set_font(xfnt_text);
draw_set_color(c_white);


//Text and Portriat
draw_set_halign(fa_left);
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);//Textbox
draw_sprite_stretched(menu_sprite,3,258,136,48,48);//Portrait Box
var _name = "Grezal of the Browi"
draw_text_transformed(259,130,_name,.35,.35,0);//Name Above Portrait Box
draw_sprite(spr_npc_andor36,0,258+6,136+6); //Portrait


//Textbox Buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(button_sprite,3,70,142,88,15);
draw_sprite_stretched(button_sprite,3,164,142,88,15);
draw_text_transformed(114,149,"BEAOWIRE FORTRESS",.5,.5,0);
draw_text_transformed(208,149,"RESTART DUNGEON",.5,.5,0);




if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = GrezalBeaowireText
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
	}
}
if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = GrezalRestartMenu;
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
//Grezal Beaowire Text
function GrezalBeaowireText(){

//Finish Introduction
if (obj_inventory.quest_grid[# 14, 1] < 12)
{
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Grezal of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "This is the old fortress Beaowire..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "The rats invaded from the north over a hundred\nyears ago, unified under the Necromancer's banner\nafter hundreds of years of tribal fueding."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "They gave the fortress their own name\nwhen they captured it; \"Du'Balurne\", the Rat Keep."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 3)
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
	draw_set_font(xfnt_text);
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
//Beaowire Fortress already finished
if (obj_inventory.quest_grid[# 14, 0] = true) and (obj_inventory.quest_grid[# 14, 1] >= 12)
{
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Grezal of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Glad you found the old relic Courier.\nI hope my knowledge can be of continued use." 
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
	draw_set_font(xfnt_text);
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
//Grezal Restart 
function GrezalRestartMenu(){
//Conver Mouse Coordinates	
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Finish Introduction
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Grezal of the Browi"

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
	text_string = "Restart Dungeon: Beaowire Fortress."
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
	if (point_in_rectangle(_mouseX,_mouseY,70,159,158,174))//Select Yes: Restart Quest and Close Menu
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,68,157,92,19);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_inventory.beaowire_dungeon[0] = 0;
			obj_inventory.beaowire_dungeon[1] = 0;
			obj_inventory.beaowire_dungeon[2] = 0;
			obj_inventory.beaowire_dungeon[3] = 0;
			obj_inventory.beaowire_dungeon[4] = 0;
			obj_inventory.beaowire_dungeon[5] = 0;
			obj_inventory.beaowire_dungeon[6] = 0;
			obj_inventory.beaowire_dungeon[7] = 0;
			obj_inventory.beaowire_dungeon[8] = 0;
			obj_inventory.beaowire_dungeon[9] = 0;
			obj_inventory.beaowire_dungeon[10] = 0;
			obj_inventory.beaowire_dungeon[11] = 0;
			obj_inventory.beaowire_dungeon[12] = 0;
			obj_inventory.beaowire_dungeon[13] = 0;
			obj_inventory.beaowire_dungeon[14] = 0;
			obj_inventory.beaowire_dungeon[15] = 0;
			obj_inventory.beaowire_dungeon[16] = 0;
			obj_inventory.beaowire_dungeon[17] = 0;
			obj_inventory.quest_grid[# 14, 0] = false;
			obj_inventory.quest_grid[# 14, 1] = 0;
			obj_inventory.quest_grid[# 14, 3] = false;
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
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_andor36,0,258+6,136+6);

}

