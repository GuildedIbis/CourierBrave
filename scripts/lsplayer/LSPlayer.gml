//Load and Save Player Stats
//
//
//
//
//
//Load Player Stats
//Path: obj_game > event Key Pressed "L"
function scr_load_player(_loadEntity){
//Load Room
if (variable_struct_exists(_loadEntity,"altar")) global.lastAltar = _loadEntity.altar;
if (variable_struct_exists(_loadEntity,"lastAltarX")) global.lastAltarX = _loadEntity.lastAltarX;
if (variable_struct_exists(_loadEntity,"lastAltarY")) global.lastAltarY = _loadEntity.lastAltarY;
if (variable_struct_exists(_loadEntity,"altar")) global.targetRoom = _loadEntity.altar;
if (variable_struct_exists(_loadEntity,"lastAltarX")) global.targetX = _loadEntity.lastAltarX;
if (variable_struct_exists(_loadEntity,"lastAltarY")) global.targetY = _loadEntity.lastAltarY;
if (variable_struct_exists(_loadEntity,"breakObject")) obj_player.break_object = _loadEntity.breakObject;
if (variable_struct_exists(_loadEntity,"level")) obj_game.level_num = _loadEntity.level;
if (variable_struct_exists(_loadEntity,"roomNum")) obj_game.room_num = _loadEntity.roomNum;
		
//Load Inventory
if (variable_struct_exists(_loadEntity,"starOrbs")) obj_inventory.star_orb = _loadEntity.starOrbs;
		
//Load Stats
if (variable_struct_exists(_loadEntity,"vitality")) obj_player.vitality = _loadEntity.vitality;
if (variable_struct_exists(_loadEntity,"hp")) obj_player.max_hp = _loadEntity.hp;
if (variable_struct_exists(_loadEntity,"conviction")) obj_player.conviction = _loadEntity.conviction; 
if (variable_struct_exists(_loadEntity,"charge")) obj_player.max_charge = _loadEntity.charge;
if (variable_struct_exists(_loadEntity,"energy")) obj_player.energy = _loadEntity.energy; 
if (variable_struct_exists(_loadEntity,"stamina")) obj_player.max_stamina = _loadEntity.stamina; 

//Load Loadout
if (variable_struct_exists(_loadEntity,"form")) 
{
	obj_player.form = _loadEntity.form;
	with (obj_player)
	{
		script_execute(obj_inventory.form_grid[# form, 2])
	}
}
if (variable_struct_exists(_loadEntity,"weaponAim")) obj_player.weapon_aim = _loadEntity.weaponAim;
}
//
//
//
//
//
//Save Player Stats
//Path: obj_game > event Key Pressed "S"
function scr_save_player(_saveData){
//
//
//What To Save As : What to Save
var _savePlayer = 
{
	//Save Room
	altar : global.lastAltar, 
	lastAltarX : global.lastAltarX,
	lastAltarY: global.lastAltarY, 
	level: obj_game.level_num,
	roomNum: obj_game.room_num,
	
	//Inventory
	starOrbs : obj_inventory.star_orb,
	
	//Enhancable Stats
	vitality : obj_player.vitality,
	hp : obj_player.max_hp,
	conviction : obj_player.conviction,
	charge : obj_player.max_charge,
	energy : obj_player.energy,
	stamina : obj_player.max_stamina,	
	armor : obj_player.armor,

	//Loadout
	form : obj_player.form,
	weaponAim : obj_player.weapon_aim,
}
array_push(_saveData, _savePlayer);
}

