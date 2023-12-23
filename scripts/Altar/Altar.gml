//Altar
//Where the player levels their character stats
//
//
//
//
//
//Altar Create
function scr_altar_create(){
entity_step = scr_altar;
reset = false;
shadow = true;
shadow_size = 2;
sound = snd_text01;
altar = true;
interact = 32;
}
//
//
//
//
//
//Altar Step
function scr_altar(){
sprite_index = spr_altar;
scr_npc_interact(12);
}
//
//
//
//
//
//Altar Text
function scr_text_altar_main(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
//draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
//draw_sprite(spr_npc_alter_portrait,0,273,129);
draw_set_color(c_white);
//var _name = "Altar"

var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Health and charges restored.\nEnemies restored.\nYou will return here on death." 
	_SubString = string_copy(text_string,1,letter_counter);
	altar = true;
}

if (string_counter >= 1)
{
	//text_script = AlterMenu;
	//alter_gui = LevelStatsMenuGUI;
	scr_game_room_enemy_reset();
	scr_player_reset();
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
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
//draw_text_transformed(259,110,_name,.5,.5,0);
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);


//draw_sprite(spr_npc_alter36,0,258+6,136+6);
}
//
//
//
//
//
//Altar Menu
function scr_menu_altar_main(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);



	
//if (point_in_rectangle(_mouseX,_mouseY,126,74,158,106))
//{
//	draw_sprite_stretched(spr_highlight_circle,0,125,73,34,34)
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		scr_game_room_enemy_reset();
//		scr_player_reset();
//		text_script = scr_menu_altar_crystal;
//		text_gui = -1;
//	}
//}
if (point_in_rectangle(_mouseX,_mouseY,162,74,194,106))
{
	draw_sprite_stretched(spr_highlight_circle,0,161,73,34,34)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		//map_selected = obj_game.room_num;
		scr_game_room_enemy_reset();
		scr_player_reset();
		text_script = scr_menu_altar_map;
		text_gui = -1;
		altar = true;
		
		room_num = obj_game.room_num;
		page = 0;
		item_id = -1;
		slot = obj_game.level_num;
		map_selected = obj_inventory.map_grid[# obj_game.level_num, 2];
	}
}
}
//
//
//
//
//
//Map GUI
function scr_menu_altar_map(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.fnt_main_white);
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite_stretched(spr_menu_beveled,3,59,39,200,102);
draw_sprite_stretched(spr_menu_circle16,1,12,82,16,16);
draw_sprite_ext(spr_map_level,slot,64,46,1.0,1.0,0,c_white,1.0);
draw_sprite_stretched(spr_menu,8,54,35,210,16)
draw_set_color(c_white);
draw_text_transformed(244,58,"MAP",1,1,0);


//Slider Bar
draw_sprite(spr_scroll_bar5b,page,245,61);
if (point_in_rectangle(_mouseX,_mouseY,245,61,253,67))
{
	draw_sprite(spr_scroll_highlight,0,245,60);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 4;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,245,129,253,135))
{
	draw_sprite(spr_scroll_highlight,1,245,128);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 4) page = page + 1;
		else page = 0;
	}
}


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Map Select Buttons
for (var i = 0; i < 4; i = i + 1)
{
	var _iPage = i + (4 * page)
	draw_sprite_stretched(spr_menu_circle16,3,228,63 + (i * 18),16,16);
	if (obj_inventory.level_ary[_iPage] = true)
	{
		//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(spr_map_button,_iPage,228,63+(i*18),1.0,1.0,0,c_white,1.0);
		if (point_in_rectangle(_mouseX,_mouseY,228,63 + (i * 18),244,79 + (i * 18)))
		{
			draw_sprite_stretched(spr_highlight_circle,0,227,62 + (i * 18),18,18);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				slot = _iPage;
				map_selected = obj_inventory.map_grid[# _iPage, 2];
			}
		}
	}
	else draw_sprite_ext(spr_lock,1,235,71+(i*18),1,1,0,c_white,1.0);
}
if (map_selected != -1)
{
	//Map Functions Found in Inventory Map Menu
	script_execute(map_selected)
}


