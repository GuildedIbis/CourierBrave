//All Things Concerning Items
//
//
//
//
//
//Items Reference
function xscr_game_items_create(){
//Beans is slot 0- this is made equal to the item_sprite with a locked icon as the 0 frame.
	
//global.items[# 0, 0]
//global.items[# 0, 1]
//global.items[# 0, 2]

//0: Name
//1: Sell Value
//2: Buy Value
global.items = ds_grid_create(100,4)
global.items[# 0, 0] = "Beans"
global.items[# 0, 1] = 0;
global.items[# 0, 2] = 0;
global.items[# 0, 3] = "Elusive, and yet everywhere.\nGold Beans aren't gold, they are something else.";
global.items[# 1, 0] = "Rat Teeth";
global.items[# 1, 1] = 5;
global.items[# 1, 2] = 30;
global.items[# 1, 3] = "Rats might have been Moros once.\nNow they are hateful killers.";
global.items[# 2, 0] = "Jade Essence";
global.items[# 2, 1] = 10;
global.items[# 2, 2] = 50;
global.items[# 2, 3] = "The essence of Lenko is in it's flora.\nTo receive it is a gift.";
global.items[# 3, 0] = "Gold Bits";
global.items[# 3, 1] = 75;
global.items[# 3, 2] = 1000;
global.items[# 3, 3] = "A crude currency for a crude race.\nIt's use and beauty deserve better.";
global.items[# 4, 0] = "Jewel Root";
global.items[# 4, 1] = 120;
global.items[# 4, 2] = 2700;
global.items[# 4, 3] = "";
global.items[# 5, 0] = "Rustrock Chunk";
global.items[# 5, 1] = 10;
global.items[# 5, 2] = 50;
global.items[# 5, 3] = "Rustrock made primative weapons once,\nand even still might reinforce a blade";
global.items[# 6, 0] = "Raw Silver";
global.items[# 6, 1] = 100;
global.items[# 6, 2] = 2000;
global.items[# 6, 3] = "";
global.items[# 7, 0] = "White String";
global.items[# 7, 1] = 10;
global.items[# 7, 2] = 50;
global.items[# 7, 3] = "";
global.items[# 8, 0] = "Void Key";
global.items[# 8, 1] = 15;
global.items[# 8, 2] = 100;
global.items[# 8, 3] = 100;
global.items[# 9, 0] = "TarbyPearl";
global.items[# 9, 1] = 100;
global.items[# 9, 2] = 2000;
global.items[# 9, 3] = "";
global.items[# 10, 0] = "Crude Ruby";
global.items[# 10, 1] = 50;
global.items[# 10, 2] = 500;
global.items[# 10, 3] = "";
global.items[# 11, 0] = "Eleven";
global.items[# 11, 1] = 120;
global.items[# 11, 2] = 2700;
global.items[# 11, 3] = "";
global.items[# 12, 0] = "Twelve";
global.items[# 12, 1] = 120;
global.items[# 12, 2] = 2700;
global.items[# 12, 3] = "";
global.items[# 13, 0] = "Thirteen";
global.items[# 13, 1] = 120;
global.items[# 13, 2] = 2700;
global.items[# 13, 3] = "";
global.items[# 14, 0] = "Crimson Rog Stone";
global.items[# 14, 1] = 0;
global.items[# 14, 2] = 5000;
global.items[# 14, 3] = "";
global.items[# 15, 0] = "Zephyr Rog Stone";
global.items[# 15, 1] = 0;
global.items[# 15, 2] = 5000;
global.items[# 15, 3] = "";
global.items[# 16, 0] = "Royal Rog Stone";
global.items[# 16, 1] = 0;
global.items[# 16, 2] = 5000;
global.items[# 16, 3] = "The scales of Eroylay\nlay in a coat of armor deep beneath Corila Sea";
global.items[# 17, 0] = "Amber Rog Stone";
global.items[# 17, 1] = 0;
global.items[# 17, 2] = 5000;
global.items[# 17, 3] = "Ameriol the was the first born Rog,\nancestor to Unundi the Last";
global.items[# 18, 0] = "Jade Rog Stone";
global.items[# 18, 1] = 0;
global.items[# 18, 2] = 5000;
global.items[# 18, 3] = "";
global.items[# 19, 0] = "Amethyst Rog Stone";
global.items[# 19, 1] = 0;
global.items[# 19, 2] = 5000;
global.items[# 19, 3] = "";
}

//
//
//
//
//
//Search for Item in Inventory. 
function xscr_inventory_items_search(rootObject,itemID){
for (var i = 0; i < rootObject.item_slots ; i += 1)
{ 
	if (rootObject.item_grid[# i, 0] == itemID)
	{
		return(i);
	}
}
return (-1);
}
//
//
//
//
//
//Inventory Space
function xscr_inventory_items_space(rootObject,itemID){
var _slot = ItemsSearch(rootObject,itemID);
if (_slot != -1)  //Matching Item Found
{
	return true;
}
if (_slot = -1) //No Matching Item Found
{
	var _slot = ItemsSearch(rootObject,-1);
	if (_slot != -1) //Empty Slot Found
	{
		return true;
	}
	else return false; //No Empty Slot Found
}
}
//
//
//
//
//
//Remove Item From Inventory
function xscr_inventory_items_remove(rootObject,itemID,amount) {
var _slot = ItemsSearch(rootObject,itemID);
if (_slot != -1)
{
	if (rootObject.item_grid[# _slot, 2] >= amount)
	{
		with (rootObject)
		{
			item_grid[# _slot, 2] = item_grid[# _slot, 2] - amount;
			
		}
		LastItemRemove(rootObject)
		return true;
	}
	else return false;
}
else return false;
}
//
//
//
//
//
//Check the Inventory for an item with Quantity
function xItemCheckQuantity(rootObject,itemID,amount) {
var _slot = ItemsSearch(rootObject,itemID);
if (_slot != -1)
{
	if (rootObject.item_grid[# _slot, 2] >= amount)
	{
		return true;
	}
	else return false;
}
else return false;
}
//
//
//
//
//
//
//Running Search gets either a slot number that matches the given ID or a -1 (no matching objects)
//If it finds a matching object, it +1's, if not it searches for an empty slot
//If it finds an empty slot, it changes the slot from -1 to the new ID and +1's it
//If it does not find an empty slot, it returns false (the item_dropped is not destroyed)
function xscr_inventory_items_add(rootObject,itemID,amount) {
var _slot = ItemsSearch(rootObject,itemID);
if (_slot != -1) 
{
	with (rootObject)
	{
		item_grid[# _slot, 2] = item_grid[# _slot, 2] + amount;
	}
	return true;
}
if (_slot = -1)
{
	var _slot = ItemsSearch(rootObject,-1);
	if (_slot != -1)
	{
		with (rootObject)
		{
			item_grid[# _slot, 0] = itemID;
			item_grid[# _slot, 2] = item_grid[# _slot, 2] + amount;
		}
		return true;
	}
	else return false;
}
}
//
//
//
//
//
//After subtracting items, check if it was last of items, to reset 	
function xLastItemRemove(_object){
for (var i = 0; i < _object.max_item_slots; i = i + 1)
{
	if (_object.item_grid[# i, 2] <= 0)
	{
		_object.item_grid[# i, 0] = -1;
		_object.item_grid[# i, 1] = Idle;
		_object.item_grid[# i, 2] = 0;
	}
}
}
//

//
//
//
//Crafting 
function xInventoryCraft(rootObject,itemID,quantity,newItem) {
var _slot = InventorySearch(rootObject,itemID);
if (_slot != -1)
{
	if (rootObject.inventory[# _slot, 1] >= quantity)
	{
		with (rootObject)
		{
			inventory[# _slot, 1] = inventory[# _slot, 1] - quantity;
			if (inventory[# _slot, 1] = 0) 
			{
				inventory[# _slot, 0] = -1;
				with (obj_item_held) script_execute(NoItem);
			}
			InventoryAdd(rootObject,newItem)
		}
		return true;
	}
	else return false;
}
return false
}
