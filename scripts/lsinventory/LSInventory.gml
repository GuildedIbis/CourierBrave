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
		
		//Load Inventory Slots
		if (variable_struct_exists(_loadEntity,"item00")) obj_inventory.item_grid[# 0, 0] = _loadEntity.item00;
		if (variable_struct_exists(_loadEntity,"item01")) obj_inventory.item_grid[# 0, 1] = _loadEntity.item01;
		if (variable_struct_exists(_loadEntity,"item02")) obj_inventory.item_grid[# 0, 2] = _loadEntity.item02;
		if (variable_struct_exists(_loadEntity,"item03")) obj_inventory.item_grid[# 0, 3] = _loadEntity.item03;
		if (variable_struct_exists(_loadEntity,"item10")) obj_inventory.item_grid[# 1, 0] = _loadEntity.item10;
		if (variable_struct_exists(_loadEntity,"item11")) obj_inventory.item_grid[# 1, 1] = _loadEntity.item11;
		if (variable_struct_exists(_loadEntity,"item12")) obj_inventory.item_grid[# 1, 2] = _loadEntity.item12;
		if (variable_struct_exists(_loadEntity,"item13")) obj_inventory.item_grid[# 1, 3] = _loadEntity.item13;
		if (variable_struct_exists(_loadEntity,"item20")) obj_inventory.item_grid[# 2, 0] = _loadEntity.item20;
		if (variable_struct_exists(_loadEntity,"item21")) obj_inventory.item_grid[# 2, 1] = _loadEntity.item21;
		if (variable_struct_exists(_loadEntity,"item22")) obj_inventory.item_grid[# 2, 2] = _loadEntity.item22;
		if (variable_struct_exists(_loadEntity,"item23")) obj_inventory.item_grid[# 2, 3] = _loadEntity.item23;
		if (variable_struct_exists(_loadEntity,"item30")) obj_inventory.item_grid[# 3, 0] = _loadEntity.item30;
		if (variable_struct_exists(_loadEntity,"item31")) obj_inventory.item_grid[# 3, 1] = _loadEntity.item31;
		if (variable_struct_exists(_loadEntity,"item32")) obj_inventory.item_grid[# 3, 2] = _loadEntity.item32;
		if (variable_struct_exists(_loadEntity,"item33")) obj_inventory.item_grid[# 3, 3] = _loadEntity.item33;
		if (variable_struct_exists(_loadEntity,"item40")) obj_inventory.item_grid[# 4, 0] = _loadEntity.item40;
		if (variable_struct_exists(_loadEntity,"item41")) obj_inventory.item_grid[# 4, 1] = _loadEntity.item41;
		if (variable_struct_exists(_loadEntity,"item42")) obj_inventory.item_grid[# 4, 2] = _loadEntity.item42;
		if (variable_struct_exists(_loadEntity,"item43")) obj_inventory.item_grid[# 4, 3] = _loadEntity.item43;
		if (variable_struct_exists(_loadEntity,"item50")) obj_inventory.item_grid[# 5, 0] = _loadEntity.item50;
		if (variable_struct_exists(_loadEntity,"item51")) obj_inventory.item_grid[# 5, 1] = _loadEntity.item51;
		if (variable_struct_exists(_loadEntity,"item52")) obj_inventory.item_grid[# 5, 2] = _loadEntity.item52;
		if (variable_struct_exists(_loadEntity,"item53")) obj_inventory.item_grid[# 5, 3] = _loadEntity.item53;
		if (variable_struct_exists(_loadEntity,"item60")) obj_inventory.item_grid[# 6, 0] = _loadEntity.item60;
		if (variable_struct_exists(_loadEntity,"item61")) obj_inventory.item_grid[# 6, 1] = _loadEntity.item61;
		if (variable_struct_exists(_loadEntity,"item62")) obj_inventory.item_grid[# 6, 2] = _loadEntity.item62;
		if (variable_struct_exists(_loadEntity,"item63")) obj_inventory.item_grid[# 6, 3] = _loadEntity.item63;
		if (variable_struct_exists(_loadEntity,"item70")) obj_inventory.item_grid[# 7, 0] = _loadEntity.item70;
		if (variable_struct_exists(_loadEntity,"item71")) obj_inventory.item_grid[# 7, 1] = _loadEntity.item71;
		if (variable_struct_exists(_loadEntity,"item72")) obj_inventory.item_grid[# 7, 2] = _loadEntity.item72;
		if (variable_struct_exists(_loadEntity,"item73")) obj_inventory.item_grid[# 7, 3] = _loadEntity.item73;
		if (variable_struct_exists(_loadEntity,"item80")) obj_inventory.item_grid[# 8, 0] = _loadEntity.item80;
		if (variable_struct_exists(_loadEntity,"item81")) obj_inventory.item_grid[# 8, 1] = _loadEntity.item81;
		if (variable_struct_exists(_loadEntity,"item82")) obj_inventory.item_grid[# 8, 2] = _loadEntity.item82;
		if (variable_struct_exists(_loadEntity,"item83")) obj_inventory.item_grid[# 8, 3] = _loadEntity.item83;
		if (variable_struct_exists(_loadEntity,"item90")) obj_inventory.item_grid[# 9, 0] = _loadEntity.item90;
		if (variable_struct_exists(_loadEntity,"item91")) obj_inventory.item_grid[# 9, 1] = _loadEntity.item91;
		if (variable_struct_exists(_loadEntity,"item92")) obj_inventory.item_grid[# 9, 2] = _loadEntity.item92;
		if (variable_struct_exists(_loadEntity,"item93")) obj_inventory.item_grid[# 9, 3] = _loadEntity.item93;
		if (variable_struct_exists(_loadEntity,"item100")) obj_inventory.item_grid[# 10, 0] = _loadEntity.item100;
		if (variable_struct_exists(_loadEntity,"item101")) obj_inventory.item_grid[# 10, 1] = _loadEntity.item101;
		if (variable_struct_exists(_loadEntity,"item102")) obj_inventory.item_grid[# 10, 2] = _loadEntity.item102;
		if (variable_struct_exists(_loadEntity,"item103")) obj_inventory.item_grid[# 10, 3] = _loadEntity.item103;
		if (variable_struct_exists(_loadEntity,"item110")) obj_inventory.item_grid[# 11, 0] = _loadEntity.item110;
		if (variable_struct_exists(_loadEntity,"item111")) obj_inventory.item_grid[# 11, 1] = _loadEntity.item111;
		if (variable_struct_exists(_loadEntity,"item112")) obj_inventory.item_grid[# 11, 2] = _loadEntity.item112;
		if (variable_struct_exists(_loadEntity,"item113")) obj_inventory.item_grid[# 11, 3] = _loadEntity.item113;
		if (variable_struct_exists(_loadEntity,"item120")) obj_inventory.item_grid[# 12, 0] = _loadEntity.item120;
		if (variable_struct_exists(_loadEntity,"item121")) obj_inventory.item_grid[# 12, 1] = _loadEntity.item121;
		if (variable_struct_exists(_loadEntity,"item122")) obj_inventory.item_grid[# 12, 2] = _loadEntity.item122;
		if (variable_struct_exists(_loadEntity,"item123")) obj_inventory.item_grid[# 12, 3] = _loadEntity.item123;
		if (variable_struct_exists(_loadEntity,"item130")) obj_inventory.item_grid[# 13, 0] = _loadEntity.item130;
		if (variable_struct_exists(_loadEntity,"item131")) obj_inventory.item_grid[# 13, 1] = _loadEntity.item131;
		if (variable_struct_exists(_loadEntity,"item132")) obj_inventory.item_grid[# 13, 2] = _loadEntity.item132;
		if (variable_struct_exists(_loadEntity,"item133")) obj_inventory.item_grid[# 13, 3] = _loadEntity.item133;
		if (variable_struct_exists(_loadEntity,"item140")) obj_inventory.item_grid[# 14, 0] = _loadEntity.item140;
		if (variable_struct_exists(_loadEntity,"item141")) obj_inventory.item_grid[# 14, 1] = _loadEntity.item141;
		if (variable_struct_exists(_loadEntity,"item142")) obj_inventory.item_grid[# 14, 2] = _loadEntity.item142;
		if (variable_struct_exists(_loadEntity,"item143")) obj_inventory.item_grid[# 14, 3] = _loadEntity.item143;
		if (variable_struct_exists(_loadEntity,"item150")) obj_inventory.item_grid[# 15, 0] = _loadEntity.item150;
		if (variable_struct_exists(_loadEntity,"item151")) obj_inventory.item_grid[# 15, 1] = _loadEntity.item151;
		if (variable_struct_exists(_loadEntity,"item152")) obj_inventory.item_grid[# 15, 2] = _loadEntity.item152;
		if (variable_struct_exists(_loadEntity,"item153")) obj_inventory.item_grid[# 15, 3] = _loadEntity.item153;
		if (variable_struct_exists(_loadEntity,"item160")) obj_inventory.item_grid[# 16, 0] = _loadEntity.item160;
		if (variable_struct_exists(_loadEntity,"item161")) obj_inventory.item_grid[# 16, 1] = _loadEntity.item161;
		if (variable_struct_exists(_loadEntity,"item162")) obj_inventory.item_grid[# 16, 2] = _loadEntity.item162;
		if (variable_struct_exists(_loadEntity,"item163")) obj_inventory.item_grid[# 16, 3] = _loadEntity.item163;
		if (variable_struct_exists(_loadEntity,"item170")) obj_inventory.item_grid[# 17, 0] = _loadEntity.item170;
		if (variable_struct_exists(_loadEntity,"item171")) obj_inventory.item_grid[# 17, 1] = _loadEntity.item171;
		if (variable_struct_exists(_loadEntity,"item172")) obj_inventory.item_grid[# 17, 2] = _loadEntity.item172;
		if (variable_struct_exists(_loadEntity,"item173")) obj_inventory.item_grid[# 17, 3] = _loadEntity.item173;
		if (variable_struct_exists(_loadEntity,"item180")) obj_inventory.item_grid[# 18, 0] = _loadEntity.item180;
		if (variable_struct_exists(_loadEntity,"item181")) obj_inventory.item_grid[# 18, 1] = _loadEntity.item181;
		if (variable_struct_exists(_loadEntity,"item182")) obj_inventory.item_grid[# 18, 2] = _loadEntity.item182;
		if (variable_struct_exists(_loadEntity,"item183")) obj_inventory.item_grid[# 18, 3] = _loadEntity.item183;
		if (variable_struct_exists(_loadEntity,"item190")) obj_inventory.item_grid[# 19, 0] = _loadEntity.item190;
		if (variable_struct_exists(_loadEntity,"item191")) obj_inventory.item_grid[# 19, 1] = _loadEntity.item191;
		if (variable_struct_exists(_loadEntity,"item192")) obj_inventory.item_grid[# 19, 2] = _loadEntity.item192;
		if (variable_struct_exists(_loadEntity,"item193")) obj_inventory.item_grid[# 19, 3] = _loadEntity.item193;
		if (variable_struct_exists(_loadEntity,"item200")) obj_inventory.item_grid[# 20, 0] = _loadEntity.item200;
		if (variable_struct_exists(_loadEntity,"item201")) obj_inventory.item_grid[# 20, 1] = _loadEntity.item201;
		if (variable_struct_exists(_loadEntity,"item202")) obj_inventory.item_grid[# 20, 2] = _loadEntity.item202;
		if (variable_struct_exists(_loadEntity,"item203")) obj_inventory.item_grid[# 20, 3] = _loadEntity.item203;
		if (variable_struct_exists(_loadEntity,"item210")) obj_inventory.item_grid[# 21, 0] = _loadEntity.item210;
		if (variable_struct_exists(_loadEntity,"item211")) obj_inventory.item_grid[# 21, 1] = _loadEntity.item211;
		if (variable_struct_exists(_loadEntity,"item212")) obj_inventory.item_grid[# 21, 2] = _loadEntity.item212;
		if (variable_struct_exists(_loadEntity,"item213")) obj_inventory.item_grid[# 21, 3] = _loadEntity.item213;
		if (variable_struct_exists(_loadEntity,"item220")) obj_inventory.item_grid[# 22, 0] = _loadEntity.item220;
		if (variable_struct_exists(_loadEntity,"item221")) obj_inventory.item_grid[# 22, 1] = _loadEntity.item221;
		if (variable_struct_exists(_loadEntity,"item222")) obj_inventory.item_grid[# 22, 2] = _loadEntity.item222;
		if (variable_struct_exists(_loadEntity,"item223")) obj_inventory.item_grid[# 22, 3] = _loadEntity.item223;
		if (variable_struct_exists(_loadEntity,"item230")) obj_inventory.item_grid[# 23, 0] = _loadEntity.item230;
		if (variable_struct_exists(_loadEntity,"item231")) obj_inventory.item_grid[# 23, 1] = _loadEntity.item231;
		if (variable_struct_exists(_loadEntity,"item232")) obj_inventory.item_grid[# 23, 2] = _loadEntity.item232;
		if (variable_struct_exists(_loadEntity,"item233")) obj_inventory.item_grid[# 23, 3] = _loadEntity.item233;
		if (variable_struct_exists(_loadEntity,"item240")) obj_inventory.item_grid[# 24, 0] = _loadEntity.item240;
		if (variable_struct_exists(_loadEntity,"item241")) obj_inventory.item_grid[# 24, 1] = _loadEntity.item241;
		if (variable_struct_exists(_loadEntity,"item242")) obj_inventory.item_grid[# 24, 2] = _loadEntity.item242;
		if (variable_struct_exists(_loadEntity,"item243")) obj_inventory.item_grid[# 24, 3] = _loadEntity.item243;
		if (variable_struct_exists(_loadEntity,"item250")) obj_inventory.item_grid[# 25, 0] = _loadEntity.item250;
		if (variable_struct_exists(_loadEntity,"item251")) obj_inventory.item_grid[# 25, 1] = _loadEntity.item251;
		if (variable_struct_exists(_loadEntity,"item252")) obj_inventory.item_grid[# 25, 2] = _loadEntity.item252;
		if (variable_struct_exists(_loadEntity,"item253")) obj_inventory.item_grid[# 25, 3] = _loadEntity.item253;
		if (variable_struct_exists(_loadEntity,"item260")) obj_inventory.item_grid[# 26, 0] = _loadEntity.item260;
		if (variable_struct_exists(_loadEntity,"item261")) obj_inventory.item_grid[# 26, 1] = _loadEntity.item261;
		if (variable_struct_exists(_loadEntity,"item262")) obj_inventory.item_grid[# 26, 2] = _loadEntity.item262;
		if (variable_struct_exists(_loadEntity,"item263")) obj_inventory.item_grid[# 26, 3] = _loadEntity.item263;
		if (variable_struct_exists(_loadEntity,"item270")) obj_inventory.item_grid[# 27, 0] = _loadEntity.item270;
		if (variable_struct_exists(_loadEntity,"item271")) obj_inventory.item_grid[# 27, 1] = _loadEntity.item271;
		if (variable_struct_exists(_loadEntity,"item272")) obj_inventory.item_grid[# 27, 2] = _loadEntity.item272;
		if (variable_struct_exists(_loadEntity,"item273")) obj_inventory.item_grid[# 27, 3] = _loadEntity.item273;
		if (variable_struct_exists(_loadEntity,"item280")) obj_inventory.item_grid[# 28, 0] = _loadEntity.item280;
		if (variable_struct_exists(_loadEntity,"item281")) obj_inventory.item_grid[# 28, 1] = _loadEntity.item281;
		if (variable_struct_exists(_loadEntity,"item282")) obj_inventory.item_grid[# 28, 2] = _loadEntity.item282;
		if (variable_struct_exists(_loadEntity,"item283")) obj_inventory.item_grid[# 28, 3] = _loadEntity.item283;
		if (variable_struct_exists(_loadEntity,"item290")) obj_inventory.item_grid[# 29, 0] = _loadEntity.item290;
		if (variable_struct_exists(_loadEntity,"item291")) obj_inventory.item_grid[# 29, 1] = _loadEntity.item291;
		if (variable_struct_exists(_loadEntity,"item292")) obj_inventory.item_grid[# 29, 2] = _loadEntity.item292;
		if (variable_struct_exists(_loadEntity,"item293")) obj_inventory.item_grid[# 29, 3] = _loadEntity.item293;
		if (variable_struct_exists(_loadEntity,"item300")) obj_inventory.item_grid[# 30, 0] = _loadEntity.item300;
		if (variable_struct_exists(_loadEntity,"item301")) obj_inventory.item_grid[# 30, 1] = _loadEntity.item301;
		if (variable_struct_exists(_loadEntity,"item302")) obj_inventory.item_grid[# 30, 2] = _loadEntity.item302;
		if (variable_struct_exists(_loadEntity,"item303")) obj_inventory.item_grid[# 30, 3] = _loadEntity.item303;
		if (variable_struct_exists(_loadEntity,"item310")) obj_inventory.item_grid[# 31, 0] = _loadEntity.item310;
		if (variable_struct_exists(_loadEntity,"item311")) obj_inventory.item_grid[# 31, 1] = _loadEntity.item311;
		if (variable_struct_exists(_loadEntity,"item312")) obj_inventory.item_grid[# 31, 2] = _loadEntity.item312;
		if (variable_struct_exists(_loadEntity,"item313")) obj_inventory.item_grid[# 31, 3] = _loadEntity.item313;
		if (variable_struct_exists(_loadEntity,"item320")) obj_inventory.item_grid[# 32, 0] = _loadEntity.item320;
		if (variable_struct_exists(_loadEntity,"item321")) obj_inventory.item_grid[# 32, 1] = _loadEntity.item321;
		if (variable_struct_exists(_loadEntity,"item322")) obj_inventory.item_grid[# 32, 2] = _loadEntity.item322;
		if (variable_struct_exists(_loadEntity,"item323")) obj_inventory.item_grid[# 32, 3] = _loadEntity.item323;
		if (variable_struct_exists(_loadEntity,"item330")) obj_inventory.item_grid[# 33, 0] = _loadEntity.item330;
		if (variable_struct_exists(_loadEntity,"item331")) obj_inventory.item_grid[# 33, 1] = _loadEntity.item331;
		if (variable_struct_exists(_loadEntity,"item332")) obj_inventory.item_grid[# 33, 2] = _loadEntity.item332;
		if (variable_struct_exists(_loadEntity,"item333")) obj_inventory.item_grid[# 33, 3] = _loadEntity.item333;
		if (variable_struct_exists(_loadEntity,"item340")) obj_inventory.item_grid[# 34, 0] = _loadEntity.item340;
		if (variable_struct_exists(_loadEntity,"item341")) obj_inventory.item_grid[# 34, 1] = _loadEntity.item341;
		if (variable_struct_exists(_loadEntity,"item342")) obj_inventory.item_grid[# 34, 2] = _loadEntity.item342;
		if (variable_struct_exists(_loadEntity,"item343")) obj_inventory.item_grid[# 34, 3] = _loadEntity.item343;
		if (variable_struct_exists(_loadEntity,"item350")) obj_inventory.item_grid[# 35, 0] = _loadEntity.item350;
		if (variable_struct_exists(_loadEntity,"item351")) obj_inventory.item_grid[# 35, 1] = _loadEntity.item351;
		if (variable_struct_exists(_loadEntity,"item352")) obj_inventory.item_grid[# 35, 2] = _loadEntity.item352;
		if (variable_struct_exists(_loadEntity,"item353")) obj_inventory.item_grid[# 35, 3] = _loadEntity.item353;
		if (variable_struct_exists(_loadEntity,"item360")) obj_inventory.item_grid[# 36, 0] = _loadEntity.item360;
		if (variable_struct_exists(_loadEntity,"item361")) obj_inventory.item_grid[# 36, 1] = _loadEntity.item361;
		if (variable_struct_exists(_loadEntity,"item362")) obj_inventory.item_grid[# 36, 2] = _loadEntity.item362;
		if (variable_struct_exists(_loadEntity,"item363")) obj_inventory.item_grid[# 36, 3] = _loadEntity.item363;
		if (variable_struct_exists(_loadEntity,"item370")) obj_inventory.item_grid[# 37, 0] = _loadEntity.item370;
		if (variable_struct_exists(_loadEntity,"item371")) obj_inventory.item_grid[# 37, 1] = _loadEntity.item371;
		if (variable_struct_exists(_loadEntity,"item372")) obj_inventory.item_grid[# 37, 2] = _loadEntity.item372;
		if (variable_struct_exists(_loadEntity,"item373")) obj_inventory.item_grid[# 37, 3] = _loadEntity.item373;
		if (variable_struct_exists(_loadEntity,"item380")) obj_inventory.item_grid[# 38, 0] = _loadEntity.item380;
		if (variable_struct_exists(_loadEntity,"item381")) obj_inventory.item_grid[# 38, 1] = _loadEntity.item381;
		if (variable_struct_exists(_loadEntity,"item382")) obj_inventory.item_grid[# 38, 2] = _loadEntity.item382;
		if (variable_struct_exists(_loadEntity,"item383")) obj_inventory.item_grid[# 38, 3] = _loadEntity.item383;
		if (variable_struct_exists(_loadEntity,"item390")) obj_inventory.item_grid[# 39, 0] = _loadEntity.item390;
		if (variable_struct_exists(_loadEntity,"item391")) obj_inventory.item_grid[# 39, 1] = _loadEntity.item391;
		if (variable_struct_exists(_loadEntity,"item392")) obj_inventory.item_grid[# 39, 2] = _loadEntity.item392;
		if (variable_struct_exists(_loadEntity,"item393")) obj_inventory.item_grid[# 39, 3] = _loadEntity.item393;

		//Storage
		if (variable_struct_exists(_loadEntity,"storage0")) obj_inventory.storage_array[0] = _loadEntity.storage0;
		if (variable_struct_exists(_loadEntity,"storage1")) obj_inventory.storage_array[1] = _loadEntity.storage1;
		if (variable_struct_exists(_loadEntity,"storage2")) obj_inventory.storage_array[2] = _loadEntity.storage2;
		if (variable_struct_exists(_loadEntity,"storage3")) obj_inventory.storage_array[3] = _loadEntity.storage3;
		if (variable_struct_exists(_loadEntity,"storage4")) obj_inventory.storage_array[4] = _loadEntity.storage4;
		if (variable_struct_exists(_loadEntity,"storage5")) obj_inventory.storage_array[5] = _loadEntity.storage5;
		if (variable_struct_exists(_loadEntity,"storage6")) obj_inventory.storage_array[6] = _loadEntity.storage6;
		if (variable_struct_exists(_loadEntity,"storage7")) obj_inventory.storage_array[7] = _loadEntity.storage7;
		if (variable_struct_exists(_loadEntity,"storage8")) obj_inventory.storage_array[8] = _loadEntity.storage8;
		if (variable_struct_exists(_loadEntity,"storage9")) obj_inventory.storage_array[9] = _loadEntity.storage9;
		if (variable_struct_exists(_loadEntity,"storage10")) obj_inventory.storage_array[10] = _loadEntity.storage10;
		if (variable_struct_exists(_loadEntity,"storage11")) obj_inventory.storage_array[11] = _loadEntity.storage11;
		if (variable_struct_exists(_loadEntity,"storage12")) obj_inventory.storage_array[12] = _loadEntity.storage12;
		if (variable_struct_exists(_loadEntity,"storage13")) obj_inventory.storage_array[13] = _loadEntity.storage13;
		if (variable_struct_exists(_loadEntity,"storage14")) obj_inventory.storage_array[14] = _loadEntity.storage14;
		if (variable_struct_exists(_loadEntity,"storage15")) obj_inventory.storage_array[15] = _loadEntity.storage15;
		if (variable_struct_exists(_loadEntity,"storage16")) obj_inventory.storage_array[16] = _loadEntity.storage16;
		if (variable_struct_exists(_loadEntity,"storage17")) obj_inventory.storage_array[17] = _loadEntity.storage17;
		if (variable_struct_exists(_loadEntity,"storage18")) obj_inventory.storage_array[18] = _loadEntity.storage18;
		if (variable_struct_exists(_loadEntity,"storage19")) obj_inventory.storage_array[19] = _loadEntity.storage19;
		
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
	//Save Inventory Stats
	itemSlots : obj_inventory.item_slots,
	
	//Save Inventory Slots
	item00 : obj_inventory.item_grid[# 0, 0],
	item01 : obj_inventory.item_grid[# 0, 1],
	item02 : obj_inventory.item_grid[# 0, 2],
	item03 : obj_inventory.item_grid[# 0, 3],
	item10 : obj_inventory.item_grid[# 1, 0],
	item11 : obj_inventory.item_grid[# 1, 1],
	item12 : obj_inventory.item_grid[# 1, 2],
	item13 : obj_inventory.item_grid[# 1, 3],
	item20 : obj_inventory.item_grid[# 2, 0],
	item21 : obj_inventory.item_grid[# 2, 1],
	item22 : obj_inventory.item_grid[# 2, 2],
	item23 : obj_inventory.item_grid[# 2, 3],
	item30 : obj_inventory.item_grid[# 3, 0],
	item31 : obj_inventory.item_grid[# 3, 1],
	item32 : obj_inventory.item_grid[# 3, 2],
	item33 : obj_inventory.item_grid[# 3, 3],
	item40 : obj_inventory.item_grid[# 4, 0],
	item41 : obj_inventory.item_grid[# 4, 1],
	item42 : obj_inventory.item_grid[# 4, 2],
	item43 : obj_inventory.item_grid[# 4, 3],
	item50 : obj_inventory.item_grid[# 5, 0],
	item51 : obj_inventory.item_grid[# 5, 1],
	item52 : obj_inventory.item_grid[# 5, 2],
	item53 : obj_inventory.item_grid[# 5, 3],	
	item60 : obj_inventory.item_grid[# 6, 0],
	item61 : obj_inventory.item_grid[# 6, 1],
	item62 : obj_inventory.item_grid[# 6, 2],
	item63 : obj_inventory.item_grid[# 6, 3],
	item70 : obj_inventory.item_grid[# 7, 0],
	item71 : obj_inventory.item_grid[# 7, 1],
	item72 : obj_inventory.item_grid[# 7, 2],
	item73 : obj_inventory.item_grid[# 7, 3],
	item80 : obj_inventory.item_grid[# 8, 0],
	item81 : obj_inventory.item_grid[# 8, 1],
	item82 : obj_inventory.item_grid[# 8, 2],
	item83 : obj_inventory.item_grid[# 8, 3],
	item90 : obj_inventory.item_grid[# 9, 0],
	item91 : obj_inventory.item_grid[# 9, 1],
	item92 : obj_inventory.item_grid[# 9, 2],
	item93 : obj_inventory.item_grid[# 9, 3],
	item100 : obj_inventory.item_grid[# 10, 0],
	item101 : obj_inventory.item_grid[# 10, 1],
	item102 : obj_inventory.item_grid[# 10, 2],
	item103 : obj_inventory.item_grid[# 10, 3],
	item110 : obj_inventory.item_grid[# 11, 0],
	item111 : obj_inventory.item_grid[# 11, 1],
	item112 : obj_inventory.item_grid[# 11, 2],
	item113 : obj_inventory.item_grid[# 11, 3],
	item120 : obj_inventory.item_grid[# 12, 0],
	item121 : obj_inventory.item_grid[# 12, 1],
	item122 : obj_inventory.item_grid[# 12, 2],
	item123 : obj_inventory.item_grid[# 12, 3],
	item130 : obj_inventory.item_grid[# 13, 0],
	item131 : obj_inventory.item_grid[# 13, 1],
	item132 : obj_inventory.item_grid[# 13, 2],
	item133 : obj_inventory.item_grid[# 13, 3],
	item140 : obj_inventory.item_grid[# 14, 0],
	item141 : obj_inventory.item_grid[# 14, 1],
	item142 : obj_inventory.item_grid[# 14, 2],
	item143 : obj_inventory.item_grid[# 14, 3],
	item150 : obj_inventory.item_grid[# 15, 0],
	item151 : obj_inventory.item_grid[# 15, 1],
	item152 : obj_inventory.item_grid[# 15, 2],
	item153 : obj_inventory.item_grid[# 15, 3],	
	item160 : obj_inventory.item_grid[# 16, 0],
	item161 : obj_inventory.item_grid[# 16, 1],
	item162 : obj_inventory.item_grid[# 16, 2],
	item163 : obj_inventory.item_grid[# 16, 3],
	item170 : obj_inventory.item_grid[# 17, 0],
	item171 : obj_inventory.item_grid[# 17, 1],
	item172 : obj_inventory.item_grid[# 17, 2],
	item173 : obj_inventory.item_grid[# 17, 3],
	item180 : obj_inventory.item_grid[# 18, 0],
	item181 : obj_inventory.item_grid[# 18, 1],
	item182 : obj_inventory.item_grid[# 18, 2],
	item183 : obj_inventory.item_grid[# 18, 3],
	item190 : obj_inventory.item_grid[# 19, 0],
	item191 : obj_inventory.item_grid[# 19, 1],
	item192 : obj_inventory.item_grid[# 19, 2],
	item193 : obj_inventory.item_grid[# 19, 3],
	item200 : obj_inventory.item_grid[# 20, 0],
	item201 : obj_inventory.item_grid[# 20, 1],
	item202 : obj_inventory.item_grid[# 20, 2],
	item203 : obj_inventory.item_grid[# 20, 3],
	item210 : obj_inventory.item_grid[# 21, 0],
	item211 : obj_inventory.item_grid[# 21, 1],
	item212 : obj_inventory.item_grid[# 21, 2],
	item213 : obj_inventory.item_grid[# 21, 3],
	item220 : obj_inventory.item_grid[# 22, 0],
	item221 : obj_inventory.item_grid[# 22, 1],
	item222 : obj_inventory.item_grid[# 22, 2],
	item223 : obj_inventory.item_grid[# 22, 3],
	item230 : obj_inventory.item_grid[# 23, 0],
	item231 : obj_inventory.item_grid[# 23, 1],
	item232 : obj_inventory.item_grid[# 23, 2],
	item233 : obj_inventory.item_grid[# 23, 3],
	item240 : obj_inventory.item_grid[# 24, 0],
	item241 : obj_inventory.item_grid[# 24, 1],
	item242 : obj_inventory.item_grid[# 24, 2],
	item243 : obj_inventory.item_grid[# 24, 3],
	item250 : obj_inventory.item_grid[# 25, 0],
	item251 : obj_inventory.item_grid[# 25, 1],
	item252 : obj_inventory.item_grid[# 25, 2],
	item253 : obj_inventory.item_grid[# 25, 3],	
	item260 : obj_inventory.item_grid[# 26, 0],
	item261 : obj_inventory.item_grid[# 26, 1],
	item262 : obj_inventory.item_grid[# 26, 2],
	item263 : obj_inventory.item_grid[# 26, 3],
	item270 : obj_inventory.item_grid[# 27, 0],
	item271 : obj_inventory.item_grid[# 27, 1],
	item272 : obj_inventory.item_grid[# 27, 2],
	item273 : obj_inventory.item_grid[# 27, 3],
	item280 : obj_inventory.item_grid[# 28, 0],
	item281 : obj_inventory.item_grid[# 28, 1],
	item282 : obj_inventory.item_grid[# 28, 2],
	item283 : obj_inventory.item_grid[# 28, 3],
	item290 : obj_inventory.item_grid[# 29, 0],
	item291 : obj_inventory.item_grid[# 29, 1],
	item292 : obj_inventory.item_grid[# 29, 2],
	item293 : obj_inventory.item_grid[# 29, 3],
	item300 : obj_inventory.item_grid[# 30, 0],
	item301 : obj_inventory.item_grid[# 30, 1],
	item302 : obj_inventory.item_grid[# 30, 2],
	item303 : obj_inventory.item_grid[# 30, 3],
	item310 : obj_inventory.item_grid[# 31, 0],
	item311 : obj_inventory.item_grid[# 31, 1],
	item312 : obj_inventory.item_grid[# 31, 2],
	item313 : obj_inventory.item_grid[# 31, 3],
	item320 : obj_inventory.item_grid[# 32, 0],
	item321 : obj_inventory.item_grid[# 32, 1],
	item322 : obj_inventory.item_grid[# 32, 2],
	item323 : obj_inventory.item_grid[# 32, 3],
	item330 : obj_inventory.item_grid[# 33, 0],
	item331 : obj_inventory.item_grid[# 33, 1],
	item332 : obj_inventory.item_grid[# 33, 2],
	item333 : obj_inventory.item_grid[# 33, 3],
	item340 : obj_inventory.item_grid[# 34, 0],
	item341 : obj_inventory.item_grid[# 34, 1],
	item342 : obj_inventory.item_grid[# 34, 2],
	item343 : obj_inventory.item_grid[# 34, 3],
	item350 : obj_inventory.item_grid[# 35, 0],
	item351 : obj_inventory.item_grid[# 35, 1],
	item352 : obj_inventory.item_grid[# 35, 2],
	item353 : obj_inventory.item_grid[# 35, 3],	
	item360 : obj_inventory.item_grid[# 36, 0],
	item361 : obj_inventory.item_grid[# 36, 1],
	item362 : obj_inventory.item_grid[# 36, 2],
	item363 : obj_inventory.item_grid[# 36, 3],
	item370 : obj_inventory.item_grid[# 37, 0],
	item371 : obj_inventory.item_grid[# 37, 1],
	item372 : obj_inventory.item_grid[# 37, 2],
	item373 : obj_inventory.item_grid[# 37, 3],
	item380 : obj_inventory.item_grid[# 38, 0],
	item381 : obj_inventory.item_grid[# 38, 1],
	item382 : obj_inventory.item_grid[# 38, 2],
	item383 : obj_inventory.item_grid[# 38, 3],
	item390 : obj_inventory.item_grid[# 39, 0],
	item391 : obj_inventory.item_grid[# 39, 1],
	item392 : obj_inventory.item_grid[# 39, 2],
	item393 : obj_inventory.item_grid[# 39, 3],
	
	//Storage
	storage0 : obj_inventory.storage_array[0],
	storage1 : obj_inventory.storage_array[1],
	storage2 : obj_inventory.storage_array[2],
	storage3 : obj_inventory.storage_array[3],
	storage4 : obj_inventory.storage_array[4],
	storage5 : obj_inventory.storage_array[5],
	storage6 : obj_inventory.storage_array[6],
	storage7 : obj_inventory.storage_array[7],
	storage8 : obj_inventory.storage_array[8],
	storage9 : obj_inventory.storage_array[9],
	storage10 : obj_inventory.storage_array[10],
	storage11 : obj_inventory.storage_array[11],
	storage12 : obj_inventory.storage_array[12],
	storage13 : obj_inventory.storage_array[13],
	storage14 : obj_inventory.storage_array[14],
	storage15 : obj_inventory.storage_array[15],
	storage16 : obj_inventory.storage_array[16],
	storage17 : obj_inventory.storage_array[17],
	storage18 : obj_inventory.storage_array[18],
	storage19 : obj_inventory.storage_array[19],
	
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
}
array_push(_saveData, _saveInv);
}
