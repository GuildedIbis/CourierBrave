//Yakflower Spawners
//
//
//
//
//
//Habfaf Lair: Escort 1 Spawner
function scr_spawner_yakflowerPath_14(){

if (obj_inventory.quest_grid[# 8, 1] < 2) 
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
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			spawn_timer = 180;
		}
	}
}
}