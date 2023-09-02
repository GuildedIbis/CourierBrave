//Load and Save Player Inventory
//
//
//
//
//
//Load Player Inventory
//Path: obj_game > event Key Pressed "L"
function LoadInventory(_loadEntity){
		
		//Load Inventory Stats
		if (variable_struct_exists(_loadEntity,"itemSlots")) obj_inventory.item_slots = _loadEntity.itemSlots;
	
		
		//Unique Items
		if (variable_struct_exists(_loadEntity,"starOrbs")) obj_inventory.star_orb = _loadEntity.starOrbs;
		if (variable_struct_exists(_loadEntity,"beans")) obj_inventory.beans = _loadEntity.beans;
			
		//Load Rog Stones
		if (variable_struct_exists(_loadEntity,"rogArray0")) obj_inventory.rog_array[0] = _loadEntity.rogArray0;
		if (variable_struct_exists(_loadEntity,"rogArray1")) obj_inventory.rog_array[1] = _loadEntity.rogArray1;
		if (variable_struct_exists(_loadEntity,"rogArray2")) obj_inventory.rog_array[2] = _loadEntity.rogArray2;
		if (variable_struct_exists(_loadEntity,"rogArray3")) obj_inventory.rog_array[3] = _loadEntity.rogArray3;
		if (variable_struct_exists(_loadEntity,"rogArray4")) obj_inventory.rog_array[4] = _loadEntity.rogArray4;
		if (variable_struct_exists(_loadEntity,"rogArray5")) obj_inventory.rog_array[5] = _loadEntity.rogArray5;
		
		//Load Power Stones
		if (variable_struct_exists(_loadEntity,"psArray0")) obj_inventory.ps_array[0] = _loadEntity.psArray0;
		if (variable_struct_exists(_loadEntity,"psArray1")) obj_inventory.ps_array[1] = _loadEntity.psArray1;
		if (variable_struct_exists(_loadEntity,"psArray2")) obj_inventory.ps_array[2] = _loadEntity.psArray2;
		if (variable_struct_exists(_loadEntity,"psArray3")) obj_inventory.ps_array[3] = _loadEntity.psArray3;
		if (variable_struct_exists(_loadEntity,"psArray4")) obj_inventory.ps_array[4] = _loadEntity.psArray4;
		if (variable_struct_exists(_loadEntity,"psArray5")) obj_inventory.ps_array[5] = _loadEntity.psArray5;
		if (variable_struct_exists(_loadEntity,"psArray6")) obj_inventory.ps_array[6] = _loadEntity.psArray6;
		if (variable_struct_exists(_loadEntity,"psArray7")) obj_inventory.ps_array[7] = _loadEntity.psArray7;
		if (variable_struct_exists(_loadEntity,"psArray8")) obj_inventory.ps_array[8] = _loadEntity.psArray8;
		if (variable_struct_exists(_loadEntity,"psArray9")) obj_inventory.ps_array[9] = _loadEntity.psArray9;

		if (variable_struct_exists(_loadEntity,"crullRecipe0")) obj_inventory.crull_recipe[0] = true;//_loadEntity.crullRecipe0;
		if (variable_struct_exists(_loadEntity,"crullRecipe1")) obj_inventory.crull_recipe[1] = _loadEntity.crullRecipe1;
		if (variable_struct_exists(_loadEntity,"crullRecipe2")) obj_inventory.crull_recipe[2] = _loadEntity.crullRecipe2;
		if (variable_struct_exists(_loadEntity,"crullRecipe3")) obj_inventory.crull_recipe[3] = _loadEntity.crullRecipe3;
		if (variable_struct_exists(_loadEntity,"crullRecipe4")) obj_inventory.crull_recipe[4] = _loadEntity.crullRecipe4;
		if (variable_struct_exists(_loadEntity,"crullRecipe5")) obj_inventory.crull_recipe[5] = _loadEntity.crullRecipe5;
		if (variable_struct_exists(_loadEntity,"crullRecipe6")) obj_inventory.crull_recipe[6] = _loadEntity.crullRecipe6;
		if (variable_struct_exists(_loadEntity,"crullRecipe7")) obj_inventory.crull_recipe[7] = _loadEntity.crullRecipe7;
		if (variable_struct_exists(_loadEntity,"crullRecipe8")) obj_inventory.crull_recipe[8] = _loadEntity.crullRecipe8;
		if (variable_struct_exists(_loadEntity,"crullRecipe9")) obj_inventory.crull_recipe[9] = _loadEntity.crullRecipe9;
		if (variable_struct_exists(_loadEntity,"crullRecipe10")) obj_inventory.crull_recipe[10] = _loadEntity.crullRecipe10;
		if (variable_struct_exists(_loadEntity,"crullRecipe11")) obj_inventory.crull_recipe[11] = _loadEntity.crullRecipe11;
		if (variable_struct_exists(_loadEntity,"crullRecipe12")) obj_inventory.crull_recipe[12] = _loadEntity.crullRecipe12;
		if (variable_struct_exists(_loadEntity,"crullRecipe13")) obj_inventory.crull_recipe[13] = _loadEntity.crullRecipe13;
		if (variable_struct_exists(_loadEntity,"crullRecipe14")) obj_inventory.crull_recipe[14] = _loadEntity.crullRecipe14;
		if (variable_struct_exists(_loadEntity,"crullRecipe15")) obj_inventory.crull_recipe[15] = _loadEntity.crullRecipe15;
		if (variable_struct_exists(_loadEntity,"crullRecipe16")) obj_inventory.crull_recipe[16] = _loadEntity.crullRecipe16;
		if (variable_struct_exists(_loadEntity,"crullRecipe17")) obj_inventory.crull_recipe[17] = _loadEntity.crullRecipe17;


}
//
//
//
//
//
//Save Player Inventory
//Path: obj_game > event Key Pressed "S"
function SaveInventory(_saveData){
	
var _saveInv = 
{
	//Save Inventory Stats - Old
	itemSlots : obj_inventory.item_slots,
	
	//Unique Items
	starOrbs : obj_inventory.star_orb,
	beans : obj_inventory.beans,
	
	//Save Rog Stone
	rogArray0 : obj_inventory.rog_array[0],
	rogArray1 : obj_inventory.rog_array[1],
	rogArray2 : obj_inventory.rog_array[2],
	rogArray3 : obj_inventory.rog_array[3],
	rogArray4 : obj_inventory.rog_array[4],
	rogArray5 : obj_inventory.rog_array[5],
	
	crullRecipe0 : obj_inventory.crull_recipe[0],
	crullRecipe1 : obj_inventory.crull_recipe[1],
	crullRecipe2 : obj_inventory.crull_recipe[2],
	crullRecipe3 : obj_inventory.crull_recipe[3],
	crullRecipe4 : obj_inventory.crull_recipe[4],
	crullRecipe5 : obj_inventory.crull_recipe[5],
	crullRecipe6 : obj_inventory.crull_recipe[6],
	crullRecipe7 : obj_inventory.crull_recipe[7],
	crullRecipe8 : obj_inventory.crull_recipe[8],
	crullRecipe9 : obj_inventory.crull_recipe[9],
	crullRecipe10 : obj_inventory.crull_recipe[10],
	crullRecipe11 : obj_inventory.crull_recipe[11],
	crullRecipe12 : obj_inventory.crull_recipe[12],
	crullRecipe13 : obj_inventory.crull_recipe[13],
	crullRecipe14 : obj_inventory.crull_recipe[14],
	crullRecipe15 : obj_inventory.crull_recipe[15],
	crullRecipe16 : obj_inventory.crull_recipe[16],
	crullRecipe17 : obj_inventory.crull_recipe[17],

	
	
	//Save Power Stone
	psArray0 : obj_inventory.ps_array[0],
	psArray1 : obj_inventory.ps_array[1],
	psArray2 : obj_inventory.ps_array[2],
	psArray3 : obj_inventory.ps_array[3],
	psArray4 : obj_inventory.ps_array[4],
	psArray5 : obj_inventory.ps_array[5],
	psArray6 : obj_inventory.ps_array[6],
	psArray7 : obj_inventory.ps_array[7],
	psArray8 : obj_inventory.ps_array[8],
	psArray9 : obj_inventory.ps_array[9],
	
	//Book Array
	
	//Fish Array
	
	//Minigame Array
}
array_push(_saveData, _saveInv);
}


