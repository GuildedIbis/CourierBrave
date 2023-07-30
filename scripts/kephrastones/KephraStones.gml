//Kephra Stone Scripts
//
//
//
//
//
//Kephra Stone Main
function KephraStoneList(){
kephra_grid = ds_grid_create(60,2);

kephra_grid[# 0, 0] = scr_menu_kephra_00;
kephra_grid[# 0, 1] = false;
kephra_grid[# 0, 2] = "MOVEMENT"
kephra_grid[# 1, 0] = scr_menu_kephra_01;
kephra_grid[# 1, 1] = false
kephra_grid[# 1, 2] = "WEAPON ATTACK"
kephra_grid[# 2, 0] = scr_menu_kephra_02;
kephra_grid[# 2, 1] = false
kephra_grid[# 2, 2] = "MAGIC ATTACK"
kephra_grid[# 3, 0] = scr_menu_kephra_03;
kephra_grid[# 3, 1] = false
kephra_grid[# 3, 2] = "SPECIAL ATTACK"
kephra_grid[# 4, 0] = scr_menu_kephra_04;
kephra_grid[# 4, 1] = false
kephra_grid[# 4, 2] = "CRULL STONES"
kephra_grid[# 5, 0] = scr_menu_kephra_05;
kephra_grid[# 5, 1] = false
kephra_grid[# 5, 2] = "ENEMIES"
kephra_grid[# 6, 0] = scr_menu_kephra_06;
kephra_grid[# 6, 1] = false
kephra_grid[# 6, 2] = "INVENTORY"
						
}
//
//
//
//
//
//Kephra Stone Main
function scr_kephra_stone(){
//Format
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.fnt_main_white);
draw_text_transformed(160,160,"PRESS \"E\"\nTO RESUME",.75,.75,0);
draw_sprite(spr_kephraStone_menu,2,64,32)
draw_sprite_stretched(spr_menu,7,59,32,202,20);



if (string_counter = 0)
{
	script_execute(obj_inventory.kephra_grid[# activate_args, 0]);
}
if (string_counter >= 1)
{
	//_feeling = 0;
	text_string = ""
	string_counter = 0;
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
//Kephra Stone 00: Movement
function scr_menu_kephra_00(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(3,-1)
_text[0] = "Move with W, S, A, D."
_text[1] = "Roll with SPACE.\n\nWhile rolling, the Courier cannot\nbe damaged."
_text[2] = "Rolling costs stamina.\n\nStamina regenerates over time\nand is displayed beneath the\nhealth bar."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 0: MOVEMENT",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_00,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 2)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}
//
//
//
//
//
//Kephra Stone 01: Weapons
function scr_menu_kephra_01(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Right click to use the Courier's\nweapon skill."
_text[1] = "Swap aiming mode with Z;\n\nAttack in the direction of the\ncursor or attack in the direction\nthe Courier is facing."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 1: WEAPONS",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_01,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}
//
//
//
//
//
//Kephra Stone 02: Magic Attack
function scr_menu_kephra_02(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Right click to use the Courier's\nweapon skill."
_text[1] = "Swap aiming mode with Z;\n\nAttack in the direction of the\ncursor or attack in the direction\nthe Courier is facing."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 2: MAGIC",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_01,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}
//
//
//
//
//
//Kephra Stone 03: Special
function scr_menu_kephra_03(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Right click to use the Courier's\nweapon skill."
_text[1] = "Swap aiming mode with Z;\n\nAttack in the direction of the\ncursor or attack in the direction\nthe Courier is facing."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 1: WEAPONS",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_01,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}
//
//
//
//
//
//Kephra Stone 04: Crull Stones
function scr_menu_kephra_04(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Right click to use the Courier's\nweapon skill."
_text[1] = "Swap aiming mode with Z;\n\nAttack in the direction of the\ncursor or attack in the direction\nthe Courier is facing."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 1: WEAPONS",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_01,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}
//
//
//
//
//
//Kephra Stone 05: Enemies
function scr_menu_kephra_05(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Right click to use the Courier's\nweapon skill."
_text[1] = "Swap aiming mode with Z;\n\nAttack in the direction of the\ncursor or attack in the direction\nthe Courier is facing."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 1: WEAPONS",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_01,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}
//
//
//
//
//
//Kephra Stone 06: Inventory
function scr_menu_kephra_06(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Right click to use the Courier's\nweapon skill."
_text[1] = "Swap aiming mode with Z;\n\nAttack in the direction of the\ncursor or attack in the direction\nthe Courier is facing."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 1: WEAPONS",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_01,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,0,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,257,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page + 1;
		}
	}
}
if (page > 0)
{
	draw_sprite_stretched(spr_menu_circle16,0,46,76,16,16);
	draw_sprite(spr_menu_arrow,2,54,84);
	if (point_in_rectangle(_mouseX,_mouseY,46,75,62,92))
	{
		draw_sprite_stretched(spr_highlight_circle,0,45,75,18,18);
		if (mouse_check_button_pressed(mb_left))
		{
			page = page - 1;
		}
	}
}

}