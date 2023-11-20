//Yakflower Spawners
//
//
//
//
//
//Yakflower Path: Boss Spawner
function scr_spawner_yakflowerPath_07(){

if (obj_inventory.quest_grid[# 8, 3] = false) and (global.aggroCounter <= 2)
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
			{
				x_spawn1 = 176;
				y_spawn1 = 232;

			}
			else
			{
				var _choose = irandom_range(0,1)
				if (_choose = 0)
				{
					x_spawn1 = 224;
					y_spawn1 = 160;
				}
				else
				{
					x_spawn1 = 128;
					y_spawn1 = 160;
				}
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_balurne_skirmisher_create();
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			spawn_timer = 300;
		
		}
	}
}
}
//
//
//
//
//
//Habfaf Lair: Escort 1 Spawner
function scr_spawner_yakflowerPath_14(){

if (obj_inventory.yakflowerPath_map_ary[14][3] < 2) 
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,356))
			{
				x_spawn1 = 440;
				y_spawn1 = 88;
				x_spawn2 = 504;
				y_spawn2 = 88;
			}
			else
			{
				x_spawn1 = 104;
				y_spawn1 = 88;
				x_spawn2 = 200;
				y_spawn2 = 88;
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_ofa_worm_create();
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			spawn_timer = 240;
		}
	}
}
}