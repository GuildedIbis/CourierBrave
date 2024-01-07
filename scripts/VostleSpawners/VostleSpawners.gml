//Vostle Town Spawners
//
//
//
//
//
//Vostle Town 00-01 NPC Spawner
function scr_spawner_vostleTown_farwayBlock_create(){
if (obj_inventory.quest_grid[# 4, 3] = false)
{
	with (instance_create_layer(0,88,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 8;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(24,116,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_nisma_block_create();
		x = 24;
		y = 116;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_nisma_block;
	}
}
}
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
	with (instance_create_layer(616,424,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_mesa_day_create();
		x = 616;
		y = 424;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_mesa;
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
//Vostle Town 00-02 NPC Spawner
function scr_spawner_vostleTown_00_02_create(){
if (global.dayPhase = 2)
{
	with (instance_create_layer(104,232,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_mesa_night_create();
		x = 160;
		y = 88;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_mesa;
	}
}
with (instance_create_layer(104,232,"Instances",obj_npc))
{
	image_alpha = 1;
	scr_npc_thurn_create();
	x = 112;
	y = 128;
	home_x = x;
	home_y = y;
	activate_script = scr_text_npc_thurn;
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
with (instance_create_layer(152,84,"Instances",obj_npc))
{
	image_alpha = 1;
	scr_npc_harvo_create();
	x = 160;
	y = 120;
	home_x = x;
	home_y = y;
	activate_script = scr_text_npc_harvo;
}
}
//
//
//
//
//
//Vostle Town 00-04 NPC Spawner
function scr_spawner_vostleTown_00_04_create(){
with (instance_create_layer(152,84,"Instances",obj_npc))
{
	image_alpha = 1;
	scr_npc_dumire_create();
	x = 144;
	y = 88;
	home_x = x;
	home_y = y;
	activate_script = scr_text_npc_dumire;
}
}
//
//
//
//
//
//Vostle Town 01-00 NPC Spawner
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
//
//
//
//
//
//Vostle Town 02 NPC Spawner
function scr_spawner_vostleTown_02_create(){
if (global.dayPhase = 0) or (global.dayPhase = 1)
{
	with (instance_create_layer(208,384,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_einalad_day_create();
		x = 168;
		y = 176;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_einalad;
	}
	
}
}
//
//
//
//
//
//Vostle Town 04 NPC Spawner
function scr_spawner_vostleTown_04_create(){
if (global.dayPhase = 0) or (global.dayPhase = 1)
{
	with (instance_create_layer(472,232,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_rhombail_day_create();
		x = 472;
		y = 232;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_rhombail;
	}
	
}
}
//
//
//
//
//
//Vostle Town 04-00 NPC Spawner
function scr_spawner_vostleTown_04_00_create(){
if (global.dayPhase = 2)
{
	with (instance_create_layer(88,80,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_einalad_night_create();
		x = 88;
		y = 80;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_einalad;
	}
	with (instance_create_layer(136,88,"Instances",obj_npc))
	{
		image_alpha = 1;
		scr_npc_rhombail_night_create();
		x = 136;
		y = 88;
		home_x = x;
		home_y = y;
		activate_script = scr_text_npc_rhombail;
	}
}
}
