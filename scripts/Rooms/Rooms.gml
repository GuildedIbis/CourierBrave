//Rooms
//
//
//
//
//
//Create Levels  | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_levels_create(){
level_ary = array_create(100,-1);
level_name = array_create(100,-1);

//name


//Levels Unlocked
level_ary[0] = false;
level_ary[1] = false;
level_ary[2] = false;
level_ary[3] = false;
level_ary[4] = false;
level_ary[5] = false;
level_ary[6] = false;
level_ary[7] = false;
level_ary[8] = false;
level_ary[9] = false;

//Levels Name
level_name[0] = "Vostle Town";
level_name[1] = "Farway Road";
level_name[2] = "Yakflower Path";
level_name[3] = "Habraf Lake";
level_name[4] = "Beaowire Fortress";
level_name[5] = "Beetra City";
level_name[6] = "Castle Mhere";
level_name[7] = "Northern Pass";
level_name[8] = "Emberof Forest";
level_name[9] = "Gartraks Cave";

}
//
//
//
//
//
//Create Altars | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_altars_create(){
//Create Altars

altar_grid = ds_grid_create(100,4);

//Altar Grid
//x spawn
//y spawn
//discovered (saved)
altar_grid[# 0, 0] = "Farway Road 00"
altar_grid[# 0, 1] = 224;
altar_grid[# 0, 2] = 128;
altar_grid[# 0, 3] = true;
altar_grid[# 1, 0] = "Farway Road 04"
altar_grid[# 1, 1] = 176;
altar_grid[# 1, 2] = 110;
altar_grid[# 1, 3] = false;
altar_grid[# 2, 0] = "Farway Road 06"
altar_grid[# 2, 1] = 104;
altar_grid[# 2, 2] = 90;
altar_grid[# 2, 3] = false;
altar_grid[# 3, 0] = "Farway Road 09"
altar_grid[# 3, 1] = 184;
altar_grid[# 3, 2] = 116;
altar_grid[# 3, 3] = false;
altar_grid[# 4, 0] = "Farway Road 13"
altar_grid[# 4, 1] = 150;
altar_grid[# 4, 2] = 88;
altar_grid[# 4, 3] = false;
altar_grid[# 5, 0] = "Yakflower Path 00"
altar_grid[# 5, 1] = 160;
altar_grid[# 5, 2] = 112;
altar_grid[# 5, 3] = false;
altar_grid[# 6, 0] = "Yakflower Path 04"
altar_grid[# 6, 1] = 112;
altar_grid[# 6, 2] = 104;
altar_grid[# 6, 3] = false;
altar_grid[# 7, 0] = "Yakflower Path 06"
altar_grid[# 7, 1] = 160;
altar_grid[# 7, 2] = 96;
altar_grid[# 7, 3] = false;
altar_grid[# 8, 0] = "Yakflower Path 09"
altar_grid[# 8, 1] = 168;
altar_grid[# 8, 2] = 80;
altar_grid[# 8, 3] = false;
altar_grid[# 9, 0] = "Yakflower Path 13"
altar_grid[# 9, 1] = 178;
altar_grid[# 9, 2] = 80;
altar_grid[# 9, 3] = false;
altar_grid[# 10, 0] = "Habraf Lake 00"
altar_grid[# 10, 1] = 88;
altar_grid[# 10, 2] = 90;
altar_grid[# 10, 3] = false;
altar_grid[# 11, 0] = "Habraf Lake 04"
altar_grid[# 11, 1] = 168;
altar_grid[# 11, 2] = 112;
altar_grid[# 11, 3] = false;
altar_grid[# 12, 0] = "Habraf Lake 06"
altar_grid[# 12, 1] = 128;
altar_grid[# 12, 2] = 88;
altar_grid[# 12, 3] = false;
altar_grid[# 13, 0] = "Habraf Lake 9"
altar_grid[# 13, 1] = 184;
altar_grid[# 13, 2] = 112;
altar_grid[# 13, 3] = false;
altar_grid[# 14, 0] = "Habraf Lake 13"
altar_grid[# 14, 1] = 160;
altar_grid[# 14, 2] = 136;
altar_grid[# 14, 3] = false;
altar_grid[# 15, 0] = "Beaowire Fortress 00"
altar_grid[# 15, 1] = 184;
altar_grid[# 15, 2] = 88;
altar_grid[# 15, 3] = false;
altar_grid[# 16, 0] = "Beaowire Fortress 04"
altar_grid[# 16, 1] = 196;
altar_grid[# 16, 2] = 104;
altar_grid[# 16, 3] = false;
altar_grid[# 17, 0] = "Beaowire Fortress 07"
altar_grid[# 17, 1] = 160;
altar_grid[# 17, 2] = 96;
altar_grid[# 17, 3] = false;
altar_grid[# 18, 0] = "Beaowire Fortress 10"
altar_grid[# 18, 1] = 168;
altar_grid[# 18, 2] = 80;
altar_grid[# 18, 3] = false;
altar_grid[# 19, 0] = "Beaowire Fortress 14"
altar_grid[# 19, 1] = 199;
altar_grid[# 19, 2] = 104;
altar_grid[# 19, 3] = false;
altar_grid[# 20, 0] = "Vostle Town 00"
altar_grid[# 20, 1] = 800;
altar_grid[# 20, 2] = 338;
altar_grid[# 20, 3] = false;
altar_grid[# 21, 0] = "Beetra City 00"
altar_grid[# 21, 1] = 512;
altar_grid[# 21, 2] = 232;
altar_grid[# 21, 3] = false;
altar_grid[# 22, 0] = "Castle Mhere 00"
altar_grid[# 22, 1] = 232;
altar_grid[# 22, 2] = 96;
altar_grid[# 22, 3] = false;
altar_grid[# 23, 0] = "Castle Mhere 04"
altar_grid[# 23, 1] = 184;
altar_grid[# 23, 2] = 112;
altar_grid[# 23, 3] = false;
altar_grid[# 24, 0] = "Castle Mhere 06"
altar_grid[# 24, 1] = 160;
altar_grid[# 24, 2] = 136;
altar_grid[# 24, 3] = false;
altar_grid[# 25, 0] = "Castle Mhere 09"
altar_grid[# 25, 1] = 120;
altar_grid[# 25, 2] = 112;
altar_grid[# 25, 3] = false;
altar_grid[# 26, 0] = "Castle Mhere 31"
altar_grid[# 26, 1] = 112;
altar_grid[# 26, 2] = 104;
altar_grid[# 26, 3] = false;
altar_grid[# 27, 0] = "Northern Pass 00"
altar_grid[# 27, 1] = 160;
altar_grid[# 27, 2] = 96;
altar_grid[# 27, 3] = false;
altar_grid[# 28, 0] = "Northern Pass 04"
altar_grid[# 28, 1] = 168;
altar_grid[# 28, 2] = 80;
altar_grid[# 28, 3] = false;
altar_grid[# 29, 0] = "Northern Pass 06"
altar_grid[# 29, 1] = 160;
altar_grid[# 29, 2] = 96;
altar_grid[# 29, 3] = false;
altar_grid[# 30, 0] = "Northern Pass 09"
altar_grid[# 30, 1] = 88;
altar_grid[# 30, 2] = 90;
altar_grid[# 30, 3] = true;
altar_grid[# 31, 0] = "Northern Pass 13"
altar_grid[# 31, 1] = 176;
altar_grid[# 31, 2] = 110;
altar_grid[# 31, 3] = false;
altar_grid[# 32, 0] = "700"
altar_grid[# 32, 1] = 104;
altar_grid[# 32, 2] = 90;
altar_grid[# 32, 3] = false;
altar_grid[# 33, 0] = "704"
altar_grid[# 33, 1] = 184;
altar_grid[# 33, 2] = 116;
altar_grid[# 33, 3] = false;
altar_grid[# 34, 0] = "706"
altar_grid[# 34, 1] = 150;
altar_grid[# 34, 2] = 88;
altar_grid[# 34, 3] = false;
altar_grid[# 35, 0] = "709"
altar_grid[# 35, 1] = 160;
altar_grid[# 35, 2] = 112;
altar_grid[# 35, 3] = false;
altar_grid[# 36, 0] = "713"
altar_grid[# 36, 1] = 112;
altar_grid[# 36, 2] = 104;
altar_grid[# 36, 3] = false;
altar_grid[# 37, 0] = "800"
altar_grid[# 37, 1] = 160;
altar_grid[# 37, 2] = 96;
altar_grid[# 37, 3] = false;
altar_grid[# 38, 0] = "804"
altar_grid[# 38, 1] = 168;
altar_grid[# 38, 2] = 80;
altar_grid[# 38, 3] = false;
altar_grid[# 39, 0] = "806"
altar_grid[# 39, 1] = 178;
altar_grid[# 39, 2] = 80;
altar_grid[# 39, 3] = false;

}
//
//
//
//
//
//
//Room Array Column 1 Assignments
//0: Name
//1: Map X Location
//2: May Y Location
//3: Room Completion (saved)
//
//
//
//
//
//Create Vostle Town Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_vostleTown(){
//Create Map
vostleTown_map_ary = array_create(20,-1);
//Vostle Town Detail
vostleTown_map_ary[0][0] = "Vostle Town 00";
vostleTown_map_ary[0][1] = 48;
vostleTown_map_ary[0][2] = 27;
vostleTown_map_ary[0][3] = 0;
vostleTown_map_ary[1][0] = "Vostle Town 01";
vostleTown_map_ary[1][1] = 96;
vostleTown_map_ary[1][2] = 27;
vostleTown_map_ary[1][3] = 0;
vostleTown_map_ary[2][0] = "Vostle Town 02";
vostleTown_map_ary[2][1] = 80;
vostleTown_map_ary[2][2] = 9;
vostleTown_map_ary[2][3] = 0;
vostleTown_map_ary[3][0] = "Vostle Town 03";
vostleTown_map_ary[3][1] = 32;
vostleTown_map_ary[3][2] = 27;
vostleTown_map_ary[3][3] = 0;
vostleTown_map_ary[4][0] = "Vostle Town 04";
vostleTown_map_ary[4][1] = 48;
vostleTown_map_ary[4][2] = 54;
vostleTown_map_ary[4][3] = 0;
vostleTown_map_ary[5][0] = "Vostle Town 05";
vostleTown_map_ary[5][1] = 64;
vostleTown_map_ary[5][2] = 36;
vostleTown_map_ary[5][3] = 0;
vostleTown_map_ary[6][0] = "Vostle Town 06";
vostleTown_map_ary[6][1] = 112;
vostleTown_map_ary[6][2] = 45;
vostleTown_map_ary[6][3] = 0;
vostleTown_map_ary[7][0] = "Vostle Town 07";
vostleTown_map_ary[7][1] = 128;
vostleTown_map_ary[7][2] = 45;
vostleTown_map_ary[7][3] = 0;
vostleTown_map_ary[8][0] = "Vostle Town 08";
vostleTown_map_ary[8][1] = 128;
vostleTown_map_ary[8][2] = 54;
vostleTown_map_ary[8][3] = 0;
vostleTown_map_ary[9][0] = "Vostle Town 09";
vostleTown_map_ary[9][1] = 80;
vostleTown_map_ary[9][2] = 27;
vostleTown_map_ary[9][3] = 0;
}
//
//
//
//
//
//Create Farway Road Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_farwayRoad(){
//Create Map
farwayRoad_map_ary = array_create(20,-1);
//Farway Road Details
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
farwayRoad_map_ary[3][2] = 45;
farwayRoad_map_ary[3][3] = 0;
farwayRoad_map_ary[4][0] = "Farway Road 04";
farwayRoad_map_ary[4][1] = 48;
farwayRoad_map_ary[4][2] = 45;
farwayRoad_map_ary[4][3] = 0;
farwayRoad_map_ary[5][0] = "Farway Road 05";
farwayRoad_map_ary[5][1] = 64;
farwayRoad_map_ary[5][2] = 36;
farwayRoad_map_ary[5][3] = 0;
farwayRoad_map_ary[6][0] = "Farway Road 06";
farwayRoad_map_ary[6][1] = 112;
farwayRoad_map_ary[6][2] = 45;
farwayRoad_map_ary[6][3] = 0;
farwayRoad_map_ary[7][0] = "Farway Road 07";
farwayRoad_map_ary[7][1] = 128;
farwayRoad_map_ary[7][2] = 45;
farwayRoad_map_ary[7][3] = 0;
farwayRoad_map_ary[8][0] = "Farway Road 08";
farwayRoad_map_ary[8][1] = 128;
farwayRoad_map_ary[8][2] = 54;
farwayRoad_map_ary[8][3] = 0;
farwayRoad_map_ary[9][0] = "Farway Road 09";
farwayRoad_map_ary[9][1] = 80;
farwayRoad_map_ary[9][2] = 27;
farwayRoad_map_ary[9][3] = 0;
farwayRoad_map_ary[10][0] = "Farway Road 10";
farwayRoad_map_ary[10][1] = 64;
farwayRoad_map_ary[10][2] = 9;
farwayRoad_map_ary[10][3] = 0;
farwayRoad_map_ary[11][0] = "Farway Road 11";
farwayRoad_map_ary[11][1] = 96;
farwayRoad_map_ary[11][2] = 9;
farwayRoad_map_ary[11][3] = 9;
farwayRoad_map_ary[12][0] = "Farway Road 12";
farwayRoad_map_ary[12][1] = 112;
farwayRoad_map_ary[12][2] = 9;
farwayRoad_map_ary[12][3] = 0;
farwayRoad_map_ary[13][0] = "Farway Road 13";
farwayRoad_map_ary[13][1] = 80;
farwayRoad_map_ary[13][2] = 63;
farwayRoad_map_ary[13][3] = 0;
farwayRoad_map_ary[14][0] = "Farway Road 14";
farwayRoad_map_ary[14][1] = 64;
farwayRoad_map_ary[14][2] = 63;
farwayRoad_map_ary[14][3] = 0;
}
//
//
//
//
//
//Create Yakflower Path Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_yakflowerPath(){
//Create Map
yakflowerPath_map_ary = array_create(20,-1);
//Yakflower Path Details
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
yakflowerPath_map_ary[8][1] = 48;
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
}
//
//
//
//
//
//Create Habraf Lake Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_habrafLake(){
//Create Map
habrafLake_map_ary = array_create(20,-1);
//Habraf Lake Details
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
habrafLake_map_ary[15][1] = 80;
habrafLake_map_ary[15][2] = 54;
habrafLake_map_ary[15][3] = 0;
}
//
//
//
//
//
//Create Beaowire Fortress Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_beaowireFortress(){
//Create Map
beaowireFortress_map_ary = array_create(20,-1);
//Beaowire Fortress Map
beaowireFortress_map_ary[0][0] = "Beaowire Fortress 00";
beaowireFortress_map_ary[0][1] = 128;
beaowireFortress_map_ary[0][2] = 36;
beaowireFortress_map_ary[0][3] = 0;
beaowireFortress_map_ary[1][0] = "Beaowire Fortress 01";
beaowireFortress_map_ary[1][1] = 128;
beaowireFortress_map_ary[1][2] = 45;
beaowireFortress_map_ary[1][3] = 0;
beaowireFortress_map_ary[2][0] = "Beaowire Fortress 02";
beaowireFortress_map_ary[2][1] = 112;
beaowireFortress_map_ary[2][2] = 54;
beaowireFortress_map_ary[2][3] = 0;
beaowireFortress_map_ary[3][0] = "Beaowire Fortress 03";
beaowireFortress_map_ary[3][1] = 96;
beaowireFortress_map_ary[3][2] = 54;
beaowireFortress_map_ary[3][3] = 0;
beaowireFortress_map_ary[4][0] = "Beaowire Fortress 04";
beaowireFortress_map_ary[4][1] = 96;
beaowireFortress_map_ary[4][2] = 63;
beaowireFortress_map_ary[4][2] = 0;
beaowireFortress_map_ary[5][0] = "Beaowire Fortress 05";
beaowireFortress_map_ary[5][1] = 48;
beaowireFortress_map_ary[5][2] = 45;
beaowireFortress_map_ary[5][3] = 0;
beaowireFortress_map_ary[6][0] = "Beaowire Fortress 06";
beaowireFortress_map_ary[6][1] = 64;
beaowireFortress_map_ary[6][2] = 45;
beaowireFortress_map_ary[6][3] = 0;
beaowireFortress_map_ary[7][0] = "Beaowire Fortress 07";
beaowireFortress_map_ary[7][1] = 64;
beaowireFortress_map_ary[7][2] = 36;
beaowireFortress_map_ary[7][3] = 0;
beaowireFortress_map_ary[8][0] = "Beaowire Fortress 08";
beaowireFortress_map_ary[8][1] = 64;
beaowireFortress_map_ary[8][2] = 18;
beaowireFortress_map_ary[8][3] = 0;
beaowireFortress_map_ary[9][0] = "Beaowire Fortress 09";
beaowireFortress_map_ary[9][1] = 64;
beaowireFortress_map_ary[9][2] = 9;
beaowireFortress_map_ary[9][3] = 0;
beaowireFortress_map_ary[10][0] = "Beaowire Fortress 10";
beaowireFortress_map_ary[10][1] = 32;
beaowireFortress_map_ary[10][2] = 54;
beaowireFortress_map_ary[10][3] = 0;
beaowireFortress_map_ary[11][0] = "Beaowire Fortress 11";
beaowireFortress_map_ary[11][1] = 16;
beaowireFortress_map_ary[11][2] = 36;
beaowireFortress_map_ary[11][3] = 0;
beaowireFortress_map_ary[12][0] = "Beaowire Fortress 12";
beaowireFortress_map_ary[12][1] = 16;
beaowireFortress_map_ary[12][2] = 27;
beaowireFortress_map_ary[12][3] = 0;
beaowireFortress_map_ary[13][0] = "Beaowire Fortress 13";
beaowireFortress_map_ary[13][1] = 32;
beaowireFortress_map_ary[13][2] = 27;
beaowireFortress_map_ary[13][3] = 0;
beaowireFortress_map_ary[14][0] = "Beaowire Fortress 14";
beaowireFortress_map_ary[14][1] = 80;
beaowireFortress_map_ary[14][2] = 36;
beaowireFortress_map_ary[14][3] = 0;
beaowireFortress_map_ary[15][0] = "Beaowire Fortress 15";
beaowireFortress_map_ary[15][1] = 80;
beaowireFortress_map_ary[15][2] = 18;
beaowireFortress_map_ary[15][3] = 0;
}
//
//
//
//
//
//Create Beetra City Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_beetraCity(){
beetraCity_map_ary = array_create(20,-1);

//Beetra City Map
beetraCity_map_ary[0][0] = "Beetra City 00";
beetraCity_map_ary[0][1] = 16;
beetraCity_map_ary[0][2] = 72;
beetraCity_map_ary[1][0] = "Beetra City 01";
beetraCity_map_ary[1][1] = 16;
beetraCity_map_ary[1][2] = 63;
beetraCity_map_ary[2][0] = "Beetra City 02";
beetraCity_map_ary[2][1] = 16;
beetraCity_map_ary[2][2] = 45;
beetraCity_map_ary[3][0] = "Beetra City 03";
beetraCity_map_ary[3][1] = 32;
beetraCity_map_ary[3][2] = 36;
beetraCity_map_ary[4][0] = "Beetra City 04";
beetraCity_map_ary[4][1] = 48;
beetraCity_map_ary[4][2] = 46;
beetraCity_map_ary[5][0] = "Beetra City 05";
beetraCity_map_ary[5][1] = 72;
beetraCity_map_ary[5][2] = 77;
beetraCity_map_ary[6][0] = "Beetra City 06";
beetraCity_map_ary[6][1] = 66;
beetraCity_map_ary[6][2] = 42;
beetraCity_map_ary[7][0] = "Beetra City 07";
beetraCity_map_ary[7][1] = 66;
beetraCity_map_ary[7][2] = 42;
beetraCity_map_ary[8][0] = "Beetra City 08";
beetraCity_map_ary[8][1] = 66;
beetraCity_map_ary[8][2] = 42;
beetraCity_map_ary[9][0] = "Beetra City 09";
beetraCity_map_ary[9][1] = 66;
beetraCity_map_ary[9][2] = 42;
beetraCity_map_ary[10][0] = "Beetra City 10";
beetraCity_map_ary[10][1] = 16;
beetraCity_map_ary[10][2] = 72;
beetraCity_map_ary[11][0] = "Beetra City 11";
beetraCity_map_ary[11][1] = 16;
beetraCity_map_ary[11][2] = 63;
beetraCity_map_ary[12][0] = "Beetra City 12";
beetraCity_map_ary[12][1] = 16;
beetraCity_map_ary[12][2] = 45;
beetraCity_map_ary[13][0] = "Beetra City 13";
beetraCity_map_ary[13][1] = 32;
beetraCity_map_ary[13][2] = 36;
beetraCity_map_ary[14][0] = "Beetra City 14";
beetraCity_map_ary[14][1] = 48;
beetraCity_map_ary[14][2] = 46;
beetraCity_map_ary[15][0] = "Beetra City 15";
beetraCity_map_ary[15][1] = 72;
beetraCity_map_ary[15][2] = 77;
beetraCity_map_ary[16][0] = "Beetra City 16";
beetraCity_map_ary[16][1] = 66;
beetraCity_map_ary[16][2] = 42;
beetraCity_map_ary[17][0] = "Beetra City 17";
beetraCity_map_ary[17][1] = 66;
beetraCity_map_ary[17][2] = 42;
beetraCity_map_ary[18][0] = "Beetra City 18";
beetraCity_map_ary[18][1] = 66;
beetraCity_map_ary[18][2] = 42;
beetraCity_map_ary[19][0] = "Beetra City 19";
beetraCity_map_ary[19][1] = 66;
beetraCity_map_ary[19][2] = 42;
}
//
//
//
//
//
//Create Castle Mhere Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_castleMhere(){
//Room Array Column 1 Assignments
//0: Name
//1: Map X Location
//2: May Y Location
//3: Room Completion (saved)
}
//
//
//
//
//
//Create Northern Pass Map | obj_inventory | Create Event | scr_inventory_rooms_create
function scr_room_create_northernPass(){
//Create Map
northerPass_map_ary = array_create(20,-1);
//Norther Pass Details
northernPass_map_ary[0][0] = "Northern Pass 00";
northernPass_map_ary[0][1] = 16;
northernPass_map_ary[0][2] = 72;
northernPass_map_ary[1][0] = "Northern Pass 01";
northernPass_map_ary[1][1] = 16;
northernPass_map_ary[1][2] = 63;
northernPass_map_ary[2][0] = "Northern Pass 02";
northernPass_map_ary[2][1] = 16;
northernPass_map_ary[2][2] = 45;
northernPass_map_ary[3][0] = "Northern Pass 03";
northernPass_map_ary[3][1] = 32;
northernPass_map_ary[3][2] = 36;
northernPass_map_ary[4][0] = "Northern Pass 04";
northernPass_map_ary[4][1] = 48;
northernPass_map_ary[4][2] = 46;
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
northernPass_map_ary[10][0] = "Northern Pass 10";
northernPass_map_ary[10][1] = 16;
northernPass_map_ary[10][2] = 72;
northernPass_map_ary[11][0] = "Northern Pass 11";
northernPass_map_ary[11][1] = 16;
northernPass_map_ary[11][2] = 63;
northernPass_map_ary[12][0] = "Northern Pass 12";
northernPass_map_ary[12][1] = 16;
northernPass_map_ary[12][2] = 45;
northernPass_map_ary[13][0] = "Northern Pass 13";
northernPass_map_ary[13][1] = 32;
northernPass_map_ary[13][2] = 36;
northernPass_map_ary[14][0] = "Northern Pass 14";
northernPass_map_ary[14][1] = 48;
northernPass_map_ary[14][2] = 46;
northernPass_map_ary[15][0] = "Northern Pass 15";
northernPass_map_ary[15][1] = 72;
northernPass_map_ary[15][2] = 77;
northernPass_map_ary[16][0] = "Northern Pass 16";
northernPass_map_ary[16][1] = 66;
northernPass_map_ary[16][2] = 42;
northernPass_map_ary[17][0] = "Northern Pass 17";
northernPass_map_ary[17][1] = 66;
northernPass_map_ary[17][2] = 42;
northernPass_map_ary[18][0] = "Northern Pass 18";
northernPass_map_ary[18][1] = 66;
northernPass_map_ary[18][2] = 42;
northernPass_map_ary[19][0] = "Northern Pass 19";
northernPass_map_ary[19][1] = 66;
northernPass_map_ary[19][2] = 42;
}