//Load and Save Player Stats
//
//
//
//
//
//Load Player Stats
//Path: obj_game > event Key Pressed "L"
function scr_load_settings(_loadEntity){
		
//Load Settings
if (variable_struct_exists(_loadEntity,"volMusic")) global.volumeMusic = _loadEntity.volMusic;
if (variable_struct_exists(_loadEntity,"volMenu")) global.volumeMenu = _loadEntity.volMenu;
if (variable_struct_exists(_loadEntity,"volEffects")) global.volumeEffects = _loadEntity.volEffects;
if (variable_struct_exists(_loadEntity,"timePlayed")) obj_game.time_played = _loadEntity.timePlayed;
if (variable_struct_exists(_loadEntity,"timePlayed2")) obj_game.time_played2 = _loadEntity.timePlayed2;
if (variable_struct_exists(_loadEntity,"timePlayed3")) obj_game.time_played3 = _loadEntity.timePlayed3;

	
}
//
//
//
//
//
//Save Player Stats
//Path: obj_game > event Key Pressed "S"
function scr_save_settings(_saveData){
//
//
//What To Save As : What to Save
var _savePlayer = 
{
	//Save Room
	volMusic : global.volumeMusic,
	volMenu : global.volumeMenu,
	volEffects : global.volumeEffects,
	timePlayed : obj_game.time_played,
	timePlayed2 : obj_game.time_played2,
	timePlayed3 : obj_game.time_played3,
}
array_push(_saveData, _savePlayer);
}

