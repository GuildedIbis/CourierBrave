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
if (variable_struct_exists(_loadEntity,"starOrb00")) obj_inventory.starOrb_list[0] = _loadEntity.starOrb00;
if (variable_struct_exists(_loadEntity,"starOrb01")) obj_inventory.starOrb_list[1] = _loadEntity.starOrb01;
if (variable_struct_exists(_loadEntity,"starOrb02")) obj_inventory.starOrb_list[2] = _loadEntity.starOrb02;
if (variable_struct_exists(_loadEntity,"starOrb03")) obj_inventory.starOrb_list[3] = _loadEntity.starOrb03;
if (variable_struct_exists(_loadEntity,"starOrb04")) obj_inventory.starOrb_list[4] = _loadEntity.starOrb04;
if (variable_struct_exists(_loadEntity,"starOrb05")) obj_inventory.starOrb_list[5] = _loadEntity.starOrb05;
if (variable_struct_exists(_loadEntity,"starOrb06")) obj_inventory.starOrb_list[6] = _loadEntity.starOrb06;
if (variable_struct_exists(_loadEntity,"starOrb07")) obj_inventory.starOrb_list[7] = _loadEntity.starOrb07;
if (variable_struct_exists(_loadEntity,"starOrb08")) obj_inventory.starOrb_list[8] = _loadEntity.starOrb08;
if (variable_struct_exists(_loadEntity,"starOrb09")) obj_inventory.starOrb_list[9] = _loadEntity.starOrb09;


//Load Crull Upgrades
//if (variable_struct_exists(_loadEntity,"crullUpgrade00")) obj_inventory.crullUpgrade_list[0] = _loadEntity.crullUpgrade00;
//if (variable_struct_exists(_loadEntity,"crullUpgrade01")) obj_inventory.crullUpgrade_list[1] = _loadEntity.crullUpgrade01;
//if (variable_struct_exists(_loadEntity,"crullUpgrade02")) obj_inventory.crullUpgrade_list[2] = _loadEntity.crullUpgrade02;
//if (variable_struct_exists(_loadEntity,"crullUpgrade03")) obj_inventory.crullUpgrade_list[3] = _loadEntity.crullUpgrade03;
//if (variable_struct_exists(_loadEntity,"crullUpgrade04")) obj_inventory.crullUpgrade_list[4] = _loadEntity.crullUpgrade04;

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
starOrb00 : obj_inventory.starOrb_list[0],	
starOrb01 : obj_inventory.starOrb_list[1],	
starOrb02 : obj_inventory.starOrb_list[2],	
starOrb03 : obj_inventory.starOrb_list[3],	
starOrb04 : obj_inventory.starOrb_list[4],	
starOrb05 : obj_inventory.starOrb_list[5],
starOrb06 : obj_inventory.starOrb_list[6],
starOrb07 : obj_inventory.starOrb_list[7],
starOrb08 : obj_inventory.starOrb_list[8],
starOrb09 : obj_inventory.starOrb_list[9],


//Crull Upgrades
//crullUpgrade00 : obj_inventory.crullUpgrade_list[0],
//crullUpgrade01 : obj_inventory.crullUpgrade_list[1],
//crullUpgrade02 : obj_inventory.crullUpgrade_list[2],
//crullUpgrade03 : obj_inventory.crullUpgrade_list[3],
//crullUpgrade04 : obj_inventory.crullUpgrade_list[4],


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
