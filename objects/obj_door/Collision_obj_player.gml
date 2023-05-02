//Collision With Player
if (locked = true)
{
	if (quest_lock != -1) script_execute(quest_lock);
}
if (obj_game.gamePaused = false) and (global.transition = false) // and (keyboard_check_pressed(ord("E")))
{
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
		global.targetX = target_x;
		global.targetY = target_y;
		global.targetRoom = target_room;
		global.targetCamp = target_camp;
		if (target_camp = true)
		{
			script_execute(RoomEnemiesReset);
			global.lastCamp = target_room;
			global.lastCampX = target_x;
			global.lastCampY = target_y;
			if (camp_num != -1)
			{
				obj_inventory.camp_grid[# camp_num, 3] = true;
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

