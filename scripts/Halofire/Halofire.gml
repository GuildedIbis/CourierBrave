//Halofire
//
//
//
//
//
//Halofire Set (create)
function HalofireSet(){
form = 1;
form_type = 1;
home_state = HalofireSet;
free_state = HalofireFree;
state_script = HalofireFree;
idle_sprite = spr_player_halofire_idle;
roll_sprite = spr_player_halofire_roll;
crull_sprite = spr_player_halofire_crull;
recharge_sprite = spr_player_halofire_recharge;
arm_sprite = spr_player_halofire_castArm;
magicP_script = HalofireMeteorSling;
magicA_script = HalofireFirespitCast;
magic_primary = true;
//weapon_aim = false
obj_cursor.curs_script = HalofireCursor;

weapon_draw = HalofireHamaxeMenu;
magic_draw = HalofireMeteorMenu;
armor_draw = HalofireFirewardArmorMenu;
special_draw = HalofireSpecialMenu;

//Dynamic Variables
weapon_count = -1;
max_weapon_count = -1;
magic_timer = 0;
attack_counter = 0;
max_attack_counter = 0;
walk_spd = 1.75;
special_count = -1;
max_special_count = -1;
armor = 7 + (4 * (obj_inventory.form_grid[# 1, 6]));
max_charge = 100 + (10 * conviction);
max_stamina = 100 + (50 * energy);
max_hp = 200 + (20 * vitality);
}
//
//
//
//
//
//Halofire Free (home) state
function HalofireFree(){
//Set
walk_spd = 1.75;
attacking = false;
casting = false;

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

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
if (orange_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Weapon time between attacks
{
	weapon_timer = weapon_timer - 1;
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


//Weapon Attack
if (key_attackW)
{
	if (thundux = false)// and (stamina >= 25)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		//stamina = stamina - 25;
		attack_script = HalofireHamaxe;
		state_script = PlayerStateAttack;
		
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (orange_crystal >= 16)
		{
			attack_script = HalofireMeteorSling;
			state_script = PlayerStateAttack;
		}
		if (magic_primary = false) and (orange_crystal >= 5)
		{
			attack_script = HalofireFirespitCast;
			state_script = PlayerStateAttack;
		}
	}
}

//Special Attack
if (key_attackS) and (orange_special >= 50)
{
	if (watervice = false)
	{
		orange_special = orange_special - 50;
		attack_script = HalofireSpecial;
		state_script = PlayerStateAttack;
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
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 13, 3] = true)
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

//Switch Weapon Aim Style
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
damage = 38 + (8 * obj_player.might) + (7 * obj_inventory.form_grid[# 1, 5]);

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
if (orange_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Weapon time between attacks
{
	weapon_timer = weapon_timer - 1;
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
AttackCalculateWeapon(spr_halofire_hamaxe_hitbox,obj_player,2,-1,-1,-1,-1,-1,5);

//Animate
PlayerAnimation();

//Return to Free State or enter Charging state
if (animation_end)
{
	if (mouse_check_button(mb_right))// and (stamina >= 15)
	{
		//stamina = stamina - 15;
		weapon_timer = 45;
		fixed_dir = _cardinalDir
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
walk_spd = .75;

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
if (orange_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Weapon time between attacks
{
	weapon_timer = weapon_timer - 1;
}


//Switch to charged state
if (weapon_timer <= 0)
{
	state_script = HalofireHamaxeCharged;
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
	sprite_index = spr_player_halofire_hamaxe_chargingMove;
}
else sprite_index = spr_player_halofire_hamaxe_charging;
if (_oldSprite != sprite_index) local_frame = 0;

//Animate
PlayerAnimationFixed();

//Attack
if (mouse_check_button_released(mb_right))
{
	state_script = HalofireHamaxeBackswing;
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
walk_spd = .75;

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
if (orange_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Weapon time between attacks
{
	weapon_timer = weapon_timer - 1;
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
	sprite_index = spr_player_halofire_hamaxe_chargedMove;
}
else sprite_index = spr_player_halofire_hamaxe_charged;
if (_oldSprite != sprite_index) local_frame = 0;


//Animate
PlayerAnimationFixed();

if (mouse_check_button_released(mb_right))
{
	state_script = HalofireHamaxeBackswingCharged;
	timer1 = 12;
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
damage = 38 + (8 * obj_player.might) + (7 * obj_inventory.form_grid[# 1, 5]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	atk_snd_delay = 28;
}
if (orange_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Melee time between attacks
{
	weapon_timer = weapon_timer - 1;
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
AttackCalculateWeapon(spr_player_halofire_hamaxe_backswing_hitbox,obj_player,2.5,-1,-1,-1,-1,-1,6);

//Animate
PlayerAnimationFixed();

if (animation_end)
{
	
	image_xscale = 1;
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
damage = 38 + (8 * obj_player.might) + (7 * obj_inventory.form_grid[# 1, 5]);
if (timer1 > 0) timer1 = timer1 - 1;

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	audio_play_sound(snd_halofire_hamaxe_slash,0,0,global.volumeEffects)
	atk_snd_delay = 28;
}
if (orange_crystal < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Melee time between attacks
{
	weapon_timer = weapon_timer - 1;
}

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
AttackCalculateWeapon(spr_player_halofire_hamaxe_backswing_hitbox,obj_player,2.5,300,-1,-1,-1,-1,7);
if (timer1 <= 0)
{
	timer1 = 24;
	with (instance_create_layer(obj_player.x, obj_player.y,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_halofire_firespit,global.volumeEffects,1);
		audio_play_sound(snd_halofire_firespit,0,0,global.volumeEffects);
		break_object = obj_player.break_object;
		magic = true;
		fragment_count = 0;
		fragment = obj_fragFire;
		damage = 20 + (9 * obj_player.might) + (12 * obj_inventory.form_grid[# 1, 5]);//
		projectile_sprite = spr_halofire_firespit;
		projectile_script = HalofireFirespit;
		idle_sprite = spr_halofire_firespit;
		image_index = irandom_range(0,5);
		hit_by_attack = -1;
		direction = obj_player.fixed_dir * 90;
		timer1 = irandom_range(20,30);
		timer2 = 150;
		projectile_speed = 2.0;
		speed = projectile_speed;
	}
}

//Animate
PlayerAnimationFixed();

if (animation_end)
{
	image_xscale = 1;
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
casting = true;

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
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Melee time between attacks
{
	weapon_timer = weapon_timer - 1;
}

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
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
	sprite_index = spr_player_halofire_runCast;
}
else sprite_index = spr_player_halofire_cast;
if (_oldSprite != sprite_index) local_frame = 0;


//Bullet Spawn Position
PlayerBulletSpawnPosition();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{
	orange_crystal = orange_crystal - 16;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_halofire_meteor,global.volumeEffects,1);
		audio_play_sound(snd_halofire_meteor,0,0,global.volumeEffects);
		break_object = obj_player.break_object;
		magic = true;
		//follow_timer = 28;
		fragment_count = 2;
		fragment = obj_fragFire;
		damage = 20 + (8 * obj_player.grace) + ((obj_inventory.form_grid[# 1, 7])*(7));//
		projectile_sprite = spr_meteor;
		projectile_script = HalofireMeteor;
		idle_sprite = spr_meteor;
		hit_by_attack = -1;
		direction = irandom_range(-8,8) + (point_direction(x,y,mouse_x,mouse_y));
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 25;
}

//Animate
PlayerAnimationCast();

//Reset or return to free sate
if (mouse_check_button(mb_left) = false) or (orange_crystal < 16)
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
//Halofire Firespit Magic State
function HalofireFirespitCast(){
//Set
walk_spd = 1.2;
attacking = true;
casting = true;

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
//if (red_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 5;
//		red_special = red_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Melee time between attacks
{
	weapon_timer = weapon_timer - 1;
}

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
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
	sprite_index = spr_player_halofire_runCast;
}
else sprite_index = spr_player_halofire_cast;
if (_oldSprite != sprite_index) local_frame = 0;


//Bullet Spawn Position
PlayerBulletSpawnPosition();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	orange_crystal = orange_crystal - 5;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_halofire_firespit,global.volumeEffects,1);
		audio_play_sound(snd_halofire_firespit,0,0,global.volumeEffects);
		break_object = obj_player.break_object;
		magic = true;
		fragment_count = 0;
		fragment = obj_fragFire;
		damage = 2 + obj_player.grace + ((obj_inventory.form_grid[# 1, 7]));//
		projectile_sprite = spr_halofire_firespit;
		projectile_script = HalofireFirespit;
		idle_sprite = spr_halofire_firespit;
		image_index = irandom_range(0,5);
		hit_by_attack = -1;
		direction = irandom_range(-12,12) + (point_direction(x,y,mouse_x,mouse_y));
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		timer1 = irandom_range(20,30);
		timer2 = 150;
		projectile_speed = 2.0;
		speed = projectile_speed;
	}
	magic_timer = 4;
}

//Animate
PlayerAnimationCast();

//Reset or return to free sate
if (mouse_check_button(mb_left) = false) or (orange_crystal < 5)
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
//Set
lit = true;
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

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateMagic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,2);
	instance_destroy();
}
if (place_meeting(x,y,break_object))
{
	instance_destroy();
}

}
//
//
//
//
//
//Halofire Meteor Projectile Script
function HalofireFirespit(){
//Set
lit = true;
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
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
if (timer1 <= 0)
{
	speed = 0;
}
if (timer2 <= 0)
{
	image_xscale = image_xscale - .02;
	image_yscale = image_yscale - .02;
	image_alpha = image_alpha - .02;
	if (image_alpha <= .5) instance_destroy();
}
//Collision
if (place_meeting(x,y,obj_enemy))
{
	
	AttackCalculateMagic(projectile_sprite,self,-1,60,-1,-1,-1,-1,.5);
	timer2 = 0;
	//instance_destroy();
}
if (place_meeting(x,y,break_object))
{
	speed = 0;
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
if (orange_crystal < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_crystal = orange_crystal + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Melee time between attacks
{
	weapon_timer = weapon_timer - 1;
}

//Attack Start
if (sprite_index != spr_player_halofire_cast_special)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_cast_special;
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
		damage = 32 + (12 * obj_player.divinity) + (9 * obj_inventory.form_grid[# 3, 8]);
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
	AttackCalculateMagic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,2);
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
		damage = 10 + (5 * obj_player.divinity);
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
	
	AttackCalculateMagic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
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
//
//Halofire Cursor
function HalofireCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 1;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

if (obj_player.magic_primary = true) spread = 4;
if (obj_player.magic_primary = false) spread = 4;
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