//Map
//
//
//
//
//
//Maps
function MapsCreate(){
map_selected = LenkoMapMenuDraw;
map_grid = ds_grid_create(6,3);
region_grid = ds_grid_create(6,3);
region_grid[# 0, 0] = "Lenko Woodlands"
region_grid[# 0, 1] = true;
region_grid[# 0, 2] = LenkoMapMenuDraw;
region_grid[# 1, 0] = "Beetrap Tundra"
region_grid[# 1, 1] = false;
region_grid[# 1, 2] = BeetrapMapMenuDraw;
region_grid[# 2, 0] = "Lenko Woodlands"
region_grid[# 2, 1] = false;
region_grid[# 2, 2] = LenkoMapMenuDraw;
region_grid[# 3, 0] = "Lenko Woodlands"
region_grid[# 3, 1] = false;
region_grid[# 3, 2] = LenkoMapMenuDraw;
region_grid[# 4, 0] = "Lenko Woodlands"
region_grid[# 4, 1] = false;
region_grid[# 4, 2] = LenkoMapMenuDraw;
region_grid[# 5, 0] = "Lenko Woodlands"
region_grid[# 5, 1] = false;
region_grid[# 5, 2] = LenkoMapMenuDraw;


map_grid[# 0, 0] = "Farway Road"
map_grid[# 0, 1] = false;
map_grid[# 0, 2] = Idle;
map_grid[# 1, 0] = "Lake Path"
map_grid[# 1, 1] = false;
map_grid[# 1, 2] = Idle;
map_grid[# 2, 0] = "Greyrock"
map_grid[# 2, 1] = false;
map_grid[# 2, 2] = Idle;
map_grid[# 3, 0] = "Habraf Lake"
map_grid[# 3, 1] = false;
map_grid[# 3, 2] = Idle;
map_grid[# 4, 1] = "Yakflower Path";
map_grid[# 4, 1] = false;
map_grid[# 4, 2] = Idle;
map_grid[# 5, 0] = "Beaowire Fortress";
map_grid[# 5, 1] = false;
map_grid[# 5, 2] = Idle;
}
//
//
//
//
//
//Map GUI
function MapMenuGUI(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Slider
draw_sprite(spr_scroll_bar1b,page,24,43);
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

draw_sprite_stretched(spr_menu_beveled,3,44,39,170,100);
draw_sprite_ext(spr_map_level,0,49,44,1.0,1.0,0,c_white,1.0);
draw_sprite_stretched(spr_menu,8,39,35,180,16);
//draw_sprite(spr_map_farwayRoad,0,66,34);


for (var i = 0; i < 5; i = i + 1)
{
	draw_sprite_stretched(button_sprite,3,36,42 + (i * 17),15,15);
	if (obj_inventory.region_grid[# i, 1] = true)
	{
		//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(spr_map_button,i,36,42+(i*17),1.0,1.0,0,c_white,1.0);
		if (point_in_rectangle(_mouseX,_mouseY,36,42 + (i * 15),50,57 + (i * 15)))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,34,40 + (i * 17),19,19);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				map_selected = obj_inventory.region_grid[# i, 2];
			}
		}
	}
	else draw_sprite_ext(spr_lock,1,41,50+(i*17),1,1,0,c_white,1.0);
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
//Lenko Overworld Map Menu
function LenkoMapMenuDraw(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _xPos = 49
var _yPos = 40

draw_sprite(spr_map_full,0,77,40);

//Draw Selectable Levels
if (obj_inventory.level_ary[0] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 69,_yPos + 25,1,1,0,c_white,1);
	if (obj_game.level_num = 0) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 73,_yPos + 29,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 69,_yPos + 25,_xPos + 77,_yPos + 33))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 68,_yPos + 24,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = FarwayRoadMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}
if (obj_inventory.level_ary[1] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 102,_yPos + 33,1,1,0,c_white,1);
	if (obj_game.level_num = 1) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 106,_yPos + 37,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 102,_yPos + 33,_xPos + 110,_yPos + 41))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 101,_yPos + 32,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = YakflowerPathMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}
if (obj_inventory.level_ary[2] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 77,_yPos + 53,1,1,0,c_white,1);
	if (obj_game.level_num = 2) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 81,_yPos + 57,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 77,_yPos + 53,_xPos + 85,_yPos + 61))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 76,_yPos + 52,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = HabrafLakeMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}
if (obj_inventory.level_ary[3] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 41,_yPos + 33,1,1,0,c_white,1);
	if (obj_game.level_num = 3) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 45,_yPos + 37,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 41,_yPos + 33,_xPos + 49,_yPos + 41))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 41,_yPos + 33,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = BeaowireFortressMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}

}
//
//
//
//
//
//Beetrap Overworld Map Menu
function BeetrapMapMenuDraw(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _xPos = 77
var _yPos = 40

draw_sprite(spr_map_full,1,77,40);

//Draw Selectable Levels
if (obj_inventory.level_ary[4] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 69,_yPos + 25,1,1,0,c_white,1);
	if (obj_game.level_num = 0) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 73,_yPos + 29,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 69,_yPos + 25,_xPos + 77,_yPos + 33))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 68,_yPos + 24,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = FarwayRoadMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}
if (obj_inventory.level_ary[5] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 102,_yPos + 33,1,1,0,c_white,1);
	if (obj_game.level_num = 1) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 106,_yPos + 37,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 102,_yPos + 33,_xPos + 110,_yPos + 41))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 101,_yPos + 32,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = YakflowerPathMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}
if (obj_inventory.level_ary[6] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 77,_yPos + 53,1,1,0,c_white,1);
	if (obj_game.level_num = 2) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 81,_yPos + 57,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 77,_yPos + 53,_xPos + 85,_yPos + 61))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 76,_yPos + 52,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = HabrafLakeMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}
if (obj_inventory.level_ary[7] = true) 
{
	draw_sprite_ext(spr_map_icon,0,_xPos + 41,_yPos + 33,1,1,0,c_white,1);
	if (obj_game.level_num = 3) draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + 45,_yPos + 37,.5,.5,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 41,_yPos + 33,_xPos + 49,_yPos + 41))
	{
		draw_sprite_ext(spr_map_icon_highlight,0,_xPos + 41,_yPos + 33,1,1,0,c_white,1);
		if (mouse_check_button_pressed(mb_left)) 
		{
			map_selected = BeaowireFortressMapMenuDraw;
		}
		//draw_set_halign(fa_left);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);
		//draw_set_font(fnt_text);
		//draw_text_transformed(262,32,"CAMP",.5,.5,0);
		//draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
		//draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
		//draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
		//draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
	}
}

}
//
//
//
//
//
//Farway Road Map Menu Draw
function FarwayRoadMapMenuDraw(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 49
var _yPos = 44



if (obj_game.level_num = 0)
{
	var _mapRoomX = obj_inventory.farwayRoad_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.farwayRoad_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}


//Draw Camps (Selectable for travel
if (obj_inventory.camp_grid[# 0, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 19, _yPos + 22,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 53,_yPos + 47,_xPos + 58,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 56,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 5;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 0;
			obj_game.room_num = 5;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 1, 1];
			global.targetY = obj_inventory.camp_grid[# 1, 2];
			global.targetRoom = rm_lenko_farwayRoad_05;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 1, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 56, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 53,_yPos + 47,_xPos + 58,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 56,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 5;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 0;
			obj_game.room_num = 5;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 1, 1];
			global.targetY = obj_inventory.camp_grid[# 1, 2];
			global.targetRoom = rm_lenko_farwayRoad_05;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 2, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 117, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 114,_yPos + 47,_xPos + 119,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 117,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 7;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 0;
			obj_game.room_num = 7;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 2, 1];
			global.targetY = obj_inventory.camp_grid[# 2, 2];
			global.targetRoom = rm_lenko_farwayRoad_07;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.camp_grid[# 3, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 87, _yPos + 31,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 84,_yPos + 29,_xPos + 89,_yPos + 32))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 87,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 10;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 0;
			obj_game.room_num = 10;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 3, 1];
			global.targetY = obj_inventory.camp_grid[# 3, 2];
			global.targetRoom = rm_lenko_farwayRoad_10;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 4, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 88, _yPos + 67,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 85,_yPos + 65,_xPos + 90,_yPos + 68))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 18,_yPos + 67);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 14;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 0;
			obj_game.room_num = 14
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 4, 1];
			global.targetY = obj_inventory.camp_grid[# 4, 2];
			global.targetRoom = rm_lenko_farwayRoad_14;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
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
//Yakflower Path Map Menu Draw
function YakflowerPathMapMenuDraw(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 77
var _yPos = 40


draw_sprite_ext(spr_map_level,1,77,40,1.0,1.0,0,c_white,1.0);
if (obj_game.level_num = 1)
{
	var _mapRoomX = obj_inventory.yakflowerPath_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.yakflowerPath_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}

//Draw Camps (Selectable for travel
if (obj_inventory.camp_grid[# 5, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 39, _yPos + 14,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 36,_yPos + 12,_xPos + 41,_yPos + 15))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 39,_yPos + 14);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 5, 1];
			global.targetY = obj_inventory.camp_grid[# 5, 2];
			global.targetRoom = rm_lenko_yakflowerPath_00;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 6, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 53, _yPos + 31,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 50,_yPos + 29,_xPos + 55,_yPos + 32))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 53,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 4;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 4;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 6, 1];
			global.targetY = obj_inventory.camp_grid[# 6, 2];
			global.targetRoom = rm_lenko_yakflowerPath_04;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 7, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 41, _yPos + 59,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 57,_xPos + 43,_yPos + 60))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 41,_yPos + 59);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 6;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 6;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 7, 1];
			global.targetY = obj_inventory.camp_grid[# 7, 2];
			global.targetRoom = rm_lenko_yakflowerPath_06;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 8, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 85, _yPos + 67,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 82,_yPos + 65,_xPos + 87,_yPos + 68))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 85,_yPos + 67);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 9;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 9;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 8, 1];
			global.targetY = obj_inventory.camp_grid[# 8, 2];
			global.targetRoom = rm_lenko_yakflowerPath_09;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 9, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 104, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 101,_yPos + 38,_xPos + 106,_yPos + 41))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 104,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 13;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 13;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 9, 1];
			global.targetY = obj_inventory.camp_grid[# 9, 2];
			global.targetRoom = rm_lenko_yakflowerPath_13;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
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
//Habraf Lake Map Menu Draw
function HabrafLakeMapMenuDraw(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 77
var _yPos = 40


draw_sprite_ext(spr_map_level,2,77,40,1.0,1.0,0,c_white,1.0);
if (obj_game.level_num = 2)
{
	var _mapRoomX = obj_inventory.habrafLake_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.habrafLake_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}


//Draw Camps (Selectable for travel
if (obj_inventory.camp_grid[# 10, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 119, _yPos + 13,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 116,_yPos + 11,_xPos + 121,_yPos + 14))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 119,_yPos + 13);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 10, 1];
			global.targetY = obj_inventory.camp_grid[# 10, 2];
			global.targetRoom = rm_lenko_habrafLake_00;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 11, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 88, _yPos + 23,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 85,_yPos + 21,_xPos + 90,_yPos + 24))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 88,_yPos + 23);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 4;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 4;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 11, 1];
			global.targetY = obj_inventory.camp_grid[# 11, 2];
			global.targetRoom = rm_lenko_habrafLake_04;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 12, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 41, _yPos + 31,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 29,_xPos + 43,_yPos + 32))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 41,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 6;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 6;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 12, 1];
			global.targetY = obj_inventory.camp_grid[# 12, 2];
			global.targetRoom = rm_lenko_habrafLake_06;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.camp_grid[# 13, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 103, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 100,_yPos + 47,_xPos + 105,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 103,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 9;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 9;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 13, 1];
			global.targetY = obj_inventory.camp_grid[# 13, 2];
			global.targetRoom = rm_lenko_habrafLake_09;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 14, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 40, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 37,_yPos + 47,_xPos + 42,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 40,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 13;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 13;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 14, 1];
			global.targetY = obj_inventory.camp_grid[# 14, 2];
			global.targetRoom = rm_lenko_habrafLake_13;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
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
//Beaowire Fortress Map Menu Draw
function BeaowireFortressMapMenuDraw(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 77
var _yPos = 40


draw_sprite_ext(spr_map_level,3,77,40,1.0,1.0,0,c_white,1.0);
if (obj_game.level_num = 3)
{
	var _mapRoomX = obj_inventory.beaowireFortress_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.beaowireFortress_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}


//Draw Camps (Selectable for travel
if (obj_inventory.camp_grid[# 15, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 136, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 133,_yPos + 39,_xPos + 138,_yPos + 42))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 136,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 15, 1];
			global.targetY = obj_inventory.camp_grid[# 15, 2];
			global.targetRoom = rm_lenko_beaowire_00;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 16, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 104, _yPos + 68,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 101,_yPos + 67,_xPos + 106,_yPos + 70))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 104,_yPos + 68);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 4;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 4;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 16, 1];
			global.targetY = obj_inventory.camp_grid[# 16, 2];
			global.targetRoom = rm_lenko_beaowire_04;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 17, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 71, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 29,_xPos + 43,_yPos + 32))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 41,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 6;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 6;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 17, 1];
			global.targetY = obj_inventory.camp_grid[# 17, 2];
			global.targetRoom = rm_lenko_beaowire_06;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.camp_grid[# 18, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 38, _yPos + 50,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 100,_yPos + 47,_xPos + 105,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 103,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 9;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 9;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 18, 1];
			global.targetY = obj_inventory.camp_grid[# 18, 2];
			global.targetRoom = rm_lenko_beaowire_09;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.camp_grid[# 19, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 56, _yPos + 76,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 37,_yPos + 47,_xPos + 42,_yPos + 50))
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 40,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 13;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 13;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.camp_grid[# 19, 1];
			global.targetY = obj_inventory.camp_grid[# 19, 2];
			global.targetRoom = rm_lenko_beaowire_13;
			global.targetCamp = true;
			script_execute(RoomEnemiesReset);
			global.lastCamp = global.targetRoom;
			global.lastCampX = global.targetX;
			global.lastCampY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			with (obj_player)
			{
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
}