//Habraf Spawners
//
//
//
//
//
//Habfaf Spawner Room 14
function HabrafSpawner14(){

if (obj_inventory.quest_grid[# 13, 1] < 2) 
{
	
	if (spawn_timer > 0) 
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			
			//Decide Spawn Position
			if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,356))
			{
				x_spawn1 = 544;
				y_spawn1 = 272;
				x_spawn2 = 560;
				y_spawn2 = 224;
			}
			else
			{
				x_spawn1 = 120;
				y_spawn1 = 216;
				x_spawn2 = 88;
				y_spawn2 = 274;
			}
			
			//Spawn, Tally, Reset
			with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistBacwireCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
			spawn_timer = 600;
		}
	}
}
}//
//
//
//
//
//Habraf Spawn 1 Create 
function HabrafSpawnCreate1(){

if (obj_inventory.habraf_lair[0] < 4)
{

	//Spawn 1
	obj_inventory.habraf_lair[0] = 0;
	with (instance_create_layer(96,64,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(TrapLilyCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}	
	with (instance_create_layer(232,64,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(TrapLilyCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(104,120,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(TrapLilyCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(208,120,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(TrapLilyCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
			
}
}
//
//
//
//
//
//Habraf Lair: Room 1 Spawn
function HabrafSpawner1(){
if (!instance_exists(obj_enemy)) obj_inventory.habraf_lair[0] = 4;
}
//
//
//
//
//
//Habfaf Lair: Escort 1 Spawner
function HabrafSpawner2(){

if (obj_inventory.habraf_lair[1] < 2)
{
	if (spawn_timer > 0) and (spawn_status = false)
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			with (instance_create_layer(535, 72,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistBacwireCreate);
				spawn_slot = 1;
				break_object = obj_break;
			}
			spawn_status = true;
			spawn_timer = 300;
		}
	}
	if (spawn_timer2 > 0) and (spawn_status2 = false)
	{
		spawn_timer2 = spawn_timer2 -1;
		if (spawn_timer2 <= 0)
		{
			with (instance_create_layer(552, 72,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistDillocCreate);
				spawn_slot = 2;
				break_object = obj_break;
			}
			spawn_status2 = true;
			spawn_timer2 = 300;
		}
	}
}
}
//
//
//
//
//
//Habfaf Lair: Escort 2 Spawner
function HabrafSpawner3(){

if (obj_inventory.habraf_lair[2] < 2)
{
	if (spawn_timer > 0) and (spawn_status = false)
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			with (instance_create_layer(184, 296,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistBacwireCreate);
				spawn_slot = 1;
				break_object = obj_break;
			}
			spawn_status = true;
			spawn_timer = 300;
		}
	}
	if (spawn_timer2 > 0) and (spawn_status2 = false)
	{
		spawn_timer2 = spawn_timer2 -1;
		if (spawn_timer2 <= 0)
		{
			with (instance_create_layer(216, 296,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistDillocCreate);
				spawn_slot = 2;
				break_object = obj_break;
			}
			spawn_status2 = true;
			spawn_timer2 = 300;
		}
	}
}
}
//
//
//
//
//
//Habfaf Lair: Escort 3Spawner
function HabrafSpawner4(){

if (obj_inventory.habraf_lair[3] < 2)
{
	if (spawn_timer > 0) and (spawn_status = false)
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			with (instance_create_layer(56, 136,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistBacwireCreate);
				spawn_slot = 1;
				break_object = obj_break;
			}
			spawn_status = true;
			spawn_timer = 300;
		}
	}
	if (spawn_timer2 > 0) and (spawn_status2 = false)
	{
		spawn_timer2 = spawn_timer2 -1;
		if (spawn_timer2 <= 0)
		{
			with (instance_create_layer(88, 136,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(LilyCultistDillocCreate);
				spawn_slot = 2;
				break_object = obj_break;
			}
			spawn_status2 = true;
			spawn_timer2 = 300;
		}
	}
}
}
//
//
//
//
//
//Habraf Boss Spawn Create 
function HabrafSpawnCreateBoss(){

if (obj_inventory.habraf_lair[4] < 2)
{

	//Spawn 1
	obj_inventory.habraf_lair[4] = 1;
	with (instance_create_layer(160,152,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(BossMotherLilyCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}		
			
}
}
//
//
//
//
//
//Habraf Lair: Boss Spawner
function HabrafSpawnerBoss(){

}