//Exit
draw_sprite_ext(spr_menu_arrow,2,20,90,1.0,1.0,0,c_white,1.0);
if (point_in_rectangle(_mouseX,_mouseY,12,82,28,98))
{
	draw_sprite_stretched(spr_highlight_circle,0,11,81,18,18)
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = scr_text_altar_main;
	}
}
if (keyboard_check_pressed(ord("E")))
{
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
	//text_script = AltarMenu;
	//alter_gui = LevelStatsMenuGUI;
	text_gui = -1;
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
}	
//
//
//
//
//
//Altar Menu
function scr_menu_altar_crystal(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _enchantMenu = array_create(25);
var _enchantName = array_create(25);
_enchantMenu[0] = scr_menu_crystal_enchant_spectral;
_enchantMenu[1] = scr_menu_crystal_enchant_yelline;
_enchantMenu[2] = scr_menu_crystal_enchant_orine;
_enchantMenu[3] = scr_menu_crystal_enchant_violine;
_enchantMenu[4] = scr_menu_crystal_enchant_bluine;
_enchantMenu[5] = scr_menu_crystal_enchant_grenine;
_enchantMenu[6] = scr_menu_crystal_enchant_redine;
_enchantMenu[7] = scr_menu_crystal_enchant_cure;
_enchantMenu[8] = scr_menu_crystal_enchant_blueUltra;
_enchantMenu[9] = scr_menu_crystal_enchant_blueUltra;
_enchantMenu[10] = scr_menu_crystal_enchant_blueUltra;
_enchantMenu[11] = scr_menu_crystal_enchant_blueUltra;

_enchantName[0] = "Spectral Restore";
_enchantName[1] = "Yelline Restore";
_enchantName[2] = "Orine Restore";
_enchantName[3] = "Violine Restore";
_enchantName[4] = "Bluine Restore";
_enchantName[5] = "Grenine Restore";
_enchantName[6] = "Redine Restore";
_enchantName[7] = "Cure";
_enchantName[8] = "Yellow Ultra";
_enchantName[9] = "Orange Ultra";
_enchantName[10] = "Purple Ultra";
_enchantName[11] = "Blue Ultra";
//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);


//Menu Base and Buttons
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_text_transformed(99,32,"PRESS \"E\" TO RESUME",.5,.5,0);
draw_text_transformed(160,156,"USE THE MOUSE WHEEL TO SELECT\nA CRYSTAL CHARGE TO REPLACE",.5,.5,0);
//Left
draw_sprite_stretched(spr_menu_beveled,3,44,35,110,108);
draw_sprite_stretched(spr_menu,8,39,35,120,16);
draw_sprite_stretched(spr_menu_circle16,1,12,82,16,16);
draw_text_transformed(99,45,"CRYSTAL ENCHANTMENTS",1,1,0);
//Right
draw_sprite(spr_menu_rope,3,176,99);
draw_sprite(spr_menu_rope,3,262,99);
draw_sprite_stretched(spr_menu_beveled,3,166,35,110,66);
draw_sprite_stretched(spr_menu_beveled,3,166,107,110,16);
draw_sprite_stretched(spr_menu,8,161,35,120,16);
draw_sprite_stretched(spr_menu_circle16,3,196,127,50,16);



//Buttons
//if (obj_player.crystal_ary[obj_player.crystal_selected] = -1)
//{
//Lefthand Buttons
for (var i = 0; i < 5; i = i + 1)
{
	var _id = i + (5 * page);
	draw_set_halign(fa_left);
	draw_sprite_stretched(spr_menu_circle16,1,49,53+(17 * i),90,16);
	if (obj_inventory.crystal_enchant[_id] = true)
	{
		draw_text_transformed(62,61+(17*i),_enchantName[_id],.6,.6,0)
		draw_sprite_ext(spr_menu_crystal_enchant,_id+1,49,53+(17*i),1,1,0,c_white,1.0);
		if (point_in_rectangle(_mouseX,_mouseY,49,53+(17*i),139,69+(17*i)))
		{
			draw_sprite_stretched(spr_highlight_circle,0,48,52+(17*i),92,18);
			if (mouse_check_button_pressed(mb_left))
			{
				text_gui = _enchantMenu[_id];
			}				
		}
	}
	else
	{
		draw_text_transformed(62,61+(17*i),"???",.6,.6,0)
	}
}
//Scroll Bar on Left Side
draw_sprite(spr_scroll_bar5b,page,141,58);
if (point_in_rectangle(_mouseX,_mouseY,141,58,149,64))
{
	draw_sprite(spr_scroll_highlight,0,141,57);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 4;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,141,126,149,132))
{
	draw_sprite(spr_scroll_highlight,1,141,125);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 4) page = page + 1;
		else page = 0;
	}
}
//Selected Enchantment Menu Script
if (text_gui != -1)
{
	script_execute(text_gui);	
}
else
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(221,78,"SELECT AN ENCHANTMENT TO CRAFT.\n\nIT WILL REPLACE THE CURRENT\nCHARGE.",.6,.6,0);
}


