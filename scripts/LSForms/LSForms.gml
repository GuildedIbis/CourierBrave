//Load and Save Form Stats
//
//
//
//
//
//Load Form Stats
//Path: obj_game > event Key Pressed "L"
function scr_load_forms(_loadEntity){
//Load Form Stones
if (variable_struct_exists(_loadEntity,"formStone0")) obj_inventory.form_stone_list[0] = _loadEntity.formStone0;
if (variable_struct_exists(_loadEntity,"formStone1")) obj_inventory.form_stone_list[1] = _loadEntity.formStone1;
if (variable_struct_exists(_loadEntity,"formStone2")) obj_inventory.form_stone_list[2] = _loadEntity.formStone2;
if (variable_struct_exists(_loadEntity,"formStone3")) obj_inventory.form_stone_list[3] = _loadEntity.formStone3;
if (variable_struct_exists(_loadEntity,"formStone4")) obj_inventory.form_stone_list[4] = _loadEntity.formStone4;
if (variable_struct_exists(_loadEntity,"formStone5")) obj_inventory.form_stone_list[5] = _loadEntity.formStone5;
if (variable_struct_exists(_loadEntity,"formStone6")) obj_inventory.form_stone_list[6] = _loadEntity.formStone6;
if (variable_struct_exists(_loadEntity,"formStone7")) obj_inventory.form_stone_list[7] = _loadEntity.formStone7;
if (variable_struct_exists(_loadEntity,"formStone8")) obj_inventory.form_stone_list[8] = _loadEntity.formStone8;
if (variable_struct_exists(_loadEntity,"formStone9")) obj_inventory.form_stone_list[9] = _loadEntity.formStone9;
if (variable_struct_exists(_loadEntity,"formStone10")) obj_inventory.form_stone_list[10] = _loadEntity.formStone10;
if (variable_struct_exists(_loadEntity,"formStone11")) obj_inventory.form_stone_list[11] = _loadEntity.formStone11;
if (variable_struct_exists(_loadEntity,"formStone12")) obj_inventory.form_stone_list[12] = _loadEntity.formStone12;
if (variable_struct_exists(_loadEntity,"formStone13")) obj_inventory.form_stone_list[13] = _loadEntity.formStone13;
if (variable_struct_exists(_loadEntity,"formStone14")) obj_inventory.form_stone_list[14] = _loadEntity.formStone14;
if (variable_struct_exists(_loadEntity,"formStone15")) obj_inventory.form_stone_list[15] = _loadEntity.formStone15;
if (variable_struct_exists(_loadEntity,"formStone16")) obj_inventory.form_stone_list[16] = _loadEntity.formStone16;
if (variable_struct_exists(_loadEntity,"formStone17")) obj_inventory.form_stone_list[17] = _loadEntity.formStone17;

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
if (variable_struct_exists(_loadEntity,"form44")) obj_inventory.form_grid[# 4, 4] = _loadEntity.form44;
if (variable_struct_exists(_loadEntity,"form45")) obj_inventory.form_grid[# 4, 5] = _loadEntity.form45;
if (variable_struct_exists(_loadEntity,"form46")) obj_inventory.form_grid[# 4, 6] = _loadEntity.form46;
if (variable_struct_exists(_loadEntity,"form47")) obj_inventory.form_grid[# 4, 7] = _loadEntity.form47;
if (variable_struct_exists(_loadEntity,"form48")) obj_inventory.form_grid[# 4, 8] = _loadEntity.form48;
}
//
//
//
//
//
//Save Form Stats
//Path: obj_game > event Key Pressed "K"
function scr_save_forms(_saveData){
//
//
//What To Save As : What to Save
var _saveWeapon = 
{
//Form Stones
formStone0 : obj_inventory.form_stone_list[0],
formStone1 : obj_inventory.form_stone_list[1],
formStone2 : obj_inventory.form_stone_list[2],
formStone3 : obj_inventory.form_stone_list[3],
formStone4 : obj_inventory.form_stone_list[4],
formStone5 : obj_inventory.form_stone_list[5],
formStone6 : obj_inventory.form_stone_list[6],
formStone7 : obj_inventory.form_stone_list[7],
formStone8 : obj_inventory.form_stone_list[8],
formStone9 : obj_inventory.form_stone_list[9],
formStone10 : obj_inventory.form_stone_list[10],
formStone11 : obj_inventory.form_stone_list[11],
formStone12 : obj_inventory.form_stone_list[12],
formStone13 : obj_inventory.form_stone_list[13],
formStone14 : obj_inventory.form_stone_list[14],
formStone15 : obj_inventory.form_stone_list[15],
formStone16 : obj_inventory.form_stone_list[16],
formStone17 : obj_inventory.form_stone_list[17],

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
form44 : obj_inventory.form_grid[# 4, 4],
form45 : obj_inventory.form_grid[# 4, 5],
form46 : obj_inventory.form_grid[# 4, 6],
form47 : obj_inventory.form_grid[# 4, 7],
form48 : obj_inventory.form_grid[# 4, 8],

	
}
array_push(_saveData, _saveWeapon);
}

