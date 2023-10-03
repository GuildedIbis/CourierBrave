//Kephra Stone Scripts
//
//
//
//
//
//Kephra Stone Main
function scr_inventory_kephraStone_create(){
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
kephra_grid[# 7, 0] = scr_menu_kephra_07;
kephra_grid[# 7, 1] = false
kephra_grid[# 7, 2] = "QUICK SWAP"
kephra_grid[# 8, 0] = scr_menu_kephra_08;
kephra_grid[# 8, 1] = false
kephra_grid[# 8, 2] = "ALTARS"
kephra_grid[# 9, 0] = scr_menu_kephra_09;
kephra_grid[# 9, 1] = false
kephra_grid[# 9, 2] = "RESOURCES"
kephra_grid[# 10, 0] = scr_menu_kephra_10;
kephra_grid[# 10, 1] = false
kephra_grid[# 10, 2] = "STATUS EFFECTS"

						
}
//
//
//
//
//
//Kephra Stone Main
function scr_kephra_stone(){
//Format
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.fnt_main_white);
draw_text_transformed(160,160,"PRESS \"E\"\nTO RESUME",.75,.75,0);
draw_sprite(spr_kephraStone_menu,1,64,32)
draw_sprite_stretched(spr_menu,8,59,32,202,20);



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
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
_text[0] = "Left click to use the Courier's\nmagic skill."
_text[1] = "Press \"F\" to swap to an alternate\nfire mode.\n\nAlternate fire modes must be\nunlocked."
_text[2] = "Magic charge regenerates over\ntime.\n\nPicking up essence also regen-\nerates charge of the same type."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 2: MAGIC",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_02,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 2)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
_text[0] = "Press \"SHIFT\" to use the Courier's\nspecial skill."
_text[1] = "Special charge regenerates only\nwhen damage is dealt."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 3: SPECIAL",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_03,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
	draw_sprite(spr_menu_arrow,0,266,84);
	if (point_in_rectangle(_mouseX,_mouseY,258,76,274,92))
	{
		draw_sprite_stretched(spr_highlight_circle,1,257,75,18,18);
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
_text[0] = "Press \"C\" to use a Crull Stone\nCharge."
_text[1] = "Some Crull Stone will restore\nthe Courier's health, but recipes\nfor other types of charges with\nvarious effects can be acquired."
_text[2] = "Visiting an alter (or dying)\nrefills Crull Charges to whatever\nthey are set as.\n\nVisiting all altar also refills\nthe Courier's magic charge."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 4: CRULL STONES",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_04,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);

if (page < 2)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
_text[0] = "Enemies drop essence (magic\ncharge) when they are damaged by\nweapons and when they die."
_text[1] = "When an enemy is slain, they can\nalso drop items used for upgrad-\ning the Courier's skills."
_text[2] = "Enemies respawn when the Courier\nvisits and alter or dies."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 5: ENEMIES",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_05,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
_text[0] = "Press \"TAB\" to open/close the\nCourier's inventory."
_text[1] = "From the \"STATS\" menu, the\nCourier's stats can be leveled up\nwith Star Orbs."
_text[2] = "From the \"FORMS\" menu, the\nindividual skills of different\nCourier forms can be leveled up\nwith Rog Stones and Power Stones."
_text[3] = "From the \"ITEMS\" menu, the\nplayer can view the Couriers\ncurrently held number of items\nlike Rog Stones."
_text[4] = "From the \"OBJECTIVES\" menu, the\nplayer can see the current\nstatus different questions."
_text[5] = "From the \"MAP\" menu, the\nplayer can see where they are, as\nwell as the location of any alters\nthey've visited."
//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 6: INVENTORY",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_06,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 5)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
//Kephra Stone 07: Quick Swap
function scr_menu_kephra_07(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Press \"R\" to open the Quick Swap\nmenu and quickly change Form."
_text[1] = "Each Form is one of six types,\neach type having it's own charge\nmeters."
_text[2] = "Don't leave the Courier defense-\nless.\n\nA quick Form swap can be a matter\nof life or death."

//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 7: FORM SWAPPING",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_07,page,64,52);
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
//Kephra Stone 08: Crull Charges
function scr_menu_kephra_08(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "As the Courier's ITERATION stat\nincreases, they will unlock\nmore charges of the Crull Stone.\n\nScroll with the mouse wheel to\nselect a different Crull Charge."
_text[1] = "The Crull Charges will refill to\na Natural Charge by default,\nwhich heals a moderate amount of\ndamage."
_text[2] = "Completing recipes at the alter\ncosts resources and replaces the\ncurrent charge but produces\ncharges that have various\neffects beyond healing."

//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 8: CRULL CHARGES",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_08,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 2)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
//Kephra Stone 09: Resources
function scr_menu_kephra_09(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Resources are found in any area\nwhere enemies spawn.\n\nThey can be collected with a weapon."
_text[1] = "They can be used for trading\nwith others, or for completing\nCrull Charge recipes."

//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 9: RESOURCES",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_09,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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
//Kephra Stone 10: Status Effects
function scr_menu_kephra_10(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _text = array_create(2,-1)
_text[0] = "Some enemy attacks will inflict\nstatus effects that are\ncured naturally over time."
_text[1] = "Status effects can also be cured\nwith the Cure Crull."

//Sprite
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,39,"KEPHRA STONE 10: STATUS EFFECTS",1,1,0);
draw_set_halign(fa_left);
draw_sprite(spr_kephraStone_infograph_10,page,64,52);
draw_text_transformed(165,56,_text[page],.5,.5,0);


if (page < 1)
{
	draw_sprite_stretched(spr_menu_circle16,1,258,76,16,16);
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
	draw_sprite_stretched(spr_menu_circle16,1,46,76,16,16);
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