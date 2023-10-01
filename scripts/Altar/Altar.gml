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
//Tinted Background
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite_stretched(spr_menu_beveled,3,121,65,78,46);
draw_sprite_stretched(spr_menu,8,116,57,88,16);
draw_sprite_stretched(spr_menu_circle16,1,126,74,32,32);
draw_sprite_stretched(spr_menu_circle16,1,162,74,32,32);
draw_sprite(spr_altar_menu_icons,0,126,74);
draw_sprite(spr_altar_menu_icons,1,162,74);

var _SubString
if (string_counter = 0)
{
	speaker = 1;
	//text_string = "You will return here when on death." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(118,52,"PRESS \"E\" TO RESUME",.5,.5,0);
	altar = true;
	scr_menu_altar_main();
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
draw_text_transformed(69,140,_SubString,.6,.6,0);
draw_text_transformed(148,61,"ALTAR",1,1,0);


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

if (point_in_rectangle(_mouseX,_mouseY,126,74,158,106))
{
	draw_sprite_stretched(spr_highlight_circle,0,125,73,34,34)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		text_script = scr_menu_altar_crull;
		text_gui = -1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,162,74,194,106))
{
	draw_sprite_stretched(spr_highlight_circle,0,161,73,34,34)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		//map_selected = obj_game.room_num;
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
//Altar Menu
function scr_menu_altar_crull(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _recipeMenu = array_create(25);
var _recipeName = array_create(25);
_recipeMenu[0] = scr_menu_crull_recipe_spectral;
_recipeMenu[1] = scr_menu_crull_recipe_yelline;
_recipeMenu[2] = scr_menu_crull_recipe_orine;
_recipeMenu[3] = scr_menu_crull_recipe_spectral;
_recipeMenu[4] = scr_menu_crull_recipe_spectral;
_recipeMenu[5] = scr_menu_crull_recipe_spectral;

_recipeName[0] = "Spectral Crull";
_recipeName[1] = "Yelline Crull";
_recipeName[2] = "Orine Crull";
_recipeName[3] = "Violine Crull";
_recipeName[4] = "Bluine Crull";
_recipeName[5] = "Greenine Crull";
_recipeName[6] = "Redine Crull";
//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);


//Menu Base and Buttons
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_text_transformed(99,32,"PRESS \"E\" TO RESUME",.5,.5,0);
//Left
draw_sprite_stretched(spr_menu_beveled,3,44,35,110,108);
draw_sprite_stretched(spr_menu,8,39,35,120,16);
draw_sprite_stretched(spr_menu_circle16,1,12,82,16,16);
draw_text_transformed(99,45,"CRULL CHARGE RECIPES",1,1,0);
//Right
draw_sprite(spr_menu_rope,3,176,99);
draw_sprite(spr_menu_rope,3,262,99);
draw_sprite_stretched(spr_menu_beveled,3,166,35,110,66);
draw_sprite_stretched(spr_menu_beveled,3,166,107,110,16);
draw_sprite_stretched(spr_menu,8,161,35,120,16);
draw_sprite_stretched(spr_menu_circle16,3,196,127,50,16);



//Buttons
if (obj_player.crull_ary[obj_player.crull_selected] = -1)
{
	//Lefthand Buttons
	for (var i = 0; i < 5; i = i + 1)
	{
		var _id = i + (5 * page);
		draw_set_halign(fa_left);
		draw_sprite_stretched(spr_menu_circle16,1,49,53+(17 * i),90,16);
		if (obj_inventory.crull_recipe[_id] = true)
		{
			draw_text_transformed(62,61+(17*i),_recipeName[_id],.6,.6,0)
			draw_sprite_ext(spr_menu_crull_recipe,_id+1,49,53+(17*i),1,1,0,c_white,1.0);
			if (point_in_rectangle(_mouseX,_mouseY,49,53+(17*i),139,69+(17*i)))
			{
				draw_sprite_stretched(spr_highlight_circle,0,48,52+(17*i),92,18);
				if (mouse_check_button_pressed(mb_left))
				{
					text_gui = _recipeMenu[_id];
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
	//Selected Recipe Menu Script
	if (text_gui != -1) script_execute(text_gui);
	
}
else
{
	draw_text_transformed(99,98,"SELECT AN EMPTY\nCRULL CHARGE.",.6,.6,0);
}


//Player Crull Selected
with (obj_player)
{
	scr_player_crull_select();
	var _selectX = 154 - (8*crull_count) + (17 * crull_selected);
	draw_sprite_stretched(spr_button_background,0,_selectX,166,12,12)
	for (var j = 0; j < crull_count; j = j + 1)
	{
		var _xPos = (152 - (8*crull_count)) + (17*j);
		var _yPos = 164;
		if (crull_ary[j] != -1)
		{
			draw_sprite_ext(spr_hud_crull,crull_ary[j],_xPos,_yPos,1.0,1.0,0,c_white,1.0);
		}
		else
		{
			draw_sprite_ext(spr_hud_crull_empty,0,_xPos,_yPos,1.0,1.0,0,c_white,1.0);
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
//Crull Recipe 0: Spectral
function scr_menu_crull_recipe_spectral(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _recipeText = "RESTORE " + string(150 + (35 * obj_player.receptivity)) + " HEALTH";
draw_text_transformed(221,45,"SPECTRAL CRULL",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_recipeText,.6,.6,0);

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
					obj_player.crull_ary[obj_player.crull_selected] = 1;
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
//Crull Recipe 1: Yelline
function scr_menu_crull_recipe_yelline(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _recipeText = "RESTORE " + string(50 + (13 * obj_player.receptivity)) + " HEALTH.\nRESTORE " + string(100 + (13 * obj_player.receptivity)) + " YELLOW CHARGE.";
draw_text_transformed(221,45,"YELLINE CRULL",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_recipeText,.6,.6,0);

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
				obj_player.crull_ary[obj_player.crull_selected] = 2;
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
//Crull Recipe 2: Orine 
function scr_menu_crull_recipe_orine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _recipeText = "RESTORE " + string(50 + (13 * obj_player.receptivity)) + " HEALTH.\nRESTORE " + string(100 + (13 * obj_player.receptivity)) + " ORANGE CHARGE.";
draw_text_transformed(221,45,"ORINE CRULL",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_recipeText,.6,.6,0);

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
				obj_player.crull_ary[obj_player.crull_selected] = 3;
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
//Crull Recipe 2: Orine 
function scr_menu_crull_recipe_violine(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _recipeText = "RESTORE " + string(50 + (13 * obj_player.receptivity)) + " HEALTH.\nRESTORE " + string(50 + (13 * obj_player.receptivity)) + " PURPLE CHARGE.";
draw_text_transformed(221,45,"VIOLINE CRULL",1,1,0);
draw_text_transformed(221,137,"CRAFT",.6,.6,0);
draw_text_transformed(221,78,_recipeText,.6,.6,0);

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
				obj_player.crull_ary[obj_player.crull_selected] = 4;
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
