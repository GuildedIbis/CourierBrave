//Yakflower Spawners
//
//
//
//
//
//Yakflower Spawn Create 1
function YakflowerSpawnCreate1(){

if (obj_inventory.yakflower_lair[1] < 20)
{
	obj_inventory.yakflower_lair[1] = 10;
	//Spawn 1
	with (instance_create_layer(64,64,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 2 
	with (instance_create_layer(88,80,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 3
	with (instance_create_layer(232,56,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 4
	with (instance_create_layer(264,56,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 5
	with (instance_create_layer(152,264,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 6
	with (instance_create_layer(168,288,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 7
	with (instance_create_layer(72,272,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 8
	with (instance_create_layer(80,304,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 9
	with (instance_create_layer(64,144,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 10		
	with (instance_create_layer(152,184,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaMothCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
			
			
}
}
//
//
//
//
//
//Habfaf Lair: Escort 1 Spawner
function YakflowerSpawner1(){

if (obj_inventory.yakflower_lair[1] < 20) 
{
	if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
	{
		x_spawn1 = 80;
		y_spawn1 = 304;
		x_spawn2 = 160;
		y_spawn2 = 296;
	}
	else
	{
		x_spawn1 = 72;
		y_spawn1 = 72;
		x_spawn2 = 240;
		y_spawn2 = 64;
	}
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			obj_inventory.yakflower_lair[1] = obj_inventory.yakflower_lair[1] + 1;
			
			if (obj_inventory.yakflower_lair[1] mod 5 = 0) 
			{
					with (instance_create_layer(x_spawn2,y_spawn2,"Instances",obj_enemy))
					{
						image_alpha = 1;
						script_execute(OfaMothCreate);
						global.aggroCounter = global.aggroCounter + 1;
						targeted = true;
						break_object = obj_break2;
					}
			}
			else 
			{
				with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
				{
					image_alpha = 1;
					script_execute(OfaWormCreate);
					global.aggroCounter = global.aggroCounter + 1;
					targeted = true;
					break_object = obj_break2;
				}
			}
			spawn_timer = 180;
		}
	}
}
}
////
////
////
////
////
////Habfaf Lair: Escort 2 Spawner
//function EscortHabrafSpawner2(){

//if (obj_inventory.habraf_lair[2] < 2)
//{
//	if (spawn_timer > 0) and (spawn_status = false)
//	{
//		spawn_timer = spawn_timer -1;
//		if (spawn_timer <= 0)
//		{
//			with (instance_create_layer(184, 296,"Instances",obj_enemy))
//			{
//				image_alpha = 1;
//				script_execute(LilyCultistBacwireCreate);
//				spawn_slot = 1;
//				break_object = obj_break;
//			}
//			spawn_status = true;
//			spawn_timer = spawn_timer_max;
//		}
//	}
//	if (spawn_timer2 > 0) and (spawn_status2 = false)
//	{
//		spawn_timer2 = spawn_timer2 -1;
//		if (spawn_timer2 <= 0)
//		{
//			with (instance_create_layer(216, 296,"Instances",obj_enemy))
//			{
//				image_alpha = 1;
//				script_execute(LilyCultistDillocCreate);
//				spawn_slot = 2;
//				break_object = obj_break;
//			}
//			spawn_status2 = true;
//			spawn_timer2 = spawn_timer2_max;
//		}
//	}
//}
//}
////
////
////
////
////
////Habfaf Lair: Escort 3Spawner
//function EscortHabrafSpawner3(){

//if (obj_inventory.habraf_lair[3] < 2)
//{
//	if (spawn_timer > 0) and (spawn_status = false)
//	{
//		spawn_timer = spawn_timer -1;
//		if (spawn_timer <= 0)
//		{
//			with (instance_create_layer(56, 136,"Instances",obj_enemy))
//			{
//				image_alpha = 1;
//				script_execute(LilyCultistBacwireCreate);
//				spawn_slot = 1;
//				break_object = obj_break;
//			}
//			spawn_status = true;
//			spawn_timer = spawn_timer_max;
//		}
//	}
//	if (spawn_timer2 > 0) and (spawn_status2 = false)
//	{
//		spawn_timer2 = spawn_timer2 -1;
//		if (spawn_timer2 <= 0)
//		{
//			with (instance_create_layer(88, 136,"Instances",obj_enemy))
//			{
//				image_alpha = 1;
//				script_execute(LilyCultistDillocCreate);
//				spawn_slot = 2;
//				break_object = obj_break;
//			}
//			spawn_status2 = true;
//			spawn_timer2 = spawn_timer2_max;
//		}
//	}
//}
//}