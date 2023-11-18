//Beaowire Spawners
//
//
//
//
//
//Beaowire Dungeon: Room 1 Create
function scr_spawner_beaowireFortress_08_create(){
spawn_timer = 900;
}

//
//
//
//
//
//Yakflower Spawn Create Boss
function scr_spawner_beaowireFortress_08(){

if (obj_inventory.quest_grid[# 16, 3] = false) and (global.aggroCounter = 1)
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
			{
				x_spawn1 = 56;
				y_spawn1 = 232;
				x_spawn2 = 264;
				y_spawn2 = 232;

			}
			else
			{
				x_spawn1 = 56;
				y_spawn1 = 144;
				x_spawn2 = 264;
				y_spawn2 = 144;
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_skirmisherElite_create();
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			with (instance_create_layer(x_spawn2,y_spawn2,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_skirmisherElite_create();
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			spawn_timer = 900;
		
		}
	}
}
}
