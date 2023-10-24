//Habraf Spawners
//
//
//
//
//
//Habfaf Lair: Escort 1 Spawner
function scr_spawner_habrafLake_14(){

if (obj_inventory.habrafLake_map_ary[14][3] < 10) 
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0) //and (global.aggroCounter <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,356))
			{
				if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
				{
					x_spawn1 = 256;
					y_spawn1 = 288;
					x_spawn2 = 280;
					y_spawn2 = 288;
				}
				else
				{
					x_spawn1 = 176;
					y_spawn1 = 80;
					x_spawn2 = 200;
					y_spawn2 = 80;
				}
			}
			else
			{
				if (point_in_rectangle(obj_player.x,obj_player.y,320,0,639,179))
				{
					x_spawn1 = 544;
					y_spawn1 = 256;
					x_spawn2 = 568;
					y_spawn2 = 256;
				}
				else
				{
					x_spawn1 = 496;
					y_spawn1 = 80;
					x_spawn2 = 520;
					y_spawn2 = 80;
				}
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_lilyCultist_bacwire_create();
				timer1 = 30;
				timer2 = 30;
				timer3 = 30;
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			with (instance_create_layer(x_spawn2,y_spawn2,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_lilyCultist_dilloc_create();
				timer1 = 30;
				timer2 = 30;
				timer3 = 30;
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			spawn_timer = 600;
		}
	}
}
}
