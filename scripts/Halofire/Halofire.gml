//Halofire
//
//
//
//
//
//Halofire Set (create)
function HalofireSet(){
form = 3;
home_state = HalofireSet;
free_state = HalofireFree;
state_script = HalofireFree;
idle_sprite = spr_player_halofire_idle;
roll_sprite = spr_player_halofire_roll;
crull_sprite = spr_player_halofire_crull;
recharge_sprite = spr_player_halofire_recharge;
magicP_script = HalofireMeteorSling;
magicA_script = HalofireTriRock;
magic_primary = true;
obj_cursor.curs_script = HalofireCursor;

melee_draw = DrawHalofireHamaxeUpgrade;
magic_draw = DrawHalofireMagicUpgrade;
armor_draw = DrawHalofireArmorUpgrade;
special_draw = DrawHalofireSpecialUpgrade;



//Dynamic Variables
weapon_count = -1;
max_weapon_count = -1;
magic_timer = 0;
attack_counter = 0;
max_attack_counter = 0;
walk_spd = 1.75;
special_count = -1;
max_special_count = -1;
armor = 7 + (4 * (obj_inventory.form_grid[# 3, 6] -1));
max_magic_count = 6 + round(obj_inventory.form_grid[# 3, 7] / 2);
if (magic_count > max_magic_count) magic_count = max_magic_count;
max_special_timer = 360 - round(12 * obj_inventory.form_grid[# 3, 8]);
}
//
//
//
//
//
//Halofire Free (home) state
function HalofireFree(){
walk_spd = 1.75;
//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);


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
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (special_timer < max_special_timer) and (watervice = false)
	{
		special_timer = special_timer + 1;
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
	sprite_index = spr_player_halofire_run;
}
else sprite_index = spr_player_halofire_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
if (key_attackW)
{
	if (thundux = false) and (stamina >= 25)
	{
		direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		stamina = stamina - 25;
		attack_script = HalofireHamaxe;
		state_script = PlayerStateAttack;
		
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (charge >= 18)
		{
			attack_script = HalofireMeteorSling;
			state_script = PlayerStateAttack;
		}
		if (magic_primary = false) and (charge >= 30)
		{
			max_attack_counter = floor(charge/30)
			attack_script = HalofireTriRock;
			state_script = PlayerStateAttack;
		}
	}
}

//Special Attack
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (key_attackS) and (special_timer >= max_special_timer)
	{
		if (watervice = false)
		{
			special_timer = 0;
			attack_script = HalofireSpecial;
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
if (keyboard_check_pressed(ord("Q"))) or (keyboard_check_pressed(ord("F")))
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
}
//
//
//
//
//
//Halofire Hamaxe State
function HalofireHamaxe(){
//Set
attacking = true;
damage = might + 3 + (14 * obj_inventory.form_grid[# 3, 5]);

//Stamdard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_sound_gain(snd_halofire_hamaxe_slash,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	atk_snd_delay = 28;
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

//Attack Start
if (sprite_index != spr_player_halofire_hamaxe)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_hamaxe;
	sprite_set_speed(sprite_index,10,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
AttackCalculateStatus(spr_halofire_hamaxe_hitbox,obj_player,2,-1,-1,-1,-1,-1);

//Animate
PlayerAnimation();

//Return to Free State or enter Charging state
if (animation_end)
{
	if (mouse_check_button(mb_right)) and (stamina >= 15)
	{
		stamina = stamina - 15;
		ability_charge = 0;
		state_script = HalofireHamaxeCharging;
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
//Halofire Hamaxe State
function HalofireHamaxeCharging(){

//Set
attacking = true;

//Standard Timers
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

//Attack Start
if (sprite_index != spr_player_halofire_hamaxe_charging)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_hamaxe_charging;
	sprite_set_speed(sprite_index,12,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

if (melee_timer <= 0)
{
	state_script = HalofireHamaxeCharged
}

//Animate
PlayerAnimation();

if (mouse_check_button_released(mb_right))
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_sound_gain(snd_halofire_hamaxe_slash,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	if (melee_timer <= 0)
	{
		state_script = HalofireHamaxeBackswingCharged;
	}
	else
	{
		state_script = HalofireHamaxeBackswing;
	}
}
}
//
//
//
//
//
//Halofire Hamaxe State
function HalofireHamaxeCharged(){

//Set
attacking = true;

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



//Attack Start
if (sprite_index != spr_player_halofire_hamaxe_charged)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_hamaxe_charged;
	sprite_set_speed(sprite_index,12,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Animate
PlayerAnimation();

if (mouse_check_button_released(mb_right))
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_sound_gain(snd_halofire_hamaxe_slash,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	if (melee_timer <= 0)
	{
		state_script = HalofireHamaxeBackswingCharged;
	}
	else
	{
		state_script = HalofireHamaxeBackswing;
	}
}
}
//
//
//
//
//
//Halofire Hamaxe State
function HalofireHamaxeBackswing(){
//Set
attacking = true;
damage = might + 3 + (14 * obj_inventory.form_grid[# 3, 5]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	atk_snd_delay = 28;
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


//Attack Start
if (sprite_index != spr_player_halofire_hamaxe_backswing)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_hamaxe_backswing;
	sprite_set_speed(sprite_index,10,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
AttackCalculateStatus(spr_player_halofire_hamaxe_backswing_hitbox,obj_player,2.5,-1,-1,-1,-1,-1);

//Animate
PlayerAnimation();

if (animation_end)
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
//Halofire Hamaxe State
function HalofireHamaxeBackswingCharged(){
//Set
attacking = true;
damage = might + 3 + (14 * obj_inventory.form_grid[# 3, 5]);

//Attack Start
if (sprite_index != spr_player_halofire_hamaxe_backswing_charged)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_hamaxe_backswing_charged;
	sprite_set_speed(sprite_index,10,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//Calcuate Hit Entitites
AttackCalculateStatus(spr_player_halofire_hamaxe_backswing_hitbox,obj_player,2.5,30,-1,-1,-1,-1);

//Animate
PlayerAnimation();

if (animation_end)
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
//Halofire Meteor Sling Magic State
function HalofireMeteorSling(){
//Set
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
	sprite_index = spr_player_halofire_runCast;
}
else sprite_index = spr_player_halofire_cast;
if (_oldSprite != sprite_index) local_frame = 0;


var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 2;
		dir_offY = -14;
	break;
		
	case 4:
		dir_offX = 2;
		dir_offY = -14;
	break;
		
	case 1:
		dir_offX = -6;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -4;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = 3;
		dir_offY = -14;
	break;	
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	charge = charge - 18;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_halofire_meteorshot,global.volumeEffects,1);
		audio_play_sound(snd_halofire_meteorshot,0,0,global.volumeEffects);
		break_object = obj_player.break_object;
		magic = true;
		follow_timer = 28;
		fragment_count = 2;
		fragment = obj_fragFire;
		damage = obj_player.grace + 10 + ((obj_inventory.form_grid[# 3, 7])*(5));//
		projectile_sprite = spr_meteor;
		projectile_script = HalofireMeteor;
		idle_sprite = spr_meteor;
		hit_by_attack = -1;
		direction = irandom_range(-6,6) + (point_direction(x,y,mouse_x,mouse_y));
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 30;
}

//Animate
PlayerAnimation();


if (mouse_check_button(mb_left) = false) or (charge < 18)
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
//Halofire Meteor Projectile Script
function HalofireMeteor(){
//Step
if (inv_timer > 0) inv_timer = inv_timer - 1;
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
	
	AttackCalculate(projectile_sprite);
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
//Halofire Tri-Rock Magic State
function HalofireTriRock(){
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
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0) //Melee time between attacks
{
	melee_timer = melee_timer - 1;
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
	sprite_index = spr_player_halofire_runCast;
}
else sprite_index = spr_player_halofire_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 2;
		dir_offY = -14;
	break;
		
	case 4:
		dir_offX = 2;
		dir_offY = -14;
	break;
		
	case 1:
		dir_offX = -6;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -4;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = 3;
		dir_offY = -14;
	break;	
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	attack_counter = attack_counter + 1;
	charge = charge - 30;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_halofire_meteorshot,global.volumeEffects,1);
		audio_play_sound(snd_halofire_meteorshot,0,0,global.volumeEffects);
		break_object = obj_player.break_object;
		magic = true;
		follow_timer = 28;
		fragment_count = 2;
		fragment = obj_fragFire;
		damage = obj_player.grace + 10 + ((obj_inventory.form_grid[# 3, 7])*(5));//
		projectile_sprite = spr_meteor;
		projectile_script = HalofireMeteor;
		idle_sprite = spr_meteor;
		hit_by_attack = -1;
		direction = irandom_range(-12,12) + (point_direction(x,y,mouse_x,mouse_y));
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 6;
}

//Animate
PlayerAnimation();


if (attack_counter >= max_attack_counter)
{
	attack_counter = 0;
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
//Halofire Special State
function HalofireSpecial(){
//Set
attacking = true;

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_halofire_special,global.volumeEffects,1);
	audio_play_sound(snd_halofire_special,0,0,global.volumeEffects)
	atk_snd_delay = 20;
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

//Attack Start
if (sprite_index != spr_player_halofire_cast)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_cast;
	//sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


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

//Calcuate Hit Entitites
//AttackCalculate(spr_fayaniBlade_goldArc_hitbox);

//Animate
PlayerAnimation();

if (animation_end)
{
	with (instance_create_layer(obj_player.x+dir_offX,obj_player.y+dir_offY,"Instances",obj_projectile))
	{
		timer1 = 120;
		timer1 = 30;
		target = -1;
		break_object = obj_player.break_object;
		damage = obj_player.grace + (10 * obj_inventory.form_grid[# 3, 8]);
		idle_sprite = spr_flameSeed;
		projectile_sprite = spr_flameSeed;
		projectile_script = HalofireFlameSeed;
		hit_by_attack = -1;
		enemy_in_range = -1;
		direction = point_direction(x,y,mouse_x,mouse_y);
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 2.5;
	}
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
//Halofire Gold Arcs Projectile Script
function HalofireFlameSeed(){
//Step
if (timer1  > 0) timer1 = timer1  - 1;
if (timer2  > 0) timer2 = timer2  - 1;
if (inv_timer  > 0) inv_timer = inv_timer  - 1;
speed = projectile_speed;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	timer1 = 210;
	timer2 = 6;
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
	if (!ds_exists(enemy_in_range,ds_type_list)) enemy_in_range = ds_list_create();
	ds_list_clear(enemy_in_range);
}

if (place_meeting(x,y,obj_enemy)) 
{	
	AttackCalculate(projectile_sprite);
}
if (place_meeting(x,y,break_object)) or (keyboard_check(vk_shift) = false)
{
	speed = 0;
}
var _num = collision_circle_list(x,y,64,obj_enemy,false,false,enemy_in_range,true);
if (_num > 0)
{
	target = enemy_in_range[| 0];
}
if (timer2 <= 0)
{
		
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		
		break_object = obj_player.break_object;
		damage = round(obj_player.grace/2);
		projectile_sprite = spr_fireSpark;
		projectile_script = HalofireFireSpark;
		idle_sprite = spr_fireSpark;
		hit_by_attack = -1;
		if (instance_exists(other.target))
		{
			if (other.target != -1) direction = point_direction(x,y,other.target.x,other.target.y);
			else direction = irandom_range(0,359);
		}
		else direction = irandom_range(0,359);
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 3;
	}
	timer2 = 12;
}
if (timer1 <= 0)
{
	instance_destroy();
}
ds_list_clear(enemy_in_range);
}
//
//
//
//
//
//Halofire Meteor Projectile Script
function HalofireFireSpark(){
//Step
if (inv_timer > 0) inv_timer = inv_timer - 1;
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
	
	AttackCalculate(projectile_sprite);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	instance_destroy();
}

if (magic = true)
{
	if (place_meeting(x,y,obj_cursor))
	{
		follow_timer = 0;
	}
	if (follow_timer > 0)
	{
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
		image_angle = direction;
	}
}
}
//
//
//
//
//Draw Halofire's Hamaxe Upgrade at Smith NPC's
function DrawHalofireHamaxeUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Fiery Hamaxe",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 5])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 10);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
		draw_text_transformed(112,99,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,15,5)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 5] = 3;
						ItemRemove(obj_inventory, 15, 5);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,15,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _weapon = string(obj_player.might + (11 * obj_inventory.form_grid[# 3, 5]));
var _weapon1 = string(obj_player.might + (11 * (obj_inventory.form_grid[# 3, 5] + 1)));
var _weaponExplain = "Level " + string(obj_inventory.form_grid[# 3, 5]) + ": " + _weapon + " > Level " + string(obj_inventory.form_grid[# 3, 5] + 1) + ": " + _weapon1;
draw_text_transformed(141,44,_weaponExplain,.5,.5,0);
draw_set_halign(fa_center);


}
//
//
//
//
//
//Draw Halofire's Armor Upgrade at Smith NPC's
function DrawHalofireArmorUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Armor",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 6])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 10);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,7,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
		draw_text_transformed(112,99,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 6] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _armor = string(7 + (4 * (obj_inventory.form_grid[# 3, 6] -1)));
var _armor1 = string(7 + (4 * (obj_inventory.form_grid[# 3, 6])));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 6]) + ": " + _armor + " > Level " + string(obj_inventory.form_grid[# 3, 6] + 1) + ": " + _armor1;
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//obj_player.armor = 6 + (12 * (obj_inventory.form_grid[# 0, 6] -1))
}
//
//
//
//
//
//Draw Halofire's Magic Upgrade at Browi NPC
function DrawHalofireMagicUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Meteor Shot",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 7])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,2,10))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 10);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,2,94,90,16,16);
		draw_text_transformed(112,99,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 7] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _damage = string(obj_player.grace + 3 + ((obj_inventory.form_grid[# 3, 7]-1)*(5)));
var _damage1 = string(obj_player.grace + 3 + ((obj_inventory.form_grid[# 3, 7])*(5)));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 7]) + ": " + _damage + " > Level " + string(obj_inventory.form_grid[# 3, 7] + 1) + ": " + _damage1;
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Draw Halofire Special Upgrade at Browi NPC
function DrawHalofireSpecialUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Spark Tracker",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 8])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 8] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,7,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,94,90,16,16);
		draw_text_transformed(112,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 8] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _damage = string(obj_player.might + (10 * obj_inventory.form_grid[# 3, 8]) + obj_player.might);
var _damage1 = string(obj_player.might + (10 * (obj_inventory.form_grid[# 3, 8] + 1))+  obj_player.might);
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 8]) + ": " + _damage + " > Level " + string(obj_inventory.form_grid[# 3, 8] + 1) + ": " + _damage1;
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Halofire Selected
function HalorfireSelected(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Selected Form Menu Sprites (Right Hand Side) //Drawn Regardless if form is selected
draw_sprite_stretched(spr_menu_circle16,1,70,42,32,32);
draw_sprite_stretched(spr_menu,3,70,63,32,11);
draw_sprite_stretched(spr_menu_circle16,1,70,76,32,32);
draw_sprite_stretched(spr_menu,3,70,97,32,11);
draw_sprite_stretched(spr_menu_circle16,1,162,42,32,32);
draw_sprite_stretched(spr_menu,3,162,63,32,11);
draw_sprite_stretched(spr_menu_circle16,1,162,76,32,32);
draw_sprite_stretched(spr_menu,3,162,97,32,11);
draw_sprite_stretched(spr_menu,3,70,110,90,16);
draw_sprite_stretched(spr_menu,3,162,110,32,16);
draw_sprite_stretched(spr_menu,3,196,110,32,16);

//Draw the selected form

//Draw it's four levelable features //weapon, armor, magic, special
draw_sprite(spr_weapons_allGame,3,70,42);
draw_sprite(spr_armor_allGame,3,70,76);
draw_sprite(spr_magic_allGame,3,162,42);
if (obj_inventory.form_grid[# 3, 8] > 0) draw_sprite(spr_special_allGame,3,162,76);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 3, 5]-1,70,63);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 3, 6]-1,70,97);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 3, 7]-1,162,63);
if (obj_inventory.form_grid[# 3, 8] > 0) draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 3, 8]-1,162,97);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(115,118,"HALOFIRE",.35,.35,0);
draw_text_transformed(178,118,"EQUIP",.35,.35,0);
draw_text_transformed(212,118,"BACK",.35,.35,0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _weaponText = "WEAPON: L-CLICK\nSlash for " + string(obj_player.might + 3 + (14 * obj_inventory.form_grid[# 3, 5])) + " damage.\nHold to charge a fiery\nbackslash."
draw_text_transformed(104,42,_weaponText,.35,.35,0);
var _armorText = "ARMOR: PASSIVE\nBlock " + string(7 + (4 * (obj_inventory.form_grid[# 3, 6] -1))) + " incoming\ndamage."
draw_text_transformed(104,76,_armorText,.35,.35,0);
var _magicText = "MAGIC: R-CLICK\nShoot meteors that\nbreak on inpact and deal\n" + string(obj_player.grace + 10 + ((obj_inventory.form_grid[# 3, 7])*(5))) + " damage per hit."
draw_text_transformed(196,42,_magicText,.35,.35,0);
var _specialText = "SPECIAL: SHIFT\nShoot a large spinning\nspark that shoots out\nsmaller sparks, dealing\n" + string(obj_player.grace + (10 * obj_inventory.form_grid[# 3, 8])) + " and " + string(round(obj_player.grace/2)) + "damage.";
if (obj_inventory.form_grid[# 3, 8] > 0) draw_text_transformed(196,76,_specialText,.35,.35,0);



//Equip the form
if (point_in_rectangle(_mouseX,_mouseY,162,110,194,126))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		with (obj_player) 
		{
			form = 3;
			script_execute(obj_inventory.form_grid[# form, 2]);
		}
	}
}
//Return to Select
if (point_in_rectangle(_mouseX,_mouseY,196,110,228,126))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,194,108,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = FormMenuGUI;
	}
}

}
//
//
//
//
//
//Halofire Cursor
function HalofireCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 3;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

if (obj_player.magic_primary = true) spread = 3.5;
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