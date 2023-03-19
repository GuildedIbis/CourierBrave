//Alter
//Where the player levels their character stats
//
//
//
//
//
//Alter Create
function AlterCreate(){
entity_step = AlterStep;
sound = snd_text01;
}
//
//
//
//
//
//Alter Step
function AlterStep(){
sprite_index = spr_alter;
}
//
//
//
//
//
//Alter Text
function AlterText(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Courier Shrine"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Travel between alters. (WIP)" 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}

if (string_counter >= 1)
{
	//text_script = AlterMenu;
	//alter_gui = LevelStatsMenuGUI;
	text_gui = 0;
	text_string = ""
	_SubString = string_copy(text_string,1,letter_counter);
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
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
draw_sprite(spr_npc_alter36,0,258+6,136+6);
}
//
//
//
//
//
//Alter Menu
function AlterMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	
//Draw Sprites
//draw_sprite_stretched(menu_sprite,4,0,0,320,180);	


draw_sprite_stretched(button_sprite,3,66,128,21,24);
draw_sprite_stretched(button_sprite,3,89,128,21,24);
draw_sprite_stretched(button_sprite,3,112,128,21,24);
draw_sprite_stretched(button_sprite,3,135,128,21,24);
draw_sprite_stretched(button_sprite,3,158,128,21,24);
draw_sprite_stretched(button_sprite,3,181,128,21,24);
draw_sprite_stretched(button_sprite,3,204,128,21,24);
draw_sprite_stretched(button_sprite,3,227,128,21,24);
//draw_sprite(spr_lock,0,160,108);
//draw_sprite(spr_lock,0,224,108);

	



//Mechanics
if (point_in_rectangle(_mouseX,_mouseY,66,128,87,156))//Player Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,64,126,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		//alter_gui = LevelStatsMenuGUI;
		//playerMenu_draw = DrawStats;
		selected_info = Idle;
		page = 0;
			
	}
}
if (point_in_rectangle(_mouseX,_mouseY,89,128,110,156)) //Forms Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,87,126,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		alter_gui = FormMenuGUI;
		//gear_sprite = spr_armor_allGame;
		//stat_script = obj_inventory.form_grid[# obj_player.form, 3];
		//describe_script = DrawWeaponDescribe;
		selected_info = Idle;
		page = 0;
		slot = 0;
		item_name = obj_inventory.form_grid[# obj_player.form, 0];
		//unlocked = true;
	}
}
//if (point_in_rectangle(_mouseX,_mouseY,112,128,133,156)) //Items Menu
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,110,126,25,28);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		item_id = -1;
//		inv_gui = ItemsMenuGUI;	
//		page = 0;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,135,128,156,156)) //Quest Menu
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,133,126,25,28);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		selected_info = Idle;
//		page = 0;
//		inv_gui = QuestMenuGUI;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,158,128,179,156)) //Map Menu
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,156,126,25,28);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		inv_gui = MapMenuGUI;
//		room_num = obj_game.room_num;
//		page = 0;
//		item_id = -1;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,181,128,202,156)) //Treasure Menu
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,179,126,25,28);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		inv_gui = WorkInProgress;
//		selected_info = Idle;
//		page = 0;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,204,128,225,156)) //Info Menu
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,202,126,25,28);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		inv_gui = WorkInProgress;
//		selected_info = Idle;
//		page = 0;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,227,128,248,156)) //Exit
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,225,126,25,28);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		obj_game.gamePaused = false;
//		obj_game.invPaused = false;
//	}
//}


draw_sprite_stretched(menu_sprite,3,64,36,192,96);

//Set Text
draw_set_font(fnt_text);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
	
//Draw Selected Alter Menu
if (alter_gui != -1) script_execute(alter_gui);
	
//Draw Text
draw_text_transformed(64,28,"Press \"E\" to Exit",.5,.5,0);
draw_set_halign(fa_center);
draw_sprite(spr_inventory_tabs,0,66,132)
//draw_text_transformed(80,142,"MAP",.35,.35,0);	
//draw_text_transformed(106,142,"ITEMS",.35,.35,0);	
//draw_text_transformed(132,142,"PLAYER",.35,.35,0);
//draw_text_transformed(158,142,"EQUIPMENT",.35,.35,0);
//draw_text_transformed(184,142,"EXIT",.35,.35,0);
if (keyboard_check_pressed(ord("E")))
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
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
//Level Stats Menu GUI
//function LevelStatsMenuGUI(){
////Get mouse location on GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);


//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_set_color(c_white);
////Background
//draw_sprite_stretched(spr_menu,3,69,54,90,16);
//draw_sprite_stretched(spr_menu,3,69,72,90,16);
//draw_sprite_stretched(spr_menu,3,69,90,90,16);
//draw_sprite_stretched(spr_menu,3,69,108,90,16);
//draw_sprite_stretched(spr_menu,3,161,108,90,16);
//////draw_sprite_stretched(spr_menu_circle16,3,70,42,36,36);
////draw_sprite_stretched(spr_menu_player_stat,0,100,46,30,30);
//////draw_sprite_stretched(spr_menu_circle16,3,184,42,36,36);
////draw_sprite_stretched(spr_menu_player_stat,1,191,46,30,30);
//////draw_sprite_stretched(spr_menu_circle16,3,70,88,36,36);
////draw_sprite_stretched(spr_menu_player_stat,2,100,92,30,30);
//////draw_sprite_stretched(spr_menu_circle16,3,184,88,36,36);
////draw_sprite_stretched(spr_menu_player_stat,3,191,92,30,30);
////if (point_in_rectangle(_mouseX,_mouseY,69,54,159,70))//Vitality
////{
////	draw_sprite_stretched(spr_highlight_nineslice,0,67,52,94,20);
////	if (mouse_check_button_pressed(mb_left))
////	{
////		audio_sound_gain(snd_menu,global.volumeMenu,1);
////		audio_play_sound(snd_menu,0,false);
////		page = 0;
		
