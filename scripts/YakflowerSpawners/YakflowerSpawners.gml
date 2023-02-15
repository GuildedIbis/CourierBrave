//Yakflower Spawners
//
//
//
//
//
//Yakflower Spawn Create 1
function YakflowerSpawnCreate2(){

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
function YakflowerSpawner2(){

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
		x_spawn2 = 232;
		y_spawn2 = 80;
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
//
//
//
//
//
//Yakflower Spawn Create 4
function YakflowerSpawnCreate4(){

if (obj_inventory.yakflower_lair[3] < 20)
{
	obj_inventory.yakflower_lair[3] = 10;
	//Spawn 1
	with (instance_create_layer(432,112,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 2 
	with (instance_create_layer(472,128,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 3
	with (instance_create_layer(536,128,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 4
	with (instance_create_layer(352,48,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 5
	with (instance_create_layer(320,128,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 6
	with (instance_create_layer(256,48,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 7
	with (instance_create_layer(256,128,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 8
	with (instance_create_layer(160,48,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 9
	with (instance_create_layer(160,128,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 10		
	with (instance_create_layer(344,88,"Instances",obj_enemy))
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
//Habfaf Lair: Escort 4 Spawner
function YakflowerSpawner4(){

if (obj_inventory.yakflower_lair[3] < 20) 
{
	if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
	{
		x_spawn1 = 472;
		y_spawn1 = 128;
		x_spawn2 = 576;
		y_spawn2 = 128;
	}
	else
	{
		x_spawn1 = 168;
		y_spawn1 = 56;
		x_spawn2 = 160;
		y_spawn2 = 128;
	}
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			obj_inventory.yakflower_lair[3] = obj_inventory.yakflower_lair[3] + 1;
			
			if (obj_inventory.yakflower_lair[3] mod 5 = 0) 
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