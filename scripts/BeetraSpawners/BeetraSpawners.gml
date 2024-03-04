//Beetra City Spawners
//
//
//
//
//
//Beetra City 04 NPC Spawner
function scr_spawner_beetraCity_04_create(){
with (instance_create_layer(520,248,"Instances",obj_npc))
{
	image_alpha = 1;
	scr_npc_bartu_create();
	x = 520;
	y = 248;
	home_x = x;
	home_y = y;
	activate_script = scr_text_npc_bartu;
}
}