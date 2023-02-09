//Load and Save Game State
//
//
//
//
//
//Load Game State
//Path: Activated at Home Screen
function LoadGameState(_loadEntity){
//Load Maps
if (variable_struct_exists(_loadEntity,"dayTimer")) obj_game.day_timer = _loadEntity.dayTimer;
if (variable_struct_exists(_loadEntity,"dayPhase")) global.dayPhase = _loadEntity.dayPhase;



//Load Crull Flowers
if (variable_struct_exists(_loadEntity,"crullS000")) obj_inventory.crullS_list[0] = _loadEntity.crullS000;
if (variable_struct_exists(_loadEntity,"crullS001")) obj_inventory.crullS_list[1] = _loadEntity.crullS001;
if (variable_struct_exists(_loadEntity,"crullS002")) obj_inventory.crullS_list[2] = _loadEntity.crullS002;

if (variable_struct_exists(_loadEntity,"crullM000")) obj_inventory.crullM_list[0] = _loadEntity.crullM000;
if (variable_struct_exists(_loadEntity,"crullM001")) obj_inventory.crullM_list[1] = _loadEntity.crullM001;
if (variable_struct_exists(_loadEntity,"crullM002")) obj_inventory.crullM_list[2] = _loadEntity.crullM002;


		
}
//
//
//
//
//
//Save Game State
//Path: Activated by Doors
function SaveGameState(_saveData){
	
var _saveInv = 
{
//Save Maps
dayTimer : obj_game.day_timer,
dayPhase : global.dayPhase,


	
}
array_push(_saveData, _saveInv);
}
