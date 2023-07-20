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
//Star Orb and Crull Flower Lists
function StarOrbList(){
starOrb_list = array_create(72,false);
//starOrb_list[0] = true;
//crullUpgrade_list = array_create(5,false);
//crullUpgrade_list[0] = true;

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
level_name = array_create(100,-1);
farwayRoad_map_ary = array_create(20,-1);
yakflowerPath_map_ary = array_create(20,-1);
//lakePath_map_ary = array_create(13,-1);
habrafLake_map_ary = array_create(20,-1);
//greyrock_map_ary = array_create(12,-1);
beaowireFortress_map_ary = array_create(20,-1);
northerPass_map_ary = array_create(20,-1);
room_ary = farwayRoad_map_ary;
//name
//x spawn
//y spawn
//discoverd

//Levels Unlocked
level_ary[0] = true;
level_ary[1] = false;
level_ary[2] = false;
level_ary[3] = false;
level_ary[4] = false;
level_ary[5] = false;
level_ary[6] = false;
level_ary[7] = false;

//Levels Name
level_name[0] = "Farway Road";
level_name[1] = "Yakflower Path";
level_name[2] = "Habraf Lake";
level_name[3] = "Beaowire Fortress";
level_name[4] = "Northern Pass";
level_name[5] = "?";
level_name[6] = "?";
level_name[7] = "?";


camp_grid[# 0, 0] = "Farway Road 00"
camp_grid[# 0, 1] = 88;
camp_grid[# 0, 2] = 90;
camp_grid[# 0, 3] = true;
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
camp_grid[# 4, 1] = 186;
camp_grid[# 4, 2] = 84;
camp_grid[# 4, 3] = false;
camp_grid[# 5, 0] = "Yakflower Path 00"
camp_grid[# 5, 1] = 160;
camp_grid[# 5, 2] = 112;
camp_grid[# 5, 3] = false;
camp_grid[# 6, 0] = "Yakflower Path 04"
camp_grid[# 6, 1] = 112;
camp_grid[# 6, 2] = 104;
camp_grid[# 6, 3] = false;
camp_grid[# 7, 0] = "Yakflower Path 06"
camp_grid[# 7, 1] = 160;
camp_grid[# 7, 2] = 96;
camp_grid[# 7, 3] = false;
camp_grid[# 8, 0] = "Yakflower Path 09"
camp_grid[# 8, 1] = 168;
camp_grid[# 8, 2] = 80;
camp_grid[# 8, 3] = false;
camp_grid[# 9, 0] = "Yakflower Path 13"
camp_grid[# 9, 1] = 178;
camp_grid[# 9, 2] = 80;
camp_grid[# 9, 3] = false;
camp_grid[# 10, 0] = "Habraf Lake 00"
camp_grid[# 10, 1] = 88;
camp_grid[# 10, 2] = 90;
camp_grid[# 10, 3] = false;
camp_grid[# 11, 0] = "Habraf Lake 04"
camp_grid[# 11, 1] = 168;
camp_grid[# 11, 2] = 112;
camp_grid[# 11, 3] = false;
camp_grid[# 12, 0] = "Habraf Lake 06"
camp_grid[# 12, 1] = 128;
camp_grid[# 12, 2] = 88;
camp_grid[# 12, 3] = false;
camp_grid[# 13, 0] = "Habraf Lake 9"
camp_grid[# 13, 1] = 184;
camp_grid[# 13, 2] = 112;
camp_grid[# 13, 3] = false;
camp_grid[# 14, 0] = "Habraf Lake 13"
camp_grid[# 14, 1] = 160;
camp_grid[# 14, 2] = 136;
camp_grid[# 14, 3] = false;
camp_grid[# 15, 0] = "Beaowire Fortress 00"
camp_grid[# 15, 1] = 160;
camp_grid[# 15, 2] = 112;
camp_grid[# 15, 3] = false;
camp_grid[# 16, 0] = "Beaowire Fortress 04"
camp_grid[# 16, 1] = 112;
camp_grid[# 16, 2] = 104;
camp_grid[# 16, 3] = false;
camp_grid[# 17, 0] = "Beaowire Fortress 07"
camp_grid[# 17, 1] = 160;
camp_grid[# 17, 2] = 96;
camp_grid[# 17, 3] = false;
camp_grid[# 18, 0] = "Beaowire Fortress 10"
camp_grid[# 18, 1] = 168;
camp_grid[# 18, 2] = 80;
camp_grid[# 18, 3] = false;
camp_grid[# 19, 0] = "Beaowire Fortress 12"
camp_grid[# 19, 1] = 160;
camp_grid[# 19, 2] = 96;
camp_grid[# 19, 3] = false;
camp_grid[# 20, 0] = "Norther Pass 00"
camp_grid[# 20, 1] = 160;
camp_grid[# 20, 2] = 80;
camp_grid[# 20, 3] = false;
camp_grid[# 21, 0] = "Norther Pass 04"
camp_grid[# 21, 1] = 168;
camp_grid[# 21, 2] = 112;
camp_grid[# 21, 3] = false;
camp_grid[# 22, 0] = "Norther Pass 06"
camp_grid[# 22, 1] = 128;
camp_grid[# 22, 2] = 88;
camp_grid[# 22, 3] = false;
camp_grid[# 23, 0] = "Norther Pass 9"
camp_grid[# 23, 1] = 184;
camp_grid[# 23, 2] = 112;
camp_grid[# 23, 3] = false;
camp_grid[# 24, 0] = "Norther Pass 13"
camp_grid[# 24, 1] = 160;
camp_grid[# 24, 2] = 136;
camp_grid[# 24, 3] = false;
camp_grid[# 25, 0] = "? 00"
camp_grid[# 25, 1] = 160;
camp_grid[# 25, 2] = 112;
camp_grid[# 25, 3] = false;
camp_grid[# 26, 0] = "? 04"
camp_grid[# 26, 1] = 112;
camp_grid[# 26, 2] = 104;
camp_grid[# 26, 3] = false;
camp_grid[# 27, 0] = "? 07"
camp_grid[# 27, 1] = 160;
camp_grid[# 27, 2] = 96;
camp_grid[# 27, 3] = false;
camp_grid[# 28, 0] = "? 10"
camp_grid[# 28, 1] = 168;
camp_grid[# 28, 2] = 80;
camp_grid[# 28, 3] = false;
camp_grid[# 29, 0] = "? 12"
camp_grid[# 29, 1] = 160;
camp_grid[# 29, 2] = 96;
camp_grid[# 29, 3] = false;

//Room Array Column 1 Assignments
//0: Name
//1: Map X Location
//2: May Y Location
//3: Room Completion



//Farway Road Map
farwayRoad_map_ary[0][0] = "Farway Road 00";
farwayRoad_map_ary[0][1] = 16;
farwayRoad_map_ary[0][2] = 18;
farwayRoad_map_ary[0][3] = 0;
farwayRoad_map_ary[1][0] = "Farway Road 01";
farwayRoad_map_ary[1][1] = 32;
farwayRoad_map_ary[1][2] = 18;
farwayRoad_map_ary[1][3] = 0;
farwayRoad_map_ary[2][0] = "Farway Road 02";
farwayRoad_map_ary[2][1] = 32;
farwayRoad_map_ary[2][2] = 27;
farwayRoad_map_ary[2][3] = 0;
farwayRoad_map_ary[3][0] = "Farway Road 03";
farwayRoad_map_ary[3][1] = 16;
farwayRoad_map_ary[3][2] = 36;
farwayRoad_map_ary[3][3] = 0;
farwayRoad_map_ary[4][0] = "Farway Road 04";
farwayRoad_map_ary[4][1] = 32;
farwayRoad_map_ary[4][2] = 45;
farwayRoad_map_ary[4][3] = 0;
farwayRoad_map_ary[5][0] = "Farway Road 05";
farwayRoad_map_ary[5][1] = 48;
farwayRoad_map_ary[5][2] = 45;
farwayRoad_map_ary[5][3] = 0;
farwayRoad_map_ary[6][0] = "Farway Road 06";
farwayRoad_map_ary[6][1] = 64;
farwayRoad_map_ary[6][2] = 36;
farwayRoad_map_ary[6][3] = 0;
farwayRoad_map_ary[7][0] = "Farway Road 07";
farwayRoad_map_ary[7][1] = 112;
farwayRoad_map_ary[7][2] = 45;
farwayRoad_map_ary[7][3] = 0;
farwayRoad_map_ary[8][0] = "Farway Road 08";
farwayRoad_map_ary[8][1] = 128;
farwayRoad_map_ary[8][2] = 45;
farwayRoad_map_ary[8][3] = 0;
farwayRoad_map_ary[9][0] = "Farway Road 09";
farwayRoad_map_ary[9][1] = 128;
farwayRoad_map_ary[9][2] = 54;
farwayRoad_map_ary[9][3] = 0;
farwayRoad_map_ary[10][0] = "Farway Road 10";
farwayRoad_map_ary[10][1] = 80;
farwayRoad_map_ary[10][2] = 27;
farwayRoad_map_ary[10][3] = 0;
farwayRoad_map_ary[11][0] = "Farway Road 11";
farwayRoad_map_ary[11][1] = 64;
farwayRoad_map_ary[11][2] = 9;
farwayRoad_map_ary[11][3] = 0;
farwayRoad_map_ary[12][0] = "Farway Road 12";
farwayRoad_map_ary[12][1] = 96;
farwayRoad_map_ary[12][2] = 9;
farwayRoad_map_ary[12][3] = 9;
farwayRoad_map_ary[13][0] = "Farway Road 13";
farwayRoad_map_ary[13][1] = 112;
farwayRoad_map_ary[13][2] = 9;
farwayRoad_map_ary[13][3] = 9;
farwayRoad_map_ary[14][0] = "Farway Road 14";
farwayRoad_map_ary[14][1] = 80;
farwayRoad_map_ary[14][2] = 63;
farwayRoad_map_ary[14][3] = 0;
farwayRoad_map_ary[15][0] = "Farway Road 15";
farwayRoad_map_ary[15][1] = 96;
farwayRoad_map_ary[15][2] = 63;
farwayRoad_map_ary[15][3] = 0;
farwayRoad_map_ary[16][0] = "Farway Road 16";
farwayRoad_map_ary[16][1] = 64;
farwayRoad_map_ary[16][2] = 63;
farwayRoad_map_ary[16][3] = 0;
farwayRoad_map_ary[17][0] = "Farway Road 17";
farwayRoad_map_ary[17][1] = 112;
farwayRoad_map_ary[17][2] = 45;
farwayRoad_map_ary[17][3] = 0;
farwayRoad_map_ary[18][0] = "Farway Road 18";
farwayRoad_map_ary[18][1] = 128;
farwayRoad_map_ary[18][2] = 45;
farwayRoad_map_ary[18][3] = 0;
farwayRoad_map_ary[19][0] = "Farway Road 19";
farwayRoad_map_ary[19][1] = 112;
farwayRoad_map_ary[19][2] = 54;
farwayRoad_map_ary[19][3] = 0;

//Yakflower Path Map
yakflowerPath_map_ary[0][0] = "Yakflower Path 00";
yakflowerPath_map_ary[0][1] = 32;
yakflowerPath_map_ary[0][2] = 9;
yakflowerPath_map_ary[0][3] = 0;
yakflowerPath_map_ary[1][0] = "Yakflower Path 01";
yakflowerPath_map_ary[1][1] = 32;
yakflowerPath_map_ary[1][2] = 18;
yakflowerPath_map_ary[1][3] = 0;
yakflowerPath_map_ary[2][0] = "Yakflower Path 02";
yakflowerPath_map_ary[2][1] = 48;
yakflowerPath_map_ary[2][2] = 9;
yakflowerPath_map_ary[2][3] = 0;
yakflowerPath_map_ary[3][0] = "Yakflower Path 03";
yakflowerPath_map_ary[3][1] = 64;
yakflowerPath_map_ary[3][2] = 27;
yakflowerPath_map_ary[3][3] = 0;
yakflowerPath_map_ary[4][0] = "Yakflower Path 04";
yakflowerPath_map_ary[4][1] = 48;
yakflowerPath_map_ary[4][2] = 27;
yakflowerPath_map_ary[4][3] = 0;
yakflowerPath_map_ary[5][0] = "Yakflower Path 05";
yakflowerPath_map_ary[5][1] = 48;
yakflowerPath_map_ary[5][2] = 36;
yakflowerPath_map_ary[5][3] = 0;
yakflowerPath_map_ary[6][0] = "Yakflower Path 06";
yakflowerPath_map_ary[6][1] = 32;
yakflowerPath_map_ary[6][2] = 54;
yakflowerPath_map_ary[6][3] = 0;
yakflowerPath_map_ary[7][0] = "Yakflower Path 07";
yakflowerPath_map_ary[7][1] = 32;
yakflowerPath_map_ary[7][2] = 63;
yakflowerPath_map_ary[7][3] = 0;
yakflowerPath_map_ary[8][0] = "Yakflower Path 08";
yakflowerPath_map_ary[8][1] = 32;
yakflowerPath_map_ary[8][2] = 72;
yakflowerPath_map_ary[8][3] = 0;
yakflowerPath_map_ary[9][0] = "Yakflower Path 09";
yakflowerPath_map_ary[9][1] = 80;
yakflowerPath_map_ary[9][2] = 63;
yakflowerPath_map_ary[9][3] = 0;
yakflowerPath_map_ary[10][0] = "Yakflower Path 10";
yakflowerPath_map_ary[10][1] = 96;
yakflowerPath_map_ary[10][2] = 54;
yakflowerPath_map_ary[10][3] = 0;
yakflowerPath_map_ary[11][0] = "Yakflower Path 11";
yakflowerPath_map_ary[11][1] = 128;
yakflowerPath_map_ary[11][2] = 63;
yakflowerPath_map_ary[11][3] = 0;
yakflowerPath_map_ary[12][0] = "Yakflower Path 12";
yakflowerPath_map_ary[12][1] = 128;
yakflowerPath_map_ary[12][2] = 72;
yakflowerPath_map_ary[12][3] = 0;
yakflowerPath_map_ary[13][0] = "Yakflower Path 13";
yakflowerPath_map_ary[13][1] = 96;
yakflowerPath_map_ary[13][2] = 36;
yakflowerPath_map_ary[13][3] = 0;
yakflowerPath_map_ary[14][0] = "Yakflower Path 14";
yakflowerPath_map_ary[14][1] = 84;
yakflowerPath_map_ary[14][2] = 37;
yakflowerPath_map_ary[14][3] = 0;
yakflowerPath_map_ary[15][0] = "Yakflower Path 15";
yakflowerPath_map_ary[15][1] = 73;
yakflowerPath_map_ary[15][2] = 17;
yakflowerPath_map_ary[15][3] = 0;
yakflowerPath_map_ary[16][0] = "Yakflower Path 16";
yakflowerPath_map_ary[16][1] = 80;
yakflowerPath_map_ary[16][2] = 20;
yakflowerPath_map_ary[16][3] = 0;
yakflowerPath_map_ary[17][0] = "Yakflower Path 17";
yakflowerPath_map_ary[17][1] = 80;
yakflowerPath_map_ary[17][2] = 20;
yakflowerPath_map_ary[17][3] = 0;
yakflowerPath_map_ary[18][0] = "Yakflower Path 18";
yakflowerPath_map_ary[18][1] = 80;
yakflowerPath_map_ary[18][2] = 27;
yakflowerPath_map_ary[18][3] = 0;
yakflowerPath_map_ary[19][0] = "Yakflower Path 19";
yakflowerPath_map_ary[19][1] = 32;
yakflowerPath_map_ary[19][2] = 72;
yakflowerPath_map_ary[19][3] = 0;

//Habraf Lake Map
habrafLake_map_ary[0][0] = "Habraf Lake 00";
habrafLake_map_ary[0][1] = 112;
habrafLake_map_ary[0][2] = 9;
habrafLake_map_ary[0][3] = 0;
habrafLake_map_ary[1][0] = "Habraf Lake 01";
habrafLake_map_ary[1][1] = 112;
habrafLake_map_ary[1][2] = 18;
habrafLake_map_ary[1][3] = 0;
habrafLake_map_ary[2][0] = "Habraf Lake 02";
habrafLake_map_ary[2][1] = 96;
habrafLake_map_ary[2][2] = 27;
habrafLake_map_ary[2][3] = 0;
habrafLake_map_ary[3][0] = "Habraf Lake 03";
habrafLake_map_ary[3][1] = 96;
habrafLake_map_ary[3][2] = 18;
habrafLake_map_ary[3][3] = 0;
habrafLake_map_ary[4][0] = "Habraf Lake 04";
habrafLake_map_ary[4][1] = 80;
habrafLake_map_ary[4][2] = 18;
habrafLake_map_ary[4][3] = 0;
habrafLake_map_ary[5][0] = "Habraf Lake 05";
habrafLake_map_ary[5][1] = 48;
habrafLake_map_ary[5][2] = 27;
habrafLake_map_ary[5][3] = 0;
habrafLake_map_ary[6][0] = "Habraf Lake 06";
habrafLake_map_ary[6][1] = 32;
habrafLake_map_ary[6][2] = 27;
habrafLake_map_ary[6][3] = 0;
habrafLake_map_ary[7][0] = "Habraf Lake 07";
habrafLake_map_ary[7][1] = 16;
habrafLake_map_ary[7][2] = 27;
habrafLake_map_ary[7][3] = 0;
habrafLake_map_ary[8][0] = "Habraf Lake 08";
habrafLake_map_ary[8][1] = 16;
habrafLake_map_ary[8][2] = 36;
habrafLake_map_ary[8][3] = 0;
habrafLake_map_ary[9][0] = "Habraf Lake 09";
habrafLake_map_ary[9][1] = 96;
habrafLake_map_ary[9][2] = 45;
habrafLake_map_ary[9][3] = 0;
habrafLake_map_ary[10][0] = "Habraf Lake 10";
habrafLake_map_ary[10][1] = 105;
habrafLake_map_ary[10][2] = 45;
habrafLake_map_ary[10][3] = 0;
habrafLake_map_ary[11][0] = "Habraf Lake 11";
habrafLake_map_ary[11][1] = 128;
habrafLake_map_ary[11][2] = 63;
habrafLake_map_ary[11][3] = 0;
habrafLake_map_ary[12][0] = "Habraf Lake 12";
habrafLake_map_ary[12][1] = 128;
habrafLake_map_ary[12][2] = 54;
habrafLake_map_ary[12][3] = 0;
habrafLake_map_ary[13][0] = "Habraf Lake 13";
habrafLake_map_ary[13][1] = 32;
habrafLake_map_ary[13][2] = 45;
habrafLake_map_ary[13][3] = 0;
habrafLake_map_ary[14][0] = "Habraf Lake 14";
habrafLake_map_ary[14][1] = 16;
habrafLake_map_ary[14][2] = 54;
habrafLake_map_ary[14][3] = 0;
habrafLake_map_ary[15][0] = "Habraf Lake 15";
habrafLake_map_ary[15][1] = 48;
habrafLake_map_ary[15][2] = 27;
habrafLake_map_ary[15][3] = 0;
habrafLake_map_ary[16][0] = "Habraf Lake 16";
habrafLake_map_ary[16][1] = 32;
habrafLake_map_ary[16][2] = 27;
habrafLake_map_ary[16][3] = 0;
habrafLake_map_ary[17][0] = "Habraf Lake 17";
habrafLake_map_ary[17][1] = 16;
habrafLake_map_ary[17][2] = 27;
habrafLake_map_ary[17][3] = 0;
habrafLake_map_ary[18][0] = "Habraf Lake 18";
habrafLake_map_ary[18][1] = 16;
habrafLake_map_ary[18][2] = 36;
habrafLake_map_ary[18][3] = 0;
habrafLake_map_ary[19][0] = "Habraf Lake 19";
habrafLake_map_ary[19][1] = 10;
habrafLake_map_ary[19][2] = 65;
habrafLake_map_ary[19][3] = 0;



//Beaowire Fortress Map
beaowireFortress_map_ary[0][0] = "Beaowire Fortress 00";
beaowireFortress_map_ary[0][1] = 128;
beaowireFortress_map_ary[0][2] = 36;
beaowireFortress_map_ary[1][0] = "Beaowire Fortress 01";
beaowireFortress_map_ary[1][1] = 128;
beaowireFortress_map_ary[1][2] = 45;
beaowireFortress_map_ary[2][0] = "Beaowire Fortress 02";
beaowireFortress_map_ary[2][1] = 112;
beaowireFortress_map_ary[2][2] = 34;
beaowireFortress_map_ary[3][0] = "Beaowire Fortress 03";
beaowireFortress_map_ary[3][1] = 96;
beaowireFortress_map_ary[3][2] = 54;
beaowireFortress_map_ary[4][0] = "Beaowire Fortress 04";
beaowireFortress_map_ary[4][1] = 96;
beaowireFortress_map_ary[4][2] = 63;
beaowireFortress_map_ary[5][0] = "Beaowire Fortress 05";
beaowireFortress_map_ary[5][1] = 48;
beaowireFortress_map_ary[5][2] = 45;
beaowireFortress_map_ary[6][0] = "Beaowire Fortress 06";
beaowireFortress_map_ary[6][1] = 64;
beaowireFortress_map_ary[6][2] = 45;
beaowireFortress_map_ary[7][0] = "Beaowire Fortress 07";
beaowireFortress_map_ary[7][1] = 64;
beaowireFortress_map_ary[7][2] = 36;
beaowireFortress_map_ary[8][0] = "Beaowire Fortress 08";
beaowireFortress_map_ary[8][1] = 64;
beaowireFortress_map_ary[8][2] = 18;
beaowireFortress_map_ary[9][0] = "Beaowire Fortress 09";
beaowireFortress_map_ary[9][1] = 64;
beaowireFortress_map_ary[9][2] = 9;
beaowireFortress_map_ary[10][0] = "Beaowire Fortress 10";
beaowireFortress_map_ary[10][1] = 32;
beaowireFortress_map_ary[10][2] = 54;
beaowireFortress_map_ary[11][0] = "Beaowire Fortress 11";
beaowireFortress_map_ary[11][1] = 16;
beaowireFortress_map_ary[11][2] = 36;
beaowireFortress_map_ary[12][0] = "Beaowire Fortress 12";
beaowireFortress_map_ary[12][1] = 16;
beaowireFortress_map_ary[12][2] = 27;
beaowireFortress_map_ary[13][0] = "Beaowire Fortress 13";
beaowireFortress_map_ary[13][1] = 32;
beaowireFortress_map_ary[13][2] = 27;
beaowireFortress_map_ary[14][0] = "Beaowire Fortress 14";
beaowireFortress_map_ary[14][1] = 80;
beaowireFortress_map_ary[14][2] = 36;
beaowireFortress_map_ary[15][0] = "Beaowire Fortress 15";
beaowireFortress_map_ary[15][1] = 80;
beaowireFortress_map_ary[15][2] = 18;



//Norther Pass Map
northernPass_map_ary[0][0] = "Northern Pass 00";
northernPass_map_ary[0][1] = 16;
northernPass_map_ary[0][2] = 72;
northernPass_map_ary[1][0] = "Northern Pass 01";
northernPass_map_ary[1][1] = 66;
northernPass_map_ary[1][2] = 57;
northernPass_map_ary[2][0] = "Northern Pass 02";
northernPass_map_ary[2][1] = 66;
northernPass_map_ary[2][2] = 65;
northernPass_map_ary[3][0] = "Northern Pass 03";
northernPass_map_ary[3][1] = 59;
northernPass_map_ary[3][2] = 70;
northernPass_map_ary[4][0] = "Northern Pass 04";
northernPass_map_ary[4][1] = 66;
northernPass_map_ary[4][2] = 72;
northernPass_map_ary[5][0] = "Northern Pass 05";
northernPass_map_ary[5][1] = 72;
northernPass_map_ary[5][2] = 77;
northernPass_map_ary[6][0] = "Northern Pass 06";
northernPass_map_ary[6][1] = 66;
northernPass_map_ary[6][2] = 42;
northernPass_map_ary[7][0] = "Northern Pass 07";
northernPass_map_ary[7][1] = 66;
northernPass_map_ary[7][2] = 42;
northernPass_map_ary[8][0] = "Northern Pass 08";
northernPass_map_ary[8][1] = 66;
northernPass_map_ary[8][2] = 42;
northernPass_map_ary[9][0] = "Northern Pass 09";
northernPass_map_ary[9][1] = 66;
northernPass_map_ary[9][2] = 42;
}
//
//
//
//
//
//Room Enemies
function RoomEnemies(){
//The X value represents the room, the y value represents the individual enemy.
//Enemies have their "activate_args" set to a number that is unique the them within the room.
//So if I want to have more than 30 enemies in a room, increase y value.
farwayRoad_enemy_grid = ds_grid_create(20,30);
yakflowerPath_enemy_grid = ds_grid_create(20,30);
lakePath_enemy_grid = ds_grid_create(20,30);
habrafLake_enemy_grid = ds_grid_create(20,30);
greyrock_enemy_grid = ds_grid_create(20,30);
beaowireFortress_enemy_grid = ds_grid_create(20,30);
northernPass_enemy_grid = ds_grid_create(20,30);
room_enemy_grid = farwayRoad_enemy_grid;

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
function RoomEnemiesReset(){
global.aggroCounter = 0;
global.bossCounter = 0;
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
		obj_game.northernPass_enemy_grid[# i, j] = false;
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