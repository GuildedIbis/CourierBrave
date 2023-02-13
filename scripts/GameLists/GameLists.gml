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
crullS_list = array_create(50,false);
crullM_list = array_create(50,false);

//Sun Locations
//0: Lake Path 1
//1: Greyrock 1
//2: Greyrock 7

//Moon Locations
//0: Farway Road 2
//1: Greyrock 4
//0: Lake Path 3
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


roomName_ary[0] = "LENKO\nTutorial";
roomName_ary[1] = "LENKO\nFarway Camp";
roomName_ary[2] = "LENKO\nKovalad's Smithy";
roomName_ary[3] = "LENKO\nFarway Road 1";
roomName_ary[4] = "LENKO\nFarway Road 2";
roomName_ary[5] = "LENKO\nFarway Road 3";
roomName_ary[6] = "LENKO\nFarway Road 4";
roomName_ary[7] = "LENKO\nFarway Road 5";
roomName_ary[8] = "LENKO\nFarway Road 6";
roomName_ary[9] = "LENKO\nFarway Road 7";
roomName_ary[10] = "LENKO\nFarway Road 8";
roomName_ary[11] = "LENKO\nFarway Road 9";
roomName_ary[12] = "LENKO\nYakflower Camp";
roomName_ary[13] = "LENKO\nLair: Yakflower Path";
roomName_ary[14] = "LENKO\nLake Path 1";
roomName_ary[15] = "LENKO\nLake Path 2";
roomName_ary[16] = "LENKO\nLake Path 3";
roomName_ary[17] = "LENKO\nLake Path 4";
roomName_ary[18] = "LENKO\nLake Path 5";
roomName_ary[19] = "LENKO\nLake Path 6";
roomName_ary[20] = "LENKO\nLake Path 7";
roomName_ary[21] = "LENKO\nLake Path 8";
roomName_ary[22] = "LENKO\nLake Path 9";
roomName_ary[23] = "LENKO\nLake Path 10";
roomName_ary[24] = "LENKO\nHabraf Lake Camp";
roomName_ary[25] = "LENKO\nLair: Habraf Lake";
roomName_ary[26] = "LENKO\nGreyrock 1";
roomName_ary[27] = "LENKO\nGreyrock 2";
roomName_ary[28] = "LENKO\nGreyrock 3";
roomName_ary[29] = "LENKO\nGreyrock 4";
roomName_ary[30] = "LENKO\nGreyrock 5";
roomName_ary[31] = "LENKO\nGreyrock 6";
roomName_ary[32] = "LENKO\nGreyrock 7";
roomName_ary[33] = "LENKO\nGreyrock 8";
roomName_ary[34] = "LENKO\nFortress Camp";
roomName_ary[35] = "LENKO\nEkthalem's Fortress";
roomName_ary[36] = "LENKO\n";
roomName_ary[37] = "LENKO\n";
roomName_ary[38] = "LENKO\n";
roomName_ary[39] = "LENKO\n";
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
for (var i = 0; i < 45; i = i + 1)
{
	for (var j = 0; j < 20; j = j + 1)
	{
		obj_game.room_enemy_grid[# i, j] = false;
	}
}

}