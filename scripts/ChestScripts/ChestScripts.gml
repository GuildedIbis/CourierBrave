//Chest Scripts
//
//
//
//
//
//Chest Create
function scr_chest_create(){
entity_step = scr_chest_free;
shadow = true;
shadow_size = 2;
sound = snd_chest;
interact = 20;
}
//
//
//
//
//Chest Free
function scr_chest_free(){
sprite_index = spr_chest;

if (activate_args != -1)
{
	if (obj_inventory.chest_list[activate_args] = false)
	{
		image_index = 0;
		interact = 20;
		scr_npc_interact(12);
	
	}
	if (obj_inventory.chest_list[activate_args] = true)
	{
		interact = -1;
		image_index = 1;
	}
}
}
