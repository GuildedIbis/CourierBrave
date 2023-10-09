//Load and Save Roomlog
//
//
//
//
//
//LoadRoomlog
//Path: obj_game > event Key Pressed "L"
function scr_load_rooms(_loadEntity){

//Load Current Location
if (variable_struct_exists(_loadEntity,"roomAry")) obj_inventory.room_ary = _loadEntity.roomAry;

//Load Camps
if (variable_struct_exists(_loadEntity,"altar00")) obj_inventory.altar_grid[# 0, 3] = _loadEntity.altar00;
if (variable_struct_exists(_loadEntity,"altar01")) obj_inventory.altar_grid[# 1, 3] = _loadEntity.altar01;
if (variable_struct_exists(_loadEntity,"altar02")) obj_inventory.altar_grid[# 2, 3] = _loadEntity.altar02;
if (variable_struct_exists(_loadEntity,"altar03")) obj_inventory.altar_grid[# 3, 3] = _loadEntity.altar03;
if (variable_struct_exists(_loadEntity,"altar04")) obj_inventory.altar_grid[# 4, 3] = _loadEntity.altar04;
if (variable_struct_exists(_loadEntity,"altar05")) obj_inventory.altar_grid[# 5, 3] = _loadEntity.altar05;
if (variable_struct_exists(_loadEntity,"altar06")) obj_inventory.altar_grid[# 6, 3] = _loadEntity.altar06;
if (variable_struct_exists(_loadEntity,"altar07")) obj_inventory.altar_grid[# 7, 3] = _loadEntity.altar07;
if (variable_struct_exists(_loadEntity,"altar08")) obj_inventory.altar_grid[# 8, 3] = _loadEntity.altar08;
if (variable_struct_exists(_loadEntity,"altar09")) obj_inventory.altar_grid[# 9, 3] = _loadEntity.altar09;
if (variable_struct_exists(_loadEntity,"altar10")) obj_inventory.altar_grid[# 10, 3] = _loadEntity.altar10;
if (variable_struct_exists(_loadEntity,"altar11")) obj_inventory.altar_grid[# 11, 3] = _loadEntity.altar11;
if (variable_struct_exists(_loadEntity,"altar12")) obj_inventory.altar_grid[# 12, 1] = _loadEntity.altar12;
if (variable_struct_exists(_loadEntity,"altar13")) obj_inventory.altar_grid[# 13, 3] = _loadEntity.altar13;
if (variable_struct_exists(_loadEntity,"altar14")) obj_inventory.altar_grid[# 14, 3] = _loadEntity.altar14;
if (variable_struct_exists(_loadEntity,"altar15")) obj_inventory.altar_grid[# 15, 3] = _loadEntity.altar15;
if (variable_struct_exists(_loadEntity,"altar16")) obj_inventory.altar_grid[# 16, 3] = _loadEntity.altar16;
if (variable_struct_exists(_loadEntity,"altar17")) obj_inventory.altar_grid[# 17, 3] = _loadEntity.altar17;
if (variable_struct_exists(_loadEntity,"altar18")) obj_inventory.altar_grid[# 18, 3] = _loadEntity.altar18;
if (variable_struct_exists(_loadEntity,"altar19")) obj_inventory.altar_grid[# 19, 3] = _loadEntity.altar19;
if (variable_struct_exists(_loadEntity,"altar20")) obj_inventory.altar_grid[# 20, 3] = _loadEntity.altar20;
if (variable_struct_exists(_loadEntity,"altar21")) obj_inventory.altar_grid[# 21, 3] = _loadEntity.altar21;
if (variable_struct_exists(_loadEntity,"altar22")) obj_inventory.altar_grid[# 22, 2] = _loadEntity.altar22;
if (variable_struct_exists(_loadEntity,"altar23")) obj_inventory.altar_grid[# 23, 3] = _loadEntity.altar23;
if (variable_struct_exists(_loadEntity,"altar24")) obj_inventory.altar_grid[# 24, 3] = _loadEntity.altar24;
if (variable_struct_exists(_loadEntity,"altar25")) obj_inventory.altar_grid[# 25, 3] = _loadEntity.altar25;
if (variable_struct_exists(_loadEntity,"altar26")) obj_inventory.altar_grid[# 26, 3] = _loadEntity.altar26;
if (variable_struct_exists(_loadEntity,"altar27")) obj_inventory.altar_grid[# 27, 3] = _loadEntity.altar27;
if (variable_struct_exists(_loadEntity,"altar28")) obj_inventory.altar_grid[# 28, 3] = _loadEntity.altar28;
if (variable_struct_exists(_loadEntity,"altar29")) obj_inventory.altar_grid[# 29, 3] = _loadEntity.altar29;


//Load Level Array
if (variable_struct_exists(_loadEntity,"level00")) obj_inventory.level_ary[0] = _loadEntity.level00;
if (variable_struct_exists(_loadEntity,"level01")) obj_inventory.level_ary[1] = _loadEntity.level01;
if (variable_struct_exists(_loadEntity,"level02")) obj_inventory.level_ary[2] = _loadEntity.level02;
if (variable_struct_exists(_loadEntity,"level03")) obj_inventory.level_ary[3] = _loadEntity.level03;
if (variable_struct_exists(_loadEntity,"level04")) obj_inventory.level_ary[4] = _loadEntity.level04;

//Room Saves
//if (variable_struct_exists(_loadEntity,"farway00")) obj_inventory.farwayRoad_map_ary[0][3] = _loadEntity.farway00;
//if (variable_struct_exists(_loadEntity,"farway01")) obj_inventory.farwayRoad_map_ary[1][3] = _loadEntity.farway01;
//if (variable_struct_exists(_loadEntity,"farway02")) obj_inventory.farwayRoad_map_ary[2][3] = _loadEntity.farway02;
if (variable_struct_exists(_loadEntity,"farway03")) obj_inventory.farwayRoad_map_ary[3][3] = _loadEntity.farway03;
//if (variable_struct_exists(_loadEntity,"farway04")) obj_inventory.farwayRoad_map_ary[4][3] = _loadEntity.farway04;
//if (variable_struct_exists(_loadEntity,"farway05")) obj_inventory.farwayRoad_map_ary[5][3] = _loadEntity.farway05;
//if (variable_struct_exists(_loadEntity,"farway06")) obj_inventory.farwayRoad_map_ary[6][3] = _loadEntity.farway06;
//if (variable_struct_exists(_loadEntity,"farway07")) obj_inventory.farwayRoad_map_ary[7][3] = _loadEntity.farway07;
//if (variable_struct_exists(_loadEntity,"farway08")) obj_inventory.farwayRoad_map_ary[8][3] = _loadEntity.farway08;
//if (variable_struct_exists(_loadEntity,"farway09")) obj_inventory.farwayRoad_map_ary[9][3] = _loadEntity.farway09;
if (variable_struct_exists(_loadEntity,"farway10")) obj_inventory.farwayRoad_map_ary[10][3] = _loadEntity.farway10;
//if (variable_struct_exists(_loadEntity,"farway11")) obj_inventory.farwayRoad_map_ary[11][3] = _loadEntity.farway11;
//if (variable_struct_exists(_loadEntity,"farway12")) obj_inventory.farwayRoad_map_ary[12][3] = _loadEntity.farway12;
//if (variable_struct_exists(_loadEntity,"farway13")) obj_inventory.farwayRoad_map_ary[13][3] = _loadEntity.farway13;
if (variable_struct_exists(_loadEntity,"farway14")) obj_inventory.farwayRoad_map_ary[14][3] = _loadEntity.farway14;
//if (variable_struct_exists(_loadEntity,"farway15")) obj_inventory.farwayRoad_map_ary[15][3] = _loadEntity.farway15;
//if (variable_struct_exists(_loadEntity,"farway16")) obj_inventory.farwayRoad_map_ary[16][3] = _loadEntity.farway16;
//if (variable_struct_exists(_loadEntity,"farway17")) obj_inventory.farwayRoad_map_ary[17][3] = _loadEntity.farway17;
//if (variable_struct_exists(_loadEntity,"farway18")) obj_inventory.farwayRoad_map_ary[18][3] = _loadEntity.farway18;
//if (variable_struct_exists(_loadEntity,"farway19")) obj_inventory.farwayRoad_map_ary[19][3] = _loadEntity.farway19;
//Yakflower
//if (variable_struct_exists(_loadEntity,"yakflower00")) obj_inventory.yakflowerPath_map_ary[0][3] = _loadEntity.yakflower00;
//if (variable_struct_exists(_loadEntity,"yakflower01")) obj_inventory.yakflowerPath_map_ary[1][3] = _loadEntity.yakflower01;
//if (variable_struct_exists(_loadEntity,"yakflower02")) obj_inventory.yakflowerPath_map_ary[2][3] = _loadEntity.yakflower02;
//if (variable_struct_exists(_loadEntity,"yakflower03")) obj_inventory.yakflowerPath_map_ary[3][3] = _loadEntity.yakflower03;
//if (variable_struct_exists(_loadEntity,"yakflower04")) obj_inventory.yakflowerPath_map_ary[4][3] = _loadEntity.yakflower04;
//if (variable_struct_exists(_loadEntity,"yakflower05")) obj_inventory.yakflowerPath_map_ary[5][3] = _loadEntity.yakflower05;
//if (variable_struct_exists(_loadEntity,"yakflower06")) obj_inventory.yakflowerPath_map_ary[6][3] = _loadEntity.yakflower06;
//if (variable_struct_exists(_loadEntity,"yakflower07")) obj_inventory.yakflowerPath_map_ary[7][3] = _loadEntity.yakflower07;
//if (variable_struct_exists(_loadEntity,"yakflower08")) obj_inventory.yakflowerPath_map_ary[8][3] = _loadEntity.yakflower08;
//if (variable_struct_exists(_loadEntity,"yakflower09")) obj_inventory.yakflowerPath_map_ary[9][3] = _loadEntity.yakflower09;
if (variable_struct_exists(_loadEntity,"yakflower10")) obj_inventory.yakflowerPath_map_ary[10][3] = _loadEntity.yakflower10;
//if (variable_struct_exists(_loadEntity,"yakflower11")) obj_inventory.yakflowerPath_map_ary[11][3] = _loadEntity.yakflower11;
//if (variable_struct_exists(_loadEntity,"yakflower12")) obj_inventory.yakflowerPath_map_ary[12][3] = _loadEntity.yakflower12;
//if (variable_struct_exists(_loadEntity,"yakflower13")) obj_inventory.yakflowerPath_map_ary[13][3] = _loadEntity.yakflower13;
if (variable_struct_exists(_loadEntity,"yakflower14")) obj_inventory.yakflowerPath_map_ary[14][3] = _loadEntity.yakflower14;
//if (variable_struct_exists(_loadEntity,"yakflower15")) obj_inventory.yakflowerPath_map_ary[15][3] = _loadEntity.yakflower15;
//if (variable_struct_exists(_loadEntity,"yakflower16")) obj_inventory.yakflowerPath_map_ary[16][3] = _loadEntity.yakflower16;
//if (variable_struct_exists(_loadEntity,"yakflower17")) obj_inventory.yakflowerPath_map_ary[17][3] = _loadEntity.yakflower17;
//if (variable_struct_exists(_loadEntity,"yakflower18")) obj_inventory.yakflowerPath_map_ary[18][3] = _loadEntity.yakflower18;
//if (variable_struct_exists(_loadEntity,"yakflower19")) obj_inventory.yakflowerPath_map_ary[19][3] = _loadEntity.yakflower19;


}
//
//
//
//
//
//
//Path: obj_game > event Key Pressed "K"
function scr_save_rooms(_saveData){
//
//
//What To Save As : What to Save
var _saveQuest = 
{
//Save current location
roomAry : obj_inventory.room_ary,

//Save Camps
altar00 : obj_inventory.altar_grid[# 0, 3],
altar01 : obj_inventory.altar_grid[# 1, 3],
altar02 : obj_inventory.altar_grid[# 2, 3],
altar03 : obj_inventory.altar_grid[# 3, 3],
altar04 : obj_inventory.altar_grid[# 4, 3],
altar05 : obj_inventory.altar_grid[# 5, 3],
altar06 : obj_inventory.altar_grid[# 6, 3],
altar07 : obj_inventory.altar_grid[# 7, 3],
altar08 : obj_inventory.altar_grid[# 8, 3],
altar09 : obj_inventory.altar_grid[# 9, 3],
altar10 : obj_inventory.altar_grid[# 10, 3],
altar11 : obj_inventory.altar_grid[# 11, 3],
altar12 : obj_inventory.altar_grid[# 12, 3],
altar13 : obj_inventory.altar_grid[# 13, 3],
altar14 : obj_inventory.altar_grid[# 14, 3],
altar15 : obj_inventory.altar_grid[# 15, 3],
altar16 : obj_inventory.altar_grid[# 16, 3],
altar17 : obj_inventory.altar_grid[# 17, 3],
altar18 : obj_inventory.altar_grid[# 18, 3],
altar19 : obj_inventory.altar_grid[# 19, 3],
altar20 : obj_inventory.altar_grid[# 20, 3],
altar21 : obj_inventory.altar_grid[# 21, 3],
altar22 : obj_inventory.altar_grid[# 22, 3],
altar23 : obj_inventory.altar_grid[# 23, 3],
altar24 : obj_inventory.altar_grid[# 24, 3],
altar25 : obj_inventory.altar_grid[# 25, 3],
altar26 : obj_inventory.altar_grid[# 26, 3],
altar27 : obj_inventory.altar_grid[# 27, 3],
altar28 : obj_inventory.altar_grid[# 28, 3],
altar29 : obj_inventory.altar_grid[# 29, 3],


//Save Levels
level00: obj_inventory.level_ary[0],
level01: obj_inventory.level_ary[1],
level02: obj_inventory.level_ary[2],
level03: obj_inventory.level_ary[3],
level04: obj_inventory.level_ary[4],

////Farway
farway03 : obj_inventory.farwayRoad_map_ary[3][3],
farway10 : obj_inventory.farwayRoad_map_ary[10][3],
farway14 : obj_inventory.farwayRoad_map_ary[14][3],
//Yakflower
//yakflower00 : obj_inventory.yakflowerPath_map_ary[0][3],
//yakflower01 : obj_inventory.yakflowerPath_map_ary[1][3],
//yakflower02 : obj_inventory.yakflowerPath_map_ary[2][3],
//yakflower03 : obj_inventory.yakflowerPath_map_ary[3][3],
//yakflower04 : obj_inventory.yakflowerPath_map_ary[4][3],
//yakflower05 : obj_inventory.yakflowerPath_map_ary[5][3],
//yakflower06 : obj_inventory.yakflowerPath_map_ary[6][3],
//yakflower07 : obj_inventory.yakflowerPath_map_ary[7][3],
//yakflower08 : obj_inventory.yakflowerPath_map_ary[8][3],
//yakflower09 : obj_inventory.yakflowerPath_map_ary[9][3],
yakflower10 : obj_inventory.yakflowerPath_map_ary[10][3],
//yakflower11 : obj_inventory.yakflowerPath_map_ary[11][3],
//yakflower12 : obj_inventory.yakflowerPath_map_ary[12][3],
//yakflower13 : obj_inventory.yakflowerPath_map_ary[13][3],
yakflower14 : obj_inventory.yakflowerPath_map_ary[14][3],
//yakflower15 : obj_inventory.yakflowerPath_map_ary[15][3],
//yakflower16 : obj_inventory.yakflowerPath_map_ary[16][3],
//yakflower17 : obj_inventory.yakflowerPath_map_ary[17][3],
//yakflower18 : obj_inventory.yakflowerPath_map_ary[18][3],
//yakflower19 : obj_inventory.yakflowerPath_map_ary[19][3],

}
array_push(_saveData, _saveQuest);
}

