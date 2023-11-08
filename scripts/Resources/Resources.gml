//
//
//
//
//
//Standard Resource Create
function scr_resource_create(){
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

}
//
//
//
//
//
//Contained Resource Create
function scr_resource_container_create(){
image_speed = 0;
sprite_index = spr_resource_container_all;

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

}
//
//
//
//
//
//Room Enemies
function scr_resource_grid_create(){
//The (i) value represents the room, the (j) value represents the individual resource id.
//Resources have their "activate_args" set to a number that is unique the them within the room.
//So if I want to have more than 30 enemies in a room, increase y value.
farwayRoad_resource_grid = ds_grid_create(20,30);
yakflowerPath_resource_grid = ds_grid_create(20,30);
habrafLake_resource_grid = ds_grid_create(20,30);
beaowireFortress_resource_grid = ds_grid_create(20,30);
northernPass_resource_grid = ds_grid_create(20,30);

for (var a = 0; a < 20; a = a + 1)
{
	for (var b = 0; b < 30; b = b + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.farwayRoad_resource_grid[# a, b] = 0;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.farwayRoad_resource_grid[# a, b] = 4;
			}
			if (_resID >= 90)
			{
				obj_game.farwayRoad_resource_grid[# a, b] = 1;
			}
		}
		else
		{
			obj_game.farwayRoad_resource_grid[# a, b] = -1;
		}
	}
}
for (var c = 0; c < 20; c = c + 1)
{
	for (var d = 0; d < 30; d = d + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.yakflowerPath_resource_grid[# c, d] = 2;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.yakflowerPath_resource_grid[# c, d] = 6;
			}
			if (_resID >= 90)
			{
				obj_game.yakflowerPath_resource_grid[# c, d] = 3;
			}
		}
		else
		{
			obj_game.yakflowerPath_resource_grid[# c, d] = -1;
		}
	}
}
for (var e = 0; e < 20; e = e + 1)
{
	for (var f = 0; f < 30; f = f + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.habrafLake_resource_grid[# e, f] = 4;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.habrafLake_resource_grid[# e, f] = 2;
			}
			if (_resID >= 90)
			{
				obj_game.habrafLake_resource_grid[# e, f] = 5;
			}
		}
		else
		{
			obj_game.habrafLake_resource_grid[# e, f] = -1;
		}
	}
}
for (var g = 0; g < 20; g = g + 1)
{
	for (var h = 0; h < 30; h = h + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.beaowireFortress_resource_grid[# g, h] = 6;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.beaowireFortress_resource_grid[# g, h] = 0;
			}
			if (_resID >= 90)
			{
				obj_game.beaowireFortress_resource_grid[# g, h] = 7;
			}
		}
		else
		{
			obj_game.beaowireFortress_resource_grid[# g, h] = -1;
		}
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.northernPass_resource_grid[# i, j] = 0;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.northernPass_resource_grid[# i, j] = 0;
			}
			if (_resID >= 90)
			{
				obj_game.northernPass_resource_grid[# i, j] = 0;
			}
		}
		else
		{
			obj_game.northernPass_resource_grid[# i, j] = -1;
		}
	}
}
}
//
//
//
//
//
//Reset All Resources
function scr_resources_all_reset(){
	scr_resources_lenko_reset();
	//scr_resources_beetrap_reset();
}
//
//
//
//
//
//Room Resource Reset
function scr_resources_lenko_reset(){
for (var a = 0; a < 20; a = a + 1)
{
	for (var b = 0; b < 30; b = b + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 65) 
			{
				obj_game.farwayRoad_resource_grid[# a, b] = 0;
			}
			if (_resID >= 65) and (_resID < 90)
			{
				obj_game.farwayRoad_resource_grid[# a, b] = 4;
			}
			if (_resID >= 90)
			{
				obj_game.farwayRoad_resource_grid[# a, b] = 1;
			}
		}
		else
		{
			obj_game.farwayRoad_resource_grid[# a, b] = -1;
		}
	}
}
for (var c = 0; c < 20; c = c + 1)
{
	for (var d = 0; d < 30; d = d + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 65) 
			{
				obj_game.yakflowerPath_resource_grid[# c, d] = 2;
			}
			if (_resID >= 65) and (_resID < 90)
			{
				obj_game.yakflowerPath_resource_grid[# c, d] = 6;
			}
			if (_resID >= 90)
			{
				obj_game.yakflowerPath_resource_grid[# c, d] = 3;
			}
		}
		else
		{
			obj_game.yakflowerPath_resource_grid[# c, d] = -1;
		}
	}
}
for (var e = 0; e < 20; e = e + 1)
{
	for (var f = 0; f < 30; f = f + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 75)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 65) 
			{
				obj_game.habrafLake_resource_grid[# e, f] = 4;
			}
			if (_resID >= 65) and (_resID < 90)
			{
				obj_game.habrafLake_resource_grid[# e, f] = 2;
			}
			if (_resID >= 90)
			{
				obj_game.habrafLake_resource_grid[# e, f] = 5;
			}
		}
		else
		{
			obj_game.habrafLake_resource_grid[# e, f] = -1;
		}
	}
}
for (var g = 0; g < 20; g = g + 1)
{
	for (var h = 0; h < 30; h = h + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.beaowireFortress_resource_grid[# g, h] = 6;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.beaowireFortress_resource_grid[# g, h] = 0;
			}
			if (_resID >= 90)
			{
				obj_game.beaowireFortress_resource_grid[# g, h] = 7;
			}
		}
		else
		{
			obj_game.beaowireFortress_resource_grid[# g, h] = -1;
		}
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		var _resChance = irandom_range(0,99)
		if (_resChance > 74)
		{
			var _resID = irandom_range(0,99)
			if (_resID < 55) 
			{
				obj_game.northernPass_resource_grid[# i, j] = 0;
			}
			if (_resID >= 55) and (_resID < 90)
			{
				obj_game.northernPass_resource_grid[# i, j] = 0;
			}
			if (_resID >= 90)
			{
				obj_game.northernPass_resource_grid[# i, j] = 0;
			}
		}
		else
		{
			obj_game.northernPass_resource_grid[# i, j] = -1;
		}
	}
}
}