//Collision With Player
if (locked = true)
{
	if (quest_lock != -1) script_execute(quest_lock);
}
if (obj_game.gamePaused = false) and (global.transition = false) // and (keyboard_check_pressed(ord("E")))
{
	//show_debug_message(string(obj_player.break_object))
	//obj_inventory.quest_grid[# 16, 0] = false;
	//obj_inventory.quest_grid[# 16, 1] = 0;
	//obj_inventory.quest_grid[# 16, 3] = false;
	if (locked = false) and (global.aggroCounter <= 0)
	{
		if (room_num != -1)
		{
			obj_inventory.room_num = room_num;
			obj_inventory.room_ary = room_ary;
			obj_game.room_num = room_num;
			obj_game.room_name = room_ary[room_num][0];
			obj_game.room_name_timer = 180;
			if (room_enemy_grid != -1) obj_game.room_enemy_grid = room_enemy_grid;
		}
		if (level_num != -1) 
		{
			obj_game.level_num = level_num;
			obj_game.level_name = obj_inventory.level_name[level_num];
			obj_game.level_name_timer = 180;
			obj_inventory.level_ary[level_num] = true;
		}
		scr_audio_transition();
		global.targetX = target_x;
		global.targetY = target_y;
		global.targetRoom = target_room;
		global.targetAltar = target_altar;
		if (target_altar = true)
		{
			
			global.lastAltar = target_room;
			global.lastAltarX = obj_inventory.altar_grid[# altar_num, 1];
			global.lastAltarY = obj_inventory.altar_grid[# altar_num, 2]
			if (altar_num != -1)
			{
				obj_inventory.altar_grid[# altar_num, 3] = true;
			}
		}
		global.transition = true;
		global.fadeOut = true;
		with (obj_player)
		{
			if (max_weapon_count != -1)
			{
				weapon_count = max_weapon_count;
			}
		}
	}
}

