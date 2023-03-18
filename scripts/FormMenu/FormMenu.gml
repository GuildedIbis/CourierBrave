//Inventory Scripts
//
//
//
//
//
//Form Array
function FormCreate(){
form_grid = ds_grid_create(16,9);

//Regaliare 
form_grid[# 0, 0] = "REGALIARE"
form_grid[# 0, 1] = "Description"
form_grid[# 0, 2] = RegaliareSet; //Set Script
form_grid[# 0, 3] = RegaliareSelectedMenu;
form_grid[# 0, 4] = true; //Unlocked Status
form_grid[# 0, 5] = 1; //Weapon
form_grid[# 0, 6] = 1; //Armor
form_grid[# 0, 7] = 1; //Magic
form_grid[# 0, 8] = 0; //Special

//Ceriver
form_grid[# 1, 0] = "CERIVER"
form_grid[# 1, 1] = "Blue and Green Lizard with boomerang, bubbles, and sp (water cannon with push?)"
form_grid[# 1, 2] = CeriverSet; //Player Script
form_grid[# 1, 3] = CeriverSelectedMenu; //Inventory Script
form_grid[# 1, 4] = false; //Unlocked Status
form_grid[# 1, 5] = 1; //Weapon
form_grid[# 1, 6] = 1; //Armor
form_grid[# 1, 7] = 1; //Magic
form_grid[# 1, 8] = 0; //Special

//Adavoid
form_grid[# 2, 0] = "ADAVIO"
form_grid[# 2, 1] = "Purple armor with white accents, bird, zerkrift hook, magic, and sp"
form_grid[# 2, 2] = AdavioSet; //Player Script
form_grid[# 2, 3] = AdavioSelectedMenu; //Inventory Script
form_grid[# 2, 4] = false; //Unlocked Status
form_grid[# 2, 5] = 1; //Weapon
form_grid[# 2, 6] = 1; //Armor
form_grid[# 2, 7] = 1; //Magic
form_grid[# 2, 8] = 0; //Special

//Halofire
form_grid[# 3, 0] = "HALOFIRE"
form_grid[# 3, 1] = "White bird with fire hair and orange accents"
form_grid[# 3, 2] = HalofireSet; //Player Script
form_grid[# 3, 3] = HalofireSelectedMenu; //Inventory Script
form_grid[# 3, 4] = false; //Unlocked Status
form_grid[# 3, 5] = 1; //Weapon
form_grid[# 3, 6] = 1; //Armor
form_grid[# 3, 7] = 1; //Magic
form_grid[# 3, 8] = 0; //Special

}
//
//
//
//
//
//Form Menu GUI
function FormMenuGUI(){

//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);


//Buttons
draw_sprite_stretched(spr_menu_beveled,3,69,42,90,18);

draw_sprite_stretched(spr_menu_beveled,3,161,42,90,64);
draw_sprite_stretched(spr_menu_circle16,1,69,62,20,20);
draw_sprite_stretched(spr_menu_circle16,1,112,62,20,20)
draw_sprite_stretched(spr_menu_circle16,1,69,85,20,20)
draw_sprite_stretched(spr_menu_circle16,1,112,85,20,20)

draw_sprite_stretched(spr_menu,3,69,108,44,16);
draw_sprite_stretched(spr_menu,3,115,108,44,16);
draw_sprite_stretched(spr_menu,3,161,108,32,16);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(140,113,"SWITCH",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(139,113,"SWITCH",.35,.35,0);

//Button Mechanics
if (point_in_rectangle(_mouseX,_mouseY,69,108,113,124))//Switch
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,106,48,20);
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
if (point_in_rectangle(_mouseX,_mouseY,115,108,161,124))//Switch
{
	draw_sprite_stretched(spr_highlight_nineslice,0,113,106,48,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = FormSwitchMenu;
	}
}

script_execute(form_menu);

}
//
//
//
//
//
//Draw Switch Menu
function FormSwitchMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 6;
//Button Mechanics
for (var i = 0; i < 16; i = i + 1)
{
	var _x2 = 95 + (i mod _rowLength) * 22;
	var _y2 = 53 + (i div _rowLength) * 22;
	draw_sprite_stretched(spr_menu_circle16,1,_x2,_y2,20,20)
	if (obj_inventory.form_grid[# i, 4] = true) 
	{
		draw_sprite(spr_formSelect_icons,i,_x2 + 10,_y2 + 12);
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+20,_y2+20))
		{
			draw_sprite_stretched(spr_highlight_circle,1,_x2-1,_y2-1,22,22)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				inv_gui = FormMenuGUI;
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
function DrawSelectedGear(){	
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Selected Form Menu Sprites (Right Hand Side) //Drawn Regardless if form is selected
draw_sprite_stretched(spr_menu_circle16,1,182,42,32,32);
draw_sprite_stretched(spr_menu,3,182,63,32,11);
draw_sprite_stretched(spr_menu_circle16,1,216,42,32,32);
draw_sprite_stretched(spr_menu,3,216,63,32,11);
draw_sprite_stretched(spr_menu_circle16,1,182,76,32,32);
draw_sprite_stretched(spr_menu,3,182,97,32,11);
draw_sprite_stretched(spr_menu_circle16,1,216,76,32,32);
draw_sprite_stretched(spr_menu,3,216,97,32,11);
draw_sprite_stretched(spr_menu,3,199,110,32,16);

//Draw the selected form
if (item_id != -1)
{
	//Draw it's four levelable features //weapon, armor, magic, special
	draw_sprite(spr_weapons_allGame,item_id,182,42);
	draw_sprite(spr_armor_allGame,item_id,216,42);
	draw_sprite(spr_magic_allGame,item_id,182,76);
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

