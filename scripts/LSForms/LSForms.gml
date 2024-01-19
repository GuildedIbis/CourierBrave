//Load and Save Form Stats
//
//
//
//
//
//Load Form Stats
//Path: obj_game > event Key Pressed "L"
function scr_load_forms(_loadEntity){
//Load Form and SKill Stone (Quantities)
if (variable_struct_exists(_loadEntity,"formStones0")) obj_inventory.form_stone[0] = _loadEntity.formStones0;
if (variable_struct_exists(_loadEntity,"formStones1")) obj_inventory.form_stone[1] = _loadEntity.formStones1;
if (variable_struct_exists(_loadEntity,"formStones2")) obj_inventory.form_stone[2] = _loadEntity.formStones2;
if (variable_struct_exists(_loadEntity,"formStones3")) obj_inventory.form_stone[3] = _loadEntity.formStones3;
if (variable_struct_exists(_loadEntity,"formStones4")) obj_inventory.form_stone[4] = _loadEntity.formStones4;
if (variable_struct_exists(_loadEntity,"formStones5")) obj_inventory.form_stone[5] = _loadEntity.formStones5;
if (variable_struct_exists(_loadEntity,"skillStones0")) obj_inventory.skill_stone[0] = _loadEntity.skillStones0;
if (variable_struct_exists(_loadEntity,"skillStones1")) obj_inventory.skill_stone[1] = _loadEntity.skillStones1;
if (variable_struct_exists(_loadEntity,"skillStones2")) obj_inventory.skill_stone[2] = _loadEntity.skillStones2;
if (variable_struct_exists(_loadEntity,"skillStones3")) obj_inventory.skill_stone[3] = _loadEntity.skillStones3;
if (variable_struct_exists(_loadEntity,"skillStones4")) obj_inventory.skill_stone[4] = _loadEntity.skillStones4;
if (variable_struct_exists(_loadEntity,"skillStones5")) obj_inventory.skill_stone[5] = _loadEntity.skillStones5;


//Load Form Stones (Pedestal Found)
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

//Load Forms and Skills (Unlocked Status)
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
if (variable_struct_exists(_loadEntity,"form54")) obj_inventory.form_grid[# 5, 4] = _loadEntity.form54;
if (variable_struct_exists(_loadEntity,"form55")) obj_inventory.form_grid[# 5, 5] = _loadEntity.form55;
if (variable_struct_exists(_loadEntity,"form56")) obj_inventory.form_grid[# 5, 6] = _loadEntity.form56;
if (variable_struct_exists(_loadEntity,"form57")) obj_inventory.form_grid[# 5, 7] = _loadEntity.form57;
if (variable_struct_exists(_loadEntity,"form58")) obj_inventory.form_grid[# 5, 8] = _loadEntity.form58;

//Load Skill Stones (Found)
if (variable_struct_exists(_loadEntity,"skillStone0")) obj_inventory.skill_stone_list[0] = _loadEntity.skillStone0;
if (variable_struct_exists(_loadEntity,"skillStone1")) obj_inventory.skill_stone_list[1] = _loadEntity.skillStone1;
if (variable_struct_exists(_loadEntity,"skillStone2")) obj_inventory.skill_stone_list[2] = _loadEntity.skillStone2;
if (variable_struct_exists(_loadEntity,"skillStone3")) obj_inventory.skill_stone_list[3] = _loadEntity.skillStone3;
if (variable_struct_exists(_loadEntity,"skillStone4")) obj_inventory.skill_stone_list[4] = _loadEntity.skillStone4;
if (variable_struct_exists(_loadEntity,"skillStone5")) obj_inventory.skill_stone_list[5] = _loadEntity.skillStone5;
if (variable_struct_exists(_loadEntity,"skillStone6")) obj_inventory.skill_stone_list[6] = _loadEntity.skillStone6;
if (variable_struct_exists(_loadEntity,"skillStone7")) obj_inventory.skill_stone_list[7] = _loadEntity.skillStone7;
if (variable_struct_exists(_loadEntity,"skillStone8")) obj_inventory.skill_stone_list[8] = _loadEntity.skillStone8;
if (variable_struct_exists(_loadEntity,"skillStone9")) obj_inventory.skill_stone_list[9] = _loadEntity.skillStone9;
if (variable_struct_exists(_loadEntity,"skillStone10")) obj_inventory.skill_stone_list[10] = _loadEntity.skillStone10;
if (variable_struct_exists(_loadEntity,"skillStone11")) obj_inventory.skill_stone_list[11] = _loadEntity.skillStone11;
if (variable_struct_exists(_loadEntity,"skillStone12")) obj_inventory.skill_stone_list[12] = _loadEntity.skillStone12;
if (variable_struct_exists(_loadEntity,"skillStone13")) obj_inventory.skill_stone_list[13] = _loadEntity.skillStone13;
if (variable_struct_exists(_loadEntity,"skillStone14")) obj_inventory.skill_stone_list[14] = _loadEntity.skillStone14;
if (variable_struct_exists(_loadEntity,"skillStone15")) obj_inventory.skill_stone_list[15] = _loadEntity.skillStone15;
if (variable_struct_exists(_loadEntity,"skillStone16")) obj_inventory.skill_stone_list[16] = _loadEntity.skillStone16;
if (variable_struct_exists(_loadEntity,"skillStone17")) obj_inventory.skill_stone_list[17] = _loadEntity.skillStone17;
if (variable_struct_exists(_loadEntity,"skillStone18")) obj_inventory.skill_stone_list[18] = _loadEntity.skillStone18;
if (variable_struct_exists(_loadEntity,"skillStone19")) obj_inventory.skill_stone_list[19] = _loadEntity.skillStone19;
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
//Form and Skill Stones (Quantity)
formStones0 : obj_inventory.form_stone[0],
formStones1 : obj_inventory.form_stone[1],
formStones2 : obj_inventory.form_stone[2],
formStones3 : obj_inventory.form_stone[3],
formStones4 : obj_inventory.form_stone[4],
formStones5 : obj_inventory.form_stone[5],
skillStones0 : obj_inventory.skill_stone[0],
skillStones1 : obj_inventory.skill_stone[1],
skillStones2 : obj_inventory.skill_stone[2],
skillStones3 : obj_inventory.skill_stone[3],
skillStones4 : obj_inventory.skill_stone[4],
skillStones5 : obj_inventory.skill_stone[5],

//Form Stones (Pedestal Found)
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
form54 : obj_inventory.form_grid[# 5, 4],
form55 : obj_inventory.form_grid[# 5, 5],
form56 : obj_inventory.form_grid[# 5, 6],
form57 : obj_inventory.form_grid[# 5, 7],
form58 : obj_inventory.form_grid[# 5, 8],

skillStone0 : obj_inventory.skill_stone_list[0],	
skillStone1 : obj_inventory.skill_stone_list[1],	
skillStone2 : obj_inventory.skill_stone_list[2],	
skillStone3 : obj_inventory.skill_stone_list[3],	
skillStone4 : obj_inventory.skill_stone_list[4],	
skillStone5 : obj_inventory.skill_stone_list[5],	
skillStone6 : obj_inventory.skill_stone_list[6],	
skillStone7 : obj_inventory.skill_stone_list[7],	
skillStone8 : obj_inventory.skill_stone_list[8],	
skillStone9 : obj_inventory.skill_stone_list[9],	
skillStone10 : obj_inventory.skill_stone_list[10],	
skillStone11 : obj_inventory.skill_stone_list[11],	
skillStone12 : obj_inventory.skill_stone_list[12],	
skillStone13 : obj_inventory.skill_stone_list[13],	
skillStone14 : obj_inventory.skill_stone_list[14],	
skillStone15 : obj_inventory.skill_stone_list[15],	
skillStone16 : obj_inventory.skill_stone_list[16],	
skillStone17 : obj_inventory.skill_stone_list[17],	
skillStone18 : obj_inventory.skill_stone_list[18],	
skillStone19 : obj_inventory.skill_stone_list[19],
}
array_push(_saveData, _saveWeapon);
}

