//Load and Save Game State
//
//
//
//
//
//Load Game State
//Path: Activated at Home Screen
function scr_load_starOrb(_loadEntity){
//Load Crull Stones
if (variable_struct_exists(_loadEntity,"starOrb00")) obj_inventory.starOrb_pedestal_list[0] = _loadEntity.starOrb00;
if (variable_struct_exists(_loadEntity,"starOrb01")) obj_inventory.starOrb_pedestal_list[1] = _loadEntity.starOrb01;
if (variable_struct_exists(_loadEntity,"starOrb02")) obj_inventory.starOrb_pedestal_list[2] = _loadEntity.starOrb02;
if (variable_struct_exists(_loadEntity,"starOrb03")) obj_inventory.starOrb_pedestal_list[3] = _loadEntity.starOrb03;
if (variable_struct_exists(_loadEntity,"starOrb04")) obj_inventory.starOrb_pedestal_list[4] = _loadEntity.starOrb04;
if (variable_struct_exists(_loadEntity,"starOrb05")) obj_inventory.starOrb_pedestal_list[5] = _loadEntity.starOrb05;
if (variable_struct_exists(_loadEntity,"starOrb06")) obj_inventory.starOrb_pedestal_list[6] = _loadEntity.starOrb06;
if (variable_struct_exists(_loadEntity,"starOrb07")) obj_inventory.starOrb_pedestal_list[7] = _loadEntity.starOrb07;
if (variable_struct_exists(_loadEntity,"starOrb08")) obj_inventory.starOrb_pedestal_list[8] = _loadEntity.starOrb08;
if (variable_struct_exists(_loadEntity,"starOrb09")) obj_inventory.starOrb_pedestal_list[9] = _loadEntity.starOrb09;
if (variable_struct_exists(_loadEntity,"starOrb10")) obj_inventory.starOrb_pedestal_list[10] = _loadEntity.starOrb10;
if (variable_struct_exists(_loadEntity,"starOrb11")) obj_inventory.starOrb_pedestal_list[11] = _loadEntity.starOrb11;
if (variable_struct_exists(_loadEntity,"starOrb12")) obj_inventory.starOrb_pedestal_list[12] = _loadEntity.starOrb12;
if (variable_struct_exists(_loadEntity,"starOrb13")) obj_inventory.starOrb_pedestal_list[13] = _loadEntity.starOrb13;
if (variable_struct_exists(_loadEntity,"starOrb14")) obj_inventory.starOrb_pedestal_list[14] = _loadEntity.starOrb14;
if (variable_struct_exists(_loadEntity,"starOrb15")) obj_inventory.starOrb_pedestal_list[15] = _loadEntity.starOrb15;
if (variable_struct_exists(_loadEntity,"starOrb16")) obj_inventory.starOrb_pedestal_list[16] = _loadEntity.starOrb16;
if (variable_struct_exists(_loadEntity,"starOrb17")) obj_inventory.starOrb_pedestal_list[17] = _loadEntity.starOrb17;		
}
//
//
//
//
//
//Save Game State
//Path: Activated by Doors
function scr_save_starOrb(_saveData){
	
var _saveInv = 
{
//Save Crull Stones 
starOrb00 : obj_inventory.starOrb_pedestal_list[0],	
starOrb01 : obj_inventory.starOrb_pedestal_list[1],	
starOrb02 : obj_inventory.starOrb_pedestal_list[2],	
starOrb03 : obj_inventory.starOrb_pedestal_list[3],	
starOrb04 : obj_inventory.starOrb_pedestal_list[4],	
starOrb05 : obj_inventory.starOrb_pedestal_list[5],
starOrb06 : obj_inventory.starOrb_pedestal_list[6],
starOrb07 : obj_inventory.starOrb_pedestal_list[7],
starOrb08 : obj_inventory.starOrb_pedestal_list[8],
starOrb09 : obj_inventory.starOrb_pedestal_list[9],
starOrb10 : obj_inventory.starOrb_pedestal_list[10],	
starOrb11 : obj_inventory.starOrb_pedestal_list[11],	
starOrb12 : obj_inventory.starOrb_pedestal_list[12],	
starOrb13 : obj_inventory.starOrb_pedestal_list[13],	
starOrb14 : obj_inventory.starOrb_pedestal_list[14],	
starOrb15 : obj_inventory.starOrb_pedestal_list[15],
starOrb16 : obj_inventory.starOrb_pedestal_list[16],
starOrb17 : obj_inventory.starOrb_pedestal_list[17],
}
array_push(_saveData, _saveInv);
}
