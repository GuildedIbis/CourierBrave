//Ceriver
//
//
//
//
//
//Ceriver Set (create)
function CeriverSet(){
form = 1;
home_state = CeriverSet;
free_state = CeriverFree;
state_script = CeriverFree;
idle_sprite = spr_player_ceriver_idle;
roll_sprite = spr_player_ceriver_roll;
crull_sprite = spr_player_ceriver_crull;
recharge_sprite = spr_player_ceriver_recharge;
magicP_script = CeriverPolyorbCast;
magicA_script = CeriverOrbRushCast;
magic_primary = true;
weapon_aim = true;
obj_cursor.curs_script = CeriverCursor;

weapon_draw = CeriverTurnbladesMenu;
magic_draw = CeriverHabraArmorMenu;
armor_draw = CeriverPolyorbMenu;
special_draw = CeriverSpecialMenu;



//Dynamic Variables
weapon_count = 2;
max_weapon_count = 2;
magic_timer = 0;
melee_timer = 0;
walk_spd = 1.75;
armor = 9 + (5 * (obj_inventory.form_grid[# 1, 6] -1));
max_magic_count = 20 + (obj_inventory.form_grid[# 1, 7] * 2);
max_charge = 50 + (3* (grace + round(grace/15)));
magic_count = 0;
if (magic_count > max_magic_count) magic_count = max_magic_count;
special_count = 0;
max_special_count = 3;
max_special_timer = 600 - round(42 * obj_inventory.form_grid[# 1, 8]);
}
//
//
//
//
//
//Ceriver Free (home) state
function CeriverFree(){
//Movement 1: Set
walk_spd = 1.75;
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);


//Standard Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 15;
		audio_sound_gain(walk_snd,global.volumeEffects,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0) //Melee time between attacks
{
	melee_timer = melee_timer - 1;
}
if (obj_inventory.form_grid[# form, 8] > 0) //Special
{
	if (special_timer < max_special_timer) and (watervice = false)
	{
		if (special_count < max_special_count) special_timer = special_timer + 1;
	}
	if (special_timer >= max_special_timer) and (special_count < max_special_count)
	{
		special_timer = 0;
		special_count = special_count + 1;
	}
}


//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_ceriver_run;
}
else sprite_index = spr_player_ceriver_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
if (key_attackW) and (stamina >= 30)
{
	if (thundux = false) and (weapon_count >= 1)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		timer1 = 15;
		attack_script = CeriverBoomerang;
		state_script = PlayerStateAttack;
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		//Polyorb
		if (magic_primary = true) and (charge >= 8)
		{
			max_charge = 100 + (grace + round(grace/15))
			attack_script = magicP_script;
			state_script = PlayerStateAttack;
		}
		//Dynorb
		if (magic_primary = false) and (charge >= 25)
		{
			max_charge = 100 + (grace + round(grace/15));
			charge = charge - 25;
			magic_timer = 20;
			attack_script = magicA_script;
			state_script = PlayerStateAttack;
			direction = point_direction(x,y,mouse_x,mouse_y);
		}
	}

}

//Special Attack
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (key_attackS) and (special_count > 0)
	{
		if (watervice = false)
		{
			magic_timer = 30;
			attack_script = CeriverDrainDartCast;
			state_script = PlayerStateAttack;
		}
	}
}

//Roll State
if (key_ability) and (stamina >= 50)
{
	if (thundux = false)
	{
		audio_sound_gain(snd_player_roll,global.volumeEffects,1);
		audio_play_sound(snd_player_roll,0,false);
		stamina = stamina - 50;
		state_script = PlayerStateRoll;
		remain_dist = roll_dist;
	}
}

//Potion State
if (keyboard_check_pressed(ord("R")))
{

}

//Crull Stone State
if (keyboard_check_pressed(ord("C"))) and (crull_stone >= 1)
{
	audio_sound_gain(snd_player_crull,global.volumeEffects,1);
	audio_play_sound(snd_player_crull,0,false);
	state_script = PlayerStateCrull;
	
}

//Switch Magic Fire
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 12, 3] = true)
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
	}
}

//Switch Weapon Aim
if (keyboard_check_pressed(ord("Z")))
{
	if (weapon_aim = true)
	{
		weapon_aim = false;
	}
	else
	{
		weapon_aim = true;
	}
}
//End Ceriver Free State
}
//
//
//
//
//
//Ceriver Boomerang State
function CeriverBoomerang(){
//Set
attacking = true;
damage = round(might/2) + (10 * obj_inventory.form_grid[# 1, 5]);


//Standard Timers
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0) //Melee time between attacks
{
	melee_timer = melee_timer - 1;
}
//Custom Timers



//Attack Start
if (sprite_index != spr_player_ceriver_boomerangThrow)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_ceriver_boomerangThrow;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Animate
PlayerAnimation();

//Create Boomerange Projectile
//if (melee_timer <= 0)
//{
//	audio_sound_gain(snd_ceriver_boomerang,global.volumeEffects,1);
//	audio_play_sound(snd_ceriver_boomerang,0,0,global.volumeEffects);
//	melee_timer = 15;
//	weapon_count = weapon_count - 1;
//	with (instance_create_layer(x,y-8,"Instances",obj_projectile))
//	{
//		return_timer = 35;
//		sd_timer = 120;
//		break_object = obj_player.break_object;
//		magic = false;
//		damage = obj_player.might + ((obj_inventory.form_grid[# 1, 6])*2);//
//		projectile_sprite = spr_ceriver_boomerang;
//		projectile_script = CeriverBoomerangFree;
//		idle_sprite = spr_ceriver_boomerang;
//		hit_by_attack = -1;
//		//script_execute(LeafArcCreate);
//		direction = (point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
//		image_angle = direction;
//		projectile_speed = 2.5;
//		returning = false;
//	}
//}

//Return to Free State or Continue Throwing Boomerangs (if possible)
if (animation_end)
{
	audio_sound_gain(snd_ceriver_boomerang,global.volumeEffects,1);
	audio_play_sound(snd_ceriver_boomerang,0,0,global.volumeEffects);
	//melee_timer = 15;
	stamina = stamina - 30;
	weapon_count = weapon_count - 1;
	with (instance_create_layer(x,y-8,"Instances",obj_projectile))
	{
		return_timer = 35;
		sd_timer = 120;
		break_object = obj_player.break_object;
		magic = false;
		damage = obj_player.might + ((obj_inventory.form_grid[# 1, 6])*2);//
		projectile_sprite = spr_ceriver_boomerang;
		projectile_script = CeriverBoomerangFree;
		idle_sprite = spr_ceriver_boomerang;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
		image_angle = direction;
		projectile_speed = 2.5;
		returning = false;
	}
	if (mouse_check_button(mb_right)) and (stamina >= 30)
	{
		if (thundux = false) and (weapon_count >= 1)
		{
			//melee_timer = 15;
			attack_script = CeriverBoomerang;
			state_script = PlayerStateAttack;
		}
		else
		{
			attacking = false;
			state_script = free_state;
			damage = 0;
			animation_end = false;
			atk_snd_delay = 0;
		}
	}
	else
	{
		attacking = false;
		state_script = free_state;
		damage = 0;
		animation_end = false;
		atk_snd_delay = 0;
	}
	
}
}
//
//
//
//
//
//Boomerange Free Script
function CeriverBoomerangFree(){
//Step
if (sd_timer > 0) sd_timer = sd_timer - 1; 
speed = projectile_speed;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

if (returning = false)
{
	return_timer = return_timer - 1;
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		AttackCalculateStatus(projectile_sprite,self,1.5,-1,-1,-1,-1,-1);
		returning = true;
	}
	if (place_meeting(x,y,break_object)) or (return_timer <= 0)
	{
		returning = true;
	}
	if (place_meeting(x,y,obj_resource)) or (return_timer <= 0)
	{
		AttackCalculateStatus(projectile_sprite,self,1.5,-1,-1,-1,-1,-1);
		returning = true;
	}
}
if (returning = true)
{
	direction = point_direction(x,y,obj_player.x,obj_player.y-6);
	if (place_meeting(x,y,obj_player))
	{
		obj_player.weapon_count = obj_player.weapon_count + 1;
		instance_destroy();
	}
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		AttackCalculateStatus(projectile_sprite,self,1.5,-1,-1,-1,-1,-1);
		returning = true;
	}
}
if (sd_timer <= 0)
{
	obj_player.weapon_count = obj_player.weapon_count + 1;
	instance_destroy();
}

}
//
//
//
//
//
//Ceriver Polyorb Magic State
function CeriverPolyorbCast(){
walk_spd = 1.2;
attacking = true;



//Standard Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 15;
		audio_sound_gain(walk_snd,global.volumeEffects,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0) //Melee time between attacks
{
	melee_timer = melee_timer - 1;
}



//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);

//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 4:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 1:
		dir_offX = 4;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -3;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = -5;
		dir_offY = -14;
	break;	
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	charge = charge - 8;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		var _bubbleRand = irandom_range(0,3);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 30;
		damage = round(obj_player.grace/4) + ((obj_inventory.form_grid[# 1, 7])*(_bubbleRand));//
		projectile_sprite = spr_ceriver_polyorb;
		projectile_script = CeriverPolyorbFree;
		idle_sprite = spr_ceriver_polyorb;
		image_index = _bubbleRand;
		projectile_speed = 3.0 + (.5 * image_index);
		image_speed = 0;
		hit_by_attack = -1;
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-12,12);
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
	}
	magic_timer = 5;
}

//Animate
PlayerAnimation();

//End State, Return to Free State
if (mouse_check_button(mb_left) = false) or (charge < 8)
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}
}//
//
//
//
//
//
//Ceriver Polyorb Projectile Script
function CeriverPolyorbFree(){

//Step
image_speed = 0;
if (inv_timer > 0) inv_timer = inv_timer - 1;
if (sd_timer > 0) sd_timer = sd_timer - 1;
speed = projectile_speed;
if (place_meeting(x,y,obj_player)) depth = obj_player.depth - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,-1);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) and (inv_timer <= 0)
{
	instance_destroy();
}
if (sd_timer <= 0) instance_destroy();

}
//
//
//
//
//
//Ceriver Orb Rush State
function CeriverOrbRushCast(){
//Set
attacking = true;
damage = grace - 3 + (13 * obj_inventory.form_grid[# 1, 7]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	//audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	atk_snd_delay = 28;
}
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
if (magic_timer > 0)
{
	magic_timer = magic_timer - 1;
}
if (special_timer < max_special_timer) and (watervice = false)
{
	special_timer = special_timer + 1;
}


//Attack Start
if (sprite_index != spr_player_ceriver_cast_orbDash)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_ceriver_cast_orbDash;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

hor_spd = lengthdir_x(3,direction);
ver_spd = lengthdir_y(3,direction);
var _collided = PlayerCollision();





//Collision
if (_collided = true)
{
	state_script = free_state;
	ScreenShake(4,15);
}

//Calcuate Hit Entitites
AttackCalculateStatus(spr_player_ceriver_cast_orbDash,obj_player,2.5,-1,-1,-1,-1,-1);

//Animate
PlayerAnimation();

if (magic_timer <= 0)
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}
}
//
//
//
//
//
//Ceriver Dynorb Magic State
function CeriverDynorbCast(){
//Set
walk_spd = 1.2;
attacking = true;

//Standard Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 15;
		audio_sound_gain(walk_snd,global.volumeEffects,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//}


//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);

//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Create Bullet at end timer - timer is length of weapon sprite animation


//Animate
PlayerAnimation();

if (mouse_check_button(mb_left) = false) 
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}
}
//
//
//
//
//
//Ceriver Dynorb Projectile Script
function CeriverDynorbFree(){
//Step
depth = obj_player.depth - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

if (cast = false)
{
	var _dirPos = round(obj_player.direction/90);
	
	switch(_dirPos)
	{
		case 0:
			x = obj_player.x+3;
			y = obj_player.y-14;
			dir_offX = 3;
			dir_offY = -14;
		break;
		
		case 4:
			x = obj_player.x+3;
			y = obj_player.y-14;
			dir_offX = 3;
			dir_offY = -14;
		break;
		
		case 1:
			x = obj_player.x+4;
			y = obj_player.y-14;
			dir_offX = 4;
			dir_offY = -14;
		break;
		
		case 2:
			x = obj_player.x-3;
			y = obj_player.y-14;
			dir_offX = -3;
			dir_offY = -14;
		break;
		
		case 3:
			x = obj_player.x-5;
			y = obj_player.y-14;
			dir_offX = -5;
			dir_offY = -14;
		break;
		
	}
	speed = 0;
	timer1 = timer1 + 1;
	var _stage = min(4,round(timer1/30));
	image_index = max(0,_stage-1)
	if (mouse_check_button_released(mb_left)) or (_stage * 5 >= obj_player.charge)
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		obj_player.charge = obj_player.charge - _stage * 5;
		cast = true;
		damage = (round(obj_player.grace/2)*_stage)  + ((obj_inventory.form_grid[# 1, 7])*(4)*(_stage));
		direction = (point_direction(x,y,mouse_x,mouse_y));
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
		with (obj_player)
		{
			attacking = false;
			state_script = free_state;
			damage = 0;
			animation_end = false;
			atk_snd_delay = 0;
		}
		
	}
	if (timer1 >= 119)
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		obj_player.charge = obj_player.charge - _stage * 5;
		cast = true;
		damage = (round(obj_player.grace/2)*_stage)  + ((obj_inventory.form_grid[# 1, 7])*(4)*(_stage));
		direction = irandom_range(-1,1) + (point_direction(x,y,mouse_x,mouse_y));
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
		with (obj_player)
		{
			attacking = false;
			state_script = free_state;
			damage = 0;
			animation_end = false;
			atk_snd_delay = 0;
		}
		
	}
}

if (cast = true)
{
	if (inv_timer > 0) inv_timer = inv_timer - 1;
	speed = projectile_speed;
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,-1);
		instance_destroy();
	}
	if (place_meeting(x,y,break_object)) and (inv_timer <= 0)
	{
		instance_destroy();
	}
}

}
//
//
//
//
//
//Ceriver Drain Dart Cast 
function CeriverDrainDartCast(){
walk_spd = 1.2;
attacking = true;



//Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 15;
		audio_sound_gain(walk_snd,global.volumeEffects,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0) //Melee time between attacks
{
	melee_timer = melee_timer - 1;
}


//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);

//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
if (_oldSprite != sprite_index) local_frame = 0;


//Bullet Spawn Position
var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 4:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 1:
		dir_offX = -4;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -3;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = 5;
		dir_offY = -14;
	break;	
}

//Animate
PlayerAnimation();

if (magic_timer <= 0) and (special_count >= 1)
{
	audio_sound_gain(snd_ceriver_drainDart,global.volumeEffects,1);
	audio_play_sound(snd_ceriver_drainDart,0,0);
	magic_timer = 30;
	special_count = special_count - 1;
	with (instance_create_layer(x + dir_offX,y + dir_offY,"Instances",obj_projectile))
	{
		timer1 = 120;
		timer1 = 30;
		target = -1;
		break_object = obj_player.break_object;
		damage = obj_player.grace + (12 * obj_inventory.form_grid[# 1, 8]);
		idle_sprite = spr_flameSeed;
		projectile_sprite = spr_drainDart;
		projectile_script = CeriverDrainDart;
		hit_by_attack = -1;
		enemy_in_range = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(obj_player.x,obj_player.y-14,mouse_x,mouse_y);
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 2.5;
	}
	if (special_count <= 0) or (keyboard_check(vk_shift) = false)
	{
		attacking = false;
		state_script = free_state;
		animation_end = false;
		atk_snd_delay = 0;
	}
}
}
//
//
//
//
//
//Ceriver Special Projectile Script
function CeriverDrainDart(){
//Step

speed = projectile_speed;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,.25);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) and (inv_timer <= 0)
{
	instance_destroy();
}
}
//
//
//
//
//
//Ceriver Cursor
function CeriverCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 1;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true) spread = 24;
if (obj_player.magic_primary = false) spread = 2.5;
if (obj_game.gamePaused = false)
{
	var _xClampF = clamp(window_mouse_get_x(),16,window_get_width()-32);
	var _yClampF = clamp(window_mouse_get_y(),16,window_get_height()-32);
	window_mouse_set(_xClampF,_yClampF)

	curs_width = 8 + (point_distance(x,y,obj_player.x,obj_player.y)/spread);
	curs_height = 8 + (point_distance(x,y,obj_player.x,obj_player.y)/spread);

}


depth = -5000;
}
//
//
//
//
//
//Ceriver Cursor Draw
function CeriverCursorDraw(){
if (curs_width > 8) or (curs_height > 8)
{
	var xOff = ((curs_width/2))
	var yOff = ((curs_height/2))
}
else 
{
	var xOff = 0
	var yOff = 0
}
draw_sprite_stretched(spr_cursor_play,curs_form,x-xOff,y-yOff,curs_width,curs_height);
}