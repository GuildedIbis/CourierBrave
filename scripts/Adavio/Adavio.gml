//Adavio
//
//
//
//
//
//Adavio Set (create)
function AdavioSet(){
form = 2;
home_state = AdavioSet;
free_state = AdavioFree;
state_script = AdavioFree;
magicP_script = AdavioVoidSpreadCast;
magicA_script = AdavioVoidCycleCast;
magic_primary = true;
//weapon_aim = false;
idle_sprite = spr_player_adavio_idle;
roll_sprite = spr_player_adavio_roll;
crull_sprite = spr_player_adavio_crull;
recharge_sprite = spr_player_regaliare_recharge;
arm_sprite = spr_player_adavio_castArm;
obj_cursor.curs_script = AdavioCursor;

weapon_draw = AdavioPowerHookMenu;
magic_draw = AdavioVioletArmorMenu;
armor_draw = AdavioVoidSpreadMenu;
special_draw = AdavioSpecialMenu;



//Dynamic Variables
magic_timer = 0;
walk_spd = 1.75;
armor = 9 + (5 * (obj_inventory.form_grid[# 2, 6] -1));
max_charge = 50 + (3* (grace + round(grace/15)));
max_stamina = 50 + (3* (might + round(might/15)));
max_hp = 150 + (3* (vitality + round(vitality/15)));

//max_magic_count = 20 + (obj_inventory.form_grid[# 0, 7] * 2);
//magic_count = 0;
//special_count = -1;
//max_special_count = -1;
//if (magic_count > max_magic_count) magic_count = max_magic_count;
//weapon_count = -1;
//max_weapon_count = -1;
}
//
//
//
//
//
//Adavio Free (home) state
function AdavioFree(){
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
if (charge < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (special < max_special) //Special Recharge
{
	if (special_timer > 0) special_timer = special_timer - 1;
	if (special_timer <= 0)
	{
		special_timer = 5;
		special = special + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
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
	sprite_index = spr_player_adavio_run;
}
else sprite_index = spr_player_adavio_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
if (key_attackW)
{
	if (thundux = false) and (stamina >= 15)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		if (weapon_aim = false) direction = round(obj_player.direction/90) * 90;
		stamina = stamina - 15;
		timer1 = 12;
		attack_script = AdavioHookThrust;
		state_script = PlayerStateAttack;
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (charge >= 25)
		{
			max_charge = 100 + (grace + round(grace/15));
			attack_script = magicP_script;
			state_script = PlayerStateAttack;
		}
		if (magic_primary = false) and (charge >= 30)
		{
			max_charge = 100 + (grace + round(grace/15));
			attack_script = magicA_script;
			state_script = PlayerStateAttack;
		}
	}
}

//Special Attack
if (key_attackS) and (special >= 250)
{
	if (watervice = false)
	{
		//audio_sound_gain(snd_ceriver_orbDash,global.volumeEffects,1);
		//audio_play_sound(snd_ceriver_orbDash,0,false);
		//special = special - 250;
		//magic_timer = 20;
		attack_script = AdavioRiftCrushFree;
		state_script = PlayerStateAttack;
		obj_cursor.curs_script = AdavioRiftCrushCursor;
		//direction = point_direction(x,y,mouse_x,mouse_y);
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

//Recharge Magic State
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

//Switch Magic Fire Mode
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 11, 3] = true)
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

//Switch Aim Style
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
//Adavio Hook Thrust State
function AdavioHookThrust(){
//Set
attacking = true;
casting = false;
damage = might - 6 + (5 * obj_inventory.form_grid[# 2, 5]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_adavio_hookThrust,global.volumeEffects,1);
	audio_play_sound(snd_adavio_hookThrust,0,0);
	atk_snd_delay = 28;
}
if (charge < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (special < max_special) //Special Recharge
{
	if (special_timer > 0) special_timer = special_timer - 1;
	if (special_timer <= 0)
	{
		special_timer = 5;
		special = special + 1;
	}
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}


//Custom Timer
if (timer1 > 0) timer1 = timer1 - 1; 


//Attack Start
if (sprite_index != spr_player_adavio_hookThrust)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_adavio_hookThrust;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
AttackCalculateStatus(spr_adavio_hookThrust_hitbox,obj_player,2.0,-1,-1,-1,-1,-1);

//Hook Blast Spawn Position
var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 8;
		dir_offY = -6;
	break;
		
	case 4:
		dir_offX = 8;
		dir_offY = -6;
	break;
		
	case 1:
		dir_offX = 0;
		dir_offY = -18;
	break;
		
	case 2:
		dir_offX = -8;
		dir_offY = -6;
	break;
		
	case 3:
		dir_offX = 3;
		dir_offY = 7;
	break;	
}

//Animate
PlayerAnimation();

if (timer1 <= 0)
{
	timer1 = 60;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		//audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		//audio_play_sound(snd_goldBullet,0,0);
		//depth = obj_player.depth - 1;
		break_object = obj_player.break_object;
		magic = true;
		//follow_timer = 28; //2/1/23
		fragment_count = 2;
		fragment = obj_fragGold;
		timer1 = 10;
		//bounces = 0;
		damage = round(obj_player.might) + ((obj_inventory.form_grid[# 2, 5])*(7));//
		projectile_sprite = spr_adavio_hook_blast;
		projectile_script = AdavioHookBlast;
		idle_sprite = spr_adavio_hook_blast;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (round(obj_player.direction)/90)*90;
		image_angle = direction;
		projectile_speed = 3.5;
	}
}

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
//Adavio Hook Blast
function AdavioHookBlast(){
//Step
//if (follow_timer > 0) follow_timer = follow_timer - 1;
timer1 = timer1 - 1;
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
if (timer1 <= 0)
{
	instance_destroy();
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

}
//
//
//
//
//
//Adavio Void Cycle State
function AdavioVoidSpreadCast(){
//Set
walk_spd = 1.2;
attacking = true;
casting = true;

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
if (stamina < max_stamina) //Roll Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (special < max_special) //Special Recharge
{
	if (special_timer > 0) special_timer = special_timer - 1;
	if (special_timer <= 0)
	{
		special_timer = 5;
		special = special + 1;
	}
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
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
	sprite_index = spr_player_adavio_runCast;
}
else sprite_index = spr_player_adavio_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
PlayerBulletSpawnPosition();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	charge = charge - 30;
	audio_sound_gain(snd_adavio_voidBits,global.volumeEffects,1);
	audio_play_sound(snd_adavio_voidBits,0,0);
	for (var i = 0; i < 5; i = i + 1)
	{
		with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_projectile))
		{
			break_object = obj_player.break_object;
			magic = true;
			//follow_timer = 28; //2/5/23
			fragment_count = 2;
			fragment = obj_fragGold;
			damage = round(obj_player.grace/2) + 3 + ((obj_inventory.form_grid[# 2, 7]-1)*8);//
			projectile_sprite = spr_adavio_voidBit;
			projectile_script = AdavioVoidBit;
			timer1 = 30;
			idle_sprite = spr_adavio_voidBit;
			hit_by_attack = -1;
			//script_execute(LeafArcCreate);
			direction = (point_direction(x,y,mouse_x,mouse_y) - 16 + (8 * i)) + irandom_range(-6,6);
			image_angle = direction;
			projectile_speed = 4.0;
		}
	}
	magic_timer = 45;
}

//Animate
PlayerAnimationCast();

//Reset or return to free state
if (mouse_check_button(mb_left) = false) or (charge < 30)
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
//
function AdavioVoidBit(){
//Set
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
	
	AttackCalculate(projectile_sprite);
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
//AdavioMagicA
function AdavioVoidCycleCast(){
//Set
walk_spd = 1.2;
attacking = true;
casting = true;

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
if (special < max_special) //Special Recharge
{
	if (special_timer > 0) special_timer = special_timer - 1;
	if (special_timer <= 0)
	{
		special_timer = 5;
		special = special + 1;
	}
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
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
	sprite_index = spr_player_adavio_runCast;
}
else sprite_index = spr_player_adavio_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
PlayerBulletSpawnPosition();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	charge = charge - 25;
	audio_sound_gain(snd_adavio_voidCycle,global.volumeEffects,1);
	audio_play_sound(snd_adavio_voidCycle,0,0);
	with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_projectile))
	{
		break_object = obj_player.break_object;
		magic = true;
		//follow_timer = 28; //2/5/23
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = round(obj_player.grace) - 5 + ((obj_inventory.form_grid[# 2, 7])*(7));//
		projectile_sprite = spr_adavio_voidCycle;
		projectile_script = AdavioVoidCycle;
		timer1 = 20;
		idle_sprite = spr_adavio_voidCycle;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (point_direction(x,y,mouse_x,mouse_y));
		image_angle = direction;
		projectile_speed = 2.0;
	}
	magic_timer = 45;
}

//Animate
PlayerAnimationCast();

//Reset or Return to free state
if (mouse_check_button(mb_left) = false) or (charge < 25)
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
//Adavio Magic Primary Projectile Script
function AdavioVoidCycle(){
//Set
//if (follow_timer > 0) follow_timer = follow_timer - 1;
timer1 = timer1 - 1;
speed = projectile_speed;
image_angle = timer1 - 30;
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

//Burst into void bits
if (timer1 <= 0)
{
	audio_sound_gain(snd_adavio_voidBits,global.volumeEffects,1);
	audio_play_sound(snd_adavio_voidBits,0,0);
	for (var i = 0; i < 5; i = i + 1)
	{
		with (instance_create_layer(x,y,"Instances",obj_projectile))
		{
			break_object = obj_player.break_object;
			magic = true;
			fragment_count = 2;
			fragment = obj_fragGold;
			damage = round(obj_player.grace/2) - 3 + ((obj_inventory.form_grid[# 2, 7]-1)*5);////
			projectile_sprite = spr_adavio_voidBit;
			projectile_script = AdavioVoidBit;
			timer1 = 30;
			idle_sprite = spr_adavio_voidBit;
			hit_by_attack = -1;
			direction = (other.direction - 16 + (8 * i)) + irandom_range(-6,6);
			image_angle = direction;
			projectile_speed = 4.0;
		}
	}
	instance_destroy();
}

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculate(projectile_sprite);
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
//Adavio Special State
function AdavioDrainGrenadeCast(){
//Set
walk_spd = 1.2;
attacking = true;
casting = true;

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
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
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
if (weapon_timer > 0)//Time between weapon uses
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
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
PlayerBulletSpawnPosition();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	special = special - 200;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		break_object = obj_player.break_object;
		fragment_count = 3;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 60;
		damage = round(obj_player.grace/3) + ((obj_inventory.form_grid[# 1, 8]) * (3));//
		projectile_sprite = spr_ceriver_steelorb;
		projectile_script = CeriverSteelorbFree;
		idle_sprite = spr_ceriver_steelorb;
		image_index = 0;
		projectile_speed = 3;
		hit_by_attack = -1;
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
	}
	magic_timer = 30;
}

//Animate
PlayerAnimationCast();

//End State, Return to Free State
if (keyboard_check(vk_shift) = false) or (special < 200)
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
//Adavio Rift Crush A Script
function AdavioRiftCrushFree(){
//
//Timers
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
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
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
if (weapon_timer > 0)//Time between weapon uses
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
	sprite_index = spr_player_adavio_riftCrush_freeRun;
}
else sprite_index = spr_player_adavio_riftCrush_free;
if (_oldSprite != sprite_index) local_frame = 0;

//Cursor Effects
if (!place_meeting(mouse_x,mouse_y,obj_wall))
{
	with (obj_cursor)
	{
		blocked = false;
	}
}
else
{
	with (obj_cursor)
	{
		blocked = true;
	}
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (mouse_check_button_pressed(mb_left))
{	
	//magic_count = magic_count - 1;
	if (!place_meeting(mouse_x,mouse_y,obj_wall))
	{
		special = special - 250;
		special_timer = 90;
		dest_x = mouse_x;
		dest_y = mouse_y;
		state_script = AdavioRiftCrushCast;
		//Attack Start
		if (sprite_index != spr_player_adavio_riftCrushA)
		{
			sprite_index = spr_player_adavio_riftCrushA;
			local_frame = 0;
			image_index = 0;
			//Clear Hit List
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
		}
		audio_sound_gain(snd_adavio_riftCrush,global.volumeEffects,1);
		audio_play_sound(snd_adavio_riftCrush,0,0);
		with (obj_cursor)
		{
			obj_cursor.curs_script = AdavioCursor;
		}
	}
}

//Animate
PlayerAnimation();

//Reset or return to free state
if (mouse_check_button_pressed(vk_shift))
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
//Adavio Rift Crush Cast
function AdavioRiftCrushCast(){
//
//Timers
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
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
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
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)//Time for special affects
{
	special_timer = special_timer - 1;
}
speed = 0;
hor_spd = 0;
ver_spd = 0;

//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
if (special_timer > 45)
{
	sprite_index = spr_player_adavio_riftCrushA;
}
if (special_timer <= 45)
{
	x = dest_x;
	y = dest_y;
	sprite_index = spr_player_adavio_riftCrushB;
	damage = round(obj_player.grace) + 6 + ((obj_inventory.form_grid[# 2, 7])*9)
	if (special_timer <= 30)
	{
		AttackCalculateStatus(spr_player_adavio_riftCrushB_hitbox,obj_player,2,-1,-1,-1,-1,1)
	}
}


//Create Bullet at end timer - timer is length of weapon sprite animation


//Animate
PlayerAnimation1();

//Reset or return to free state
if (special_timer <= 0)
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
//AdavioCursor
function AdavioCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 2;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true) spread = 1.5;
if (obj_player.magic_primary = false)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,68))
	{
		spread = 24;
	}
	else spread = 3;
}
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
//AdavioCursor
function AdavioRiftCrushCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;


//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

if (obj_game.gamePaused = false)
{
	var _xClampF = clamp(window_mouse_get_x(),16,window_get_width()-32);
	var _yClampF = clamp(window_mouse_get_y(),16,window_get_height()-32);
	window_mouse_set(_xClampF,_yClampF)
	curs_width = 8;
	curs_height = 8;
	curs_form = 2;
	if (blocked = false)
	{
		curs_form = 2;
	}
	if (blocked = true)
	{
		curs_form = 6;
	}
}
	



depth = -5000;
}