////	}
////}
//if (point_in_rectangle(_mouseX,_mouseY,69,72,159,88))//Energy
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,70,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 0;
		
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,90,159,106))//Might
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,88,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 1;
		
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,108,159,124))//Grace
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,106,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 2;
		
//	}
//}


//var _vitalityTitle = "VITALITY | LVL: " + string(obj_player.vitality);
////var _energyTitle = "ENERGY | LVL: " + string(obj_player.energy);
//var _mightTitle = "MIGHT | LVL: " + string(obj_player.might);
//var _graceTitle = "GRACE | LVL: " + string(obj_player.grace);
////draw_text_transformed(75,59,_vitalityTitle,.35,.35,0);
//draw_text_transformed(75,77,_vitalityTitle,.35,.35,0);
//draw_text_transformed(75,95,_mightTitle,.35,.35,0);
//draw_text_transformed(75,113,_graceTitle,.35,.35,0);

////Draw Vitality
//if (page = 0)
//{
//	draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_font(fnt_text);
//	var _vitLevel = "Level: " + string(obj_player.vitality) + " > " + string(obj_player.vitality+1);
//	var _health = "Max health: " + string(150 + (3* ((obj_player.vitality) + round((obj_player.vitality)/15)))) + ">" + string(150 + (3* ((obj_player.vitality + 1) + round((obj_player.vitality+1)/15))));
//	var _cost = (obj_player.vitality * round(obj_player.vitality/2)) + obj_player.might + obj_player.grace;
//	//draw_sprite_stretched(menu_sprite,3,140,106,40,13);
//	draw_sprite(spr_bean,0,167,113)
//	draw_set_color(c_black);
//	draw_text_transformed(167,44,"VITALITY",.5,.5,0);
//	draw_text_transformed(167,60,"Increase max health.\nBase health 150.",.35,.35,0); 
//	draw_text_transformed(167,88,_vitLevel,.35,.35,0); 
//	draw_text_transformed(167,100,_health,.35,.35,0); 
//	draw_text_transformed(167,113,_cost,.35,.35,0)
//	draw_set_color(c_white);
//	draw_text_transformed(166,44,"VITALITY",.5,.5,0);
//	draw_text_transformed(166,60,"Increase max health.\nBase health 150.",.35,.35,0); 
//	draw_text_transformed(166,88,_vitLevel,.35,.35,0); 
//	draw_text_transformed(166,100,_health,.35,.35,0);
//	draw_text_transformed(166,113,_cost,.35,.35,0)
//	if (point_in_rectangle(_mouseX,_mouseY,161,108,251,124))//Level
//	{
//		draw_sprite_stretched(spr_highlight_nineslice,0,159,106,94,20);
//		if (mouse_check_button_pressed(mb_left))
//		{
//			audio_sound_gain(snd_menu,global.volumeMenu,1);
//			audio_play_sound(snd_menu,0,false);
//			obj_player.beans = obj_player.beans - _cost;
//			obj_player.vitality = obj_player.vitality + 1;
//			obj_player.max_hp = 150 + (3* (obj_player.vitality + round(obj_player.vitality/15)));
//			obj_player.hp = obj_player.max_hp;
			
		
//		}
//	}
//}


////Draw Energy
////if (page = 1)
////{
////	draw_sprite_stretched(spr_menu_player_stat,1,196,64,30,30);
////	draw_set_halign(fa_left);
////	draw_set_valign(fa_top);
////	draw_set_color(c_white);
////	draw_text_transformed(167,47,"ENERGY",.35,.35,0);
////	draw_text_transformed(167,54,"Base energy 50.\nEach level increases max energy.",.3,.3,0);
////}


////Draw Might
//if (page = 1)
//{
//	draw_sprite_stretched(spr_menu_player_stat,2,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
//	draw_text_transformed(167,47,"MIGHT",.35,.35,0);
//	draw_text_transformed(167,54,"Added to weapon skill.\nApplies to some special skills.",.3,.3,0);
//}

////Draw Grace
//if (page = 2)
//{
//	draw_sprite_stretched(spr_menu_player_stat,3,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
//	draw_text_transformed(167,47,"GRACE",.35,.35,0);
//	draw_text_transformed(167,54,"Applies to magic skills.\nApplies to some special skills.",.3,.3,0);
//}
////Leave Menu
//if (keyboard_check_pressed(ord("E")))
//{
//	text_gui = 0;
//	text_string = ""
//	string_counter = 0;
//	audio_sound_gain(snd_menu,global.volumeMenu,1);
//	audio_play_sound(snd_menu,0,false);
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

	
