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
roomName_ary = array_create(100,-1);
farwayRoad_map_ary = array_create(15,-1);
yakflowerPath_map_ary = array_create(7,-1);
lakePath_map_ary = array_create(13,-1);
habrafLake_map_ary = array_create(8,-1);
greyrock_map_ary = array_create(12,-1);
beaowireFortress_map_ary = array_create(20,-1);
//name
//x spawn
//y spawn
//discoverd

camp_grid[# 0, 0] = "Kovalad's Smithy"
camp_grid[# 0, 1] = 352;
camp_grid[# 0, 2] = 288;
camp_grid[# 0, 3] = false;
camp_grid[# 1, 0] = "Yakflower Camp"
camp_grid[# 1, 1] = 296;
camp_grid[# 1, 2] = 88;
camp_grid[# 1, 3] = false;
camp_grid[# 2, 0] = "Habraf Lake Camp"
camp_grid[# 2, 1] = 160;
camp_grid[# 2, 2] = 48;
camp_grid[# 2, 3] = false;
camp_grid[# 3, 0] = "Fortress Camp"
camp_grid[# 3, 1] = 160;
camp_grid[# 3, 2] = 88;
camp_grid[# 3, 3] = false;


roomName_ary[0][0] = "LENKO\nTutorial";
roomName_ary[0][1] = 31;
roomName_ary[0][2] = 5;
roomName_ary[1][0] = "LENKO\nFarway Camp";
roomName_ary[1][1] = 38;
roomName_ary[1][2] = 7;
roomName_ary[2][0] = "LENKO\nKovalad's Smithy";
roomName_ary[2][1] = 38;
roomName_ary[2][2] = 2;
roomName_ary[3][0] = "LENKO\nFarway Road 1";
roomName_ary[3][1] = 38;
roomName_ary[3][2] = 12;
roomName_ary[4][0] = "LENKO\nFarway Road 2";
roomName_ary[4][1] = 41;
roomName_ary[4][2] = 20;
roomName_ary[5][0] = "LENKO\nFarway Road 3";
roomName_ary[5][1] = 38;
roomName_ary[5][2] = 27;
roomName_ary[6][0] = "LENKO\nFarway Road 4";
roomName_ary[6][1] = 45;
roomName_ary[6][2] = 12;
roomName_ary[7][0] = "LENKO\nFarway Road 5";
roomName_ary[7][1] = 49;
roomName_ary[7][2] = 27;
roomName_ary[8][0] = "LENKO\nFarway Road 6";
roomName_ary[8][1] = 52;
roomName_ary[8][2] = 20;
roomName_ary[9][0] = "LENKO\nFarway Road 7";
roomName_ary[9][1] = 62;
roomName_ary[9][2] = 20;
roomName_ary[10][0] = "LENKO\nFarway Road 8";
roomName_ary[10][1] = 59;
roomName_ary[10][2] = 12;
roomName_ary[11][0] = "LENKO\nFarway Road 9";
roomName_ary[11][1] = 52;
roomName_ary[11][2] = 12;
roomName_ary[12][0] = "LENKO\nYakflower Camp";
roomName_ary[12][1] = 66;
roomName_ary[12][2] = 12;
roomName_ary[13][0] = "LENKO\nLair: Yakflower Path";
roomName_ary[13][1] = 66;
roomName_ary[13][2] = 12;
roomName_ary[14][0] = "LENKO\nLake Path 1";
roomName_ary[14][1] = 27;
roomName_ary[14][2] = 15;
roomName_ary[15][0] = "LENKO\nLake Path 2";
roomName_ary[15][1] = 17;
roomName_ary[15][2] = 12;
roomName_ary[16][0] = "LENKO\nLake Path 3";
roomName_ary[16][1] = 17;
roomName_ary[16][2] = 20;
roomName_ary[17][0] = "LENKO\nLake Path 4";
roomName_ary[17][1] = 17;
roomName_ary[17][2] = 27;
roomName_ary[18][0] = "LENKO\nLake Path 5";
roomName_ary[18][1] = 21;
roomName_ary[18][2] = 35;
roomName_ary[19][0] = "LENKO\nLake Path 6";
roomName_ary[19][1] = 31;
roomName_ary[19][2] = 35;
roomName_ary[20][0] = "LENKO\nLake Path 7";
roomName_ary[20][1] = 27;
roomName_ary[20][2] = 42;
roomName_ary[21][0] = "LENKO\nLake Path 8";
roomName_ary[21][1] = 28;
roomName_ary[21][2] = 25;
roomName_ary[22][0] = "LENKO\nLake Path 9";
roomName_ary[22][1] = 10;
roomName_ary[22][2] = 22;
roomName_ary[23][0] = "LENKO\nLake Path 10";
roomName_ary[23][1] = 10;
roomName_ary[23][2] = 27;
roomName_ary[24][0] = "LENKO\nHabraf Lake Camp";
roomName_ary[24][1] = 17;
roomName_ary[24][2] = 42;
roomName_ary[25][0] = "LENKO\nLair: Habraf Lake";
roomName_ary[25][1] = 17;
roomName_ary[25][2] = 42;
roomName_ary[26][0] = "LENKO\nGreyrock 1";
roomName_ary[26][1] = 63;
roomName_ary[26][2] = 27;
roomName_ary[27][0] = "LENKO\nGreyrock 2";
roomName_ary[27][1] = 63;
roomName_ary[27][2] = 35;
roomName_ary[28][0] = "LENKO\nGreyrock 3";
roomName_ary[28][1] = 56;
roomName_ary[28][2] = 42;
roomName_ary[29][0] = "LENKO\nGreyrock 4";
roomName_ary[29][1] = 41;
roomName_ary[29][2] = 40;
roomName_ary[30][0] = "LENKO\nGreyrock 5";
roomName_ary[30][1] = 52;
roomName_ary[30][2] = 37;
roomName_ary[31][0] = "LENKO\nGreyrock 6";
roomName_ary[31][1] = 52;
roomName_ary[31][2] = 32;
roomName_ary[32][0] = "LENKO\nGreyrock 7";
roomName_ary[32][1] = 38;
roomName_ary[32][2] = 32;
roomName_ary[33][0] = "LENKO\nGreyrock 8";
roomName_ary[33][1] = 45;
roomName_ary[33][2] = 32;
roomName_ary[34][0] = "LENKO\nGreyrock 9";
roomName_ary[34][1] = 59;
roomName_ary[34][2] = 47;
roomName_ary[35][0] = "LENKO\nFortress Camp";
roomName_ary[35][1] = 66;
roomName_ary[35][2] = 42;
roomName_ary[36][0] = "LENKO\nEkthalem's Fortress";
roomName_ary[36][1] = 66;
roomName_ary[36][2] = 42;
roomName_ary[37][1] = "LENKO\Greyrock 10";
roomName_ary[37][1] = 73;
roomName_ary[37][2] = 27;
roomName_ary[38][0] = "LENKO\Greyrock 11";
roomName_ary[38][1] = 73;
roomName_ary[38][2] = 32;
roomName_ary[39][0] = "LENKO\Greyrock 12";
roomName_ary[39][1] = 80;
roomName_ary[39][2] = 32;
roomName_ary[40][0] = "LENKO\nFarway Road 10";
roomName_ary[40][1] = 45;
roomName_ary[40][2] = 7;
roomName_ary[41][0] = "LENKO\nFarway Road 11";
roomName_ary[41][1] = 52;
roomName_ary[41][2] = 7;
roomName_ary[42][0] = "LENKO\nFarway Road 12";
roomName_ary[42][1] = 59;
roomName_ary[42][2] = 7;
roomName_ary[43][0] = "LENKO\nLake Path 11";
roomName_ary[43][1] = 38;
roomName_ary[43][2] = 12;
roomName_ary[44][0] = "LENKO\nLake Path 12";
roomName_ary[44][1] = 41;
roomName_ary[44][2] = 20;
roomName_ary[45][0] = "LENKO\nLake Path 13";
roomName_ary[45][1] = 38;
roomName_ary[45][2] = 27;
roomName_ary[46][0] = "LENKO\n";
roomName_ary[46][1] = 45;
roomName_ary[46][2] = 12;
roomName_ary[47][0] = "LENKO\n";
roomName_ary[47][1] = 49;
roomName_ary[47][2] = 27;
roomName_ary[48][0] = "LENKO\n";
roomName_ary[48][1] = 52;
roomName_ary[48][2] = 20;
roomName_ary[49][0] = "LENKO\n";
roomName_ary[49][1] = 62;
roomName_ary[49][2] = 20;
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

//Farway Road Map
farwayRoad_map_ary[0][0] = "LENKO\nTutorial";
farwayRoad_map_ary[0][1] = 31;
farwayRoad_map_ary[0][2] = 5;
farwayRoad_map_ary[1][0] = "LENKO\nFarway Camp";
farwayRoad_map_ary[1][1] = 38;
farwayRoad_map_ary[1][2] = 7;
farwayRoad_map_ary[2][0] = "LENKO\nKovalad's Smithy";
farwayRoad_map_ary[2][1] = 38;
farwayRoad_map_ary[2][2] = 2;
farwayRoad_map_ary[3][0] = "LENKO\nFarway Road 1";
farwayRoad_map_ary[3][1] = 38;
farwayRoad_map_ary[3][2] = 12;
farwayRoad_map_ary[4][0] = "LENKO\nFarway Road 2";
farwayRoad_map_ary[4][1] = 41;
farwayRoad_map_ary[4][2] = 20;
farwayRoad_map_ary[5][0] = "LENKO\nFarway Road 3";
farwayRoad_map_ary[5][1] = 38;
farwayRoad_map_ary[5][2] = 27;
farwayRoad_map_ary[6][0] = "LENKO\nFarway Road 4";
farwayRoad_map_ary[6][1] = 45;
farwayRoad_map_ary[6][2] = 12;
farwayRoad_map_ary[7][0] = "LENKO\nFarway Road 5";
farwayRoad_map_ary[7][1] = 49;
farwayRoad_map_ary[7][2] = 27;
farwayRoad_map_ary[8][0] = "LENKO\nFarway Road 6";
farwayRoad_map_ary[8][1] = 52;
farwayRoad_map_ary[8][2] = 20;
farwayRoad_map_ary[9][0] = "LENKO\nFarway Road 7";
farwayRoad_map_ary[9][1] = 62;
farwayRoad_map_ary[9][2] = 20;
farwayRoad_map_ary[10][0] = "LENKO\nFarway Road 8";
farwayRoad_map_ary[10][1] = 59;
farwayRoad_map_ary[10][2] = 12;
farwayRoad_map_ary[11][0] = "LENKO\nFarway Road 9";
farwayRoad_map_ary[11][1] = 52;
farwayRoad_map_ary[11][2] = 12;
farwayRoad_map_ary[12][0] = "LENKO\nFarway Road 10";
farwayRoad_map_ary[12][1] = 45;
farwayRoad_map_ary[12][2] = 7;
farwayRoad_map_ary[13][0] = "LENKO\nFarway Road 11";
farwayRoad_map_ary[13][1] = 52;
farwayRoad_map_ary[13][2] = 7;
farwayRoad_map_ary[14][0] = "LENKO\nFarway Road 12";
farwayRoad_map_ary[14][1] = 59;
farwayRoad_map_ary[14][2] = 7;

//Yakflower Path Map
yakflowerPath_map_ary[0][0] = "LENKO\nYakflower Camp";
yakflowerPath_map_ary[0][1] = 66;
yakflowerPath_map_ary[0][2] = 12;
yakflowerPath_map_ary[1][0] = "LENKO\nYakflower Path 1";
yakflowerPath_map_ary[1][1] = 73;
yakflowerPath_map_ary[1][2] = 12;
yakflowerPath_map_ary[2][0] = "LENKO\nYakflower Path 2";
yakflowerPath_map_ary[2][1] = 73;
yakflowerPath_map_ary[2][2] = 19;
yakflowerPath_map_ary[3][0] = "LENKO\nYakflower Path 3";
yakflowerPath_map_ary[3][1] = 66;
yakflowerPath_map_ary[3][2] = 12;
yakflowerPath_map_ary[4][0] = "LENKO\nYakflower Path 4";
yakflowerPath_map_ary[4][1] = 66;
yakflowerPath_map_ary[4][2] = 12;
yakflowerPath_map_ary[5][0] = "LENKO\nYakflower Path 5";
yakflowerPath_map_ary[5][1] = 66;
yakflowerPath_map_ary[5][2] = 12;
yakflowerPath_map_ary[6][0] = "LENKO\nYakflower Path 6";
yakflowerPath_map_ary[6][1] = 66;
yakflowerPath_map_ary[6][2] = 12;

//Lake Path Map
lakePath_map_ary[0][0] = "LENKO\nLake Path 1";
lakePath_map_ary[0][1] = 27;
lakePath_map_ary[0][2] = 15;
lakePath_map_ary[1][0] = "LENKO\nLake Path 2";
lakePath_map_ary[1][1] = 17;
lakePath_map_ary[1][2] = 12;
lakePath_map_ary[2][0] = "LENKO\nLake Path 3";
lakePath_map_ary[2][1] = 17;
lakePath_map_ary[2][2] = 20;
lakePath_map_ary[3][0] = "LENKO\nLake Path 4";
lakePath_map_ary[3][1] = 17;
lakePath_map_ary[3][2] = 27;
lakePath_map_ary[4][0] = "LENKO\nLake Path 5";
lakePath_map_ary[4][1] = 21;
lakePath_map_ary[4][2] = 35;
lakePath_map_ary[5][0] = "LENKO\nLake Path 6";
lakePath_map_ary[5][1] = 31;
lakePath_map_ary[5][2] = 35;
lakePath_map_ary[6][0] = "LENKO\nLake Path 7";
lakePath_map_ary[6][1] = 27;
lakePath_map_ary[6][2] = 42;
lakePath_map_ary[7][0] = "LENKO\nLake Path 8";
lakePath_map_ary[7][1] = 28;
lakePath_map_ary[7][2] = 25;
lakePath_map_ary[8][0] = "LENKO\nLake Path 9";
lakePath_map_ary[8][1] = 10;
lakePath_map_ary[8][2] = 22;
lakePath_map_ary[9][0] = "LENKO\nLake Path 10";
lakePath_map_ary[9][1] = 10;
lakePath_map_ary[9][2] = 27;
lakePath_map_ary[10][0] = "LENKO\nLake Path 11";
lakePath_map_ary[10][1] = 38;
lakePath_map_ary[10][2] = 12;
lakePath_map_ary[11][0] = "LENKO\nLake Path 12";
lakePath_map_ary[11][1] = 41;
lakePath_map_ary[11][2] = 20;
lakePath_map_ary[12][0] = "LENKO\nLake Path 13";
lakePath_map_ary[12][1] = 38;
lakePath_map_ary[12][2] = 27;

//Habraf Lake Map
habrafLake_map_ary[0][0] = "LENKO\nHabraf Lake Camp";
habrafLake_map_ary[0][1] = 17;
habrafLake_map_ary[0][2] = 42;
habrafLake_map_ary[1][0] = "LENKO\nLair: Habraf Lake 1";
habrafLake_map_ary[1][1] = 17;
habrafLake_map_ary[1][2] = 42;
habrafLake_map_ary[2][0] = "LENKO\nLair: Habraf Lake 2";
habrafLake_map_ary[2][1] = 17;
habrafLake_map_ary[2][2] = 42;
habrafLake_map_ary[3][0] = "LENKO\nLair: Habraf Lake 3";
habrafLake_map_ary[3][1] = 17;
habrafLake_map_ary[3][2] = 42;
habrafLake_map_ary[4][0] = "LENKO\nLair: Habraf Lake 4";
habrafLake_map_ary[4][1] = 17;
habrafLake_map_ary[4][2] = 42;
habrafLake_map_ary[5][0] = "LENKO\nLair: Habraf Lake 5";
habrafLake_map_ary[5][1] = 17;
habrafLake_map_ary[5][2] = 42;
habrafLake_map_ary[6][0] = "LENKO\nLair: Habraf Lake 6";
habrafLake_map_ary[6][1] = 17;
habrafLake_map_ary[6][2] = 42;
habrafLake_map_ary[7][0] = "LENKO\nLair: Habraf Lake 7";
habrafLake_map_ary[7][1] = 17;
habrafLake_map_ary[7][2] = 42;

//Greyrock Map
greyrock_map_ary[0][0] = "LENKO\nGreyrock 1";
greyrock_map_ary[0][1] = 63;
greyrock_map_ary[0][2] = 27;
greyrock_map_ary[1][0] = "LENKO\nGreyrock 2";
greyrock_map_ary[1][1] = 63;
greyrock_map_ary[1][2] = 35;
greyrock_map_ary[2][0] = "LENKO\nGreyrock 3";
greyrock_map_ary[2][1] = 56;
greyrock_map_ary[2][2] = 42;
greyrock_map_ary[3][0] = "LENKO\nGreyrock 4";
greyrock_map_ary[3][1] = 41;
greyrock_map_ary[3][2] = 40;
greyrock_map_ary[4][0] = "LENKO\nGreyrock 5";
greyrock_map_ary[4][1] = 52;
greyrock_map_ary[4][2] = 37;
greyrock_map_ary[5][0] = "LENKO\nGreyrock 6";
greyrock_map_ary[5][1] = 52;
greyrock_map_ary[5][2] = 32;
greyrock_map_ary[6][0] = "LENKO\nGreyrock 7";
greyrock_map_ary[6][1] = 38;
greyrock_map_ary[6][2] = 32;
greyrock_map_ary[7][0] = "LENKO\nGreyrock 8";
greyrock_map_ary[7][1] = 45;
greyrock_map_ary[7][2] = 32;
greyrock_map_ary[8][0] = "LENKO\nGreyrock 9";
greyrock_map_ary[8][1] = 59;
greyrock_map_ary[8][2] = 47;
greyrock_map_ary[9][1] = "LENKO\Greyrock 10";
greyrock_map_ary[9][1] = 73;
greyrock_map_ary[9][2] = 27;
greyrock_map_ary[10][0] = "LENKO\Greyrock 11";
greyrock_map_ary[10][1] = 73;
greyrock_map_ary[10][2] = 32;
greyrock_map_ary[11][0] = "LENKO\Greyrock 12";
greyrock_map_ary[11][1] = 80;
greyrock_map_ary[11][2] = 32;

//Beaowire Fortress Map
beaowireFortress_map_ary[0][0] = "LENKO\nFortress Camp";
beaowireFortress_map_ary[0][1] = 66;
beaowireFortress_map_ary[0][2] = 42;
beaowireFortress_map_ary[1][0] = "LENKO\nBeaowire Fortress 1";
beaowireFortress_map_ary[1][1] = 66;
beaowireFortress_map_ary[1][2] = 42;
beaowireFortress_map_ary[2][0] = "LENKO\nBeaowire Fortress 2";
beaowireFortress_map_ary[2][1] = 66;
beaowireFortress_map_ary[2][2] = 42;
beaowireFortress_map_ary[3][0] = "LENKO\nBeaowire Fortress 3";
beaowireFortress_map_ary[3][1] = 66;
beaowireFortress_map_ary[3][2] = 42;
beaowireFortress_map_ary[4][0] = "LENKO\nBeaowire Fortress 4";
beaowireFortress_map_ary[4][1] = 66;
beaowireFortress_map_ary[4][2] = 42;
beaowireFortress_map_ary[5][0] = "LENKO\nBeaowire Fortress 5";
beaowireFortress_map_ary[5][1] = 66;
beaowireFortress_map_ary[5][2] = 42;
beaowireFortress_map_ary[6][0] = "LENKO\nBeaowire Fortress 6";
beaowireFortress_map_ary[6][1] = 66;
beaowireFortress_map_ary[6][2] = 42;
beaowireFortress_map_ary[7][0] = "LENKO\nBeaowire Fortress 7";
beaowireFortress_map_ary[7][1] = 66;
beaowireFortress_map_ary[7][2] = 42;
}
//
//
//
//
//
//Room Enemies
function RoomEnemies(){
room_enemy_grid = ds_grid_create(45,20);

for (var i = 0; i < 45; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		room_enemy_grid[# i, j] = false;
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
for (var i = 0; i < 45; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.room_enemy_grid[# i, j] = false;
	}
}

}