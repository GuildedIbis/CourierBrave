//NPC Rhombhail
//Vostle Town 04-00
//
//
//
//
//
//Rhombail Create
function scr_npc_rhombail_night_create(){
entity_step = scr_npc_rhombail_night_step;
sprite_index = spr_npc_rhombail;
npc_idle = spr_npc_rhombail;
npc_move = spr_npc_rhombail_walk;
sound = snd_npc_mouse;
interact = 20;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Rhombail Step
function scr_npc_rhombail_night_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	if (global.dayPhase = 2)
	{
		scr_npc_wander_home_range(60,240,home_x,home_y,64);
	}
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_exit(224,144);
		if (place_meeting(x,y,obj_door))
		{
			instance_destroy();
		}
	}
	scr_npc_animation();
}
else
{
	sprite_index = npc_idle;
	image_speed = 0;
	path_end();
}
}
//
//
//
//
//
//Rhombail Create
function scr_npc_rhombail_day_create(){
entity_step = scr_npc_rhombail_day_step;
sprite_index = spr_npc_rhombail;
npc_idle = spr_npc_rhombail;
npc_move = spr_npc_rhombail_walk;
sound = snd_npc_mouse;
interact = 20;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Rhombail Step
function scr_npc_rhombail_day_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	if (global.dayPhase = 0) or (global.dayPhase = 1)
	{
		scr_npc_wander_home_range(60,240,home_x,home_y,360);
	}
	if (global.dayPhase = 2)
	{
		scr_npc_exit(512,175);
		if (place_meeting(x,y,obj_door))
		{
			instance_destroy();
		}
	}
	scr_npc_animation();
}
else
{
	sprite_index = npc_idle;
	image_speed = 0;
	path_end();
}
}
//
//
//
//
//
//Rombhail Text
function scr_text_npc_rhombail(){

//Formatting
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_rhombail,0,261,117);
draw_set_color(c_white);
var _name = "Rhombail"

var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Courier, a fellow traveler. Warmest of greetings." 
	_SubString = string_copy(text_string,1,letter_counter);
}

if (string_counter >= 1)
{
	scr_text_end();
	_SubString = string_copy(text_string,1,letter_counter);
	//text_string = ""
	//string_counter = 0;
	//_SubString = string_copy(text_string,1,letter_counter);
	//obj_game.gamePaused = false;
	//obj_game.textPaused = false;
	
	////Reset Buy/Sell Menu
	//page = 0;
	//slot = -1;
	//item_id = -1;
	//item_name = -1;
	//sell_price = 0;
	//buy_price = 0;
}
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_text_transformed(259,110,_name,.5,.5,0);
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);

}
//
//
//
//
//
//Draw Inventory
function scr_menu_rhombail_trade(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _object = obj_inventory;
//
//Tinted Background
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
//
draw_sprite_stretched(spr_menu_beveled,3,115,40,90,100);
draw_sprite_stretched(spr_menu,8,110,40,100,16);
draw_sprite_stretched(spr_menu_circle16,3,120,66,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,84,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,102,80,16);
draw_sprite_stretched(spr_menu_circle16,3,120,120,80,16);
draw_sprite_stretched(spr_menu_circle16,3,92,40,16,16);
draw_sprite_stretched(spr_menu_circle16,3,212,40,16,16);
draw_sprite_ext(spr_menu_arrow,0,220,48,1,1,0,c_white,1);
draw_sprite_ext(spr_menu_arrow,2,100,48,1,1,0,c_white,1);
draw_text_transformed(160,50,"TRADE",1,1,0);
draw_text_transformed(160,62,"GIVE > RECEIVE (HAVE)",.6,.6,0);


//Submenu Change
if (point_in_rectangle(_mouseX,_mouseY,92,40,108,56))
{
	draw_sprite_stretched(spr_highlight_circle,0,91,39,18,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page >= 1) page = page - 1;
		else page = 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,212,40,228,56))
{
	draw_sprite_stretched(spr_highlight_circle,0,211,39,18,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page <= 0) page = page + 1;
		else page = 0;
	}
}

