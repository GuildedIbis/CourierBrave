//Escort Lilly Shrine
//
//
//
//
//Escort Lilly Shrine
function EscortLilyShrine(){
if (point_in_rectangle(obj_escort.x,obj_escort.y,319,0,639,719))
{
	spawn_x = 87;
	spawn_y = 631;
}
else
{
	spawn_x = 240;
	spawn_y = 72;
}
if (obj_inventory.habraf_lair[1] < 2)
{
	if (spawn_timer > 0) and (spawn_status = false)
	{
		spawn_timer = spawn_timer -1;
		if (spawn_timer <= 0)
		{
			with (instance_create_layer(spawn_x + 8, spawn_y + 8,"Instances",obj_enemy))
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
			with (instance_create_layer(spawn_x, spawn_y,"Instances",obj_enemy))
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