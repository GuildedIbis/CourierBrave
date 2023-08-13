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
shadow = true;
shadow_size = 1;
sound = snd_text01;
interact = 32;
}
//
//
//
//
//
//Alter Step
function AlterStep(){
sprite_index = spr_alter;
scr_npc_interact(12);
}
//
//
//
//
//
//Alter Text
function AlterText(){
//Background
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
var _SubString


if (string_counter = 0)
{
	speaker = 1;
	text_string = "You will return here when on death." 
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
function AlterMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	
	
//Draw Sprites
//draw_sprite_stretched(menu_sprite,4,0,0,320,180);	
draw_sprite_stretched(menu_sprite,3,64,36,192,96);

//draw_sprite_stretched(button_sprite,3,66,128,21,24);
//draw_sprite_stretched(button_sprite,3,89,128,21,24);
//draw_sprite_stretched(button_sprite,3,112,128,21,24);
//draw_sprite_stretched(button_sprite,3,135,128,21,24);
//draw_sprite_stretched(button_sprite,3,158,128,21,24);
//draw_sprite_stretched(button_sprite,3,181,128,21,24);
//draw_sprite_stretched(button_sprite,3,204,128,21,24);
//draw_sprite_stretched(button_sprite,3,227,128,21,24);
//draw_sprite(spr_lock,0,160,108);
//draw_sprite(spr_lock,0,224,108);

	

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


	
