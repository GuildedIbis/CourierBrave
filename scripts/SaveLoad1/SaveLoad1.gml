//Save and Load
//
//
//
//
//
//Save Game
function scr_game_save_1(){

//Setup Array to hold Strings
var _saveData = array_create(0);

//Save Scripts
scr_save_player(_saveData);
//scr_save_inventory(_saveData);
scr_save_forms(_saveData);	
scr_save_quests(_saveData);
scr_save_rooms(_saveData);
scr_save_chests(_saveData);
scr_save_kephra(_saveData);
scr_save_gamestate(_saveData);
scr_save_starOrb(_saveData);

	

	
//
//
//Save
var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

show_debug_message("Game Saved!" + _string);
}
//	
//		
//
//
//
//Load Game
function scr_game_load_1(){
if (file_exists("savedgame.save"))
{
	var _buffer = buffer_load("savedgame.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _loadData = json_parse(_string);
	while (array_length(_loadData) > 0)
	{
		var _loadEntity = array_pop(_loadData);

		//Load Scripts
		scr_load_player(_loadEntity);
		//scr_load_inventory(_loadEntity);
		scr_load_forms(_loadEntity);
		scr_load_quests(_loadEntity);
		scr_load_rooms(_loadEntity);
		scr_load_chests(_loadEntity);
		scr_load_kephra(_loadEntity);
		scr_load_gamestate(_loadEntity);
		scr_load_starOrb(_loadEntity);
		
	}
	show_debug_message("Game Loaded!" + _string);
}
}


