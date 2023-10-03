//Load and Save Game State
//
//
//
//
//
//Load Game State
//Path: Activated at Home Screen
function scr_load_gamestate(_loadEntity){
//Load Maps
//if (variable_struct_exists(_loadEntity,"timePlayed")) obj_game.time_played = _loadEntity.timePlayed;
//if (variable_struct_exists(_loadEntity,"timePlayed2")) obj_game.time_played2 = _loadEntity.timePlayed2;
//if (variable_struct_exists(_loadEntity,"timePlayed3")) obj_game.time_played3 = _loadEntity.timePlayed3;
if (variable_struct_exists(_loadEntity,"dayTimer")) obj_game.day_timer = _loadEntity.dayTimer;
if (variable_struct_exists(_loadEntity,"dayPhase")) global.dayPhase = _loadEntity.dayPhase;



//Load Crull Flowers
//if (variable_struct_exists(_loadEntity,"crullS000")) obj_inventory.crullS_list[0] = _loadEntity.crullS000;
//if (variable_struct_exists(_loadEntity,"crullS001")) obj_inventory.crullS_list[1] = _loadEntity.crullS001;
//if (variable_struct_exists(_loadEntity,"crullS002")) obj_inventory.crullS_list[2] = _loadEntity.crullS002;

//if (variable_struct_exists(_loadEntity,"crullM000")) obj_inventory.crullM_list[0] = _loadEntity.crullM000;
//if (variable_struct_exists(_loadEntity,"crullM001")) obj_inventory.crullM_list[1] = _loadEntity.crullM001;
//if (variable_struct_exists(_loadEntity,"crullM002")) obj_inventory.crullM_list[2] = _loadEntity.crullM002;

//if (variable_struct_exists(_loadEntity,"enemy28_0")) obj_game.room_enemy_grid[# 28, 0] = _loadEntity.enemy28_0;
//if (variable_struct_exists(_loadEntity,"enemy28_1")) obj_game.room_enemy_grid[# 28, 1] = _loadEntity.enemy28_1;
//if (variable_struct_exists(_loadEntity,"enemy28_2")) obj_game.room_enemy_grid[# 28, 2] = _loadEntity.enemy28_2;
//if (variable_struct_exists(_loadEntity,"enemy28_3")) obj_game.room_enemy_grid[# 28, 3] = _loadEntity.enemy28_3;
		
}
//
//
//
//
//
//Save Game State
//Path: Activated by Doors
function scr_save_gamestate(_saveData){
	
var _saveInv = 
{
//Save Maps
//timePlayed : obj_game.time_played,
//timePlayed2 : obj_game.time_played2,
//timePlayed3 : obj_game.time_played3,
dayTimer : obj_game.day_timer,
dayPhase : global.dayPhase,

//enemy28_0 : obj_game.room_enemy_grid[# 28, 0],
//enemy28_1 : obj_game.room_enemy_grid[# 28, 1],
//enemy28_2 : obj_game.room_enemy_grid[# 28, 2],
//enemy28_3 : obj_game.room_enemy_grid[# 28, 3]
	
}
array_push(_saveData, _saveInv);
}
