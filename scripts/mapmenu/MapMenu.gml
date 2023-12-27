//Map
//
//
//
//
//
//Maps
function scr_inventory_maps_create(){
slot = obj_game.level_num;
map_grid = ds_grid_create(23,3);
//region_grid = ds_grid_create(6,3);
//region_grid[# 0, 0] = "Lenko Woodlands"
//region_grid[# 0, 1] = true;
//region_grid[# 0, 2] = LenkoMapMenuDraw;
//region_grid[# 1, 0] = "Beetrap Tundra"
//region_grid[# 1, 1] = false;
//region_grid[# 1, 2] = BeetrapMapMenuDraw;
//region_grid[# 2, 0] = "Lenko Woodlands"
//region_grid[# 2, 1] = false;
//region_grid[# 2, 2] = LenkoMapMenuDraw;
//region_grid[# 3, 0] = "Lenko Woodlands"
//region_grid[# 3, 1] = false;
//region_grid[# 3, 2] = LenkoMapMenuDraw;
//region_grid[# 4, 0] = "Lenko Woodlands"
//region_grid[# 4, 1] = false;
//region_grid[# 4, 2] = LenkoMapMenuDraw;
//region_grid[# 5, 0] = "Lenko Woodlands"
//region_grid[# 5, 1] = false;
//region_grid[# 5, 2] = LenkoMapMenuDraw;

map_grid[# 0, 0] = "Vostle Town"
map_grid[# 0, 1] = false;
map_grid[# 0, 2] = scr_menu_map_vostle_town;
map_grid[# 1, 0] = "Farway Road"
map_grid[# 1, 1] = false;
map_grid[# 1, 2] = scr_menu_map_farway_road;
map_grid[# 2, 0] = "Yakflower Path"
map_grid[# 2, 1] = false;
map_grid[# 2, 2] = scr_menu_map_yakflower_path;
map_grid[# 3, 0] = "Habraf Lake"
map_grid[# 3, 1] = false;
map_grid[# 3, 2] = scr_menu_map_habraf_lake;
map_grid[# 4, 0] = "Beaowire Fortress"
map_grid[# 4, 1] = false;
map_grid[# 4, 2] = scr_menu_map_beaowire_fortress;
map_grid[# 5, 1] = "Northern Pass";
map_grid[# 5, 1] = false;
map_grid[# 5, 2] = scr_menu_map_northern_pass;
map_grid[# 6, 0] = "Beetrap 2";
map_grid[# 6, 1] = false;
map_grid[# 6, 2] = scr_menu_map_farway_road;

if (slot != -1)
{
	map_selected = map_grid[# slot, 2]
}
}
//
//
//
//
//
//Map GUI
function scr_menu_inventory_map(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite_stretched(spr_menu_beveled,3,59,39,200,102);
draw_sprite_ext(spr_map_level,slot,64,46,1.0,1.0,0,c_white,1.0);
draw_sprite_stretched(spr_menu,8,54,35,210,16)
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(244,53,"MAP",.5,.5,0);
//Slider
draw_sprite(spr_scroll_bar5b,page,245,61);
if (point_in_rectangle(_mouseX,_mouseY,245,61,253,67))
{
	draw_sprite(spr_scroll_highlight,0,245,60);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 4;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,245,129,253,135))
{
	draw_sprite(spr_scroll_highlight,1,245,128);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 4) page = page + 1;
		else page = 0;
	}
}

//Buttons
//draw_sprite_stretched(button_sprite,2,70,41,14,14);
//draw_sprite_stretched(button_sprite,2,70,57,14,14);
//draw_sprite_stretched(button_sprite,2,70,73,14,14);
//draw_sprite_stretched(button_sprite,2,70,89,14,14);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if instance_exists(obj_altar)
{
	if (point_in_circle(obj_altar.x,obj_altar.y,obj_player.x,obj_player.y,64))
	{
		altar = true;
	}
	else
	{
		altar = false;
	}
}
else
{
	altar = false;
}


for (var i = 0; i < 4; i = i + 1)
{
	var _iPage = i + (4 * page)
	draw_sprite_stretched(spr_menu_circle16,3,228,63 + (i * 18),16,16);
	if (obj_inventory.level_ary[_iPage] = true)
	{
		//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(spr_map_button,_iPage,228,63+(i*18),1.0,1.0,0,c_white,1.0);
		if (point_in_rectangle(_mouseX,_mouseY,228,63 + (i * 18),244,79 + (i * 18)))
		{
			draw_sprite_stretched(spr_highlight_circle,0,227,62 + (i * 18),18,18);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				slot = _iPage;
				map_selected = map_grid[# _iPage, 2];
			}
		}
	}
	else draw_sprite_ext(spr_lock,1,235,71+(i*18),1,1,0,c_white,1.0);
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
//Vostle Town Map Menu Draw
function scr_menu_map_vostle_town(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 64;
var _yPos = 47;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"VOSTLE TOWN",1,1,0);

if (obj_game.level_num = 0)
{
	var _mapRoomX = obj_inventory.vostleTown_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.vostleTown_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
	
}


//Draw Altars (Selectable for travel
if (obj_inventory.altar_grid[# 20, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 87, _yPos + 47,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 84,_yPos + 45,_xPos + 89,_yPos + 48)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 87,_yPos + 47);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.vostleTown_map_ary;
			obj_game.level_num = 0;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.vostleTown_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 20, 1];
			global.targetY = obj_inventory.altar_grid[# 20, 2];
			global.targetRoom = rm_lenko_vostleTown_00;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}

//Farway Connector Arrow
if (obj_inventory.level_ary[1] = true)
{
	draw_sprite_ext(spr_map_arrow,1,_xPos + 129, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 126,_yPos + 37,_xPos + 132,_yPos + 46))
	{
		draw_sprite(spr_map_arrow_highlight,1,_xPos + 129,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))
		{
			slot = 1;
			map_selected = obj_inventory.map_grid[# 1, 2];
		}
	}
}

//Yakflower Connector Arrow
if (obj_inventory.level_ary[2] = true)
{
	draw_sprite_ext(spr_map_arrow,0,_xPos + 87, _yPos + 55,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 84,_yPos + 52,_xPos + 90,_yPos + 58))
	{
		draw_sprite(spr_map_arrow_highlight,0,_xPos + 87,_yPos + 55);
		if (mouse_check_button_pressed(mb_left))
		{
			slot = 2;
			map_selected = obj_inventory.map_grid[# 2, 2];
		}
	}
}

//Farway Connector Arrow
if (obj_inventory.level_ary[3] = true)
{
	draw_sprite_ext(spr_map_arrow,0,_xPos + 57, _yPos + 74,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 54,_yPos + 71,_xPos + 60,_yPos + 77))
	{
		draw_sprite(spr_map_arrow_highlight,0,_xPos + 57,_yPos + 74);
		if (mouse_check_button_pressed(mb_left))
		{
			slot = 3;
			map_selected = obj_inventory.map_grid[# 3, 2];
		}
	}
}

//Farway Connector Arrow
if (obj_inventory.level_ary[4] = true)
{
	draw_sprite_ext(spr_map_arrow,0,_xPos + 41, _yPos + 47,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 44,_xPos + 44,_yPos + 50))
	{
		draw_sprite(spr_map_arrow_highlight,0,_xPos + 41,_yPos + 47);
		if (mouse_check_button_pressed(mb_left))
		{
			slot = 4;
			map_selected = obj_inventory.map_grid[# 4, 2];
		}
	}
}
}
//
//
//
//
//
//Farway Road Map Menu Draw
function scr_menu_map_farway_road(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 64;
var _yPos = 47;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"FARWAY ROAD",1,1,0);

if (obj_game.level_num = 1)
{
	var _mapRoomX = obj_inventory.farwayRoad_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.farwayRoad_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
	
}


//Draw Altars (Selectable for travel
if (obj_inventory.altar_grid[# 0, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 19, _yPos + 22,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 16,_yPos + 20,_xPos + 21,_yPos + 23)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 19,_yPos + 22);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 0, 1];
			global.targetY = obj_inventory.altar_grid[# 0, 2];
			global.targetRoom = rm_lenko_farwayRoad_00;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 1, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 56, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 53,_yPos + 47,_xPos + 58,_yPos + 50)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 56,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 5;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 5;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 1, 1];
			global.targetY = obj_inventory.altar_grid[# 1, 2];
			global.targetRoom = rm_lenko_farwayRoad_04;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 2, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 117, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 114,_yPos + 47,_xPos + 119,_yPos + 50)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 117,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 7;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 7;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 2, 1];
			global.targetY = obj_inventory.altar_grid[# 2, 2];
			global.targetRoom = rm_lenko_farwayRoad_06;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.altar_grid[# 3, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 87, _yPos + 31,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 84,_yPos + 29,_xPos + 89,_yPos + 32)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 87,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 10;
			obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 10;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 3, 1];
			global.targetY = obj_inventory.altar_grid[# 3, 2];
			global.targetRoom = rm_lenko_farwayRoad_09;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 4, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 88, _yPos + 67,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 85,_yPos + 65,_xPos + 90,_yPos + 68)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 88,_yPos + 67);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 14;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 1;
			obj_game.room_num = 14
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 4, 1];
			global.targetY = obj_inventory.altar_grid[# 4, 2];
			global.targetRoom = rm_lenko_farwayRoad_13;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.level_ary[0] = true)
{
	draw_sprite_ext(spr_map_arrow,3,_xPos + 29, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 26,_yPos + 46,_xPos + 32,_yPos + 52))
	{
		draw_sprite(spr_map_arrow_highlight,3,_xPos + 29,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))
		{
			slot = 0;
			map_selected = obj_inventory.map_grid[# 0, 2];
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
function scr_menu_map_yakflower_path(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 64;
var _yPos = 47;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"YAKFLOWER PATH",1,1,0);

if (obj_game.level_num = 2)
{
	var _mapRoomX = obj_inventory.yakflowerPath_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.yakflowerPath_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}

//Draw Altars (Selectable for travel
if (obj_inventory.altar_grid[# 5, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 39, _yPos + 14,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 36,_yPos + 12,_xPos + 41,_yPos + 15))and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 39,_yPos + 14);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 5, 1];
			global.targetY = obj_inventory.altar_grid[# 5, 2];
			global.targetRoom = rm_lenko_yakflowerPath_00;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 6, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 53, _yPos + 31,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 50,_yPos + 29,_xPos + 55,_yPos + 32)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 53,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 4;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 4;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 6, 1];
			global.targetY = obj_inventory.altar_grid[# 6, 2];
			global.targetRoom = rm_lenko_yakflowerPath_04;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 7, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 41, _yPos + 59,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 57,_xPos + 43,_yPos + 60)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 41,_yPos + 59);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 6;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 6;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 7, 1];
			global.targetY = obj_inventory.altar_grid[# 7, 2];
			global.targetRoom = rm_lenko_yakflowerPath_06;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 8, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 85, _yPos + 67,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 82,_yPos + 65,_xPos + 87,_yPos + 68)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 85,_yPos + 67);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 9;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 9;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 8, 1];
			global.targetY = obj_inventory.altar_grid[# 8, 2];
			global.targetRoom = rm_lenko_yakflowerPath_09;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 9, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 104, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 101,_yPos + 38,_xPos + 106,_yPos + 41)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 104,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 13;
			obj_inventory.room_ary = obj_inventory.yakflowerPath_map_ary;
			obj_game.level_num = 2;
			obj_game.room_num = 13;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.yakflowerPath_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 9, 1];
			global.targetY = obj_inventory.altar_grid[# 9, 2];
			global.targetRoom = rm_lenko_yakflowerPath_13;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.level_ary[0] = true)
{
	draw_sprite_ext(spr_map_arrow,2,_xPos + 39, _yPos + 6,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 36,_yPos + 3,_xPos + 42,_yPos + 9))
	{
		draw_sprite(spr_map_arrow_highlight,2,_xPos + 39,_yPos + 6);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			slot = 0;
			map_selected = obj_inventory.map_grid[# 0, 2];
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
function scr_menu_map_habraf_lake(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 64;
var _yPos = 47;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"HABRAF LAKE",1,1,0);

if (obj_game.level_num = 3)
{
	var _mapRoomX = obj_inventory.habrafLake_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.habrafLake_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}


//Draw Altars (Selectable for travel
if (obj_inventory.altar_grid[# 10, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 119, _yPos + 13,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 116,_yPos + 11,_xPos + 121,_yPos + 14)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 119,_yPos + 13);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 10, 1];
			global.targetY = obj_inventory.altar_grid[# 10, 2];
			global.targetRoom = rm_lenko_habrafLake_00;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 11, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 88, _yPos + 23,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 85,_yPos + 21,_xPos + 90,_yPos + 24)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 88,_yPos + 23);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 4;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 4;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 11, 1];
			global.targetY = obj_inventory.altar_grid[# 11, 2];
			global.targetRoom = rm_lenko_habrafLake_04;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 12, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 41, _yPos + 31,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 29,_xPos + 43,_yPos + 32)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 41,_yPos + 31);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 6;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 6;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 12, 1];
			global.targetY = obj_inventory.altar_grid[# 12, 2];
			global.targetRoom = rm_lenko_habrafLake_06;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.altar_grid[# 13, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 103, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 100,_yPos + 47,_xPos + 105,_yPos + 50)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 103,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 9;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 9;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 13, 1];
			global.targetY = obj_inventory.altar_grid[# 13, 2];
			global.targetRoom = rm_lenko_habrafLake_09;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 14, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 40, _yPos + 49,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 37,_yPos + 47,_xPos + 42,_yPos + 50)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 40,_yPos + 49);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 13;
			obj_inventory.room_ary = obj_inventory.habrafLake_map_ary;
			obj_game.level_num = 3;
			obj_game.room_num = 13;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.habrafLake_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 14, 1];
			global.targetY = obj_inventory.altar_grid[# 14, 2];
			global.targetRoom = rm_lenko_habrafLake_13;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.level_ary[0] = true)
{
	draw_sprite_ext(spr_map_arrow,2,_xPos + 119, _yPos + 6,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 116,_yPos + 3,_xPos + 122,_yPos + 9))
	{
		draw_sprite(spr_map_arrow_highlight,2,_xPos + 119,_yPos + 6);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			slot = 0;
			map_selected = obj_inventory.map_grid[# 0, 2];
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
function scr_menu_map_beaowire_fortress(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 64;
var _yPos = 47;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"BEAOWIRE FORTRESS",1,1,0);


if (obj_game.level_num = 4)
{
	var _mapRoomX = obj_inventory.beaowireFortress_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.beaowireFortress_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}


//Draw Altars (Selectable for travel
if (obj_inventory.altar_grid[# 15, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 136, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 133,_yPos + 38,_xPos + 138,_yPos + 41)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 136,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 4;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 15, 1];
			global.targetY = obj_inventory.altar_grid[# 15, 2];
			global.targetRoom = rm_lenko_beaowire_00;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 16, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 104, _yPos + 68,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 101,_yPos + 66,_xPos + 106,_yPos + 69)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 104,_yPos + 68);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 4;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 4;
			obj_game.room_num = 4;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 16, 1];
			global.targetY = obj_inventory.altar_grid[# 16, 2];
			global.targetRoom = rm_lenko_beaowire_04;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 17, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 71, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 68,_yPos + 38,_xPos + 73,_yPos + 41)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 71,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 7;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 4;
			obj_game.room_num = 7;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 17, 1];
			global.targetY = obj_inventory.altar_grid[# 17, 2];
			global.targetRoom = rm_lenko_beaowire_07;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.altar_grid[# 18, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 38, _yPos + 58,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 35,_yPos + 56,_xPos + 40,_yPos +59)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 38,_yPos + 58);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 10;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 4;
			obj_game.room_num = 10;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 18, 1];
			global.targetY = obj_inventory.altar_grid[# 18, 2];
			global.targetRoom = rm_lenko_beaowire_10;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 19, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 88, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 85,_yPos + 38,_xPos + 90,_yPos + 41)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 88,_yPos + 40);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 14;
			obj_inventory.room_ary = obj_inventory.beaowireFortress_map_ary;
			obj_game.level_num = 4;
			obj_game.room_num = 14;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.beaowireFortress_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 19, 1];
			global.targetY = obj_inventory.altar_grid[# 19, 2];
			global.targetRoom = rm_lenko_beaowire_14;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.level_ary[0] = true)
{
	draw_sprite_ext(spr_map_arrow,2,_xPos + 136, _yPos + 33,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 133,_yPos + 30,_xPos + 139,_yPos + 36))
	{
		draw_sprite(spr_map_arrow_highlight,2,_xPos + 136,_yPos + 33);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			slot = 0;
			map_selected = obj_inventory.map_grid[# 0, 2];
		}
	}
}

}
//
//
//
//
//
//Northern Pass Map Menu Draw
function scr_menu_map_northern_pass(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _xPos = 64;
var _yPos = 47;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"NORTHERN PASS",1,1,0);


if (obj_game.level_num = 4)
{
	var _mapRoomX = obj_inventory.northernPass_map_ary[obj_game.room_num][1] 
	var _mapRoomY = obj_inventory.northernPass_map_ary[obj_game.room_num][2]
	var _mapIconX = _mapRoomX + round((obj_player.x / 2)/10);
	var _mapIconY = _mapRoomY + round((obj_player.y / 2)/10);
	draw_sprite_ext(spr_formSelect_icons,obj_player.form,_xPos + _mapIconX,_yPos + _mapIconY,.5,.5,0,c_white,1);
}


//Draw Altars (Selectable for travel
if (obj_inventory.altar_grid[# 20, 3] = true)
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 22, _yPos + 76,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 19,_yPos + 74,_xPos + 24,_yPos + 77)) and (altar = true)
	{
		draw_sprite(spr_map_alter_icon_highlight,0,_xPos + 22,_yPos + 76);
		if (mouse_check_button_pressed(mb_left))// and (obj_inventory.quest_grid[# 1, 3] = true)
		{
			obj_inventory.room_num = 0;
			obj_inventory.room_ary = obj_inventory.northernPass_map_ary;
			obj_game.level_num = 4;
			obj_game.room_num = 0;
			obj_game.room_name = obj_inventory.room_ary[obj_game.room_num][0];
			obj_game.room_name_timer = 180;
			obj_game.room_enemy_grid = obj_game.northernPass_enemy_grid;
			global.targetX = obj_inventory.altar_grid[# 20, 1];
			global.targetY = obj_inventory.altar_grid[# 20, 2];
			global.targetRoom = rm_beetrap_northernPass_00;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 21, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 104, _yPos + 68,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 101,_yPos + 67,_xPos + 106,_yPos + 70)) and (altar = true)
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
			global.targetX = obj_inventory.altar_grid[# 21, 1];
			global.targetY = obj_inventory.altar_grid[# 21, 2];
			global.targetRoom = rm_lenko_beaowire_04;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 22, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 71, _yPos + 40,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 38,_yPos + 29,_xPos + 43,_yPos + 32)) and (altar = true)
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
			global.targetX = obj_inventory.altar_grid[# 17, 1];
			global.targetY = obj_inventory.altar_grid[# 17, 2];
			global.targetRoom = rm_lenko_beaowire_06;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
			
		}
	}
}
if (obj_inventory.altar_grid[# 23, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 38, _yPos + 50,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 100,_yPos + 47,_xPos + 105,_yPos + 50)) and (altar = true)
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
			global.targetX = obj_inventory.altar_grid[# 18, 1];
			global.targetY = obj_inventory.altar_grid[# 18, 2];
			global.targetRoom = rm_lenko_beaowire_09;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
if (obj_inventory.altar_grid[# 24, 3] = true) 
{
	draw_sprite_ext(spr_map_alter_icon,0,_xPos + 56, _yPos + 76,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_xPos + 37,_yPos + 47,_xPos + 42,_yPos + 50)) and (altar = true)
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
			global.targetX = obj_inventory.altar_grid[# 19, 1];
			global.targetY = obj_inventory.altar_grid[# 19, 2];
			global.targetRoom = rm_lenko_beaowire_13;
			global.targetAltar = true;
			scr_game_room_enemy_reset();
			global.lastAltar = global.targetRoom;
			global.lastAltarX = global.targetX;
			global.lastAltarY = global.targetY;
			global.transition = true;
			global.fadeOut = true;
			obj_game.gamePaused = false;
			obj_game.invPaused = false;
			obj_game.textPaused = false;
			obj_inventory.swap_menu = false;
			obj_inventory.main_menu = false;
			obj_inventory.quest_menu = false;
			obj_inventory.map_menu = false;
			with (obj_player)
			{
				walk_snd = snd_walk_regular;
				if (max_weapon_count != -1)
				{
					weapon_count = max_weapon_count;
				}
			}
		}
	}
}
}