/// @description Insert description here
event_inherited();
image_speed = 0;
sprite_index = spr_resource_all;
destroyed = true;
passable = true;
if (resource_grid[# obj_game.room_num, activate_args] != -1)
{
	resource_id = resource_grid[# obj_game.room_num, activate_args];
	image_index = resource_grid[# obj_game.room_num, activate_args];
}
if (resource_grid[# obj_game.room_num, activate_args] = -1)
{
	destroyed = false;
	instance_destroy();
}
shadow = true;
shadow_size = 0;

