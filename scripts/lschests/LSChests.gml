//Load and Save Player Inventory
//
//
//
//
//
//Load Player Inventory
//Path: obj_game > event Key Pressed "L"
function scr_load_chests(_loadEntity){
//Load Maps
if (variable_struct_exists(_loadEntity,"map00")) obj_inventory.map_grid[# 0, 1] = _loadEntity.map00;
if (variable_struct_exists(_loadEntity,"map01")) obj_inventory.map_grid[# 1, 1] = _loadEntity.map01;
if (variable_struct_exists(_loadEntity,"map02")) obj_inventory.map_grid[# 2, 1] = _loadEntity.map02;
if (variable_struct_exists(_loadEntity,"map03")) obj_inventory.map_grid[# 3, 1] = _loadEntity.map03;
if (variable_struct_exists(_loadEntity,"map04")) obj_inventory.map_grid[# 4, 1] = _loadEntity.map04;


//Load Chests
if (variable_struct_exists(_loadEntity,"chest000")) obj_inventory.chest_list[0] = _loadEntity.chest000;
if (variable_struct_exists(_loadEntity,"chest001")) obj_inventory.chest_list[1] = _loadEntity.chest001;
if (variable_struct_exists(_loadEntity,"chest002")) obj_inventory.chest_list[2] = _loadEntity.chest002;
if (variable_struct_exists(_loadEntity,"chest003")) obj_inventory.chest_list[3] = _loadEntity.chest003;
if (variable_struct_exists(_loadEntity,"chest004")) obj_inventory.chest_list[4] = _loadEntity.chest004;
if (variable_struct_exists(_loadEntity,"chest005")) obj_inventory.chest_list[5] = _loadEntity.chest005;
if (variable_struct_exists(_loadEntity,"chest006")) obj_inventory.chest_list[6] = _loadEntity.chest006;
if (variable_struct_exists(_loadEntity,"chest007")) obj_inventory.chest_list[7] = _loadEntity.chest007;
if (variable_struct_exists(_loadEntity,"chest008")) obj_inventory.chest_list[8] = _loadEntity.chest008;
if (variable_struct_exists(_loadEntity,"chest009")) obj_inventory.chest_list[9] = _loadEntity.chest009;
if (variable_struct_exists(_loadEntity,"chest010")) obj_inventory.chest_list[10] = _loadEntity.chest010;
if (variable_struct_exists(_loadEntity,"chest011")) obj_inventory.chest_list[11] = _loadEntity.chest011;
if (variable_struct_exists(_loadEntity,"chest012")) obj_inventory.chest_list[12] = _loadEntity.chest012;
if (variable_struct_exists(_loadEntity,"chest013")) obj_inventory.chest_list[13] = _loadEntity.chest013;
if (variable_struct_exists(_loadEntity,"chest014")) obj_inventory.chest_list[14] = _loadEntity.chest014;
if (variable_struct_exists(_loadEntity,"chest015")) obj_inventory.chest_list[15] = _loadEntity.chest015;
if (variable_struct_exists(_loadEntity,"chest016")) obj_inventory.chest_list[16] = _loadEntity.chest016;
if (variable_struct_exists(_loadEntity,"chest017")) obj_inventory.chest_list[17] = _loadEntity.chest017;
if (variable_struct_exists(_loadEntity,"chest018")) obj_inventory.chest_list[18] = _loadEntity.chest018;
//if (variable_struct_exists(_loadEntity,"chest019")) obj_inventory.chest_list[19] = _loadEntity.chest019;

		
}
//
//
//
//
//
//Save Player Inventory
//Path: obj_game > event Key Pressed "S"
function scr_save_chests(_saveData){
	
var _saveInv = 
{
//Save Maps
map00 : obj_inventory.map_grid[# 0, 1],
map01 : obj_inventory.map_grid[# 1, 1],
map02 : obj_inventory.map_grid[# 2, 1],
map03 : obj_inventory.map_grid[# 3, 1],
map04 : obj_inventory.map_grid[# 4, 1],

	
//Save Chests
chest000 : obj_inventory.chest_list[0],
chest001 : obj_inventory.chest_list[1],
chest002 : obj_inventory.chest_list[2],
chest003 : obj_inventory.chest_list[3],
chest004 : obj_inventory.chest_list[4],
chest005 : obj_inventory.chest_list[5],
chest006 : obj_inventory.chest_list[6],
chest007 : obj_inventory.chest_list[7],
chest008 : obj_inventory.chest_list[8],
chest009 : obj_inventory.chest_list[9],
chest010 : obj_inventory.chest_list[10],
chest011 : obj_inventory.chest_list[11],
chest012 : obj_inventory.chest_list[12],
chest013 : obj_inventory.chest_list[13],
chest014 : obj_inventory.chest_list[14],
chest015 : obj_inventory.chest_list[15],
chest016 : obj_inventory.chest_list[16],
chest017 : obj_inventory.chest_list[17],
chest018 : obj_inventory.chest_list[18],
//chest019 : obj_inventory.chest_list[19],
}
array_push(_saveData, _saveInv);
}
