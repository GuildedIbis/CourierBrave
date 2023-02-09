// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function OuterHabrafSpawner(){
if (obj_game.gamePaused = false) and (obj_game.event_live = true)
{
	if (point_in_rectangle(obj_player.x,obj_player.y,15,1127,399,1399)) and (obj_inventory.quest_grid[# 6, 0] = true)
	{
		if (obj_inventory.quest_grid[# 6, 1] < obj_inventory.quest_grid[# 6, 2])
		{
			spawn_timer = spawn_timer - 1;
			spawn_timer2 = spawn_timer2 - 1;
			if (spawn_timer <= 0)
			{
				spawn_timer = spawn_timer_max;
				if (global.aggroCounter < 5)
				{
					with (instance_create_layer(x+8,y+32,"Instances",obj_enemy))
					{
						image_alpha = 1;
						script_execute(LillyGuardCreate);
						targeted = true;
						break_object = obj_break;
					}
					global.aggroCounter = global.aggroCounter + 1;
				}
			}
		}
	}
}
}