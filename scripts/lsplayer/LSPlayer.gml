//Load and Save Player Stats
//
//
//
//
//
//Load Player Stats
//Path: obj_game > event Key Pressed "L"
function scr_load_player(_loadEntity){
		//Load Beans
		//if (variable_struct_exists(_loadEntity,"beans")) obj_player.beans = _loadEntity.beans;
		//if (variable_struct_exists(_loadEntity,"beans")) obj_player.star_orb = _loadEntity.star_orb;
		
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
		
		//Load crystal
		if (variable_struct_exists(_loadEntity,"crystal0")) obj_player.crystal_ary[0] = _loadEntity.crystal0;
		if (variable_struct_exists(_loadEntity,"crystal1")) obj_player.crystal_ary[1] = _loadEntity.crystal1;
		if (variable_struct_exists(_loadEntity,"crystal2")) obj_player.crystal_ary[2] = _loadEntity.crystal2;
		if (variable_struct_exists(_loadEntity,"crystal3")) obj_player.crystal_ary[3] = _loadEntity.crystal3;
		if (variable_struct_exists(_loadEntity,"crystal4")) obj_player.crystal_ary[4] = _loadEntity.crystal4;
		if (variable_struct_exists(_loadEntity,"crystal5")) obj_player.crystal_ary[5] = _loadEntity.crystal5;
		if (variable_struct_exists(_loadEntity,"crystal6")) obj_player.crystal_ary[6] = _loadEntity.crystal6;
		if (variable_struct_exists(_loadEntity,"crystal7")) obj_player.crystal_ary[7] = _loadEntity.crystal7;
		if (variable_struct_exists(_loadEntity,"crystal8")) obj_player.crystal_ary[8] = _loadEntity.crystal8;
		if (variable_struct_exists(_loadEntity,"crystal9")) obj_player.crystal_ary[9] = _loadEntity.crystal9;
		if (variable_struct_exists(_loadEntity,"crystal10")) obj_player.crystal_ary[10] = _loadEntity.crystal10;
		
		if (variable_struct_exists(_loadEntity,"crystalUse0")) obj_player.crystal_use[0] = _loadEntity.crystalUse0;
		if (variable_struct_exists(_loadEntity,"crystalUse1")) obj_player.crystal_use[1] = _loadEntity.crystalUse1;
		if (variable_struct_exists(_loadEntity,"crystalUse2")) obj_player.crystal_use[2] = _loadEntity.crystalUse2;
		if (variable_struct_exists(_loadEntity,"crystalUse3")) obj_player.crystal_use[3] = _loadEntity.crystalUse3;
		if (variable_struct_exists(_loadEntity,"crystalUse4")) obj_player.crystal_use[4] = _loadEntity.crystalUse4;
		if (variable_struct_exists(_loadEntity,"crystalUse5")) obj_player.crystal_use[5] = _loadEntity.crystalUse5;
		if (variable_struct_exists(_loadEntity,"crystalUse6")) obj_player.crystal_use[6] = _loadEntity.crystalUse6;
		if (variable_struct_exists(_loadEntity,"crystalUse7")) obj_player.crystal_use[7] = _loadEntity.crystalUse7;
		if (variable_struct_exists(_loadEntity,"crystalUse8")) obj_player.crystal_use[8] = _loadEntity.crystalUse8;
		if (variable_struct_exists(_loadEntity,"crystalUse9")) obj_player.crystal_use[9] = _loadEntity.crystalUse9;
		if (variable_struct_exists(_loadEntity,"crystalUse10")) obj_player.crystal_use[10] = _loadEntity.crystalUse10;
	
		
		//Load Upgrades
		if (variable_struct_exists(_loadEntity,"vitality")) obj_player.vitality = _loadEntity.vitality;
		if (variable_struct_exists(_loadEntity,"hp")) obj_player.max_hp = _loadEntity.hp;
		if (variable_struct_exists(_loadEntity,"iteration")) 
		{
			obj_player.iteration = _loadEntity.iteration; 
			obj_player.crystal_count = obj_player.iteration + 1;
		}
		//if (variable_struct_exists(_loadEntity,"crystal") ) obj_player.max_crystal_stone = _loadEntity.crystal;
		//if (variable_struct_exists(_loadEntity,"crystal") ) obj_player.crystal_count = _loadEntity.crystal;
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
function scr_save_player(_saveData){
//
//
//What To Save As : What to Save
var _savePlayer = 
{
	//Save Room
	altar : global.lastAltar, //CONCEPT: NOT FINAL
	lastCampX : global.lastAltarX, //CONCEPT: NOT FINAL
	lastCampY: global.lastAltarY, //CONCEPT: NOT FINAL
	level: obj_game.level_num, //CONCEPT: NOT FINAL
	roomNum: obj_game.room_num,
	
	//Save crystal
	crystal0 : obj_player.crystal_ary[0],
	crystal1 : obj_player.crystal_ary[1],
	crystal2 : obj_player.crystal_ary[2],
	crystal3 : obj_player.crystal_ary[3],
	crystal4 : obj_player.crystal_ary[4],
	crystal5 : obj_player.crystal_ary[5],
	crystal6 : obj_player.crystal_ary[6],
	crystal7 : obj_player.crystal_ary[7],
	crystal8 : obj_player.crystal_ary[8],
	crystal9 : obj_player.crystal_ary[9],
	crystal10 : obj_player.crystal_ary[10],
	
	crystalUse0 : obj_player.crystal_use[0],
	crystalUse1 : obj_player.crystal_use[1],
	crystalUse2 : obj_player.crystal_use[2],
	crystalUse3 : obj_player.crystal_use[3],
	crystalUse4 : obj_player.crystal_use[4],
	crystalUse5 : obj_player.crystal_use[5],
	crystalUse6 : obj_player.crystal_use[6],
	crystalUse7 : obj_player.crystal_use[7],
	crystalUse8 : obj_player.crystal_use[8],
	crystalUse9 : obj_player.crystal_use[9],
	crystalUse10 : obj_player.crystal_use[10],

	
	//Enhancable Stats
	vitality : obj_player.vitality,  //1
	hp : obj_player.max_hp,
	iteration : obj_player.iteration, //2
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

