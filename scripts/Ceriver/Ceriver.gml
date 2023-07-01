//Ceriver
//
//
//
//
//
//Ceriver Set (create)
function CeriverSet(){
form = 3;
form_type = 3;
home_state = CeriverSet;
free_state = CeriverFree;
state_script = CeriverFree;
idle_sprite = spr_player_ceriver_idle;
roll_sprite = spr_player_ceriver_roll;
crull_sprite = spr_player_ceriver_crull;
recharge_sprite = spr_player_ceriver_recharge;
arm_sprite = spr_player_ceriver_castArm;
magicP_script = CeriverPolyorbCast;
magicA_script = CeriverLineorbCast;
magic_primary = true;
//weapon_aim = true;
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
armor = 11 + (6 * (obj_inventory.form_grid[# 3, 6] -1));
max_charge = 100 + (10 * conviction);
max_stamina = 100 + (50 * energy);
max_hp = 200 + (20 * vitality);


}
//
//
//
//
//
//Ceriver Free (home) state
function CeriverFree(){
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
if (blue_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		blue_crystal = blue_crystal + 1;
	}
}
//if (blue_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 12;
//		blue_special = blue_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)
{
	weapon_timer = weapon_timer - 1;
}



//Movement 2: Collision
PlayerCollision();

//Movement 3: Environment
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
		direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
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
		if (magic_primary = true) and (blue_crystal >= 6)
		{
			attack_script = magicP_script;
			state_script = PlayerStateAttack;
		}
		//Dynorb
		if (magic_primary = false) and (blue_crystal >= 3)
		{
			attack_script = magicA_script;
			state_script = PlayerStateAttack;
		}
		//if (magic_primary = false) and (charge >= 25)
		//{
		//	audio_sound_gain(snd_ceriver_orbDash,global.volumeEffects,1);
		//	audio_play_sound(snd_ceriver_orbDash,0,false);
		//	max_charge = 100 + (grace + round(grace/15));
		//	charge = charge - 25;
		//	magic_timer = 20;
		//	attack_script = magicA_script;
		//	state_script = PlayerStateAttack;
		//	direction = point_direction(x,y,mouse_x,mouse_y);
		//}
	}

}

//Special Attack
if (key_attackS) and (blue_special >= 20)
{
	if (watervice = false)
	{
		//audio_sound_gain(snd_ceriver_orbDash,global.volumeEffects,1);
		//audio_play_sound(snd_ceriver_orbDash,0,false);
		//special = special - 250;
		//magic_timer = 20;
		attack_script = CeriverSteelorbCast;
		state_script = PlayerStateAttack;
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
casting = false;
damage = round(might/2) + (10 * obj_inventory.form_grid[# 1, 5]);


//Standard Timers
if (blue_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		blue_crystal = blue_crystal + 1;
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
		damage = 18 + (6 * obj_player.might) + ((obj_inventory.form_grid[# 3, 6])*4);//
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
//Set
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
	
		AttackCalculateWeapon(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,3);
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
	
		AttackCalculateWeapon(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,3);
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
	blue_crystal = blue_crystal - 6;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		var _bubbleRand = irandom_range(0,3);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 30;
		damage = 8 + (5 * obj_player.grace) + ((obj_inventory.form_grid[# 3, 7]) * (2) + (_bubbleRand));//
		projectile_sprite = spr_ceriver_polyorb;
		projectile_script = CeriverPolyorbFree;
		idle_sprite = spr_ceriver_polyorb;
		image_index = _bubbleRand;
		projectile_speed = 3.0 + (.5 * image_index);
		image_speed = 0;
		hit_by_attack = -1;
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-12,12);
		image_angle = direction;
	}
	magic_timer = 5;
}

//Animate
PlayerAnimationCast();

//End State, Return to Free State
if (mouse_check_button(mb_left) = false) or (blue_crystal < 6)
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
//Ceriver Polyorb Projectile Script
function CeriverPolyorbFree(){
//Set
image_speed = 0;
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

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,-1);
	instance_destroy();
}
if (place_meeting(x,y,break_object))
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
//Ceriver Lineorb Magic State
function CeriverLineorbCast(){
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
	blue_crystal = blue_crystal - 3;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 15;
		damage = 7 + (4 * obj_player.grace) + ((obj_inventory.form_grid[# 3, 7]) * 3);//
		projectile_sprite = spr_ceriver_polyorb;
		projectile_script = CeriverLineorbFree;
		idle_sprite = spr_ceriver_polyorb;
		image_index = 0;
		projectile_speed = 2.5;
		image_speed = 0;
		hit_by_attack = -1;
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y);
	}
	magic_timer = 3;
}

//Animate
PlayerAnimationCast();

//End State, Return to Free State
if (mouse_check_button(mb_left) = false) or (blue_crystal < 3)
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
//Ceriver Lineorb Projectile Script
function CeriverLineorbFree(){
//Set
image_speed = 0;
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

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,-1);
	instance_destroy();
}
if (place_meeting(x,y,break_object))
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
//Ceriver Steelorb Magic State
function CeriverSteelorbCast(){
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
if (blue_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		blue_crystal = blue_crystal + 1;
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
	blue_special = blue_special - 20;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_steelorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_steelorb,0,0);
		break_object = obj_player.break_object;
		fragment_count = 3;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 60;
		damage = 35 + (12 * obj_player.divinity) + ((obj_inventory.form_grid[# 3, 8]) * (10));//
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
if (keyboard_check(vk_shift) = false) or (blue_charge < 20)
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
//Ceriver Steelorb Projectile Script
function CeriverSteelorbFree(){
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
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateStatus(projectile_sprite,self,3,-1,-1,-1,-1,-1);
	instance_destroy();
}
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
//Ceriver Cursor
function CeriverCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 3;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true) spread = 2;
if (obj_player.magic_primary = false) spread = 24;
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