//Player Crystal Selected
with (obj_player)
{
	scr_player_crystal_select();
	var _selectX = 160 - (8*crystal_count) + (17 * crystal_selected);
	draw_sprite_stretched(spr_button_background,0,_selectX,166,12,12)
	for (var j = 0; j < crystal_count; j = j + 1)
	{
		var _xPos = (158 - (8*crystal_count)) + (17*j);
		var _yPos = 164;
		if (crystal_ary[j] != -1)
		{
			draw_sprite_ext(spr_hud_crystal,crystal_ary[j],_xPos,_yPos,1.0,1.0,0,c_white,1.0);
		}
		else
		{
			draw_sprite_ext(spr_hud_crystal_empty,0,_xPos,_yPos,1.0,1.0,0,c_white,1.0);
		}
		
	}
}

//Exit
draw_sprite_ext(spr_menu_arrow,2,20,90,1.0,1.0,0,c_white,1.0);
if (point_in_rectangle(_mouseX,_mouseY,12,82,28,98))
{
	draw_sprite_stretched(spr_highlight_circle,0,11,81,18,18)
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = scr_text_altar_main;
	}
}
if (keyboard_check_pressed(ord("E")))
{
	//text_script = AltarMenu;
	//alter_gui = LevelStatsMenuGUI;
	text_gui = -1;
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
}
//
//
//
//
//
//1 Crystal Enchantment 0: Spectral 
function scr_menu_crystal_enchant_spectral(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(150 + (35 * obj_player.receptivity)) + " HEALTH";
draw_text_transformed(221,45,"SPECTRAL RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[0] >= 1) and (obj_inventory.rog_array[1] >= 1)
		{
			if (obj_inventory.rog_array[2] >= 1) and (obj_inventory.rog_array[3] >= 1)
			{
				if (obj_inventory.rog_array[4] >= 1) and (obj_inventory.rog_array[5] >= 1)
				{
					audio_sound_gain(snd_text02,global.volumeMenu,1);
					audio_play_sound(snd_text02,0,false);
					obj_player.crystal_ary[obj_player.crystal_selected] = 1;
					obj_inventory.rog_array[0] = obj_inventory.rog_array[0] - 1;
					obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
					obj_inventory.rog_array[2] = obj_inventory.rog_array[2] - 1;
					obj_inventory.rog_array[3] = obj_inventory.rog_array[3] - 1;
					obj_inventory.rog_array[4] = obj_inventory.rog_array[4] - 1;
					obj_inventory.rog_array[5] = obj_inventory.rog_array[5] - 1;
				}
			}
		}
	}
}

