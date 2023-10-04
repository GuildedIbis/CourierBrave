//Farway Spawners
//
//
//
//
//
//Farway Road: Spawner - Room 03 Create
function scr_spawner_farwayRoad_03_create(){
if (obj_inventory.farwayRoad_map_ary[3][3] < 1) 
{
	obj_inventory.farwayRoad_map_ary[3][3] = 1;
	with (instance_create_layer(104,232,"Instances",obj_enemy))
	{
		image_alpha = 1;
		scr_enemy_balurne_skirmisher_create();
		enemy_lvl = 0;
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(280,240,"Instances",obj_enemy))
	{
		image_alpha = 1;
		scr_enemy_balurne_skirmisher_create();
		enemy_lvl = 0;
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(312,256,"Instances",obj_enemy))
	{
		image_alpha = 1;
		scr_enemy_balurne_skirmisher_create();
		enemy_lvl = 0;
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(240,384,"Instances",obj_enemy))
	{
		image_alpha = 1;
		scr_enemy_balurne_skirmisher_create();
		enemy_lvl = 0;
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
	with (instance_create_layer(432,200,"Instances",obj_enemy))
	{
		image_alpha = 1;
		scr_enemy_balurne_skirmisher_create();
		enemy_lvl = 0;
		global.aggroCounter = global.aggroCounter + 1;
		targeted = true;
		break_object = obj_break;
	}
}
}

