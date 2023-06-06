// Retired Skills
//
//
//
//
//
//Ceriver Orb Rush State
function CeriverOrbladeDashCast(){
//Set
attacking = true;
//casting = true;
damage = grace + (13 * obj_inventory.form_grid[# 1, 8]);
invincible = true;
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
//Ceriver Aquabarrier Magic State
function CeriverAquaBarrierCast(){
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
	special = special - 100;
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
		projectile_sprite = spr_ceriver_aquaBarrier;
		projectile_script = CeriverAquaBarrierFree;
		idle_sprite = spr_ceriver_aquaBarrier;
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
if (keyboard_check(vk_shift) = false) or (special < 100)
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
//Ceriver Aqua Barrier Projectile Script
function CeriverAquaBarrierFree(){
//Set
image_speed = 1;
speed = projectile_speed;
//if (place_meeting(x,y,obj_player)) depth = obj_player.depth - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//Timers
if (sd_timer > 0) sd_timer = sd_timer - 1;
if (projectile_speed > 0) projectile_speed = projectile_speed - .15;

//Collision
if (place_meeting(x,y,obj_enemy_projectile)) 
{
	
	AttackCalculateProjectile(projectile_sprite);
}
if (place_meeting(x,y,break_object))
{
	speed = 0;
}
if (sd_timer <= 0) instance_destroy();

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
//Halofire Tri-Rock Magic State
function HalofireTriRock(){
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
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Melee time between attacks
{
	weapon_timer = weapon_timer - 1;
}
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//}

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
	attack_counter = attack_counter + 1;
	charge = charge - 24;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_halofire_trirock,global.volumeEffects,1);
		audio_play_sound(snd_halofire_trirock,0,0,global.volumeEffects);
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
PlayerAnimationCast();

//Restart or return to free state
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