//172
//234
draw_sprite_stretched(spr_rog_all,0,172,106,16,16);
draw_text_transformed(172,120,"1\n("+ string(obj_inventory.rog_array[0])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,1,190,106,16,16);
draw_text_transformed(190,120,"1\n("+ string(obj_inventory.rog_array[1])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,2,207,106,16,16);
draw_text_transformed(207,120,"1\n("+ string(obj_inventory.rog_array[2])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,3,224,106,16,16);
draw_text_transformed(224,120,"1\n("+ string(obj_inventory.rog_array[3])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,4,241,106,16,16);
draw_text_transformed(241,120,"1\n("+ string(obj_inventory.rog_array[4])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,5,258,106,16,16);
draw_text_transformed(258,120,"1\n("+ string(obj_inventory.rog_array[5])+")",.6,.6,0);

}
//
//
//
//
//
//2 Crystal Enchantment 1: Yelline
function scr_menu_crystal_enchant_yelline(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nFULLY RESTORE YELLOW PRIMARY\nCHARGE.";
draw_text_transformed(221,45,"YELLINE RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[0] >= 1) and (obj_inventory.resource_array[0] >= 5)
		{
			if (obj_inventory.resource_array[3] >= 1)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 2;
				obj_inventory.rog_array[0] = obj_inventory.rog_array[0] - 1;
				obj_inventory.resource_array[0] = obj_inventory.resource_array[0] - 5;
				obj_inventory.resource_array[3] = obj_inventory.resource_array[3] - 1;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,0,186,107,16,16);
draw_text_transformed(186,120,"1\n("+ string(obj_inventory.rog_array[0])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,0,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[0])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,3,236,107,16,16);
draw_text_transformed(236,120,"1\n("+ string(obj_inventory.resource_array[3])+")",.6,.6,0);

}
//
//
//
//
//
//3 Crystal Enchantment 2: Orine 
function scr_menu_crystal_enchant_orine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nFULLY RESTORE ORANGE PRIMARY CHARGE.";
draw_text_transformed(221,45,"ORINE RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[1] >= 1) and (obj_inventory.resource_array[4] >= 5)
		{
			if (obj_inventory.resource_array[7] >= 1)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 3;
				obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
				obj_inventory.resource_array[4] = obj_inventory.resource_array[4] - 5;
				obj_inventory.resource_array[7] = obj_inventory.resource_array[7] - 1;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,1,186,107,16,16);
draw_text_transformed(186,120,"1\n("+ string(obj_inventory.rog_array[1])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,4,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[4])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,7,236,107,16,16);
draw_text_transformed(236,120,"1\n("+ string(obj_inventory.resource_array[7])+")",.6,.6,0);

}
//
//
//
//
//
//4 Crystal Enchantment 3: Violine 
function scr_menu_crystal_enchant_violine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nFULLY RESTORE PURPLE PRIMARY CHARGE.";
draw_text_transformed(221,45,"VIOLINE RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[2] >= 1) and (obj_inventory.resource_array[2] >= 5)
		{
			if (obj_inventory.resource_array[1] >= 1)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 4;
				obj_inventory.rog_array[2] = obj_inventory.rog_array[2] - 1;
				obj_inventory.resource_array[2] = obj_inventory.resource_array[2] - 5;
				obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 1;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,2,186,107,16,16);
draw_text_transformed(186,120,"1\n("+ string(obj_inventory.rog_array[1])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,2,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[2])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,1,236,107,16,16);
draw_text_transformed(236,120,"1\n("+ string(obj_inventory.resource_array[1])+")",.6,.6,0);

}
//
//
//
//
//
//5 Crystal Enchantment 4: Bluine 
function scr_menu_crystal_enchant_bluine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nFULLY RESTORE BLUE PRIMARY CHARGE.";
draw_text_transformed(221,45,"BLUINE RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[3] >= 1) and (obj_inventory.resource_array[2] >= 5)
		{
			if (obj_inventory.resource_array[1] >= 1)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 5; //(enchant # + 1)
				obj_inventory.rog_array[3] = obj_inventory.rog_array[3] - 1;
				obj_inventory.resource_array[2] = obj_inventory.resource_array[2] - 5;
				obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 1;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,3,186,107,16,16);
draw_text_transformed(186,120,"1\n("+ string(obj_inventory.rog_array[3])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,2,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[2])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,1,236,107,16,16);
draw_text_transformed(236,120,"1\n("+ string(obj_inventory.resource_array[1])+")",.6,.6,0);

}
//
//
//
//
//
//6 Crystal Enchantment 5: Grenin 
function scr_menu_crystal_enchant_grenine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nFULLY RESTORE GREEN PRIMARY CHARGE.";
draw_text_transformed(221,45,"GRENINE RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[1] >= 1) and (obj_inventory.resource_array[2] >= 5)
		{
			if (obj_inventory.resource_array[1] >= 1)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 6; //(enchant # + 1)
				obj_inventory.rog_array[2] = obj_inventory.rog_array[2] - 1;
				obj_inventory.resource_array[2] = obj_inventory.resource_array[2] - 5;
				obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 1;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,2,186,107,16,16);
draw_text_transformed(186,120,"1\n("+ string(obj_inventory.rog_array[1])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,2,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[2])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,1,236,107,16,16);
draw_text_transformed(236,120,"1\n("+ string(obj_inventory.resource_array[1])+")",.6,.6,0);

}
//
//
//
//
//
//7 Crystal Enchantment 6: Redine 
function scr_menu_crystal_enchant_redine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nFULLY RESTORE RED PRIMARY CHARGE.";
draw_text_transformed(221,45,"REDINE RESTORE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[5] >= 1) and (obj_inventory.resource_array[5] >= 5)
		{
			if (obj_inventory.resource_array[1] >= 1)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 7; //(enchant # + 1)
				obj_inventory.rog_array[5] = obj_inventory.rog_array[5] - 1;
				obj_inventory.resource_array[2] = obj_inventory.resource_array[2] - 5;
				obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 1;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,2,186,107,16,16);
draw_text_transformed(186,120,"1\n("+ string(obj_inventory.rog_array[1])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,2,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[2])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,1,236,107,16,16);
draw_text_transformed(236,120,"1\n("+ string(obj_inventory.resource_array[1])+")",.6,.6,0);

}
//
//
//
//
//
//8 Crystal Enchantment 7: Cure 
function scr_menu_crystal_enchant_cure(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "RESTORE " + string(60 + (15 * obj_player.receptivity)) + " HEALTH.\nCURE ALL STATUS EFFECTS.";
draw_text_transformed(221,45,"CURE",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[0] >= 1) and (obj_inventory.rog_array[1] >= 2)
		{
			if (obj_inventory.rog_array[2] >= 1) and (obj_inventory.rog_array[3] >= 2)
			{
				if (obj_inventory.rog_array[4] >= 1) and (obj_inventory.rog_array[5] >= 2)
				{
					audio_sound_gain(snd_text02,global.volumeMenu,1);
					audio_play_sound(snd_text02,0,false);
					obj_player.crystal_ary[obj_player.crystal_selected] = 8;
					obj_inventory.rog_array[0] = obj_inventory.rog_array[0] - 1;
					obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 2;
					obj_inventory.rog_array[2] = obj_inventory.rog_array[2] - 1;
					obj_inventory.rog_array[3] = obj_inventory.rog_array[3] - 2;
					obj_inventory.rog_array[4] = obj_inventory.rog_array[4] - 1;
					obj_inventory.rog_array[5] = obj_inventory.rog_array[5] - 2;
				}
			}
		}
	}
}

