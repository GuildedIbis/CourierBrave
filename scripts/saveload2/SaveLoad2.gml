//Save and Load
//
//
//
//
//
//Save Game
function SaveGame2(){

//Setup Array to hold Strings
var _saveData = array_create(0);

//Save Scripts
SavePlayer(_saveData);//Revert, then commit with a Load2
SaveInventory(_saveData);
SaveForms(_saveData);	
SaveQuest(_saveData);
SaveRooms(_saveData);
SaveChests(_saveData);
SaveKephra(_saveData);
SaveGameState(_saveData);

	
//
//
//Save
var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame2.save");
buffer_delete(_buffer);

show_debug_message("Game Saved!" + _string);
}
//	
//		
//
//
//
//Load Game
function LoadGame2(){
if (file_exists("savedgame2.save"))
{
	var _buffer = buffer_load("savedgame2.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _loadData = json_parse(_string);
	while (array_length(_loadData) > 0)
	{
		var _loadEntity = array_pop(_loadData);

		//Load Scripts
		LoadPlayer(_loadEntity);
		LoadInventory(_loadEntity);
		LoadForms(_loadEntity);
		LoadQuest(_loadEntity);
		LoadRooms(_loadEntity);
		LoadChests(_loadEntity);
		LoadKephra(_loadEntity);
		LoadGameState(_loadEntity);
		
	}
	show_debug_message("Game Loaded!" + _string);
}
}


