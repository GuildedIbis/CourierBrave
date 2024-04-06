//Game Object Scripts
//
//
//
//
//Change Rooms
function scr_game_room_change(xPos,yPos,targetRoom,roomNum,levelNum,roomArray,enemyGrid,altar,altarNum){
obj_inventory.room_num = roomNum;
obj_inventory.room_ary = roomArray;
obj_game.room_num = roomNum;
obj_game.room_name = obj_inventory.room_ary[roomNum][0];
obj_game.room_name_timer = 180;
obj_game.room_enemy_grid = enemyGrid;
obj_game.level_num = levelNum;
obj_game.level_name = obj_inventory.level_name[levelNum];
obj_game.level_name_timer = 180;
obj_inventory.level_ary[levelNum] = true;
global.targetX = xPos;
global.targetY = yPos;
global.targetRoom = targetRoom;

if (altar = true)
{
	global.targetAltar = true;
	global.lastAltar = targetRoom;
	global.lastAltarX = obj_inventory.altar_grid[# altarNum, 1];
	global.lastAltarY = obj_inventory.altar_grid[# altarNum, 2];
	obj_inventory.altar_grid[# altarNum, 3] = true;
}

scr_game_room_enemy_reset();
global.transition = true;
global.fadeOut = true;
}
//
//
//
//
//
//Game Room Transition
function scr_game_room_transition(){
if (global.transition = true)
{
	if (global.fadeOut = true)
	{
		transition_timer = transition_timer + 8;
		draw_sprite_ext(spr_pixel,0,0,0,480,2700,0,c_black,transition_timer/100);
		if (transition_timer >= 100)
		{
			room_goto(global.targetRoom);
			scr_audio_stop_enemy();
			obj_player.x = global.targetX;
			obj_player.y = global.targetY;
			obj_camera.x = global.targetX;
			obj_camera.y = global.targetY;
			global.aggroCounter = 0;
			if (global.targetAltar = true)
			{
				global.lastAltarX = global.targetX;
				global.lastAltarY = global.targetY;
				global.lastAltar = global.targetRoom;
				
			}
			if (global.current_save != -1) script_execute(global.current_save);
			scr_game_save_settings();
			scr_game_load_settings();
			global.fadeOut = false;
		}
	}
	if (global.fadeOut = false)
	{
		transition_timer = transition_timer - 8;
		draw_sprite_ext(spr_pixel,0,0,0,480,270,0,c_black,transition_timer/100);
		if (transition_timer <= 0)
		{
			global.transition = false;
			transition_timer = 0;
		}
	}
}
}
//
//
//
//
//
//Game Room Name
function scr_game_room_name(){

if (room_name_timer > 0)
{
	room_name_timer = room_name_timer - 1;
	var _rmNameAlpha = (room_name_timer/100)
	if (_rmNameAlpha > 1.0) _rmNameAlpha = 1.0;
	//draw_sprite_stretched_ext(menu_sprite,3,14,144,96,32,c_white,_rmNameAlpha);
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed_color(315,16,room_name,.75,.75,0,c_white,c_white,c_white,c_white,_rmNameAlpha);
}
if (level_name_timer > 0)
{
	level_name_timer = level_name_timer - 1;
	var _lvlNameAlpha = (level_name_timer/100)
	if (_lvlNameAlpha > 1.0) _lvlNameAlpha = 1.0;
	//draw_sprite_stretched_ext(menu_sprite,3,14,144,96,32,c_white,_rmNameAlpha);
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed_color(160,90,level_name,1.5,1.5,0,c_white,c_white,c_white,c_white,_lvlNameAlpha);
}
}

//
//
//
//
//
//GameDayCycle
function scr_day_cycle(){
if (gamePaused = false)
{
	if (day_timer < max_day_timer)
	{
		day_timer = day_timer + 1;
		if (global.dayPhase = 2)
		{
			if (day_timer < 1000)
			{
				night_fade = night_fade + 1;
			}
			if (day_timer >= 17000)
			{
				night_fade = night_fade - 1;
			}
			if (day_timer > 1000) and (day_timer < 17000)
			{
				night_fade = 1000;
			}
		}
		else night_fade = 0;
	}
	if (day_timer >= max_day_timer)
	{
		if (global.dayPhase = 2)
		{
			for (var i = 0; i < 49; i = i + 1)
			{
				obj_inventory.crullS_list[i] = false;
			}
			scr_inventory_quest_reset_daily();
			scr_resources_all_reset();
			var _daySelect = irandom_range(1,4);
			if (_daySelect = 1) global.dayPhase = 1;
			else global.dayPhase = 0;
			day_timer = 0;
		}
		else
		{
			for (var i = 0; i < 49; i = i + 1)
			{
				obj_inventory.crullM_list[i] = false;
			}
			global.dayPhase = 2;
			scr_resources_all_reset();
			day_timer = 0;
		}
	}
}

}