switch(page)
{
	case 0:
		scr_menu_rhombail_trade_page_0();
	break;
	
	case 1:
		scr_menu_rhombail_trade_page_1();
	break;
}

//Exit
draw_set_halign(fa_center);
draw_text_transformed(160,160,"PRESS \"E\" TO RESUME",.5,.5,0);
if (keyboard_check_pressed(ord("E")))
{
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
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
//Draw Rhombail Trade Menu 0
function scr_menu_rhombail_trade_page_0(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);



//Button 1
draw_set_halign(fa_left);
draw_text_transformed(124,76,"5 (" + string(obj_inventory.resource_array[6]) + ")",.5,.5,0);
draw_sprite_ext(spr_resource_menu_all,6,142,66,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,76,">",.75,.75,0);
draw_sprite_ext(spr_powerstone_menu_all,1,162,66,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,76,"1 (" + string(obj_inventory.ps_array[1]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,66,200,82))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,65,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.resource_array[6] >= 5)
		{
			obj_inventory.resource_array[6] = obj_inventory.resource_array[6] - 5;
			obj_inventory.ps_array[1] = obj_inventory.ps_array[1] + 1;
		}
	}
}
//Button 2
draw_set_halign(fa_left);
draw_text_transformed(124,94,"1 (" + string(obj_inventory.rog_array[4]) + ")",.5,.5,0);
draw_sprite_ext(spr_rog_menu_all,4,142,84,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,94,">",.75,.75,0);
draw_sprite_ext(spr_rog_menu_all,2,162,84,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,94,"1 (" + string(obj_inventory.rog_array[2]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,84,200,100))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,83,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.rog_array[4] >= 1)
		{
			obj_inventory.rog_array[4] = obj_inventory.rog_array[4] - 1;
			obj_inventory.rog_array[2] = obj_inventory.rog_array[2] + 1;
		}
	}
}