//172
//234
draw_sprite_stretched(spr_rog_all,0,172,106,16,16);
draw_text_transformed(172,120,"1\n("+ string(obj_inventory.rog_array[0])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,1,190,106,16,16);
draw_text_transformed(190,120,"2\n("+ string(obj_inventory.rog_array[1])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,2,207,106,16,16);
draw_text_transformed(207,120,"1\n("+ string(obj_inventory.rog_array[2])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,3,224,106,16,16);
draw_text_transformed(224,120,"2\n("+ string(obj_inventory.rog_array[3])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,4,241,106,16,16);
draw_text_transformed(241,120,"1\n("+ string(obj_inventory.rog_array[4])+")",.6,.6,0);
draw_sprite_stretched(spr_rog_all,5,258,106,16,16);
draw_text_transformed(258,120,"2\n("+ string(obj_inventory.rog_array[5])+")",.6,.6,0);

}
//
//
//
//
//
//12 Crystal Enchantment 8: Blue Ultra
function scr_menu_crystal_enchant_blueUltra(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _enchantText = "FIRE AN ICE BOMB THAT DEALS " + string(50 + (25 * obj_player.receptivity)) + " DMG ON IMPACT AND\n" + string(100 + (50 * obj_player.receptivity)) + "EXPLOSION DMG.";
draw_text_transformed(221,45,"BLUE ULTRA",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_enchantText,.6,.6,0);

//Cost
if (point_in_rectangle(_mouseX,_mouseY,196,127,246,143))
{
	draw_sprite_stretched(spr_highlight_circle,0,195,126,52,18)
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[3] >= 1) and (obj_inventory.resource_array[4] >= 5)
		{
			if (obj_inventory.resource_array[1] >= 5)
			{
				audio_sound_gain(snd_text02,global.volumeMenu,1);
				audio_play_sound(snd_text02,0,false);
				obj_player.crystal_ary[obj_player.crystal_selected] = 12; 
				obj_inventory.rog_array[3] = obj_inventory.rog_array[3] - 5;
				obj_inventory.resource_array[4] = obj_inventory.resource_array[4] - 5;
				obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 5;

			}
		}
	}
}

//172
//234

draw_sprite_stretched(spr_rog_menu_all,2,186,107,16,16);
draw_text_transformed(186,120,"5\n("+ string(obj_inventory.rog_array[3])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,2,211,107,16,16);
draw_text_transformed(211,120,"5\n("+ string(obj_inventory.resource_array[4])+")",.6,.6,0);
draw_sprite_stretched(spr_resource_menu_all,1,236,107,16,16);
draw_text_transformed(236,120,"5\n("+ string(obj_inventory.resource_array[1])+")",.6,.6,0);

}