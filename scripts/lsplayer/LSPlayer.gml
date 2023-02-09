//Load and Save Player Stats
//
//
//
//
//
//Load Player Stats
//Path: obj_game > event Key Pressed "L"
function LoadPlayer(_loadEntity){
		//Load Beans
		if (variable_struct_exists(_loadEntity,"beans")) obj_player.beans = _loadEntity.beans;
		
		//Load Room
		if (variable_struct_exists(_loadEntity,"camp")) global.lastCamp = _loadEntity.camp;
		if (variable_struct_exists(_loadEntity,"lastCampX")) global.lastCampX = _loadEntity.lastCampX;
		if (variable_struct_exists(_loadEntity,"lastCampY")) global.lastCampY = _loadEntity.lastCampY;
		if (variable_struct_exists(_loadEntity,"camp")) global.targetRoom = _loadEntity.camp;
		if (variable_struct_exists(_loadEntity,"lastCampX")) global.targetX = _loadEntity.lastCampX;
		if (variable_struct_exists(_loadEntity,"lastCampY")) global.targetY = _loadEntity.lastCampY;
		if (variable_struct_exists(_loadEntity,"breakObject")) obj_player.break_object = _loadEntity.breakObject;

		
		//Load Upgrades
		if (variable_struct_exists(_loadEntity,"vitality")) obj_player.vitality = _loadEntity.vitality;
		if (variable_struct_exists(_loadEntity,"hp")) obj_player.max_hp = _loadEntity.hp;
		if (variable_struct_exists(_loadEntity,"energy")) obj_player.energy = _loadEntity.energy; 
		if (variable_struct_exists(_loadEntity,"stamina")) obj_player.max_stamina = _loadEntity.stamina; 
		if (variable_struct_exists(_loadEntity,"might")) obj_player.might = _loadEntity.might; 
		if (variable_struct_exists(_loadEntity,"grace")) obj_player.grace = _loadEntity.grace; 
		//if (variable_struct_exists(_loadEntity,"cul") ) obj_player.max_crull_stone = _loadEntity.cul; 
		if (variable_struct_exists(_loadEntity,"crull") ) obj_player.max_crull_stone = _loadEntity.crull;
		if (variable_struct_exists(_loadEntity,"crull") ) obj_player.crull_stone = _loadEntity.crull;
		if (variable_struct_exists(_loadEntity,"armor")) obj_player.armor = _loadEntity.armor; 
		//if (variable_struct_exists(_loadEntity,"roll")) obj_player.max_roll_count = _loadEntity.roll;
		
		//Load Loadout
		if (variable_struct_exists(_loadEntity,"form")) 
		{
			obj_player.form = _loadEntity.form;
			with (obj_player)
			{
				script_execute(obj_inventory.form_grid[# form, 2])
			}
		}
		
}
//
//
//
//
//
//Save Player Stats
//Path: obj_game > event Key Pressed "S"
function SavePlayer(_saveData){
//
//
//What To Save As : What to Save
var _savePlayer = 
{
	//Save Room
	camp : global.lastCamp, //CONCEPT: NOT FINAL
	lastCampX : global.lastCampX, //CONCEPT: NOT FINAL
	lastCampY: global.lastCampY, //CONCEPT: NOT FINAL
	
	//Save Beans
	beans : obj_player.beans,
	
	//Enhancable Stats
	vitality : obj_player.vitality,
	energy : obj_player.energy,
	stamina : obj_player.max_stamina,
	might : obj_player.might,
	grace : obj_player.grace,
	crull : obj_player.max_crull_stone,
	hp : obj_player.max_hp,
	armor : obj_player.armor,
	breakObject : obj_player.break_object,
	
	//Loadout
	form : obj_player.form,
	////meleeMain : obj_player.melee_main,
	//meleeID : obj_player.melee_id,
	////magicMain : obj_player.magic_main,
	//magicID : obj_player.magic_id,
	////magicMain : obj_player.magic_main,
	//armorID : obj_player.armor_id,
	
}
array_push(_saveData, _savePlayer);
}