//Button 3
draw_set_halign(fa_left);
draw_text_transformed(124,112,"5 (" + string(obj_inventory.resource_array[2]) + ")",.5,.5,0);
draw_sprite_ext(spr_resource_menu_all,2,142,102,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,112,">",.75,.75,0);
draw_sprite_ext(spr_rog_menu_all,2,162,102,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,112,"1 (" + string(obj_inventory.rog_array[2]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,102,200,118))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,101,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.resource_array[2] >= 5)
		{
			obj_inventory.resource_array[2] = obj_inventory.resource_array[2] - 5;
			obj_inventory.rog_array[2] = obj_inventory.rog_array[2] + 1;
		}
	}
}
//Button 4
draw_set_halign(fa_left);
draw_text_transformed(124,130,"1 (" + string(obj_inventory.resource_array[3]) + ")",.5,.5,0);
draw_sprite_ext(spr_resource_menu_all,3,142,120,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,130,">",.75,.75,0);
draw_sprite_ext(spr_rog_menu_all,4,162,120,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,130,"1 (" + string(obj_inventory.rog_array[4]) + ")",.5,.5,0); 
if (point_in_rectangle(_mouseX,_mouseY,120,120,200,136))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,119,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.resource_array[3] >= 1)
		{
			obj_inventory.resource_array[3] = obj_inventory.resource_array[3] - 1;
			obj_inventory.rog_array[4] = obj_inventory.rog_array[4] + 1;
		}
	}
}

}
//
//
//
//
//
//Draw Rhombail Trade Menu 1
function scr_menu_rhombail_trade_page_1(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Button 1
draw_set_halign(fa_left);
draw_text_transformed(124,76,"1 (" + string(obj_inventory.resource_array[1]) + ")",.5,.5,0);
draw_sprite_ext(spr_resource_menu_all,1,142,66,1,1,0,c_white,1);
draw_set_halign(fa_center);
draw_text_transformed(160,76,">",.75,.75,0);
draw_sprite_ext(spr_resource_menu_all,7,162,66,1,1,0,c_white,1);
draw_set_halign(fa_right);
draw_text_transformed(196,76,"1 (" + string(obj_inventory.resource_array[7]) + ")",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,120,66,200,82))
{
	draw_sprite_stretched(spr_highlight_circle,0,119,65,82,18);
	if (mouse_check_button_pressed(mb_left))
	{
		if (obj_inventory.resource_array[1] >= 1)
		{
			obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 1;
			obj_inventory.resource_array[7] = obj_inventory.resource_array[7] + 1;
		}
	}
}
//Button 2
//draw_set_halign(fa_left);
//draw_text_transformed(124,94,"1 (" + string(obj_inventory.rog_array[4]) + ")",.5,.5,0);
//draw_sprite_ext(spr_rog_menu_all,4,142,84,1,1,0,c_white,1);
//draw_set_halign(fa_center);
//draw_text_transformed(160,94,">",.75,.75,0);
//draw_sprite_ext(spr_rog_menu_all,2,162,84,1,1,0,c_white,1);
//draw_set_halign(fa_right);
//draw_text_transformed(196,94,"1 (" + string(obj_inventory.rog_array[2]) + ")",.5,.5,0);
//if (point_in_rectangle(_mouseX,_mouseY,120,84,200,100))
//{
//	draw_sprite_stretched(spr_highlight_circle,0,119,83,82,18);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (obj_inventory.rog_array[4] >= 1)
//		{
//			obj_inventory.rog_array[4] = obj_inventory.rog_array[4] - 1;
//			obj_inventory.rog_array[2] = obj_inventory.rog_array[2] + 1;
//		}
//	}
//}
////Button 3
//draw_set_halign(fa_left);
//draw_text_transformed(124,112,"1 (" + string(obj_inventory.resource_array[1]) + ")",.5,.5,0);
//draw_sprite_ext(spr_resource_menu_all,1,142,102,1,1,0,c_white,1);
//draw_set_halign(fa_center);
//draw_text_transformed(160,112,">",.75,.75,0);
//draw_sprite_ext(spr_resource_menu_all,7,162,102,1,1,0,c_white,1);
//draw_set_halign(fa_right);
//draw_text_transformed(196,112,"1 (" + string(obj_inventory.resource_array[7]) + ")",.5,.5,0);
//if (point_in_rectangle(_mouseX,_mouseY,120,102,200,118))
//{
//	draw_sprite_stretched(spr_highlight_circle,0,119,101,82,18);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (obj_inventory.resource_array[1] >= 1)
//		{
//			obj_inventory.resource_array[1] = obj_inventory.resource_array[1] - 1;
//			obj_inventory.resource_array[7] = obj_inventory.resource_array[7] + 1;
//		}
//	}
//}
//Button 4
//draw_set_halign(fa_left);
//draw_text_transformed(124,130,"1 (" + string(obj_inventory.ps_array[1]) + ")",.5,.5,0);
//draw_sprite_ext(spr_powerstone_all,1,142,120,1,1,0,c_white,1);
//draw_set_halign(fa_center);
//draw_text_transformed(160,130,">",.75,.75,0);
//draw_sprite_ext(spr_rog_menu_all,0,162,120,1,1,0,c_white,1);
//draw_set_halign(fa_right);
//draw_text_transformed(196,130,"1 (" + string(obj_inventory.rog_array[0]) + ")",.5,.5,0); 
//if (point_in_rectangle(_mouseX,_mouseY,120,120,200,136))
//{
//	draw_sprite_stretched(spr_highlight_circle,0,119,119,82,18);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (obj_inventory.ps_array[1] >= 1)
//		{
//			obj_inventory.ps_array[1] = obj_inventory.ps_array[1] - 1;
//			obj_inventory.rog_array[0] = obj_inventory.rog_array[0] + 1;
//		}
//	}
//}


}
