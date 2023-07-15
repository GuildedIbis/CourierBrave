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
	
	
//Draw Sprites
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);


//draw_sprite_stretched(button_sprite,3,69,8,21,24);
//draw_sprite_stretched(button_sprite,3,92,8,21,24);
//draw_sprite_stretched(button_sprite,3,115,8,21,24);
//draw_sprite_stretched(button_sprite,3,138,8,21,24);
//draw_sprite_stretched(button_sprite,3,161,8,21,24);
//draw_sprite_stretched(button_sprite,3,184,8,21,24);
//draw_sprite_stretched(button_sprite,3,207,8,21,24);
//draw_sprite_stretched(button_sprite,3,230,8,21,24);
//draw_sprite(spr_lock,0,160,108);
//draw_sprite(spr_lock,0,224,108);

draw_sprite_stretched(spr_menu_circle16,3,69,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,92,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,115,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,138,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,161,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,184,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,207,8,21,24);
draw_sprite_stretched(spr_menu_circle16,3,230,8,21,24);

	



//Mechanics
if (point_in_rectangle(_mouseX,_mouseY,69,8,90,36))//Player Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,68,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = StatsMenuGUI;
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
		inv_gui = FormSwitchMenu;
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
		inv_gui = scr_menu_item_gui;	
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
		inv_gui = QuestMenuGUI;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,161,8,182,36)) //Map Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,160,7,23,26);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = MapMenuGUI;
		room_num = obj_game.room_num;
		page = 0;
		item_id = -1;
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




//draw_sprite_stretched(menu_sprite,3,64,36,192,96);
//Set Text
draw_set_font(fnt_text);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
//Draw Text
draw_text_transformed(160,160,"TAB\nto resume",.5,.5,0);
draw_set_halign(fa_center);
draw_sprite(spr_inventory_tabs,0,69,12)
//draw_text_transformed(80,142,"MAP",.35,.35,0);	
//draw_text_transformed(106,142,"ITEMS",.35,.35,0);	
//draw_text_transformed(132,142,"PLAYER",.35,.35,0);
//draw_text_transformed(158,142,"EQUIPMENT",.35,.35,0);
//draw_text_transformed(184,142,"EXIT",.35,.35,0);

}
//
//
//
//
//
//WIP
function WorkInProgress(){
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text_transformed(160,88,"WORK IN PROGRESS",.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(159,88,"WORK IN PROGRESS",.5,.5,0);
}





