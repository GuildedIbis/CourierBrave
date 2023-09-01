//Alter
//Where the player levels their character stats
//
//
//
//
//
//Alter Create
function scr_alter_create(){
entity_step = scr_alter;
shadow = true;
shadow_size = 2;
sound = snd_text01;
interact = 32;
}
//
//
//
//
//
//Alter Step
function scr_alter(){
sprite_index = spr_alter;
scr_npc_interact(12);
}
//
//
//
//
//
//Alter Text
function scr_text_alter_main(){
//Tinted Background
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite_stretched(spr_menu_beveled,3,121,65,78,46);
draw_sprite_stretched(spr_menu,8,116,53,88,20);
draw_sprite_stretched(spr_menu_circle16,1,126,74,32,32);
draw_sprite_stretched(spr_menu_circle16,1,162,74,32,32);
draw_sprite(spr_alter_menu_icons,0,126,74);
draw_sprite(spr_alter_menu_icons,1,162,74);
var _SubString


if (string_counter = 0)
{
	speaker = 1;
	//text_string = "You will return here when on death." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	scr_menu_alter_main();
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

//Draw Text
draw_set_font(global.fnt_main_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white);
draw_text_transformed(69,140,_SubString,.6,.6,0);
//draw_text_transformed(259,130,_name,.5,.5,0);
//draw_sprite(spr_npc_alter36,0,258+6,136+6);
}
//
//
//
//
//
//Alter Travel
function AlterTravelMenu(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Slider
draw_sprite(spr_scroll_bar1b,page,68,43);
//if (point_in_rectangle(_mouseX,_mouseY,69,41,77,47))
//{
//	draw_sprite(spr_scroll_highlight,0,69,41);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (page > 0) page = page - 1;
//		else page = 1;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,114,77,119))
//{
//	draw_sprite(spr_scroll_highlight,1,69,114);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (page < 1) page = page + 1;
//		else page = 0;
//	}
//}

//Buttons
//draw_sprite_stretched(button_sprite,2,70,41,14,14);
//draw_sprite_stretched(button_sprite,2,70,57,14,14);
//draw_sprite_stretched(button_sprite,2,70,73,14,14);
//draw_sprite_stretched(button_sprite,2,70,89,14,14);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite_stretched(menu_sprite,3,103,41,147,86);
draw_sprite_part(spr_mapBackground,0,0,55,139,78,107,45);

for (var i = 0; i < 5; i = i + 1)
{
	draw_sprite_stretched(button_sprite,3,80,42 + (i * 17),15,15);
	if (obj_inventory.region_grid[# i, 1] = true)
	{
		//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(spr_map_button,i,80,42+(i*17),1.0,1.0,0,c_white,1.0);
		if (point_in_rectangle(_mouseX,_mouseY,80,42 + (i * 15),94,57 + (i * 15)))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,78,40 + (i * 17),19,19);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				map_selected = obj_inventory.region_grid[# i, 2];
			}
		}
	}
	else draw_sprite_ext(spr_lock,1,85,50+(i*17),1,1,0,c_white,1.0);
}
if (map_selected != -1)
{
	//draw_sprite_ext(spr_map,obj_inventory.map_selected,107,45,1.0,1.0,0,c_white,1);
	script_execute(map_selected)
}

}
//
//
//
//
//
//Alter Menu
function scr_menu_alter_main(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

if (point_in_rectangle(_mouseX,_mouseY,126,74,158,106))
{
	draw_sprite_stretched(spr_highlight_circle,0,125,73,34,34)
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = scr_menu_alter_crull;
	}
}

}
//
//
//
//
//
//Alter Menu
function scr_menu_alter_crull(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Menu Base and Buttons
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
//Left
draw_sprite_stretched(spr_menu_beveled,3,44,35,110,108);
draw_sprite_stretched(spr_menu,8,39,35,120,16);
draw_sprite_stretched(spr_menu_circle16,1,4,74,32,32);
//Right
draw_sprite(spr_menu_rope,3,176,99);
draw_sprite(spr_menu_rope,3,262,99);
draw_sprite_stretched(spr_menu_beveled,3,166,35,110,66);
draw_sprite_stretched(spr_menu_beveled,3,166,107,110,16);
draw_sprite_stretched(spr_menu,8,161,35,120,16);
draw_sprite_stretched(spr_menu_circle16,3,167,127,50,16);

//
if (point_in_rectangle(_mouseX,_mouseY,4,74,158,106))
{
	draw_sprite_stretched(spr_highlight_circle,0,3,73,34,34)
	if (mouse_check_button_pressed(mb_left))
	{
		text_script = scr_text_alter_main;
	}
}
if (keyboard_check_pressed(ord("E")))
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
}


	
