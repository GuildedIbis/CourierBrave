//Load and Save Form Stats
//
//
//
//
//
//Load Form Stats
//Path: obj_game > event Key Pressed "L"
function LoadForms(_loadEntity){

//Load Form Stats
if (variable_struct_exists(_loadEntity,"form04")) obj_inventory.form_grid[# 0, 4] = _loadEntity.form04;
if (variable_struct_exists(_loadEntity,"form05")) obj_inventory.form_grid[# 0, 5] = _loadEntity.form05;
if (variable_struct_exists(_loadEntity,"form06")) obj_inventory.form_grid[# 0, 6] = _loadEntity.form06;
if (variable_struct_exists(_loadEntity,"form07")) obj_inventory.form_grid[# 0, 7] = _loadEntity.form07;
if (variable_struct_exists(_loadEntity,"form08")) obj_inventory.form_grid[# 0, 8] = _loadEntity.form08;
if (variable_struct_exists(_loadEntity,"form14")) obj_inventory.form_grid[# 1, 4] = _loadEntity.form14;
if (variable_struct_exists(_loadEntity,"form15")) obj_inventory.form_grid[# 1, 5] = _loadEntity.form15;
if (variable_struct_exists(_loadEntity,"form16")) obj_inventory.form_grid[# 1, 6] = _loadEntity.form16;
if (variable_struct_exists(_loadEntity,"form17")) obj_inventory.form_grid[# 1, 7] = _loadEntity.form17;
if (variable_struct_exists(_loadEntity,"form18")) obj_inventory.form_grid[# 1, 8] = _loadEntity.form18;
if (variable_struct_exists(_loadEntity,"form24")) obj_inventory.form_grid[# 2, 4] = _loadEntity.form24;
if (variable_struct_exists(_loadEntity,"form25")) obj_inventory.form_grid[# 2, 5] = _loadEntity.form25;
if (variable_struct_exists(_loadEntity,"form26")) obj_inventory.form_grid[# 2, 6] = _loadEntity.form26;
if (variable_struct_exists(_loadEntity,"form27")) obj_inventory.form_grid[# 2, 7] = _loadEntity.form27;
if (variable_struct_exists(_loadEntity,"form28")) obj_inventory.form_grid[# 2, 8] = _loadEntity.form28;
if (variable_struct_exists(_loadEntity,"form34")) obj_inventory.form_grid[# 3, 4] = _loadEntity.form34;
if (variable_struct_exists(_loadEntity,"form35")) obj_inventory.form_grid[# 3, 5] = _loadEntity.form35;
if (variable_struct_exists(_loadEntity,"form36")) obj_inventory.form_grid[# 3, 6] = _loadEntity.form36;
if (variable_struct_exists(_loadEntity,"form37")) obj_inventory.form_grid[# 3, 7] = _loadEntity.form37;
if (variable_struct_exists(_loadEntity,"form38")) obj_inventory.form_grid[# 3, 8] = _loadEntity.form38;
}
//
//
//
//
//
//Save Form Stats
//Path: obj_game > event Key Pressed "K"
function SaveForms(_saveData){
//
//
//What To Save As : What to Save
var _saveWeapon = 
{

//Save Form Stats
form04 : obj_inventory.form_grid[# 0, 4],
form05 : obj_inventory.form_grid[# 0, 5],
form06 : obj_inventory.form_grid[# 0, 6],
form07 : obj_inventory.form_grid[# 0, 7],
form08 : obj_inventory.form_grid[# 0, 8],
form14 : obj_inventory.form_grid[# 1, 4],
form15 : obj_inventory.form_grid[# 1, 5],
form16 : obj_inventory.form_grid[# 1, 6],
form17 : obj_inventory.form_grid[# 1, 7],
form18 : obj_inventory.form_grid[# 1, 8],
form24 : obj_inventory.form_grid[# 2, 4],
form25 : obj_inventory.form_grid[# 2, 5],
form26 : obj_inventory.form_grid[# 2, 6],
form27 : obj_inventory.form_grid[# 2, 7],
form28 : obj_inventory.form_grid[# 2, 8],
form34 : obj_inventory.form_grid[# 3, 4],
form35 : obj_inventory.form_grid[# 3, 5],
form36 : obj_inventory.form_grid[# 3, 6],
form37 : obj_inventory.form_grid[# 3, 7],
form38 : obj_inventory.form_grid[# 3, 8],

	
}
array_push(_saveData, _saveWeapon);
}

