//Vostle Town Spawners
//
//
//
//
//
//Vostle Town 00 NPC Spawner
function scr_spawner_vostleTown_00_create(){
if (global.dayPhase = 0) or (global.dayPhase = 1)
{
	with (instance_create_layer(208,384,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_orodry_day_create();
		x = 208;
		y = 384;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_orodry;
	}
	with (instance_create_layer(776,232,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_esow_day_create();
		x = 776;
		y = 232;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_esow;
	}
	with (instance_create_layer(776,232,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_basre_day_create();
		x = 648;
		y = 112;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_basre;
	}
}
}
//
//
//
//
//
//Vostle Town 00-01 NPC Spawner
function scr_spawner_vostleTown_00_01_create(){
if (global.dayPhase = 2)
{
	with (instance_create_layer(104,232,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_orodry_night_create();
		x = 151;
		y = 87;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_orodry;
	}
}
}
//
//
//
//
//
//Vostle Town 00-03 NPC Spawner
function scr_spawner_vostleTown_00_03_create(){
if (global.dayPhase = 2)
{
	with (instance_create_layer(152,84,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_esow_night_create();
		x = 152;
		y = 84;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_esow;
	}
}
}
//
//
//
//
//
//Vostle Town 00-03 NPC Spawner
function scr_spawner_vostleTown_01_00_create(){
if (global.dayPhase = 2)
{
	with (instance_create_layer(152,84,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_basre_night_create();
		x = 160;
		y = 96;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_basre;
	}
}
}

