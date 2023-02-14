//Habraf Spawners
//
//
//
//
//
//Habfaf Lair: Escort 1 Spawner
function EscortHabrafSpawner1(){

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
function EscortHabrafSpawner2(){

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
			spawn_timer = spawn_timer_max;
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
			spawn_timer2 = spawn_timer2_max;
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
function EscortHabrafSpawner3(){

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
			spawn_timer = spawn_timer_max;
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
			spawn_timer2 = spawn_timer2_max;
		}
	}
}
}