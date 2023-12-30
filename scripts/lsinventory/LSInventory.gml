//Load and Save Player Inventory
//
//
//
//
//
//Load Player Inventory
//Path: obj_game > event Key Pressed "L"
function xscr_load_inventory(_loadEntity){	
		
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
		//Load Resource Items
		if (variable_struct_exists(_loadEntity,"resource0")) obj_inventory.resource_array[0] = _loadEntity.resource0;
		if (variable_struct_exists(_loadEntity,"resource1")) obj_inventory.resource_array[1] = _loadEntity.resource1;
		if (variable_struct_exists(_loadEntity,"resource2")) obj_inventory.resource_array[2] = _loadEntity.resource2;
		if (variable_struct_exists(_loadEntity,"resource3")) obj_inventory.resource_array[3] = _loadEntity.resource3;
		if (variable_struct_exists(_loadEntity,"resource4")) obj_inventory.resource_array[4] = _loadEntity.resource4;
		if (variable_struct_exists(_loadEntity,"resource5")) obj_inventory.resource_array[5] = _loadEntity.resource5;
		if (variable_struct_exists(_loadEntity,"resource6")) obj_inventory.resource_array[6] = _loadEntity.resource6;
		if (variable_struct_exists(_loadEntity,"resource7")) obj_inventory.resource_array[7] = _loadEntity.resource7;
		if (variable_struct_exists(_loadEntity,"resource8")) obj_inventory.resource_array[8] = _loadEntity.resource8;
		if (variable_struct_exists(_loadEntity,"resource9")) obj_inventory.resource_array[9] = _loadEntity.resource9;
		if (variable_struct_exists(_loadEntity,"resource10")) obj_inventory.resource_array[10] = _loadEntity.resource10;
		if (variable_struct_exists(_loadEntity,"resource11")) obj_inventory.resource_array[11] = _loadEntity.resource11;
		if (variable_struct_exists(_loadEntity,"resource12")) obj_inventory.resource_array[12] = _loadEntity.resource12;
		if (variable_struct_exists(_loadEntity,"resource13")) obj_inventory.resource_array[13] = _loadEntity.resource13;
		if (variable_struct_exists(_loadEntity,"resource14")) obj_inventory.resource_array[14] = _loadEntity.resource14;
		if (variable_struct_exists(_loadEntity,"resource15")) obj_inventory.resource_array[15] = _loadEntity.resource15;
		if (variable_struct_exists(_loadEntity,"resource16")) obj_inventory.resource_array[16] = _loadEntity.resource16;
		if (variable_struct_exists(_loadEntity,"resource17")) obj_inventory.resource_array[17] = _loadEntity.resource17;
		if (variable_struct_exists(_loadEntity,"resource18")) obj_inventory.resource_array[18] = _loadEntity.resource18;
		if (variable_struct_exists(_loadEntity,"resource19")) obj_inventory.resource_array[19] = _loadEntity.resource19;
		//Load crystal Enchant Unlocks
		if (variable_struct_exists(_loadEntity,"crystalEnchant0")) obj_inventory.crystal_enchant[0] = _loadEntity.crystalEnchant0;//_loadEntity.crystalEnchant0;
		if (variable_struct_exists(_loadEntity,"crystalEnchant1")) obj_inventory.crystal_enchant[1] = true;
		if (variable_struct_exists(_loadEntity,"crystalEnchant2")) obj_inventory.crystal_enchant[2] = _loadEntity.crystalEnchant2;
		if (variable_struct_exists(_loadEntity,"crystalEnchant3")) obj_inventory.crystal_enchant[3] = _loadEntity.crystalEnchant3;
		if (variable_struct_exists(_loadEntity,"crystalEnchant4")) obj_inventory.crystal_enchant[4] = _loadEntity.crystalEnchant4;
		if (variable_struct_exists(_loadEntity,"crystalEnchant5")) obj_inventory.crystal_enchant[5] = _loadEntity.crystalEnchant5;
		if (variable_struct_exists(_loadEntity,"crystalEnchant6")) obj_inventory.crystal_enchant[6] = _loadEntity.crystalEnchant6;
		if (variable_struct_exists(_loadEntity,"crystalEnchant7")) obj_inventory.crystal_enchant[7] = _loadEntity.crystalEnchant7;
		if (variable_struct_exists(_loadEntity,"crystalEnchant8")) obj_inventory.crystal_enchant[8] = _loadEntity.crystalEnchant8;
		if (variable_struct_exists(_loadEntity,"crystalEnchant9")) obj_inventory.crystal_enchant[9] = _loadEntity.crystalEnchant9;
		if (variable_struct_exists(_loadEntity,"crystalEnchant10")) obj_inventory.crystal_enchant[10] = _loadEntity.crystalEnchant10;
		if (variable_struct_exists(_loadEntity,"crystalEnchant11")) obj_inventory.crystal_enchant[11] = _loadEntity.crystalEnchant11;
		if (variable_struct_exists(_loadEntity,"crystalEnchant12")) obj_inventory.crystal_enchant[12] = _loadEntity.crystalEnchant12;
		if (variable_struct_exists(_loadEntity,"crystalEnchant13")) obj_inventory.crystal_enchant[13] = _loadEntity.crystalEnchant13;
		if (variable_struct_exists(_loadEntity,"crystalEnchant14")) obj_inventory.crystal_enchant[14] = _loadEntity.crystalEnchant14;
		if (variable_struct_exists(_loadEntity,"crystalEnchant15")) obj_inventory.crystal_enchant[15] = _loadEntity.crystalEnchant15;
		if (variable_struct_exists(_loadEntity,"crystalEnchant16")) obj_inventory.crystal_enchant[16] = _loadEntity.crystalEnchant16;
		if (variable_struct_exists(_loadEntity,"crystalEnchant17")) obj_inventory.crystal_enchant[17] = _loadEntity.crystalEnchant17;


}
//
//
//
//
//
//Save Player Inventory
//Path: obj_game > event Key Pressed "S"
function xscr_save_inventory(_saveData){
	
var _saveInv = 
{
	
	//Save Rog Stone
	rogArray0 : obj_inventory.rog_array[0],
	rogArray1 : obj_inventory.rog_array[1],
	rogArray2 : obj_inventory.rog_array[2],
	rogArray3 : obj_inventory.rog_array[3],
	rogArray4 : obj_inventory.rog_array[4],
	rogArray5 : obj_inventory.rog_array[5],
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
	//Save Resources
	resource0 : obj_inventory.resource_array[0],
	resource1 : obj_inventory.resource_array[1],
	resource2 : obj_inventory.resource_array[2],
	resource3 : obj_inventory.resource_array[3],
	resource4 : obj_inventory.resource_array[4],
	resource5 : obj_inventory.resource_array[5],
	resource6 : obj_inventory.resource_array[6],
	resource7 : obj_inventory.resource_array[7],
	resource8 : obj_inventory.resource_array[8],
	resource9 : obj_inventory.resource_array[9],
	resource10 : obj_inventory.resource_array[10],
	resource11 : obj_inventory.resource_array[11],
	resource12 : obj_inventory.resource_array[12],
	resource13 : obj_inventory.resource_array[13],
	resource14 : obj_inventory.resource_array[14],
	resource15 : obj_inventory.resource_array[15],
	resource16 : obj_inventory.resource_array[16],
	resource17 : obj_inventory.resource_array[17],
	resource18 : obj_inventory.resource_array[18],
	resource19 : obj_inventory.resource_array[19],

	
	crystalEnchant0 : obj_inventory.crystal_enchant[0],
	crystalEnchant1 : obj_inventory.crystal_enchant[1],
	crystalEnchant2 : obj_inventory.crystal_enchant[2],
	crystalEnchant3 : obj_inventory.crystal_enchant[3],
	crystalEnchant4 : obj_inventory.crystal_enchant[4],
	crystalEnchant5 : obj_inventory.crystal_enchant[5],
	crystalEnchant6 : obj_inventory.crystal_enchant[6],
	crystalEnchant7 : obj_inventory.crystal_enchant[7],
	crystalEnchant8 : obj_inventory.crystal_enchant[8],
	crystalEnchant9 : obj_inventory.crystal_enchant[9],
	crystalEnchant10 : obj_inventory.crystal_enchant[10],
	crystalEnchant11 : obj_inventory.crystal_enchant[11],
	crystalEnchant12 : obj_inventory.crystal_enchant[12],
	crystalEnchant13 : obj_inventory.crystal_enchant[13],
	crystalEnchant14 : obj_inventory.crystal_enchant[14],
	crystalEnchant15 : obj_inventory.crystal_enchant[15],
	crystalEnchant16 : obj_inventory.crystal_enchant[16],
	crystalEnchant17 : obj_inventory.crystal_enchant[17],

	
	
	
}
array_push(_saveData, _saveInv);
}


