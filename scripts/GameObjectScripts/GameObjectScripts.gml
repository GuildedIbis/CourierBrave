//Game Object Scripts
//
//
//
//
//
//Game Room Transition
function GameRoomTransition(){
if (global.transition = true)
{
	if (global.fadeOut = true)
	{
		transition_timer = transition_timer + 8;
		draw_sprite_ext(spr_pixel,0,0,0,320,180,0,c_black,transition_timer/100);
		if (transition_timer >= 100)
		{
			room_goto(global.targetRoom);
			audio_stop_all();
			obj_player.x = global.targetX;
			obj_player.y = global.targetY;
			obj_camera.x = global.targetX;
			obj_camera.y = global.targetY;
			global.aggroCounter = 0;
			if (global.targetCamp = true)
			{
				global.lastCampX = global.targetX;
				global.lastCampY = global.targetY;
				global.lastCamp = global.targetRoom;
				with (obj_player)
				{
					hp = max_hp;
					crull_stone = max_crull_stone;
					yellow_crystal = max_charge;
					orange_crystal = max_charge;
					purple_crystal = max_charge;
					blue_crystal = max_charge;
					green_crystal = max_charge;
					red_crystal = max_charge;
					yellow_special = max_charge;
					orange_special = max_charge;
					purple_special = max_charge;
					blue_special = max_charge;
					green_special = max_charge;
					red_special = max_charge;
					
				}
			}
			if (global.current_save != -1) script_execute(global.current_save);
			script_execute(SaveGameSettings);
			script_execute(LoadGameSettings);
			global.fadeOut = false;
		}
	}
	if (global.fadeOut = false)
	{
		transition_timer = transition_timer - 8;
		draw_sprite_ext(spr_pixel,0,0,0,320,180,0,c_black,transition_timer/100);
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
//
function GameRoomName(){

if (room_name_timer > 0)
{
	room_name_timer = room_name_timer - 1;
	var _rmNameAlpha = (room_name_timer/100)
	if (_rmNameAlpha > 1.0) _rmNameAlpha = 1.0;
	//draw_sprite_stretched_ext(menu_sprite,3,14,144,96,32,c_white,_rmNameAlpha);
	draw_set_font(fnt_text);
	draw_set_halign(fa_right)
	draw_set_valign(fa_top)
	draw_text_transformed_color(316,24,room_name,.5,.5,0,c_black,c_black,c_black,c_black,_rmNameAlpha);
	draw_text_transformed_color(315,24,room_name,.5,.5,0,c_white,c_white,c_white,c_white,_rmNameAlpha);
}
if (level_name_timer > 0)
{
	level_name_timer = level_name_timer - 1;
	var _lvlNameAlpha = (level_name_timer/100)
	if (_lvlNameAlpha > 1.0) _lvlNameAlpha = 1.0;
	//draw_sprite_stretched_ext(menu_sprite,3,14,144,96,32,c_white,_rmNameAlpha);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_transformed_color(160,90,level_name,1,1,0,c_black,c_black,c_black,c_black,_lvlNameAlpha);
	draw_text_transformed_color(160,90,level_name,1,1,0,c_white,c_white,c_white,c_white,_lvlNameAlpha);
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
			QuestResetDaysEnd();
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
			day_timer = 0;
		}
	}
}
if (obj_game.invPaused = true)
{
	var _dayPerc = (day_timer/max_day_timer) * 100;
	draw_healthbar(15,9,41,11,_dayPerc,c_black,c_white,c_white,0,true,true);
	draw_sprite_ext(spr_lighting_phase,global.dayPhase,12,7,1,1,0,c_white,1.0);
}
}