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
				obj_player.hp = obj_player.max_hp;
				obj_player.crull_stone = obj_player.max_crull_stone;
			}
			if (global.current_save != -1) script_execute(global.current_save);
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
}
//
//
//
//
//
//GameDayCycle
function GameDayCycle(){
if (scene = false)
{
	if (day_timer < max_day_timer) day_timer = day_timer + 1;
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
	if (global.home = false)
	{
		var _dayPerc = (day_timer/max_day_timer) * 100;
		draw_healthbar(15,9,41,11,_dayPerc,c_black,c_white,c_white,0,true,true);
		draw_sprite_ext(spr_lighting_phase,global.dayPhase,12,7,1,1,0,c_white,1.0);
	}
}
}