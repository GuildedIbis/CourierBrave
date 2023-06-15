//Create Lists
//
//
//
//
//
//Chest Lists
function ChestList(){
chest_list = array_create(50,false)
}
//
//
//
//
//
//Crull Stones and Flower Lists
function CrullList(){
crullStone_list = array_create(18,false);
crullStone_list[0] = true;
crullUpgrade_list = array_create(5,false);
crullUpgrade_list[0] = true;

crullS_list = array_create(50,false);
crullM_list = array_create(50,false);

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
//Room Lists
function CampRooms(){ 
camp_grid = ds_grid_create(20,4);
level_ary = array_create(100,-1);
farwayRoad_map_ary = array_create(17,-1);
yakflowerPath_map_ary = array_create(7,-1);
lakePath_map_ary = array_create(13,-1);
habrafLake_map_ary = array_create(8,-1);
greyrock_map_ary = array_create(12,-1);
beaowireFortress_map_ary = array_create(20,-1);
room_ary = farwayRoad_map_ary;
//name
//x spawn
//y spawn
//discoverd
level_ary[0] = true;
level_ary[1] = false;
level_ary[2] = false;
level_ary[3] = false;

camp_grid[# 0, 0] = "Farway Road 00"
camp_grid[# 0, 1] = 88;
camp_grid[# 0, 2] = 90;
camp_grid[# 0, 3] = false;
camp_grid[# 1, 0] = "Farway Road 05"
camp_grid[# 1, 1] = 168;
camp_grid[# 1, 2] = 112;
camp_grid[# 1, 3] = false;
camp_grid[# 2, 0] = "Farway Road 07"
camp_grid[# 2, 1] = 128;
camp_grid[# 2, 2] = 88;
camp_grid[# 2, 3] = false;
camp_grid[# 3, 0] = "Farway Road 10"
camp_grid[# 3, 1] = 184;
camp_grid[# 3, 2] = 112;
camp_grid[# 3, 3] = false;
camp_grid[# 4, 0] = "Farway Road 14"
camp_grid[# 4, 1] = 160;
camp_grid[# 4, 2] = 136;
camp_grid[# 4, 3] = false;
camp_grid[# 5, 0] = "Yakflower Path 00"
camp_grid[# 5, 1] = 120;
camp_grid[# 5, 2] = 88;
camp_grid[# 5, 3] = false;
camp_grid[# 6, 0] = "Yakflower Path 05"
camp_grid[# 6, 1] = 160;
camp_grid[# 6, 2] = 136;
camp_grid[# 6, 3] = false;


//Farway Road Map
farwayRoad_map_ary[0][0] = "Farway Road 00";
farwayRoad_map_ary[0][1] = 16;
farwayRoad_map_ary[0][2] = 18;
farwayRoad_map_ary[1][0] = "Farway Road 01";
farwayRoad_map_ary[1][1] = 32;
farwayRoad_map_ary[1][2] = 18;
farwayRoad_map_ary[2][0] = "Farway Road 02";
farwayRoad_map_ary[2][1] = 32;
farwayRoad_map_ary[2][2] = 27;
farwayRoad_map_ary[3][0] = "Farway Road 03";
farwayRoad_map_ary[3][1] = 16;
farwayRoad_map_ary[3][2] = 36;
farwayRoad_map_ary[4][0] = "Farway Road 04";
farwayRoad_map_ary[4][1] = 32;
farwayRoad_map_ary[4][2] = 45;
farwayRoad_map_ary[5][0] = "Farway Road 05";
farwayRoad_map_ary[5][1] = 48;
farwayRoad_map_ary[5][2] = 45;
farwayRoad_map_ary[6][0] = "Farway Road 06";
farwayRoad_map_ary[6][1] = 64;
farwayRoad_map_ary[6][2] = 36;
farwayRoad_map_ary[7][0] = "Farway Road 07";
farwayRoad_map_ary[7][1] = 112;
farwayRoad_map_ary[7][2] = 45;
farwayRoad_map_ary[8][0] = "Farway Road 08";
farwayRoad_map_ary[8][1] = 128;
farwayRoad_map_ary[8][2] = 45;
farwayRoad_map_ary[9][0] = "Farway Road 09";
farwayRoad_map_ary[9][1] = 112;
farwayRoad_map_ary[9][2] = 54;
farwayRoad_map_ary[10][0] = "Farway Road 10";
farwayRoad_map_ary[10][1] = 80;
farwayRoad_map_ary[10][2] = 27;
farwayRoad_map_ary[11][0] = "Farway Road 11";
farwayRoad_map_ary[11][1] = 64;
farwayRoad_map_ary[11][2] = 9;
farwayRoad_map_ary[12][0] = "Farway Road 12";
farwayRoad_map_ary[12][1] = 96;
farwayRoad_map_ary[12][2] = 9;
farwayRoad_map_ary[13][0] = "Farway Road 13";
farwayRoad_map_ary[13][1] = 112;
farwayRoad_map_ary[13][2] = 9;
farwayRoad_map_ary[14][0] = "Farway Road 14";
farwayRoad_map_ary[14][1] = 80;
farwayRoad_map_ary[14][2] = 63;
farwayRoad_map_ary[15][0] = "Farway Road 15";
farwayRoad_map_ary[15][1] = 48;
farwayRoad_map_ary[15][2] = 45;
farwayRoad_map_ary[16][0] = "Farway Road 16";
farwayRoad_map_ary[16][1] = 64;
farwayRoad_map_ary[16][2] = 36;

//Yakflower Path Map
yakflowerPath_map_ary[0][0] = "Yakflower Path 00";
yakflowerPath_map_ary[0][1] = 66;
yakflowerPath_map_ary[0][2] = 22;
yakflowerPath_map_ary[1][0] = "Yakflower Path 01";
yakflowerPath_map_ary[1][1] = 73;
yakflowerPath_map_ary[1][2] = 22;
yakflowerPath_map_ary[2][0] = "Yakflower Path 02";
yakflowerPath_map_ary[2][1] = 73;
yakflowerPath_map_ary[2][2] = 30;
yakflowerPath_map_ary[3][0] = "Yakflower Path 03";
yakflowerPath_map_ary[3][1] = 84;
yakflowerPath_map_ary[3][2] = 30;
yakflowerPath_map_ary[4][0] = "Yakflower Path 04";
yakflowerPath_map_ary[4][1] = 84;
yakflowerPath_map_ary[4][2] = 37;
yakflowerPath_map_ary[5][0] = "Yakflower Path 05";
yakflowerPath_map_ary[5][1] = 73;
yakflowerPath_map_ary[5][2] = 17;
yakflowerPath_map_ary[6][0] = "LENKO\nZerwerk";
yakflowerPath_map_ary[6][1] = 80;
yakflowerPath_map_ary[6][2] = 20;

//Lake Path Map
lakePath_map_ary[0][0] = "LENKO\nLake Path 1";
lakePath_map_ary[0][1] = 27;
lakePath_map_ary[0][2] = 25;
lakePath_map_ary[1][0] = "LENKO\nLake Path 2";
lakePath_map_ary[1][1] = 17;
lakePath_map_ary[1][2] = 22;
lakePath_map_ary[2][0] = "LENKO\nLake Path 3";
lakePath_map_ary[2][1] = 17;
lakePath_map_ary[2][2] = 30;
lakePath_map_ary[3][0] = "LENKO\nLake Path 4";
lakePath_map_ary[3][1] = 17;
lakePath_map_ary[3][2] = 37;
lakePath_map_ary[4][0] = "LENKO\nLake Path 5";
lakePath_map_ary[4][1] = 21;
lakePath_map_ary[4][2] = 45;
lakePath_map_ary[5][0] = "LENKO\nLake Path 6";
lakePath_map_ary[5][1] = 31;
lakePath_map_ary[5][2] = 45;
lakePath_map_ary[6][0] = "LENKO\nLake Path 7";
lakePath_map_ary[6][1] = 27;
lakePath_map_ary[6][2] = 52;
lakePath_map_ary[7][0] = "LENKO\nLake Path 8";
lakePath_map_ary[7][1] = 28;
lakePath_map_ary[7][2] = 35;
lakePath_map_ary[8][0] = "LENKO\nLake Path 9";
lakePath_map_ary[8][1] = 10;
lakePath_map_ary[8][2] = 32;
lakePath_map_ary[9][0] = "LENKO\nLake Path 10";
lakePath_map_ary[9][1] = 10;
lakePath_map_ary[9][2] = 37;
lakePath_map_ary[10][0] = "LENKO\nLake Path 11";
lakePath_map_ary[10][1] = 10;
lakePath_map_ary[10][2] = 42;
lakePath_map_ary[11][0] = "LENKO\nLake Path 12";
lakePath_map_ary[11][1] = 10;
lakePath_map_ary[11][2] = 47;
lakePath_map_ary[12][0] = "LENKO\nLake Path 13";
lakePath_map_ary[12][1] = 10;
lakePath_map_ary[12][2] = 52;

//Habraf Lake Map
habrafLake_map_ary[0][0] = "LENKO\nHabraf Lake Camp";
habrafLake_map_ary[0][1] = 17;
habrafLake_map_ary[0][2] = 52;
habrafLake_map_ary[1][0] = "LENKO\nHabraf Lake 1";
habrafLake_map_ary[1][1] = 17;
habrafLake_map_ary[1][2] = 57;
habrafLake_map_ary[2][0] = "LENKO\nHabraf Lake 2";
habrafLake_map_ary[2][1] = 28;
habrafLake_map_ary[2][2] = 57;
habrafLake_map_ary[3][0] = "LENKO\nHabraf Lake 3";
habrafLake_map_ary[3][1] = 31;
habrafLake_map_ary[3][2] = 65;
habrafLake_map_ary[4][0] = "LENKO\nHabraf Lake 4";
habrafLake_map_ary[4][1] = 21;
habrafLake_map_ary[4][2] = 67;
habrafLake_map_ary[5][0] = "LENKO\nHabraf Lake 5";
habrafLake_map_ary[5][1] = 24;
habrafLake_map_ary[5][2] = 62;
habrafLake_map_ary[6][0] = "LENKO\nHabraf Lake 6";
habrafLake_map_ary[6][1] = 17;
habrafLake_map_ary[6][2] = 62;
habrafLake_map_ary[7][0] = "LENKO\nMother Lily";
habrafLake_map_ary[7][1] = 10;
habrafLake_map_ary[7][2] = 65;

//Greyrock Map
greyrock_map_ary[0][0] = "LENKO\nGreyrock 1";
greyrock_map_ary[0][1] = 63;
greyrock_map_ary[0][2] = 37;
greyrock_map_ary[1][0] = "LENKO\nGreyrock 2";
greyrock_map_ary[1][1] = 63;
greyrock_map_ary[1][2] = 45;
greyrock_map_ary[2][0] = "LENKO\nGreyrock 3";
greyrock_map_ary[2][1] = 56;
greyrock_map_ary[2][2] = 52;
greyrock_map_ary[3][0] = "LENKO\nGreyrock 4";
greyrock_map_ary[3][1] = 42;
greyrock_map_ary[3][2] = 50;
greyrock_map_ary[4][0] = "LENKO\nGreyrock 5";
greyrock_map_ary[4][1] = 52;
greyrock_map_ary[4][2] = 47;
greyrock_map_ary[5][0] = "LENKO\nGreyrock 6";
greyrock_map_ary[5][1] = 52;
greyrock_map_ary[5][2] = 42;
greyrock_map_ary[6][0] = "LENKO\nGreyrock 7";
greyrock_map_ary[6][1] = 45;
greyrock_map_ary[6][2] = 42;
greyrock_map_ary[7][0] = "LENKO\nGreyrock 8";
greyrock_map_ary[7][1] = 38;
greyrock_map_ary[7][2] = 42;
greyrock_map_ary[8][0] = "LENKO\nGreyrock 9";
greyrock_map_ary[8][1] = 59;
greyrock_map_ary[8][2] = 57;
greyrock_map_ary[9][1] = "LENKO\Greyrock 10";
greyrock_map_ary[9][1] = 73;
greyrock_map_ary[9][2] = 37;
greyrock_map_ary[10][0] = "LENKO\Greyrock 11";
greyrock_map_ary[10][1] = 73;
greyrock_map_ary[10][2] = 42;
greyrock_map_ary[11][0] = "LENKO\Greyrock 12";
greyrock_map_ary[11][1] = 80;
greyrock_map_ary[11][2] = 42;

//Beaowire Fortress Map
beaowireFortress_map_ary[0][0] = "LENKO\nNorth Fortress Camp";
beaowireFortress_map_ary[0][1] = 66;
beaowireFortress_map_ary[0][2] = 52;
beaowireFortress_map_ary[1][0] = "LENKO\nBeaowire Fortress 1";
beaowireFortress_map_ary[1][1] = 66;
beaowireFortress_map_ary[1][2] = 57;
beaowireFortress_map_ary[2][0] = "LENKO\nBeaowire Fortress 2";
beaowireFortress_map_ary[2][1] = 66;
beaowireFortress_map_ary[2][2] = 65;
beaowireFortress_map_ary[3][0] = "LENKO\nBeaowire Fortress 3";
beaowireFortress_map_ary[3][1] = 59;
beaowireFortress_map_ary[3][2] = 70;
beaowireFortress_map_ary[4][0] = "LENKO\nBeaowire Fortress 4";
beaowireFortress_map_ary[4][1] = 66;
beaowireFortress_map_ary[4][2] = 72;
beaowireFortress_map_ary[5][0] = "LENKO\nBeaowire Fortress 5";
beaowireFortress_map_ary[5][1] = 72;
beaowireFortress_map_ary[5][2] = 77;
beaowireFortress_map_ary[6][0] = "LENKO\nBeaowire Fortress 6";
beaowireFortress_map_ary[6][1] = 66;
beaowireFortress_map_ary[6][2] = 42;
beaowireFortress_map_ary[7][0] = "LENKO\nBeaowire Fortress 7";
beaowireFortress_map_ary[7][1] = 66;
beaowireFortress_map_ary[7][2] = 42;
beaowireFortress_map_ary[8][0] = "LENKO\nBeaowire Fortress 8";
beaowireFortress_map_ary[8][1] = 66;
beaowireFortress_map_ary[8][2] = 42;
beaowireFortress_map_ary[9][0] = "LENKO\nBeaowire Fortress 9";
beaowireFortress_map_ary[9][1] = 66;
beaowireFortress_map_ary[9][2] = 42;
beaowireFortress_map_ary[10][0] = "LENKO\nBeaowire Fortress 10";
beaowireFortress_map_ary[10][1] = 66;
beaowireFortress_map_ary[10][2] = 42;
beaowireFortress_map_ary[11][0] = "LENKO\nBeaowire Fortress 11";
beaowireFortress_map_ary[11][1] = 66;
beaowireFortress_map_ary[11][2] = 42;
beaowireFortress_map_ary[12][0] = "LENKO\nBeaowire Fortress 12";
beaowireFortress_map_ary[12][1] = 66;
beaowireFortress_map_ary[12][2] = 42;
beaowireFortress_map_ary[13][0] = "LENKO\nBeaowire Fortress 13";
beaowireFortress_map_ary[13][1] = 66;
beaowireFortress_map_ary[13][2] = 42;
beaowireFortress_map_ary[14][0] = "LENKO\nBeaowire Fortress 14";
beaowireFortress_map_ary[14][1] = 66;
beaowireFortress_map_ary[14][2] = 42;
beaowireFortress_map_ary[15][0] = "LENKO\nBeaowire Fortress 15";
beaowireFortress_map_ary[15][1] = 66;
beaowireFortress_map_ary[15][2] = 42;
beaowireFortress_map_ary[16][0] = "LENKO\nBeaowire Fortress 16";
beaowireFortress_map_ary[16][1] = 66;
beaowireFortress_map_ary[16][2] = 42;
beaowireFortress_map_ary[17][0] = "LENKO\nBeaowire Fortress 17";
beaowireFortress_map_ary[17][1] = 66;
beaowireFortress_map_ary[17][2] = 42;
beaowireFortress_map_ary[18][0] = "LENKO\nBeaowire Gate Camp";
beaowireFortress_map_ary[18][1] = 80;
beaowireFortress_map_ary[18][2] = 77;
}
//
//
//
//
//
//Room Enemies
function RoomEnemies(){
farwayRoad_enemy_grid = ds_grid_create(20,20);
yakflowerPath_enemy_grid = ds_grid_create(20,20);
lakePath_enemy_grid = ds_grid_create(20,20);
habrafLake_enemy_grid = ds_grid_create(20,20);
greyrock_enemy_grid = ds_grid_create(20,20);
beaowireFortress_enemy_grid = ds_grid_create(20,20);
room_enemy_grid = farwayRoad_enemy_grid;

for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		farwayRoad_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		yakflowerPath_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		lakePath_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		habrafLake_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		greyrock_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		beaowireFortress_enemy_grid[# i, j] = false;
	}
}

}
//
//
//
//
//
//Room Enemies Reset
function RoomEnemiesReset(){
global.aggroCounter = 0;
global.bossCounter = 0;
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.farwayRoad_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.yakflowerPath_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.lakePath_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.habrafLake_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.greyrock_enemy_grid[# i, j] = false;
	}
}
for (var i = 0; i < 20; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.beaowireFortress_enemy_grid[# i, j] = false;
	}
}

}
	
//
//
//
//
//Old Map
//roomName_ary[0][0] = "LENKO\nTutorial";
//roomName_ary[0][1] = 31;
//roomName_ary[0][2] = 5;
//roomName_ary[1][0] = "LENKO\nFarway Camp";
//roomName_ary[1][1] = 38;
//roomName_ary[1][2] = 7;
//roomName_ary[2][0] = "LENKO\nKovalad's Smithy";
//roomName_ary[2][1] = 38;
//roomName_ary[2][2] = 2;
//roomName_ary[3][0] = "LENKO\nFarway Road 1";
//roomName_ary[3][1] = 38;
//roomName_ary[3][2] = 12;
//roomName_ary[4][0] = "LENKO\nFarway Road 2";
//roomName_ary[4][1] = 41;
//roomName_ary[4][2] = 20;
//roomName_ary[5][0] = "LENKO\nFarway Road 3";
//roomName_ary[5][1] = 38;
//roomName_ary[5][2] = 27;
//roomName_ary[6][0] = "LENKO\nFarway Road 4";
//roomName_ary[6][1] = 45;
//roomName_ary[6][2] = 12;
//roomName_ary[7][0] = "LENKO\nFarway Road 5";
//roomName_ary[7][1] = 49;
//roomName_ary[7][2] = 27;
//roomName_ary[8][0] = "LENKO\nFarway Road 6";
//roomName_ary[8][1] = 52;
//roomName_ary[8][2] = 20;
//roomName_ary[9][0] = "LENKO\nFarway Road 7";
//roomName_ary[9][1] = 62;
//roomName_ary[9][2] = 20;
//roomName_ary[10][0] = "LENKO\nFarway Road 8";
//roomName_ary[10][1] = 59;
//roomName_ary[10][2] = 12;
//roomName_ary[11][0] = "LENKO\nFarway Road 9";
//roomName_ary[11][1] = 52;
//roomName_ary[11][2] = 12;
//roomName_ary[12][0] = "LENKO\nYakflower Camp";
//roomName_ary[12][1] = 66;
//roomName_ary[12][2] = 12;
//roomName_ary[13][0] = "LENKO\nLair: Yakflower Path";
//roomName_ary[13][1] = 66;
//roomName_ary[13][2] = 12;
//roomName_ary[14][0] = "LENKO\nLake Path 1";
//roomName_ary[14][1] = 27;
//roomName_ary[14][2] = 15;
//roomName_ary[15][0] = "LENKO\nLake Path 2";
//roomName_ary[15][1] = 17;
//roomName_ary[15][2] = 12;
//roomName_ary[16][0] = "LENKO\nLake Path 3";
//roomName_ary[16][1] = 17;
//roomName_ary[16][2] = 20;
//roomName_ary[17][0] = "LENKO\nLake Path 4";
//roomName_ary[17][1] = 17;
//roomName_ary[17][2] = 27;
//roomName_ary[18][0] = "LENKO\nLake Path 5";
//roomName_ary[18][1] = 21;
//roomName_ary[18][2] = 35;
//roomName_ary[19][0] = "LENKO\nLake Path 6";
//roomName_ary[19][1] = 31;
//roomName_ary[19][2] = 35;
//roomName_ary[20][0] = "LENKO\nLake Path 7";
//roomName_ary[20][1] = 27;
//roomName_ary[20][2] = 42;
//roomName_ary[21][0] = "LENKO\nLake Path 8";
//roomName_ary[21][1] = 28;
//roomName_ary[21][2] = 25;
//roomName_ary[22][0] = "LENKO\nLake Path 9";
//roomName_ary[22][1] = 10;
//roomName_ary[22][2] = 22;
//roomName_ary[23][0] = "LENKO\nLake Path 10";
//roomName_ary[23][1] = 10;
//roomName_ary[23][2] = 27;
//roomName_ary[24][0] = "LENKO\nHabraf Lake Camp";
//roomName_ary[24][1] = 17;
//roomName_ary[24][2] = 42;
//roomName_ary[25][0] = "LENKO\nLair: Habraf Lake";
//roomName_ary[25][1] = 17;
//roomName_ary[25][2] = 42;
//roomName_ary[26][0] = "LENKO\nGreyrock 1";
//roomName_ary[26][1] = 63;
//roomName_ary[26][2] = 27;
//roomName_ary[27][0] = "LENKO\nGreyrock 2";
//roomName_ary[27][1] = 63;
//roomName_ary[27][2] = 35;
//roomName_ary[28][0] = "LENKO\nGreyrock 3";
//roomName_ary[28][1] = 56;
//roomName_ary[28][2] = 42;
//roomName_ary[29][0] = "LENKO\nGreyrock 4";
//roomName_ary[29][1] = 41;
//roomName_ary[29][2] = 40;
//roomName_ary[30][0] = "LENKO\nGreyrock 5";
//roomName_ary[30][1] = 52;
//roomName_ary[30][2] = 37;
//roomName_ary[31][0] = "LENKO\nGreyrock 6";
//roomName_ary[31][1] = 52;
//roomName_ary[31][2] = 32;
//roomName_ary[32][0] = "LENKO\nGreyrock 7";
//roomName_ary[32][1] = 38;
//roomName_ary[32][2] = 32;
//roomName_ary[33][0] = "LENKO\nGreyrock 8";
//roomName_ary[33][1] = 45;
//roomName_ary[33][2] = 32;
//roomName_ary[34][0] = "LENKO\nGreyrock 9";
//roomName_ary[34][1] = 59;
//roomName_ary[34][2] = 47;
//roomName_ary[35][0] = "LENKO\nFortress Camp";
//roomName_ary[35][1] = 66;
//roomName_ary[35][2] = 42;
//roomName_ary[36][0] = "LENKO\nEkthalem's Fortress";
//roomName_ary[36][1] = 66;
//roomName_ary[36][2] = 42;
//roomName_ary[37][1] = "LENKO\Greyrock 10";
//roomName_ary[37][1] = 73;
//roomName_ary[37][2] = 27;
//roomName_ary[38][0] = "LENKO\Greyrock 11";
//roomName_ary[38][1] = 73;
//roomName_ary[38][2] = 32;
//roomName_ary[39][0] = "LENKO\Greyrock 12";
//roomName_ary[39][1] = 80;
//roomName_ary[39][2] = 32;
//roomName_ary[40][0] = "LENKO\nFarway Road 10";
//roomName_ary[40][1] = 45;
//roomName_ary[40][2] = 7;
//roomName_ary[41][0] = "LENKO\nFarway Road 11";
//roomName_ary[41][1] = 52;
//roomName_ary[41][2] = 7;
//roomName_ary[42][0] = "LENKO\nFarway Road 12";
//roomName_ary[42][1] = 59;
//roomName_ary[42][2] = 7;
//roomName_ary[43][0] = "LENKO\nLake Path 11";
//roomName_ary[43][1] = 38;
//roomName_ary[43][2] = 12;
//roomName_ary[44][0] = "LENKO\nLake Path 12";
//roomName_ary[44][1] = 41;
//roomName_ary[44][2] = 20;
//roomName_ary[45][0] = "LENKO\nLake Path 13";
//roomName_ary[45][1] = 38;
//roomName_ary[45][2] = 27;
//roomName_ary[46][0] = "LENKO\n";
//roomName_ary[46][1] = 45;
//roomName_ary[46][2] = 12;
//roomName_ary[47][0] = "LENKO\n";
//roomName_ary[47][1] = 49;
//roomName_ary[47][2] = 27;
//roomName_ary[48][0] = "LENKO\n";
//roomName_ary[48][1] = 52;
//roomName_ary[48][2] = 20;
//roomName_ary[49][0] = "LENKO\n";
//roomName_ary[49][1] = 62;
//roomName_ary[49][2] = 20;
//roomName_ary[0] = "LENKO\n";
//roomName_ary[1] = "LENKO\n";
//roomName_ary[2] = "LENKO\n";
//roomName_ary[3] = "LENKO\n";
//roomName_ary[4] = "LENKO\n";
//roomName_ary[5] = "LENKO\n";
//roomName_ary[6] = "LENKO\n";
//roomName_ary[7] = "LENKO\n";
//roomName_ary[8] = "LENKO\n";
//roomName_ary[9] = "LENKO\n";