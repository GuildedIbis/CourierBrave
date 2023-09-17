//Load and Save Player Inventory
//
//
//
//
//
//Load Kephra Knowledge
//Path: obj_game > event Key Pressed "L"
function scr_load_kephra(_loadEntity){


//Load Chests
if (variable_struct_exists(_loadEntity,"kephra000")) obj_inventory.kephra_grid[# 0, 1] = _loadEntity.kephra000;
if (variable_struct_exists(_loadEntity,"kephra001")) obj_inventory.kephra_grid[# 1, 1] = _loadEntity.kephra001;
if (variable_struct_exists(_loadEntity,"kephra002")) obj_inventory.kephra_grid[# 2, 1] = _loadEntity.kephra002;
if (variable_struct_exists(_loadEntity,"kephra003")) obj_inventory.kephra_grid[# 3, 1] = _loadEntity.kephra003;
if (variable_struct_exists(_loadEntity,"kephra004")) obj_inventory.kephra_grid[# 4, 1] = _loadEntity.kephra004;
if (variable_struct_exists(_loadEntity,"kephra005")) obj_inventory.kephra_grid[# 5, 1] = _loadEntity.kephra005;
if (variable_struct_exists(_loadEntity,"kephra006")) obj_inventory.kephra_grid[# 6, 1] = _loadEntity.kephra006;
if (variable_struct_exists(_loadEntity,"kephra007")) obj_inventory.kephra_grid[# 7, 1] = _loadEntity.kephra007;
if (variable_struct_exists(_loadEntity,"kephra008")) obj_inventory.kephra_grid[# 8, 1] = _loadEntity.kephra008;
if (variable_struct_exists(_loadEntity,"kephra009")) obj_inventory.kephra_grid[# 9, 1] = _loadEntity.kephra009;

		
}
//
//
//
//
//
//Save Player Inventory
//Path: obj_game > event Key Pressed "S"
function scr_save_kephra(_saveData){
	
var _saveInv = 
{

//Save Chests
kephra000 : obj_inventory.kephra_grid[# 0, 1],
kephra001 : obj_inventory.kephra_grid[# 1, 1],
kephra002 : obj_inventory.kephra_grid[# 2, 1],
kephra003 : obj_inventory.kephra_grid[# 3, 1],
kephra004 : obj_inventory.kephra_grid[# 4, 1],
kephra005 : obj_inventory.kephra_grid[# 5, 1],
kephra006 : obj_inventory.kephra_grid[# 6, 1],
kephra007 : obj_inventory.kephra_grid[# 7, 1],
kephra008 : obj_inventory.kephra_grid[# 8, 1],
kephra009 : obj_inventory.kephra_grid[# 9, 1],
}
array_push(_saveData, _saveInv);
}
