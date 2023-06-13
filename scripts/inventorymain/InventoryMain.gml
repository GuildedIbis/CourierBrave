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


draw_sprite_stretched(button_sprite,3,66,8,21,24);
draw_sprite_stretched(button_sprite,3,89,8,21,24);
draw_sprite_stretched(button_sprite,3,112,8,21,24);
draw_sprite_stretched(button_sprite,3,135,8,21,24);
draw_sprite_stretched(button_sprite,3,158,8,21,24);
draw_sprite_stretched(button_sprite,3,181,8,21,24);
draw_sprite_stretched(button_sprite,3,204,8,21,24);
draw_sprite_stretched(button_sprite,3,227,8,21,24);
//draw_sprite(spr_lock,0,160,108);
//draw_sprite(spr_lock,0,224,108);

	



//Mechanics
if (point_in_rectangle(_mouseX,_mouseY,66,8,87,36))//Player Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,64,6,25,28);
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
if (point_in_rectangle(_mouseX,_mouseY,89,8,110,36)) //Forms Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,87,6,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = FormMenuGUI;
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
if (point_in_rectangle(_mouseX,_mouseY,112,8,133,36)) //Items Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,110,6,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		item_id = -1;
		inv_gui = ItemsMenuGUI;	
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,135,8,156,36)) //Quest Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,133,6,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = Idle;
		page = 0;
		inv_gui = QuestMenuGUI;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,158,8,179,36)) //Map Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,156,6,25,28);
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
if (point_in_rectangle(_mouseX,_mouseY,181,8,202,36)) //Treasure Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,179,6,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = WorkInProgress;
		selected_info = Idle;
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,204,8,225,36)) //Treasure Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,202,6,25,28);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = WorkInProgress;
		selected_info = Idle;
		page = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,227,8,248,36)) //Info Menu
{
	draw_sprite_stretched(spr_highlight_nineslice,0,225,6,25,28);
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
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
	
//Draw Text
draw_text_transformed(64,28,"TAB to resume",.5,.5,0);
draw_set_halign(fa_center);
draw_sprite(spr_inventory_tabs,0,66,12)
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





