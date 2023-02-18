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
form_grid[# 0, 0] = "Regaliare"
form_grid[# 0, 1] = "Description"
form_grid[# 0, 2] = RegaliareSet; //Set Script
form_grid[# 0, 3] = RegaliareSelected;
form_grid[# 0, 4] = true; //Unlocked Status
form_grid[# 0, 5] = 1; //Weapon
form_grid[# 0, 6] = 1; //Armor
form_grid[# 0, 7] = 1; //Magic
form_grid[# 0, 8] = 0; //Special

//Ceriver
form_grid[# 1, 0] = "Ceriver"
form_grid[# 1, 1] = "Blue and Green Lizard with boomerang, bubbles, and sp (water cannon with push?)"
form_grid[# 1, 2] = CeriverSet; //Player Script
form_grid[# 1, 3] = CeriverSelected; //Inventory Script
form_grid[# 1, 4] = false; //Unlocked Status
form_grid[# 1, 5] = 1; //Weapon
form_grid[# 1, 6] = 1; //Armor
form_grid[# 1, 7] = 1; //Magic
form_grid[# 1, 8] = 0; //Special

//Adavoid
form_grid[# 2, 0] = "Adavoid"
form_grid[# 2, 1] = "Purple armor with white accents, bird, zerkrift hook, magic, and sp"
form_grid[# 2, 2] = AdavioSet; //Player Script
form_grid[# 2, 3] = AdavioSelected; //Inventory Script
form_grid[# 2, 4] = true; //Unlocked Status
form_grid[# 2, 5] = 1; //Weapon
form_grid[# 2, 6] = 1; //Armor
form_grid[# 2, 7] = 1; //Magic
form_grid[# 2, 8] = 0; //Special

//Halofire
form_grid[# 3, 0] = "Halofire"
form_grid[# 3, 1] = "White bird with fire hair and orange accents"
form_grid[# 3, 2] = HalofireSet; //Player Script
form_grid[# 3, 3] = HalorfireSelected; //Inventory Script
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
var _rowLength = 6;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


//Slider
//draw_sprite(spr_scroll_bar2b,page,68,41);
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

//Buttons Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

//Button Surface Sprites
//draw_sprite_stretched(spr_menu,3,80,42,79,15);
//draw_sprite_stretched(spr_menu,3,80,59,79,15);
//draw_sprite_stretched(spr_menu,3,80,76,79,15);
//draw_sprite_stretched(spr_menu,3,80,93,79,15);
//draw_sprite_stretched(spr_menu,3,80,110,79,15);

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
				inv_gui = obj_inventory.form_grid[# i, 3]; 
			}
		}
	}
}





//draw_line_width_color(172,44,172,124,1,c_black,c_black)

//Execute Selected Draw Script
//DrawSelectedGear();


}
//
//
//
//
//
//Draw Selected (Run in FormMenuGUI)
function DrawSelectedGear(){	//function DrawSelectedGear()
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

