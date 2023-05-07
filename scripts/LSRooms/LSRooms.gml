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
if (variable_struct_exists(_loadEntity,"habraf00")) obj_inventory.habraf_lair[0] = _loadEntity.habraf00;
if (variable_struct_exists(_loadEntity,"habraf01")) obj_inventory.habraf_lair[1] = _loadEntity.habraf01;
if (variable_struct_exists(_loadEntity,"habraf02")) obj_inventory.habraf_lair[2] = _loadEntity.habraf02;
if (variable_struct_exists(_loadEntity,"habraf03")) obj_inventory.habraf_lair[3] = _loadEntity.habraf03;
if (variable_struct_exists(_loadEntity,"habraf04")) obj_inventory.habraf_lair[4] = _loadEntity.habraf04;
//Yakflower
if (variable_struct_exists(_loadEntity,"yakflower00")) obj_inventory.yakflower_lair[0] = _loadEntity.yakflower00;
if (variable_struct_exists(_loadEntity,"yakflower01")) obj_inventory.yakflower_lair[1] = _loadEntity.yakflower01;
if (variable_struct_exists(_loadEntity,"yakflower02")) obj_inventory.yakflower_lair[2] = _loadEntity.yakflower02;
if (variable_struct_exists(_loadEntity,"yakflower03")) obj_inventory.yakflower_lair[3] = _loadEntity.yakflower03;
if (variable_struct_exists(_loadEntity,"yakflower04")) obj_inventory.yakflower_lair[4] = _loadEntity.yakflower04;



//Load Dungeons
if (variable_struct_exists(_loadEntity,"beaowire00")) obj_inventory.beaowire_dungeon[0] = _loadEntity.beaowire00;
if (variable_struct_exists(_loadEntity,"beaowire01")) obj_inventory.beaowire_dungeon[1] = _loadEntity.beaowire01;
if (variable_struct_exists(_loadEntity,"beaowire02")) obj_inventory.beaowire_dungeon[2] = _loadEntity.beaowire02;
if (variable_struct_exists(_loadEntity,"beaowire03")) obj_inventory.beaowire_dungeon[3] = _loadEntity.beaowire03;
if (variable_struct_exists(_loadEntity,"beaowire04")) obj_inventory.beaowire_dungeon[4] = _loadEntity.beaowire04;
if (variable_struct_exists(_loadEntity,"beaowire05")) obj_inventory.beaowire_dungeon[5] = _loadEntity.beaowire05;
if (variable_struct_exists(_loadEntity,"beaowire06")) obj_inventory.beaowire_dungeon[6] = _loadEntity.beaowire06;
if (variable_struct_exists(_loadEntity,"beaowire07")) obj_inventory.beaowire_dungeon[7] = _loadEntity.beaowire07;
if (variable_struct_exists(_loadEntity,"beaowire08")) obj_inventory.beaowire_dungeon[8] = _loadEntity.beaowire08;
if (variable_struct_exists(_loadEntity,"beaowire09")) obj_inventory.beaowire_dungeon[9] = _loadEntity.beaowire09;
if (variable_struct_exists(_loadEntity,"beaowire10")) obj_inventory.beaowire_dungeon[10] = _loadEntity.beaowire10;
if (variable_struct_exists(_loadEntity,"beaowire11")) obj_inventory.beaowire_dungeon[11] = _loadEntity.beaowire11;
if (variable_struct_exists(_loadEntity,"beaowire12")) obj_inventory.beaowire_dungeon[12] = _loadEntity.beaowire12;
if (variable_struct_exists(_loadEntity,"beaowire13")) obj_inventory.beaowire_dungeon[13] = _loadEntity.beaowire13;
if (variable_struct_exists(_loadEntity,"beaowire14")) obj_inventory.beaowire_dungeon[14] = _loadEntity.beaowire14;
if (variable_struct_exists(_loadEntity,"beaowire15")) obj_inventory.beaowire_dungeon[15] = _loadEntity.beaowire15;
if (variable_struct_exists(_loadEntity,"beaowire16")) obj_inventory.beaowire_dungeon[16] = _loadEntity.beaowire16;



//Load Camps
if (variable_struct_exists(_loadEntity,"camp00")) obj_inventory.camp_grid[# 0, 3] = _loadEntity.camp00;
if (variable_struct_exists(_loadEntity,"camp01")) obj_inventory.camp_grid[# 1, 3] = _loadEntity.camp01;
if (variable_struct_exists(_loadEntity,"camp02")) obj_inventory.camp_grid[# 2, 3] = _loadEntity.camp02;
if (variable_struct_exists(_loadEntity,"camp03")) obj_inventory.camp_grid[# 3, 3] = _loadEntity.camp03;

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
habraf00 : obj_inventory.habraf_lair[0],
habraf01 : obj_inventory.habraf_lair[1],
habraf02 : obj_inventory.habraf_lair[2],
habraf03 : obj_inventory.habraf_lair[3],
habraf04 : obj_inventory.habraf_lair[4],
//Yakflower
yakflower00 : obj_inventory.yakflower_lair[0],
yakflower01 : obj_inventory.yakflower_lair[1],
yakflower02 : obj_inventory.yakflower_lair[2],
yakflower03 : obj_inventory.yakflower_lair[3],
yakflower04 : obj_inventory.yakflower_lair[4],

//Save Dungeons
beaowire00 : obj_inventory.beaowire_dungeon[0],
beaowire01 : obj_inventory.beaowire_dungeon[1],
beaowire02 : obj_inventory.beaowire_dungeon[2],
beaowire03 : obj_inventory.beaowire_dungeon[3],
beaowire04 : obj_inventory.beaowire_dungeon[4],
beaowire05 : obj_inventory.beaowire_dungeon[5],
beaowire06 : obj_inventory.beaowire_dungeon[6],
beaowire07 : obj_inventory.beaowire_dungeon[7],
beaowire08 : obj_inventory.beaowire_dungeon[8],
beaowire09 : obj_inventory.beaowire_dungeon[9],
beaowire10 : obj_inventory.beaowire_dungeon[10],
beaowire11 : obj_inventory.beaowire_dungeon[11],
beaowire12 : obj_inventory.beaowire_dungeon[12],
beaowire13 : obj_inventory.beaowire_dungeon[13],
beaowire14 : obj_inventory.beaowire_dungeon[14],
beaowire15 : obj_inventory.beaowire_dungeon[15],
beaowire16 : obj_inventory.beaowire_dungeon[16],



//Save Camps
camp00 : obj_inventory.camp_grid[# 0, 3],
camp01 : obj_inventory.camp_grid[# 1, 3],
camp02 : obj_inventory.camp_grid[# 2, 3],
camp03 : obj_inventory.camp_grid[# 3, 3],

}
array_push(_saveData, _saveQuest);
}

