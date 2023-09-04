/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (destroyed = true)
{
	if (obj_game.room_num != -1) and (activate_args != -1)
	{
		obj_game.farwayRoad_resource_grid[# obj_game.room_num, activate_args] = -1;
	}
	event_inherited();
}

