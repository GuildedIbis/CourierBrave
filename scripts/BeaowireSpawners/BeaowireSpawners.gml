//Beaowire Spawners
//
//
//
//
//
//Beaowire Dungeon: Room 1 Create
function BeaowireFortressSpawn1Create(){

if (obj_inventory.beaowire_dungeon[0] < 1)
{
	obj_inventory.beaowire_dungeon[0] = 1;
	//Spawn Enemies
	with (instance_create_layer(160,112,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteSkirmisherCreate);
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
//Beaowire Dungeon: Room 2 Create
function BeaowireFortressSpawn2Create(){

if (obj_inventory.beaowire_dungeon[1] < 1)
{
	obj_inventory.beaowire_dungeon[1] = 1;
	//Spawn Enemies
	with (instance_create_layer(160,112,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteSkirmisherCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(168,168,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteSkirmisherCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(152,248,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteSkirmisherCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(80,256,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteSkirmisherCreate);
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
//Beaowire Dungeon: Room 3 Create
function BeaowireFortressSpawn3Create(){

if (obj_inventory.beaowire_dungeon[2] < 1)
{
	//Spawn Boss
	with (instance_create_layer(160,200,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteGorogCreate);
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}	
	//Spawn Adds
	spawn_status = false
	spawn_timer = 300;

}
}
//
//
//
//
//
//Beaowire Dungeon: Room 3 Spawn
function BeaowireFortressSpawn3(){
var _spawnX
var _spawnY
if (point_in_rectangle(obj_player.x,obj_player.y,0,0,320,180))
{
	_spawnX = 160;
	_spawnY = 344;
}
else
{
	_spawnX = 160;
	_spawnY = 24;
}
if (obj_inventory.beaowire_dungeon[2] < 1)
{
	if (spawn_timer > 0) and (spawn_status = false)
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			with (instance_create_layer(_spawnX, _spawnY,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(EliteSkirmisherCreate);
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				spawn_slot = 1;
				break_object = obj_break;
			}
			spawn_status = true;
			spawn_timer = 600;
		}
	}
}
}
//
//
//
//
//
//Beaowire Dungeon: Room 3 Create
function BeaowireFortressSpawn11Create(){

if (obj_inventory.beaowire_dungeon[10] < 2)
{
	//Spawn Boss
	with (instance_create_layer(384,304,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteGorogCreate);
		spawn_slot = 1;
		break_object = obj_break;
	}	
	//Spawn Adds
	spawn_status = true;
	spawn_timer = 300;

}
}
//
//
//
//
//
//Beaowire Dungeon: Room 11 Create
function BeaowireFortressSpawn11(){
if (obj_inventory.beaowire_dungeon[10] < 2)
{
	//obj_inventory.beaowire_dungeon[10] = 1;
	//Spawn Enemies
	if (spawn_status = false)
	{
		if (spawn_timer > 0) spawn_timer = spawn_timer - 1;
		if (spawn_timer <= 0)
		{
			spawn_status = true;
			spawn_timer = 300;
			with (instance_create_layer(384,304,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(EliteGorogCreate);
				spawn_slot = 1;
				break_object = obj_break;
			}
		}
	}
}
}
//
//
//
//
//
//Beaowire Dungeon: Room 15 Create
function BeaowireFortressSpawn15Create(){

if (obj_inventory.beaowire_dungeon[10] < 2)
{
	//Spawn Boss
	with (instance_create_layer(48,64,"Instances",obj_enemy))
	{
		image_alpha = 1;
		script_execute(EliteGorogCreate);
		spawn_slot = 1;
		break_object = obj_break;
	}	
	//Spawn Adds
	spawn_status = true;
	spawn_timer = 300;

}
}
//
//
//
//
//
//Beaowire Dungeon: Room 15 Create
function BeaowireFortressSpawn15(){
if (obj_inventory.beaowire_dungeon[14] < 2)
{
	//obj_inventory.beaowire_dungeon[10] = 1;
	//Spawn Enemies
	if (spawn_status = false)
	{
		if (spawn_timer > 0) spawn_timer = spawn_timer - 1;
		if (spawn_timer <= 0)
		{
			spawn_status = true;
			spawn_timer = 300;
			with (instance_create_layer(48,64,"Instances",obj_enemy))
			{
				image_alpha = 1;
				script_execute(EliteGorogCreate);
				spawn_slot = 1;
				break_object = obj_break;
			}
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
function BeaowireFortressSpawnBossCreate(){

if (obj_inventory.quest_grid[15] < 2)
{

	//Spawn 1
	with (instance_create_layer(160,168,"Instances",obj_enemy))
	{
		beaowire_dungeon[15] = 0;
		image_alpha = 1;
		script_execute(BossTortoiseTrollCreate);
		break_object = obj_break;
	}		
			
}
}
//
//
//
//
//
//Effect Habraf Lake Door - Escort 1
function EffectHalofireQuestDoor(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_player.form != 3)
{
	sprite_index = spr_door_questHalofire;

}
if (obj_player.form = 3)
{
	sprite_index = spr_door_questHalofire_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	with (break_object)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 512;
			y = 136;
		}
	}
}

}