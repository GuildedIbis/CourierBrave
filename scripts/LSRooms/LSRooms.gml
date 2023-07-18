//Load and Save Roomlog
//
//
//
//
//
//LoadRoomlog
//Path: obj_game > event Key Pressed "L"
function LoadRooms(_loadEntity){
//Load Current Location
if (variable_struct_exists(_loadEntity,"roomAry")) obj_inventory.room_ary = _loadEntity.roomAry;

//Load Lairs
//Habraf
//if (variable_struct_exists(_loadEntity,"habraf00")) obj_inventory.habraf_lair[0] = _loadEntity.habraf00;
//if (variable_struct_exists(_loadEntity,"habraf01")) obj_inventory.habraf_lair[1] = _loadEntity.habraf01;
//if (variable_struct_exists(_loadEntity,"habraf02")) obj_inventory.habraf_lair[2] = _loadEntity.habraf02;
//if (variable_struct_exists(_loadEntity,"habraf03")) obj_inventory.habraf_lair[3] = _loadEntity.habraf03;
//if (variable_struct_exists(_loadEntity,"habraf04")) obj_inventory.habraf_lair[4] = _loadEntity.habraf04;
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
//if (variable_struct_exists(_loadEntity,"yakflower10")) obj_inventory.yakflowerPath_map_ary[10][3] = _loadEntity.yakflower10;
//if (variable_struct_exists(_loadEntity,"yakflower11")) obj_inventory.yakflowerPath_map_ary[11][3] = _loadEntity.yakflower11;
//if (variable_struct_exists(_loadEntity,"yakflower12")) obj_inventory.yakflowerPath_map_ary[12][3] = _loadEntity.yakflower12;
//if (variable_struct_exists(_loadEntity,"yakflower13")) obj_inventory.yakflowerPath_map_ary[13][3] = _loadEntity.yakflower13;
//if (variable_struct_exists(_loadEntity,"yakflower14")) obj_inventory.yakflowerPath_map_ary[14][3] = _loadEntity.yakflower14;
//if (variable_struct_exists(_loadEntity,"yakflower15")) obj_inventory.yakflowerPath_map_ary[15][3] = _loadEntity.yakflower15;
//if (variable_struct_exists(_loadEntity,"yakflower16")) obj_inventory.yakflowerPath_map_ary[16][3] = _loadEntity.yakflower16;
//if (variable_struct_exists(_loadEntity,"yakflower17")) obj_inventory.yakflowerPath_map_ary[17][3] = _loadEntity.yakflower17;
//if (variable_struct_exists(_loadEntity,"yakflower18")) obj_inventory.yakflowerPath_map_ary[18][3] = _loadEntity.yakflower18;
//if (variable_struct_exists(_loadEntity,"yakflower19")) obj_inventory.yakflowerPath_map_ary[19][3] = _loadEntity.yakflower19;


//Load Dungeons
//if (variable_struct_exists(_loadEntity,"beaowire00")) obj_inventory.beaowire_dungeon[0] = _loadEntity.beaowire00;
//if (variable_struct_exists(_loadEntity,"beaowire01")) obj_inventory.beaowire_dungeon[1] = _loadEntity.beaowire01;
//if (variable_struct_exists(_loadEntity,"beaowire02")) obj_inventory.beaowire_dungeon[2] = _loadEntity.beaowire02;
//if (variable_struct_exists(_loadEntity,"beaowire03")) obj_inventory.beaowire_dungeon[3] = _loadEntity.beaowire03;
//if (variable_struct_exists(_loadEntity,"beaowire04")) obj_inventory.beaowire_dungeon[4] = _loadEntity.beaowire04;
//if (variable_struct_exists(_loadEntity,"beaowire05")) obj_inventory.beaowire_dungeon[5] = _loadEntity.beaowire05;
//if (variable_struct_exists(_loadEntity,"beaowire06")) obj_inventory.beaowire_dungeon[6] = _loadEntity.beaowire06;
//if (variable_struct_exists(_loadEntity,"beaowire07")) obj_inventory.beaowire_dungeon[7] = _loadEntity.beaowire07;
//if (variable_struct_exists(_loadEntity,"beaowire08")) obj_inventory.beaowire_dungeon[8] = _loadEntity.beaowire08;
//if (variable_struct_exists(_loadEntity,"beaowire09")) obj_inventory.beaowire_dungeon[9] = _loadEntity.beaowire09;
//if (variable_struct_exists(_loadEntity,"beaowire10")) obj_inventory.beaowire_dungeon[10] = _loadEntity.beaowire10;
//if (variable_struct_exists(_loadEntity,"beaowire11")) obj_inventory.beaowire_dungeon[11] = _loadEntity.beaowire11;
//if (variable_struct_exists(_loadEntity,"beaowire12")) obj_inventory.beaowire_dungeon[12] = _loadEntity.beaowire12;
//if (variable_struct_exists(_loadEntity,"beaowire13")) obj_inventory.beaowire_dungeon[13] = _loadEntity.beaowire13;
//if (variable_struct_exists(_loadEntity,"beaowire14")) obj_inventory.beaowire_dungeon[14] = _loadEntity.beaowire14;
//if (variable_struct_exists(_loadEntity,"beaowire15")) obj_inventory.beaowire_dungeon[15] = _loadEntity.beaowire15;
//if (variable_struct_exists(_loadEntity,"beaowire16")) obj_inventory.beaowire_dungeon[16] = _loadEntity.beaowire16;



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


//Load Level Array
if (variable_struct_exists(_loadEntity,"level00")) obj_inventory.level_ary[0] = _loadEntity.level00;
if (variable_struct_exists(_loadEntity,"level01")) obj_inventory.level_ary[1] = _loadEntity.level01;
if (variable_struct_exists(_loadEntity,"level02")) obj_inventory.level_ary[2] = _loadEntity.level02;
if (variable_struct_exists(_loadEntity,"level03")) obj_inventory.level_ary[3] = _loadEntity.level03;
if (variable_struct_exists(_loadEntity,"level04")) obj_inventory.level_ary[4] = _loadEntity.level04;

//Save Region
if (variable_struct_exists(_loadEntity,"region00")) obj_inventory.region_grid[# 0, 0] = _loadEntity.region00;
if (variable_struct_exists(_loadEntity,"region01")) obj_inventory.region_grid[# 1, 0] = _loadEntity.region01;
if (variable_struct_exists(_loadEntity,"region02")) obj_inventory.region_grid[# 2, 0] = _loadEntity.region02;
if (variable_struct_exists(_loadEntity,"region03")) obj_inventory.region_grid[# 3, 0] = _loadEntity.region03;
if (variable_struct_exists(_loadEntity,"region04")) obj_inventory.region_grid[# 4, 0] = _loadEntity.region04;


}
//
//
//
//
//
//Save Dungeon
//Path: obj_game > event Key Pressed "K"
function SaveRooms(_saveData){
//
//
//What To Save As : What to Save
var _saveQuest = 
{
//Save current location
roomAry : obj_inventory.room_ary,

//Save Lairs
//Habraf
//habraf00 : obj_inventory.habraf_lair[0],
//habraf01 : obj_inventory.habraf_lair[1],
//habraf02 : obj_inventory.habraf_lair[2],
//habraf03 : obj_inventory.habraf_lair[3],
//habraf04 : obj_inventory.habraf_lair[4],

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
//yakflower10 : obj_inventory.yakflowerPath_map_ary[10][3],
//yakflower11 : obj_inventory.yakflowerPath_map_ary[11][3],
//yakflower12 : obj_inventory.yakflowerPath_map_ary[12][3],
//yakflower13 : obj_inventory.yakflowerPath_map_ary[13][3],
//yakflower14 : obj_inventory.yakflowerPath_map_ary[14][3],
//yakflower15 : obj_inventory.yakflowerPath_map_ary[15][3],
//yakflower16 : obj_inventory.yakflowerPath_map_ary[16][3],
//yakflower17 : obj_inventory.yakflowerPath_map_ary[17][3],
//yakflower18 : obj_inventory.yakflowerPath_map_ary[18][3],
//yakflower19 : obj_inventory.yakflowerPath_map_ary[19][3],

////Save Dungeons
//beaowire00 : obj_inventory.beaowire_dungeon[0],
//beaowire01 : obj_inventory.beaowire_dungeon[1],
//beaowire02 : obj_inventory.beaowire_dungeon[2],
//beaowire03 : obj_inventory.beaowire_dungeon[3],
//beaowire04 : obj_inventory.beaowire_dungeon[4],
//beaowire05 : obj_inventory.beaowire_dungeon[5],
//beaowire06 : obj_inventory.beaowire_dungeon[6],
//beaowire07 : obj_inventory.beaowire_dungeon[7],
//beaowire08 : obj_inventory.beaowire_dungeon[8],
//beaowire09 : obj_inventory.beaowire_dungeon[9],
//beaowire10 : obj_inventory.beaowire_dungeon[10],
//beaowire11 : obj_inventory.beaowire_dungeon[11],
//beaowire12 : obj_inventory.beaowire_dungeon[12],
//beaowire13 : obj_inventory.beaowire_dungeon[13],
//beaowire14 : obj_inventory.beaowire_dungeon[14],
//beaowire15 : obj_inventory.beaowire_dungeon[15],
//beaowire16 : obj_inventory.beaowire_dungeon[16],



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

//Save Levels
level00: obj_inventory.level_ary[0],
level01: obj_inventory.level_ary[1],
level02: obj_inventory.level_ary[2],
level03: obj_inventory.level_ary[3],
level04: obj_inventory.level_ary[4],

//Save Regions
region00: obj_inventory.region_grid[# 0, 1],
region01: obj_inventory.region_grid[# 1, 1],
region02: obj_inventory.region_grid[# 2, 1],
region03: obj_inventory.region_grid[# 3, 1],
region04: obj_inventory.region_grid[# 4, 1],


}
array_push(_saveData, _saveQuest);
}

