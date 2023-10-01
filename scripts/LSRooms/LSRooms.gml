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
if (variable_struct_exists(_loadEntity,"camp00")) obj_inventory.camp_grid[# 0, 3] = _loadEntity.camp00;
if (variable_struct_exists(_loadEntity,"camp01")) obj_inventory.camp_grid[# 1, 3] = _loadEntity.camp01;
if (variable_struct_exists(_loadEntity,"camp02")) obj_inventory.camp_grid[# 2, 3] = _loadEntity.camp02;
if (variable_struct_exists(_loadEntity,"camp03")) obj_inventory.camp_grid[# 3, 3] = _loadEntity.camp03;
if (variable_struct_exists(_loadEntity,"camp04")) obj_inventory.camp_grid[# 4, 3] = _loadEntity.camp04;
if (variable_struct_exists(_loadEntity,"camp05")) obj_inventory.camp_grid[# 5, 3] = _loadEntity.camp05;
if (variable_struct_exists(_loadEntity,"camp06")) obj_inventory.camp_grid[# 6, 3] = _loadEntity.camp06;
if (variable_struct_exists(_loadEntity,"camp07")) obj_inventory.camp_grid[# 7, 3] = _loadEntity.camp07;
if (variable_struct_exists(_loadEntity,"camp08")) obj_inventory.camp_grid[# 8, 3] = _loadEntity.camp08;
if (variable_struct_exists(_loadEntity,"camp09")) obj_inventory.camp_grid[# 9, 3] = _loadEntity.camp09;
if (variable_struct_exists(_loadEntity,"camp10")) obj_inventory.camp_grid[# 10, 3] = _loadEntity.camp10;
if (variable_struct_exists(_loadEntity,"camp11")) obj_inventory.camp_grid[# 11, 3] = _loadEntity.camp11;
if (variable_struct_exists(_loadEntity,"camp12")) obj_inventory.camp_grid[# 12, 3] = _loadEntity.camp12;
if (variable_struct_exists(_loadEntity,"camp13")) obj_inventory.camp_grid[# 13, 3] = _loadEntity.camp13;
if (variable_struct_exists(_loadEntity,"camp14")) obj_inventory.camp_grid[# 14, 3] = _loadEntity.camp14;
if (variable_struct_exists(_loadEntity,"camp15")) obj_inventory.camp_grid[# 15, 3] = _loadEntity.camp15;
if (variable_struct_exists(_loadEntity,"camp16")) obj_inventory.camp_grid[# 16, 3] = _loadEntity.camp16;
if (variable_struct_exists(_loadEntity,"camp17")) obj_inventory.camp_grid[# 17, 3] = _loadEntity.camp17;
if (variable_struct_exists(_loadEntity,"camp18")) obj_inventory.camp_grid[# 18, 3] = _loadEntity.camp18;
if (variable_struct_exists(_loadEntity,"camp19")) obj_inventory.camp_grid[# 19, 3] = _loadEntity.camp19;
if (variable_struct_exists(_loadEntity,"camp20")) obj_inventory.camp_grid[# 20, 3] = _loadEntity.camp20;
if (variable_struct_exists(_loadEntity,"camp21")) obj_inventory.camp_grid[# 21, 3] = _loadEntity.camp21;
if (variable_struct_exists(_loadEntity,"camp22")) obj_inventory.camp_grid[# 22, 3] = _loadEntity.camp22;
if (variable_struct_exists(_loadEntity,"camp23")) obj_inventory.camp_grid[# 23, 3] = _loadEntity.camp23;
if (variable_struct_exists(_loadEntity,"camp24")) obj_inventory.camp_grid[# 24, 3] = _loadEntity.camp24;
if (variable_struct_exists(_loadEntity,"camp25")) obj_inventory.camp_grid[# 25, 3] = _loadEntity.camp25;
if (variable_struct_exists(_loadEntity,"camp26")) obj_inventory.camp_grid[# 26, 3] = _loadEntity.camp26;
if (variable_struct_exists(_loadEntity,"camp27")) obj_inventory.camp_grid[# 27, 3] = _loadEntity.camp27;
if (variable_struct_exists(_loadEntity,"camp28")) obj_inventory.camp_grid[# 28, 3] = _loadEntity.camp28;
if (variable_struct_exists(_loadEntity,"camp29")) obj_inventory.camp_grid[# 29, 3] = _loadEntity.camp29;

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
//if (variable_struct_exists(_loadEntity,"farway03")) obj_inventory.farwayRoad_map_ary[3][3] = _loadEntity.farway03;
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
camp00 : obj_inventory.camp_grid[# 0, 3],
camp01 : obj_inventory.camp_grid[# 1, 3],
camp02 : obj_inventory.camp_grid[# 2, 3],
camp03 : obj_inventory.camp_grid[# 3, 3],
camp04 : obj_inventory.camp_grid[# 4, 3],
camp05 : obj_inventory.camp_grid[# 5, 3],
camp06 : obj_inventory.camp_grid[# 6, 3],
camp07 : obj_inventory.camp_grid[# 7, 3],
camp08 : obj_inventory.camp_grid[# 8, 3],
camp09 : obj_inventory.camp_grid[# 9, 3],
camp10 : obj_inventory.camp_grid[# 0, 3],
camp11 : obj_inventory.camp_grid[# 11, 3],
camp12 : obj_inventory.camp_grid[# 12, 3],
camp13 : obj_inventory.camp_grid[# 13, 3],
camp14 : obj_inventory.camp_grid[# 14, 3],
camp15 : obj_inventory.camp_grid[# 15, 3],
camp16 : obj_inventory.camp_grid[# 16, 3],
camp17 : obj_inventory.camp_grid[# 17, 3],
camp18 : obj_inventory.camp_grid[# 18, 3],
camp19 : obj_inventory.camp_grid[# 19, 3],
camp20 : obj_inventory.camp_grid[# 20, 3],
camp21 : obj_inventory.camp_grid[# 21, 3],
camp22 : obj_inventory.camp_grid[# 22, 3],
camp23 : obj_inventory.camp_grid[# 23, 3],
camp24 : obj_inventory.camp_grid[# 24, 3],
camp25 : obj_inventory.camp_grid[# 25, 3],
camp26 : obj_inventory.camp_grid[# 26, 3],
camp27 : obj_inventory.camp_grid[# 27, 3],
camp28 : obj_inventory.camp_grid[# 28, 3],
camp29 : obj_inventory.camp_grid[# 29, 3],

//Save Levels
level00: obj_inventory.level_ary[0],
level01: obj_inventory.level_ary[1],
level02: obj_inventory.level_ary[2],
level03: obj_inventory.level_ary[3],
level04: obj_inventory.level_ary[4],

////Farway
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

