//Load and Save Player Stats
//
//
//
//
//
//Load Player Stats
//Path: obj_game > event Key Pressed "L"
function LoadSettings(_loadEntity){
		
//Load Settings
if (variable_struct_exists(_loadEntity,"volMusic")) global.volumeMusic = _loadEntity.volMusic;
if (variable_struct_exists(_loadEntity,"volMenu")) global.volumeMenu = _loadEntity.volMenu;
if (variable_struct_exists(_loadEntity,"volEffects")) global.volumeEffects = _loadEntity.volEffects;
	
}
//
//
//
//
//
//Save Player Stats
//Path: obj_game > event Key Pressed "S"
function SaveSettings(_saveData){
//
//
//What To Save As : What to Save
var _savePlayer = 
{
	//Save Room
	volMusic : global.volumeMusic, //CONCEPT: NOT FINAL
	volMenu : global.volumeMenu, //CONCEPT: NOT FINAL
	volEffects : global.volumeEffects, //CONCEPT: NOT FINAL

	
	
}
array_push(_saveData, _savePlayer);
}

