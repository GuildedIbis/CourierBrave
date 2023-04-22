//Lenko Spawners
//
//
//
//
//
//Lenko
function LenkoFortressSpawnCreate(){

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
}
}
//
//
//
//
//
//Habraf Lair: Room 1 Spawn
function LenkoFortressSpawn(){

}
