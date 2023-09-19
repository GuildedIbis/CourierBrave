//Inventory Scripts
//
//
//
//
//
//Form Array
function scr_inventory_form_create(){
form_grid = ds_grid_create(18,9);

//Regaliare 
form_grid[# 0, 0] = "REGALIARE"
form_grid[# 0, 1] = "Description"
form_grid[# 0, 2] = scr_player_regaliare_set; //Set Script
form_grid[# 0, 3] = scr_menu_regaliare;
form_grid[# 0, 4] = true; //Unlocked Status
form_grid[# 0, 5] = 0; //Weapon
form_grid[# 0, 6] = 0; //Armor
form_grid[# 0, 7] = 0; //Magic
form_grid[# 0, 8] = 1; //Special

//Halofire
form_grid[# 1, 0] = "HALOFIRE"
form_grid[# 1, 1] = "White Lavos with fire hair and orange accents"
form_grid[# 1, 2] = scr_player_halofire_set; //Player Script
form_grid[# 1, 3] = scr_menu_halofire; //Inventory Script
form_grid[# 1, 4] = false; //Unlocked Status
form_grid[# 1, 5] = 0; //Weapon
form_grid[# 1, 6] = 1; //Armor
form_grid[# 1, 7] = 1; //Magic
form_grid[# 1, 8] = 0; //Special

//Adavoid
form_grid[# 2, 0] = "ADAVIO"
form_grid[# 2, 1] = "Purple armored Moros."
form_grid[# 2, 2] = scr_player_adavio_set; //Player Script
form_grid[# 2, 3] = scr_menu_adavio; //Inventory Script
form_grid[# 2, 4] = false; //Unlocked Status
form_grid[# 2, 5] = 1; //Weapon
form_grid[# 2, 6] = 1; //Armor
form_grid[# 2, 7] = 1; //Magic
form_grid[# 2, 8] = 1; //Special

//Ceriver
form_grid[# 3, 0] = "CERIVER"
form_grid[# 3, 1] = "Blue and Green Remphos with boomerang, bubbles, and sp (water cannon with push?)"
form_grid[# 3, 2] = scr_player_ceriver_set; //Player Script
form_grid[# 3, 3] = scr_menu_ceriver; //Inventory Script
form_grid[# 3, 4] = false; //Unlocked Status
form_grid[# 3, 5] = 1; //Weapon
form_grid[# 3, 6] = 1; //Armor
form_grid[# 3, 7] = 1; //Magic
form_grid[# 3, 8] = 1; //Special

//Evarel
form_grid[# 4, 0] = "EVAREL"
form_grid[# 4, 1] = "Grey-green Lavos with green and brown tunic."
form_grid[# 4, 2] = scr_player_evarel_set; //Player Script
form_grid[# 4, 3] = scr_menu_evarel; //Inventory Script
form_grid[# 4, 4] = false; //Unlocked Status
form_grid[# 4, 5] = 2; //Weapon
form_grid[# 4, 6] = 2; //Armor
form_grid[# 4, 7] = 2; //Magic
form_grid[# 4, 8] = 2; //Special

}
//
//
//
//
//
//Form Menu GUI
function scr_menu_form(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

//Skills and unlocks
draw_sprite(spr_menu_rope,3,54,88);
draw_sprite(spr_menu_rope,3,140,88);
draw_sprite_stretched(spr_menu_beveled,3,44,35,110,55);
draw_sprite_stretched(spr_menu_beveled,3,44,96,110,27);
draw_sprite_stretched(spr_menu,8,39,35,120,16);
for (var i = 0; i < 4; i = i + 1)
{
	var _originX = 50 + (26 * i);
	var _originY = 53;
	draw_sprite_stretched(spr_menu_circle16,1,_originX,_originY,21,21);
}
for (var j = 0; j < 5; j = j + 1)
{
	var _originX2 = 50 + (20 * j)
	var _originY2 = 102;
	draw_sprite_stretched(spr_menu_circle16,1,_originX2,_originY2,16,16);
}
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# slot, 6],49,75);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# slot, 5],75,75);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# slot, 7],101,75);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# slot, 8],127,75);
draw_sprite(spr_armor_allGame,slot,45,52);
draw_sprite(spr_weapons_allGame,slot,72,53);
draw_sprite(spr_primary_allGame,slot,97,53);
draw_sprite(spr_special_allGame,slot,123,53);

//Equip and Switch Buttons
draw_sprite_stretched(spr_menu_circle16,3,48,127,50,16);
draw_sprite_stretched(spr_menu_circle16,3,102,127,50,16);
draw_set_halign(fa_center);
draw_text_transformed(75,132,"EQUIP",.5,.5,0);
draw_text_transformed(127,132,"SWITCH",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,48,127,98,143))//Equip
{
	draw_sprite_stretched(spr_highlight_circle,0,47,126,52,18);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		with (obj_player)
		{
			script_execute(obj_inventory.form_grid[# other.slot, 2]);
		}
	}
}
if (point_in_rectangle(_mouseX,_mouseY,102,127,152,143))//Switch
{
	draw_sprite_stretched(spr_highlight_circle,0,101,126,52,18);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = scr_menu_form_switch;
	}
}



//Form Specific Menus and Button Programming
script_execute(form_menu); 

}
//
//
//
//
//
//Draw Switch Menu
function scr_menu_form_switch(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 6;
draw_sprite_stretched(spr_menu_beveled,3,87,35,146,98);
draw_sprite_stretched(spr_menu,8,82,35,156,16);

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"SELECT A FORM",1,1,0);


//Button Mechanics
for (var i = 0; i < 18; i = i + 1)
{
	var _x2 = 92 + (i mod _rowLength) * 23;
	var _y2 = 52 + (i div _rowLength) * 26;
	draw_sprite_stretched(spr_menu_circle16,1,_x2,_y2,21,24)
	if (obj_inventory.form_grid[# i, 4] = true) 
	{
		draw_sprite(spr_formSelect_icons,i,_x2 + 10,_y2 + 13);
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+21,_y2+24))
		{
			draw_sprite_stretched_ext(spr_highlight_circle,1,_x2-1,_y2-1,23,26,c_white,1.0)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				inv_gui = scr_menu_form;
				form_menu = obj_inventory.form_grid[# i, 3];
				selected_info = -1;
				slot = i;
			}
		}
	}
}

}
//
//
//
//
//
//Draw Selected (Run in FormMenuGUI)
function xscr_menu_form_gear(){	
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Selected Form Menu Sprites (Right Hand Side) //Drawn Regardless if form is selected
//draw_sprite_stretched(spr_menu_circle16,1,182,42,32,32);
//draw_sprite_stretched(spr_menu,3,182,63,32,11);
//draw_sprite_stretched(spr_menu_circle16,1,216,42,32,32);
//draw_sprite_stretched(spr_menu,3,216,63,32,11);
//draw_sprite_stretched(spr_menu_circle16,1,182,76,32,32);
//draw_sprite_stretched(spr_menu,3,182,97,32,11);
//draw_sprite_stretched(spr_menu_circle16,1,216,76,32,32);
//draw_sprite_stretched(spr_menu,3,216,97,32,11);
//draw_sprite_stretched(spr_menu,3,199,110,32,16);

//Draw the selected form
if (item_id != -1)
{
	//Draw it's four levelable features //weapon, armor, magic, special
	draw_sprite(spr_weapons_allGame,item_id,182,42);
	draw_sprite(spr_armor_allGame,item_id,216,42);
	draw_sprite(spr_primary_allGame,item_id,182,76);
	draw_sprite(spr_special_allGame,item_id,216,76);
	draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# item_id, 5]-1,182,63);
	draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# item_id, 6]-1,216,63);
	draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# item_id, 7]-1,182,97);
	draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# item_id, 8]-1,216,97);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(215,118,"EQUIP",.35,.35,0);

	//Equip the form
	if (point_in_rectangle(_mouseX,_mouseY,199,110,231,126))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,197,108,36,20);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			with (obj_player) 
			{
				form = other.item_id;
				script_execute(obj_inventory.form_grid[# form, 2]);
			}
		}

	}
}

}

