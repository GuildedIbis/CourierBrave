//Create Lists
//
//
//
//
//
//Chest Lists
function scr_inventory_chests_create(){
chest_list = array_create(50,false);
}
//
//
//
//
//
//Star Orb and Crull Flower Lists
function scr_inventory_starOrb_create(){
star_orb = 0;
starOrb_pedestal_list = array_create(18,false);




//Sun Locations
//0: Lake Path 1
//1: Greyrock 1
//2: Greyrock 4

//Moon Locations
//0: Farway Road 2
//1: Greyrock 4
//2: Lake Path 3
}
//
//
//
//
//
//Room Lists: Called in Inventory
function scr_inventory_room_create(){ 

//Create Levels
scr_room_levels_create()

//Create Maps
scr_room_create_vostleTown();
scr_room_create_farwayRoad();
scr_room_create_yakflowerPath();
scr_room_create_habrafLake();
scr_room_create_beaowireFortress();
scr_room_create_beetraCity();
scr_room_create_castleMhere();
scr_room_create_northernPass();
room_ary = farwayRoad_map_ary;

//Create Altars
scr_room_altars_create();

}
//
//
//
//
//
//Room Enemies
function scr_game_room_enemy_create(){
//The X value represents the room, the y value represents the individual enemy.
//Enemies have their "activate_args" set to a number that is unique the them within the room.
//So if I want to have more than 30 enemies in a room, increase y value.
vostleTown_enemy_grid = ds_grid_create(20,30);
farwayRoad_enemy_grid = ds_grid_create(20,30);
yakflowerPath_enemy_grid = ds_grid_create(20,30);
lakePath_enemy_grid = ds_grid_create(20,30);
habrafLake_enemy_grid = ds_grid_create(20,30);
greyrock_enemy_grid = ds_grid_create(20,30);
beaowireFortress_enemy_grid = ds_grid_create(20,30);
beetraCity_enemy_grid = ds_grid_create(20,30);
castleMhere_enemy_grid = ds_grid_create(20,30);
northernPass_enemy_grid = ds_grid_create(20,30);
room_enemy_grid = farwayRoad_enemy_grid;

for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		vostleTown_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		farwayRoad_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		yakflowerPath_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		habrafLake_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		beaowireFortress_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		beetraCity_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		castleMhere_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		northernPass_enemy_grid[# i, j] = false;
	}
}

}
//
//
//
//
//
//Room Enemies Reset
function scr_game_room_enemy_reset(){
global.aggroCounter = 0;
global.bossCounter = 0;
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.vostleTown_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.farwayRoad_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.yakflowerPath_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.habrafLake_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.beaowireFortress_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.beetraCity_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.castleMhere_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 30; j = j + 1)
	{
		obj_game.northernPass_enemy_grid[# i, j] = false;
	}
}
}

