//Load and Save Roomlog
//
//
//
//
//
//LoadRoomlog
//Path: obj_game > event Key Pressed "L"
function LoadRooms(_loadEntity){
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
if (variable_struct_exists(_loadEntity,"yakflower04")) obj_inventory.yakflower_lair[3] = _loadEntity.yakflower04;



//Load Dungeons

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
//Save Lairs
//Habraf
habraf00 : obj_inventory.habraf_lair[0],
habraf01 : obj_inventory.habraf_lair[1],
habraf02 : obj_inventory.habraf_lair[2],
habraf03 : obj_inventory.habraf_lair[3],
habraf03 : obj_inventory.habraf_lair[4],
//Yakflower
yakflower00 : obj_inventory.yakflower_lair[0],
yakflower01 : obj_inventory.yakflower_lair[1],
yakflower02 : obj_inventory.yakflower_lair[2],
yakflower03 : obj_inventory.yakflower_lair[3],
yakflower04 : obj_inventory.yakflower_lair[4],

//Save Dungeons

//Save Camps
camp00 : obj_inventory.camp_grid[# 0, 3],
camp01 : obj_inventory.camp_grid[# 1, 3],
camp02 : obj_inventory.camp_grid[# 2, 3],
camp03 : obj_inventory.camp_grid[# 3, 3],

}
array_push(_saveData, _saveQuest);
}

