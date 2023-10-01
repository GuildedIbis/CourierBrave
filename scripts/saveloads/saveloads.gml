//Save and Load
//
//
//
//
//
//Save Game
function scr_game_save_settings(){

//Setup Array to hold Strings
var _saveData = array_create(0);

//Save Scripts
scr_save_settings(_saveData);//Revert, then commit with a Load2

	

	
//
//
//Save
var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgameS.save");
buffer_delete(_buffer);

show_debug_message("Game Saved!" + _string);
}
//	
//		
//
//
//
//Load Game
function scr_game_load_settings(){
if (file_exists("savedgameS.save"))
{
	var _buffer = buffer_load("savedgameS.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _loadData = json_parse(_string);
	while (array_length(_loadData) > 0)
	{
		var _loadEntity = array_pop(_loadData);

		//Load Scripts
		scr_load_settings(_loadEntity);
	
		
		
	}
	show_debug_message("Game Loaded!" + _string);
}
}


