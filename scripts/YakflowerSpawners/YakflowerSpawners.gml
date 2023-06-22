//Yakflower Spawners
//
//
//
//
//
//Yakflower Spawn Create Boss
function YakflowerSpawnCreate1(){

if (obj_inventory.yakflower_lair[0] < 1)
{

	//Spawn 1
	obj_inventory.yakflower_lair[0] = 1;
	with (instance_create_layer(160,96,"Instances",obj_enemy))
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
//Yakflower Lair: Room 1 Spawn
function YakflowerSpawner1(){

}
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
function YakflowerSpawner18(){

if (obj_inventory.yakflowerPath_map_ary[18][3] < 1) 
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
			{
				x_spawn1 = 488;
				y_spawn1 = 88;
				x_spawn2 = 520;
				y_spawn2 = 104;
			}
			else
			{
				x_spawn1 = 104;
				y_spawn1 = 88;
				x_spawn2 = 152;
				y_spawn2 = 72;
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break2;
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
//Habfaf Lair: Escort 1 Spawner
function YakflowerSpawner19(){

if (obj_inventory.yakflowerPath_map_ary[19][3] < 1) 
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
			{
				x_spawn1 = 488;
				y_spawn1 = 88;
				x_spawn2 = 520;
				y_spawn2 = 104;
			}
			else
			{
				x_spawn1 = 104;
				y_spawn1 = 88;
				x_spawn2 = 152;
				y_spawn2 = 72;
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break2;
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
//Yakflower Path Spawn Create Room 02
function YakflowerSpawnCreate02(){
spawn_timer = 180;
x_spawn1 = 80;
y_spawn1 = 304;
x_spawn2 = 80;
y_spawn2 = 88;
spawn1 = false;
spawn2 = false;
spawn3 = false;
if (obj_inventory.yakflower_lair[2] < 3)
{
	obj_inventory.yakflower_lair[2] = 0;
	//Spawn 1
	with (instance_create_layer(64,208,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 2 
	with (instance_create_layer(112,144,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 3
	with (instance_create_layer(240,72,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 4
	with (instance_create_layer(200,128,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break2;
	}
	//Spawn 5
	with (instance_create_layer(248,224,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(OfaWormCreate);
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
//Yakflower Path Spawner Room 02
function YakflowerSpawn02(){

//First Totem
if (obj_inventory.yakflower_lair[2] < 1) 
{
	
	if (spawn_timer > 0) 
	{
		
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,256,224,384,328))
			{
				x_spawn1 = 80;
				y_spawn1 = 304;
				x_spawn2 = 80;
				y_spawn2 = 88;
			}
			else
			{
				var _ran = irandom_range(0,1)
				if (_ran = 0)
				{
					x_spawn1 = 280;
					y_spawn1 = 280;
					x_spawn2 = 320;
					y_spawn2 = 272;
			
				}
				else
				{
					x_spawn1 = 80;
					y_spawn1 = 304;
					x_spawn2 = 80;
					y_spawn2 = 88;
				}
		
			}
			
			//Spawn and Reset Timer
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break2;
			}
			spawn_timer = 180;
		}
	}	
}

//Second Totem
if (obj_inventory.yakflower_lair[2] = 1) 
{
	
	if (spawn_timer > 0) 
	{
		
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,256,224,384,328))
			{
				x_spawn1 = 472;
				y_spawn1 = 64;
				x_spawn2 = 562;
				y_spawn2 = 72;
			}
			else
			{
				var _ran = irandom_range(0,1)
				if (_ran = 0)
				{
					x_spawn1 = 280;
					y_spawn1 = 280;
					x_spawn2 = 320;
					y_spawn2 = 272;
			
				}
				else
				{
					x_spawn1 = 472;
					y_spawn1 = 64;
					x_spawn2 = 562;
					y_spawn2 = 72;
				}
		
			}
			
			//Spawn and Reset Timer
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break2;
			}
			spawn_timer = 180;
		}
	}
	if (spawn2 = false)
	{
		spawn2 = true;
		with (instance_create_layer(288,280,"Instances",obj_enemy))
		{
			image_alpha = 1;
			script_execute(OfaMothCreate);
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			break_object = obj_break2;
		}
	}	
}

//Third Totem
if (obj_inventory.yakflower_lair[2] = 2) 
{
	
	if (spawn_timer > 0) 
	{
		
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,256,224,384,328))
			{
				x_spawn1 = 320;
				y_spawn1 = 56;
				x_spawn2 = 264;
				y_spawn2 = 72;
			}
			else
			{
				var _ran = irandom_range(0,1)
				if (_ran = 0)
				{
					x_spawn1 = 280;
					y_spawn1 = 280;
					x_spawn2 = 320;
					y_spawn2 = 272;
			
				}
				else
				{
					x_spawn1 = 320;
					y_spawn1 = 56;
					x_spawn2 = 264;
					y_spawn2 = 72;
				}
		
			}
			
			//Spawn and Reset Timer
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break2;
			}
			spawn_timer = 180;
		}
	}
	if (spawn3 = false)
	{
		spawn3 = true;
		with (instance_create_layer(288,280,"Instances",obj_enemy))
		{
			image_alpha = 1;
			script_execute(OfaMothCreate);
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			break_object = obj_break2;
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
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			//Decide Spawn Position
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
			
			//Tally, Spawn, Reset
			obj_inventory.yakflower_lair[3] = obj_inventory.yakflower_lair[3] + 1;
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(OfaWormCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break2;
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
//Yakflower Spawn Create Boss
function YakflowerSpawnCreateBoss(){

if (obj_inventory.yakflower_lair[4] < 1)
{

	//Spawn 1
	with (instance_create_layer(160,168,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(BossZerwerkCreate);
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
//Yakflower Lair: Boss Spawn
function YakflowerSpawnerBoss(){

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