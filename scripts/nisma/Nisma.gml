//NPC Nisma the Browi
//Kovalads House North of Lenko Main
//Magic and Special Upgrading
//
//
//
//
//Nisma Create
function NismaCreate(){
entity_step = NismaStep;
sound = snd_npc_mouse;
}
//
//
//
//
//
//Nisma Step
function NismaStep(){
sprite_index = spr_npc_nisma;
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
//Nisma Text
function NismaText(){

//
//
//
//Nisma after intiation
if (obj_inventory.quest_grid[# 0, 3] = true) and (obj_inventory.quest_grid[# 1, 1] >= 1)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Nisma of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "There are four keys hidden, and they\nmust be found before the Necromancer finds them." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Anything I can do to aid you on your journey?"
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
		//text_script = NismaMenu;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		text_gui = 0
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
//Finish Introduction
if (obj_inventory.quest_grid[# 0, 3] = false)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Nisma of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Greetings fellow creature of good.\nI am Nisma, and I have been waiting for you.\nI am one of the Browi. We have dedicated ourselves to\nyour service for the day that you return." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Finally, the day has come- you have been sent to our\n aid. Evil crawls in every corner of the world now.\nGood kind folks are nearly all but gone."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "But you will destroy this great darkness of our time.\nYou are the Courier, Kephras divine warrior, bound not\nto rest until your task is complete."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 3)
	{
		speaker = 1;
		text_string = "You'll find all the Browi are quite old.\nWe would be wasted on service in battle"
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 4)
	{
		speaker = 1;
		text_string = "But our knowledge is yours...\nWhatever use it may be..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 5)
	{
		obj_inventory.quest_grid[# 0, 0] = true;
		obj_inventory.quest_grid[# 0, 1] = 1;
		obj_inventory.quest_grid[# 0, 3] = true;
		obj_inventory.quest_grid[# 1, 0] = true;
		obj_inventory.quest_grid[# 1, 1] = 0;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
		//Revert if broken^
	
		//Reset Buy/Sell Menu
		text_gui = 0
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
//
//
//
//Nisma quest initiation
if (obj_inventory.quest_grid[# 0, 3] = true) and (obj_inventory.quest_grid[# 1, 1] = 0)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Nisma of the Browi"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "It would be an honor to study the magic arts with you\nCourier, but first there is important discussion of\nyour purpose... Olutaph." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Olutaph is a necromancer who has destroyed and\nconquered the land over the course of the last 300\nyears. He masked himself at first as a wise man to\nkings,to bring us into the weakness of civil war." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "Kings fell, and now he reigns over all from The\nFortress of the Heart... but I fear it may be worse\nthan a tyrant king... he has proclaimed himself the\nAcolyte of the Great Evil."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter = 3)
	{
		speaker = 1;
		text_string = "He plans to break the Great Evil from it's prison- and\nthis must be why you are sent to us now.\nYou must stop the Necromancer from unleashing\nThe Great Evil of ancient destruction."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter = 4)
	{
		speaker = 1;
		text_string = "The Great Evil was imprisoned in the Fortress of the\nHeart,and could only be freed with the\n4 Sephra Key's. You must act fast Courier, and\nfind the four keys before Olutaph."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter = 5)
	{
		speaker = 1;
		text_string = "They may be hidden, but it is no secret that one is in\nthe Fortress south of here."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter >= 6)
	{
		obj_inventory.quest_grid[# 1, 1] = 1;
		//text_script = NismaMenu;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		text_gui = 0
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
//Nisma Menu
function NismaMenu(){
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
draw_sprite_stretched(button_sprite,3,70,159,88,15);
draw_text_transformed(114,149,"MAGIC",.5,.5,0);
draw_text_transformed(208,149,"SPECIAL",.5,.5,0);
draw_text_transformed(114,166,"xCGx",.5,.5,0);



if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 1;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
	}
}
if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 2;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
	}
}
if (point_in_rectangle(_mouseX,_mouseY,70,159,158,174))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,157,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		//text_gui = 3;
		//audio_sound_gain(snd_text01,global.volumeMenu,1);
		//audio_play_sound(snd_text01,0,false);
	}
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (text_gui = 0) 
{
	
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
}
if (text_gui = 1) 
{
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(48,28,"Press E to Exit",.5,.5,0);
	DrawMagicBrowiMenu(obj_player.form,obj_inventory);
}
if (text_gui = 2) 
{
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(48,28,"Press E to Exit",.5,.5,0);
	DrawSpecialBrowiMenu(obj_player.form,obj_inventory);
}
if (text_gui = 3) 
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
	SaveGame();
	with (obj_text)
	{
		text_string = ""
		string_counter = 0;
		text_script = PlayerSceneTextCG;
	}
	obj_game.scene = true;
	obj_player.scene = true;
	obj_game.gamePaused = true;
	obj_game.textPaused = true;
	
		
	audio_stop_all();
}

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