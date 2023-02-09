//Load and Save Game State
//
//
//
//
//
//Load Game State
//Path: Activated at Home Screen
function LoadCrull(_loadEntity){

//Load Crull Stones
if (variable_struct_exists(_loadEntity,"crullStone00")) obj_inventory.crullStone_list[0] = _loadEntity.crullStone00;
if (variable_struct_exists(_loadEntity,"crullStone01")) obj_inventory.crullStone_list[1] = _loadEntity.crullStone01;
if (variable_struct_exists(_loadEntity,"crullStone02")) obj_inventory.crullStone_list[2] = _loadEntity.crullStone02;
if (variable_struct_exists(_loadEntity,"crullStone03")) obj_inventory.crullStone_list[3] = _loadEntity.crullStone03;
if (variable_struct_exists(_loadEntity,"crullStone04")) obj_inventory.crullStone_list[4] = _loadEntity.crullStone04;
if (variable_struct_exists(_loadEntity,"crullStone05")) obj_inventory.crullStone_list[5] = _loadEntity.crullStone05;
if (variable_struct_exists(_loadEntity,"crullStone06")) obj_inventory.crullStone_list[6] = _loadEntity.crullStone06;
if (variable_struct_exists(_loadEntity,"crullStone07")) obj_inventory.crullStone_list[7] = _loadEntity.crullStone07;
if (variable_struct_exists(_loadEntity,"crullStone08")) obj_inventory.crullStone_list[8] = _loadEntity.crullStone08;
if (variable_struct_exists(_loadEntity,"crullStone09")) obj_inventory.crullStone_list[9] = _loadEntity.crullStone09;
if (variable_struct_exists(_loadEntity,"crullStone10")) obj_inventory.crullStone_list[10] = _loadEntity.crullStone10;
if (variable_struct_exists(_loadEntity,"crullStone11")) obj_inventory.crullStone_list[11] = _loadEntity.crullStone11;
if (variable_struct_exists(_loadEntity,"crullStone12")) obj_inventory.crullStone_list[12] = _loadEntity.crullStone12;
if (variable_struct_exists(_loadEntity,"crullStone13")) obj_inventory.crullStone_list[13] = _loadEntity.crullStone13;
if (variable_struct_exists(_loadEntity,"crullStone14")) obj_inventory.crullStone_list[14] = _loadEntity.crullStone14;
if (variable_struct_exists(_loadEntity,"crullStone15")) obj_inventory.crullStone_list[15] = _loadEntity.crullStone15;
if (variable_struct_exists(_loadEntity,"crullStone16")) obj_inventory.crullStone_list[16] = _loadEntity.crullStone16;
if (variable_struct_exists(_loadEntity,"crullStone17")) obj_inventory.crullStone_list[17] = _loadEntity.crullStone17;


//Load Crull Flowers
if (variable_struct_exists(_loadEntity,"crullS000")) obj_inventory.crullS_list[0] = _loadEntity.crullS000;
if (variable_struct_exists(_loadEntity,"crullS001")) obj_inventory.crullS_list[1] = _loadEntity.crullS001;
if (variable_struct_exists(_loadEntity,"crullS002")) obj_inventory.crullS_list[2] = _loadEntity.crullS002;

if (variable_struct_exists(_loadEntity,"crullM000")) obj_inventory.crullM_list[0] = _loadEntity.crullM000;
if (variable_struct_exists(_loadEntity,"crullM001")) obj_inventory.crullM_list[1] = _loadEntity.crullM001;
if (variable_struct_exists(_loadEntity,"crullM002")) obj_inventory.crullM_list[2] = _loadEntity.crullM002;


		
}
//
//
//
//
//
//Save Game State
//Path: Activated by Doors
function SaveCrull(_saveData){
	
var _saveInv = 
{
//Save Crull Stones 
crullStone00 : obj_inventory.crullStone_list[0],	
crullStone01 : obj_inventory.crullStone_list[1],	
crullStone02 : obj_inventory.crullStone_list[2],	
crullStone03 : obj_inventory.crullStone_list[3],	
crullStone04 : obj_inventory.crullStone_list[4],	
crullStone05 : obj_inventory.crullStone_list[5],
crullStone06 : obj_inventory.crullStone_list[6],
crullStone07 : obj_inventory.crullStone_list[7],
crullStone08 : obj_inventory.crullStone_list[8],
crullStone09 : obj_inventory.crullStone_list[9],
crullStone10 : obj_inventory.crullStone_list[10],	
crullStone11 : obj_inventory.crullStone_list[11],	
crullStone12 : obj_inventory.crullStone_list[12],	
crullStone13 : obj_inventory.crullStone_list[13],	
crullStone14 : obj_inventory.crullStone_list[14],	
crullStone15 : obj_inventory.crullStone_list[15],
crullStone16 : obj_inventory.crullStone_list[16],
crullStone17 : obj_inventory.crullStone_list[17],



//Save Crull Flowers
crullS000 : obj_inventory.crullS_list[0],
crullS001 : obj_inventory.crullS_list[1],
crullS002 : obj_inventory.crullS_list[2],

crullM000 : obj_inventory.crullM_list[0],
crullM001 : obj_inventory.crullM_list[1],
crullM002 : obj_inventory.crullM_list[2],

}
array_push(_saveData, _saveInv);
}
