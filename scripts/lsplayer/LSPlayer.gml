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
		//if (variable_struct_exists(_loadEntity,"beans")) obj_player.beans = _loadEntity.beans;
		//if (variable_struct_exists(_loadEntity,"beans")) obj_player.star_orb = _loadEntity.star_orb;
		
		//Load Room
		if (variable_struct_exists(_loadEntity,"camp")) global.lastCamp = _loadEntity.camp;
		if (variable_struct_exists(_loadEntity,"lastCampX")) global.lastCampX = _loadEntity.lastCampX;
		if (variable_struct_exists(_loadEntity,"lastCampY")) global.lastCampY = _loadEntity.lastCampY;
		if (variable_struct_exists(_loadEntity,"camp")) global.targetRoom = _loadEntity.camp;
		if (variable_struct_exists(_loadEntity,"lastCampX")) global.targetX = _loadEntity.lastCampX;
		if (variable_struct_exists(_loadEntity,"lastCampY")) global.targetY = _loadEntity.lastCampY;
		if (variable_struct_exists(_loadEntity,"breakObject")) obj_player.break_object = _loadEntity.breakObject;
		if (variable_struct_exists(_loadEntity,"level")) obj_game.level_num = _loadEntity.level;
		
		//Load Crull
		if (variable_struct_exists(_loadEntity,"crull0")) obj_player.crull_ary[0] = _loadEntity.crull0;
		if (variable_struct_exists(_loadEntity,"crull1")) obj_player.crull_ary[1] = _loadEntity.crull1;
		if (variable_struct_exists(_loadEntity,"crull2")) obj_player.crull_ary[2] = _loadEntity.crull2;
		if (variable_struct_exists(_loadEntity,"crull3")) obj_player.crull_ary[3] = _loadEntity.crull3;
		if (variable_struct_exists(_loadEntity,"crull4")) obj_player.crull_ary[4] = _loadEntity.crull4;
		if (variable_struct_exists(_loadEntity,"crull5")) obj_player.crull_ary[5] = _loadEntity.crull5;
		if (variable_struct_exists(_loadEntity,"crull6")) obj_player.crull_ary[6] = _loadEntity.crull6;
		if (variable_struct_exists(_loadEntity,"crull7")) obj_player.crull_ary[7] = _loadEntity.crull7;
		if (variable_struct_exists(_loadEntity,"crull8")) obj_player.crull_ary[8] = _loadEntity.crull8;
		if (variable_struct_exists(_loadEntity,"crull9")) obj_player.crull_ary[9] = _loadEntity.crull9;
		if (variable_struct_exists(_loadEntity,"crull10")) obj_player.crull_ary[10] = _loadEntity.crull10;
		
		//Load Upgrades
		if (variable_struct_exists(_loadEntity,"vitality")) obj_player.vitality = _loadEntity.vitality;
		if (variable_struct_exists(_loadEntity,"hp")) obj_player.max_hp = _loadEntity.hp;
		if (variable_struct_exists(_loadEntity,"iteration")) obj_player.iteration = _loadEntity.iteration; 
		//if (variable_struct_exists(_loadEntity,"crull") ) obj_player.max_crull_stone = _loadEntity.crull;
		if (variable_struct_exists(_loadEntity,"crull") ) obj_player.crull_count = _loadEntity.crull;
		if (variable_struct_exists(_loadEntity,"conviction")) obj_player.conviction = _loadEntity.conviction; 
		if (variable_struct_exists(_loadEntity,"charge")) obj_player.max_charge = _loadEntity.charge;
		if (variable_struct_exists(_loadEntity,"might")) obj_player.might = _loadEntity.might; 
		if (variable_struct_exists(_loadEntity,"grace")) obj_player.grace = _loadEntity.grace; 
		if (variable_struct_exists(_loadEntity,"divinity")) obj_player.divinity = _loadEntity.divinity; 
		if (variable_struct_exists(_loadEntity,"energy")) obj_player.energy = _loadEntity.energy; 
		if (variable_struct_exists(_loadEntity,"stamina")) obj_player.max_stamina = _loadEntity.stamina; 
		if (variable_struct_exists(_loadEntity,"receptivity")) obj_player.receptivity = _loadEntity.receptivity; 
		
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
		//if (variable_struct_exists(_loadEntity,"cursMeter")) obj_cursor.curs_meter = _loadEntity.cursMeter;
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
	level: obj_game.level_num, //CONCEPT: NOT FINAL
	
	//Save Crull
	crull0 : obj_player.crull_ary[0],
	crull1 : obj_player.crull_ary[1],
	crull2 : obj_player.crull_ary[2],
	crull3 : obj_player.crull_ary[3],
	crull4 : obj_player.crull_ary[4],
	crull5 : obj_player.crull_ary[5],
	crull6 : obj_player.crull_ary[6],
	crull7 : obj_player.crull_ary[7],
	crull8 : obj_player.crull_ary[8],
	crull9 : obj_player.crull_ary[9],
	crull10 : obj_player.crull_ary[10],

	
	//Enhancable Stats
	vitality : obj_player.vitality,  //1
	hp : obj_player.max_hp,
	iteration : obj_player.iteration, //2
	crull : obj_player.crull_count,
	conviction : obj_player.conviction, //3
	charge : obj_player.max_charge,
	might : obj_player.might, //4
	grace : obj_player.grace,  //5
	divinity : obj_player.divinity, //6
	energy : obj_player.energy, //7
	stamina : obj_player.max_stamina,	
	receptivity : obj_player.receptivity, //8

	
	
	armor : obj_player.armor,
	//breakObject : obj_player.break_object,
	
	//Loadout
	form : obj_player.form,
	weaponAim : obj_player.weapon_aim,
	//cursMeter : obj_cursor.curs_meter,
	
	
}
array_push(_saveData, _savePlayer);
}

