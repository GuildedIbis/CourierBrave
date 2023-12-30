//Load and Save Game State
//
//
//
//
//
//Load Game State
//Path: Activated at Home Screen
function scr_load_gamestate(_loadEntity){
//Load World State
if (variable_struct_exists(_loadEntity,"dayTimer")) obj_game.day_timer = _loadEntity.dayTimer;
if (variable_struct_exists(_loadEntity,"dayPhase")) global.dayPhase = _loadEntity.dayPhase;
	
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
//Save World State
dayTimer : obj_game.day_timer,
dayPhase : global.dayPhase,

	
}
array_push(_saveData, _saveInv);
}
