//Inventory Scripts
//
//
//
//
//
//Inventory Main Page
function InventoryMain(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	

//Tinted Background
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
//Menu Sprites
draw_sprite_stretched(spr_menu_circle16,3,69,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,92,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,115,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,138,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,161,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,184,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,207,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,230,8,21,24);
draw_sprite(spr_inventory_tabs,0,69,12);

//Overlayed Text
draw_set_font(global.fnt_main_white)
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(160,160,"PRESS \"TAB\" TO RESUME",.5,.5,0);

//Day Meter
if (obj_game.invPaused = true)
{
	var _dayPerc = (obj_game.day_timer/18000) * 100;
	draw_healthbar(15,9,41,11,_dayPerc,c_black,c_white,c_white,0,true,true);
	draw_sprite_ext(spr_lighting_phase,global.dayPhase,12,7,1,1,0,c_white,1.0);
}

//Button Mechanics
if (point_in_rectangle(_mouseX,_mouseY,69,8,90,36))//Player Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,68,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = scr_menu_stats;
		//playerMenu_draw = DrawStats;
		selected_info = Idle;
		page = 0;
			
	}
}
if (point_in_rectangle(_mouseX,_mouseY,92,8,113,36)) //Forms Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,91,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = scr_menu_form_switch;
		form_menu = obj_inventory.form_grid[# obj_player.form, 3];
		//gear_sprite = spr_armor_allGame;
		//stat_script = obj_inventory.form_grid[# obj_player.form, 3];
		//describe_script = DrawWeaponDescribe;
		selected_info = -1;
		item_name = obj_inventory.form_grid[# obj_player.form, 0];
		page = 0;
		slot = obj_player.form;
		
		//unlocked = true;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,115,8,139,36)) //Items Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,114,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = scr_menu_upgrade_items;
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,138,8,159,36)) //Quest Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,137,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = Idle;
		page = 0;
		slot = -1
		inv_gui = scr_menu_quest;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,161,8,182,36)) //Map Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,160,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = scr_menu_map_base;
		room_num = obj_game.room_num;
		page = 0;
		item_id = -1;
		slot = obj_game.level_num;
		map_selected = map_grid[# obj_game.level_num, 2];
	}
}
if (point_in_rectangle(_mouseX,_mouseY,184,8,205,36)) //Treasure Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,183,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = WorkInProgress;
		selected_info = Idle;
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,207,8,228,36)) //Treasure Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,206,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = WorkInProgress;
		selected_info = Idle;
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,230,8,251,36)) //Info Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,229,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		obj_game.gamePaused = false;
		obj_game.invPaused = false;
	}
}

}
//
//
//
//
//
//WIP
function WorkInProgress(){
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,88,"WORK IN PROGRESS",1,1,0);
}





