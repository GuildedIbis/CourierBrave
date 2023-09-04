/// @description Insert description here
event_inherited();
image_speed = 0;
sprite_index = spr_resource_farwayRoad;
destroyed = true;
resource_id = 0;
if (obj_game.farwayRoad_resource_grid[# obj_game.room_num, activate_args] = -1)
{
	switch (obj_game.farwayRoad_resource_grid[# obj_game.room_num, activate_args])
	{
		case 0:
			resource_id = 0;
			image_index = 0;
		break;
		
		case 1:														
			resource_id = 4;
			image_index = 1;
		break;
		
		case 2:
			resource_id = 1;
			image_index = 2;
		break;
	}
}
if (obj_game.farwayRoad_resource_grid[# obj_game.room_num, activate_args] = -1)
{
	destroyed = false;
	instance_destroy();
}
shadow = true;
shadow_size = 0;

