//Ceriver
//
//
//
//
//
//Ceriver Set (create)
function scr_player_ceriver_set(){
form = 3;
form_type = 3;
home_state = scr_player_ceriver_set;
free_state = scr_player_ceriver_free;
state_script = scr_player_ceriver_free;
idle_sprite = spr_player_ceriver_idle;
roll_sprite = spr_player_ceriver_roll;
//crystal_sprite = spr_player_ceriver_crystal;
//recharge_sprite = spr_player_ceriver_recharge;
arm_sprite = spr_player_ceriver_castArm;
magicP_script = scr_player_ceriver_polyorb;
magicA_script = scr_player_ceriver_lineorb;
magic_primary = true;
obj_cursor.curs_script = scr_cursor_ceriver;


//Dynamic Variables
if (obj_inventory.form_grid[# 3, 6] = true)
{
	
	weapon_count = 3;
	max_weapon_count = 3;
}
else 
{
	weapon_count = 2;
	max_weapon_count = 2;
}
weapon_cycle = 3;
base_spread = 6;
projectile_spread = 6;
magic_timer = 0;
melee_timer = 0;
walk_spd = 1.25;
armor = 5;
max_charge = 200 + (25 * conviction);
max_stamina = 200 + (25 * energy);
max_hp = 200 + (25 * vitality);
primary_cost = 4;
special_cost = 40;
overshield = 0;
}
//
//
//
//
//
//Ceriver Free (home) state
function scr_player_ceriver_free(){
//Set
walk_spd = 1.25;
attacking = false;
casting = false;

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

//Standard Timers
scr_player_standard_timers(16,true,true,true,true,base_spread);

//Movement 2: Collision
scr_player_collision();

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
scr_player_animation();

//Melee Attack
var _weaponCost
if (obj_inventory.form_grid[# 3, 5] = false)
{
	_weaponCost = 15;
}
else
{
	_weaponCost = 0;
}
if (key_attackW) and (stamina >= _weaponCost)
{
	if (thundux = false) and (weapon_count >= 1)
	{
		direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		timer1 = 15;
		attack_script = scr_player_ceriver_boomerang;
		state_script = scr_player_attack;
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		//Polyorb
		if (magic_primary = true) and (blue_primary >= 4)
		{
			attack_script = magicP_script;
			state_script = scr_player_attack;
			base_spread = 6;
			projectile_spread = 6;
		}
		//Dynorb
		if (magic_primary = false) and (blue_primary >= 4)
		{
			attack_script = magicA_script;
			state_script = scr_player_attack;
			base_spread = 0;
			projectile_spread = 0;
		}
	}

}

//Special Attack 
if (key_attackS) and (blue_special >= 40)
{
	if (watervice = false)
	{
		attack_script = scr_player_ceriver_steelorb;
		state_script = scr_player_attack;
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
		state_script = scr_player_roll;
		remain_dist = roll_dist;
	}
}

//Switch Magic Fire
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.form_grid[# 3, 7] = true)
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
		primary_cost = 4;
		projectile_spread = 0;
		base_spread = 0;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
		primary_cost = 4;
		projectile_spread = 6;
		base_spread = 6;
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
function scr_player_ceriver_boomerang(){
//Set
attacking = true;
casting = false;
damage = 10;


///Standard Timers
scr_player_standard_timers(-1,false,true,true,true,-1);

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
scr_player_animation();

//Return to Free State or Continue Throwing Boomerangs (if possible)
if (animation_end)
{
	//Set Cost
	var _weaponCost
	if (obj_inventory.form_grid[# 3, 5] = false)
	{
		_weaponCost = 15;
	}
	else
	{
		_weaponCost = 0;
	}
	
	//Throw Boomerang
	audio_sound_gain(snd_ceriver_boomerang,global.volumeEffects,1);
	audio_play_sound(snd_ceriver_boomerang,0,0,global.volumeEffects);
	stamina = stamina - _weaponCost;
	weapon_count = weapon_count - 1;
	if (weapon_cycle = 0)
	{
		weapon_cycle = 3;
	}
	if (weapon_cycle > 0)
	{
		weapon_cycle = weapon_cycle - 1;
	}
	if (obj_inventory.form_grid[# 3, 6] = true)
	{
		max_weapon_count = 3;
		if (weapon_cycle = 0)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_projectile))
			{
				return_timer = 22;
				sd_timer = 120;
				break_object = obj_player.break_object;
				magic = false;
				damage = 30;//+ (6 * obj_player.might) + ((obj_inventory.form_grid[# 3, 6])*5);//
				projectile_sprite = spr_ceriver_boomerang_steel;
				projectile_script = scr_projectile_steelboom;
				idle_sprite = spr_ceriver_boomerang_steel;
				hit_by_attack = -1;
				//script_execute(LeafArcCreate);
				direction = (point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
				image_angle = direction;
				projectile_speed = 4.0;
				returning = false;
			}
		}
		else
		{
			with (instance_create_layer(x,y-8,"Instances",obj_projectile))
			{
				return_timer = 35;
				sd_timer = 120;
				break_object = obj_player.break_object;
				magic = false;
				damage = 18;//+ (6 * obj_player.might) + ((obj_inventory.form_grid[# 3, 6])*5);//
				projectile_sprite = spr_ceriver_boomerang;
				projectile_script = scr_projectile_boomerang;
				idle_sprite = spr_ceriver_boomerang;
				hit_by_attack = -1;
				//script_execute(LeafArcCreate);
				direction = (point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
				image_angle = direction;
				projectile_speed = 2.5;
				returning = false;
			}
		}
	}
	else 
	{
		max_weapon_count = 2;
		with (instance_create_layer(x,y-8,"Instances",obj_projectile))
		{
			return_timer = 35;
			sd_timer = 120;
			break_object = obj_player.break_object;
			magic = false;
			damage = 18;//+ (6 * obj_player.might) + ((obj_inventory.form_grid[# 3, 6])*5);//
			projectile_sprite = spr_ceriver_boomerang;
			projectile_script = scr_projectile_boomerang;
			idle_sprite = spr_ceriver_boomerang;
			hit_by_attack = -1;
			//script_execute(LeafArcCreate);
			direction = (point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
			image_angle = direction;
			projectile_speed = 2.5;
			returning = false;
		}
	}
	
	//Restart or return
	if (mouse_check_button(mb_right)) and (stamina >= _weaponCost)
	{
		if (thundux = false) and (weapon_count >= 1)
		{
			//melee_timer = 15;
			attack_script = scr_player_ceriver_boomerang
			state_script = scr_player_attack;
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
function scr_projectile_boomerang(){
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
	scr_player_attack_calculate_weapon(projectile_sprite,self,-1,-1,-1,-1,-1,-1,3);
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		//scr_player_attack_calculate_weapon(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,3);
		returning = true;
	}
	if (place_meeting(x,y,break_object)) or (return_timer <= 0)
	{
		returning = true;
	}
	if (place_meeting(x,y,obj_resource)) or (return_timer <= 0)
	{
		//scr_player_attack_calculate_weapon(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,3);
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
	
		scr_player_attack_calculate_weapon(projectile_sprite,self,-1,-1,-1,-1,-1,-1,3);
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
//Steel Boom Free Script
function scr_projectile_steelboom(){
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
	scr_player_attack_calculate_weapon(projectile_sprite,self,10,-1,-1,-1,-1,-1,3,-1,-1);
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		//scr_player_attack_calculate_weapon(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,3);
		returning = true;
	}
	if (place_meeting(x,y,break_object)) or (return_timer <= 0)
	{
		returning = true;
	}
	if (place_meeting(x,y,obj_resource)) or (return_timer <= 0)
	{
		//scr_player_attack_calculate_weapon(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,3);
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
	
		scr_player_attack_calculate_weapon(projectile_sprite,self,-1,-1,-1,-1,-1,-1,3,-1,-1);
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
function scr_player_ceriver_polyorb(){
//Set
walk_spd = 1.0;
attacking = true;
casting = true;

///Standard Timers
scr_player_standard_timers(20,true,true,true,true,-1);


//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

//Movement 2: Collision
scr_player_collision();


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
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	scr_camera_screen_shake(1,3);
	blue_primary = blue_primary - 4;
	if (projectile_spread < 12)
	{
		projectile_spread = projectile_spread + 1;
	}
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		projectile_spread = other.projectile_spread;
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		var _bubbleRand = irandom_range(0,3);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 30;
		damage = 8 + (_bubbleRand * 4);//+ (5 * obj_player.grace) + (((obj_inventory.form_grid[# 3, 7]);//
		projectile_sprite = spr_ceriver_polyorb;
		projectile_script = scr_projectile_polyorb;
		idle_sprite = spr_ceriver_polyorb;
		image_index = _bubbleRand;
		projectile_speed = 3.0 + (.5 * image_index);
		image_speed = 0;
		hit_by_attack = -1;
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-projectile_spread,projectile_spread);
		image_angle = direction;
	}
	magic_timer = 5;
}

//Animate
scr_player_animation_cast();

//End State, Return to Free State
if (mouse_check_button(mb_left) = false) or (blue_primary < 4)
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
function scr_projectile_polyorb(){
//Set
lit = true;
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
	
	scr_player_attack_calculate_magic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
	//instance_destroy();
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
function scr_player_ceriver_lineorb(){
//Set
walk_spd = 1.0;
attacking = true;
casting = true;

///Standard Timers
scr_player_standard_timers(20,true,true,true,true,-1);


//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

//Movement 2: Collision
scr_player_collision();

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
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	blue_primary = blue_primary - 4;
	scr_camera_screen_shake(1,3);
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		sd_timer = 15;
		damage = 7;//+ (4 * obj_player.grace) + ((obj_inventory.form_grid[# 3, 7]) * 4);//
		projectile_sprite = spr_ceriver_polyorb;
		projectile_script = scr_projectile_lineorb;
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
scr_player_animation_cast();

//End State, Return to Free State
if (mouse_check_button(mb_left) = false) or (blue_primary < 4)
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
function scr_projectile_lineorb(){
//Set
lit = true;
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
	
	scr_player_attack_calculate_magic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
	//instance_destroy();
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
function scr_player_ceriver_steelorb(){
//Set
walk_spd = 1.0;
attacking = true;
casting = true;

///Standard Timers
scr_player_standard_timers(20,true,true,true,false,-1);


//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

//Movement 2: Collision
scr_player_collision();

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
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	scr_camera_screen_shake(2,8);
	blue_special = blue_special - 40;
	if (obj_inventory.form_grid[# 3, 8] = true)
	{
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
		{
			audio_sound_gain(snd_ceriver_steelorb,global.volumeEffects,1);
			audio_play_sound(snd_ceriver_steelorb,0,0,global.volumeEffects);
			break_object = obj_player.break_object;
			timer1 = 15;
			fragment_count = 3;
			fragment = obj_fragWater;
			magic = true;
			sd_timer = 120;
			damage = 20;
			projectile_sprite = spr_ceriver_steelorb_wall;
			projectile_script = scr_projectile_steelorb_wall;
			idle_sprite = spr_ceriver_steelorb_wall;
			image_index = 0;
			projectile_speed = 3;
			hit_by_attack = -1;
			speed = projectile_speed;
			direction = point_direction(x,y,mouse_x,mouse_y);
			image_angle = direction;
		}
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
		{
			audio_sound_gain(snd_ceriver_steelorb,global.volumeEffects,1);
			audio_play_sound(snd_ceriver_steelorb,0,0);
			break_object = obj_player.break_object;
			fragment_count = 3;
			fragment = obj_fragWater;
			magic = true;
			sd_timer = 60;
			damage = 35;//+ (12 * obj_player.divinity) + ((obj_inventory.form_grid[# 3, 8]) * (10));//
			projectile_sprite = spr_ceriver_steelorb;
			projectile_script = scr_projectile_steelorb;
			idle_sprite = spr_ceriver_steelorb;
			image_index = 0;
			projectile_speed = 3;
			hit_by_attack = -1;
			speed = projectile_speed;
			direction = point_direction(x,y,mouse_x,mouse_y);
			image_angle = direction;
		}
	}
	else
	{
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
		{
			audio_sound_gain(snd_ceriver_steelorb,global.volumeEffects,1);
			audio_play_sound(snd_ceriver_steelorb,0,0);
			break_object = obj_player.break_object;
			fragment_count = 3;
			fragment = obj_fragWater;
			magic = true;
			sd_timer = 60;
			damage = 35;//+ (12 * obj_player.divinity) + ((obj_inventory.form_grid[# 3, 8]) * (10));//
			projectile_sprite = spr_ceriver_steelorb;
			projectile_script = scr_projectile_steelorb;
			idle_sprite = spr_ceriver_steelorb;
			image_index = 0;
			projectile_speed = 3;
			hit_by_attack = -1;
			speed = projectile_speed;
			direction = point_direction(x,y,mouse_x,mouse_y);
			image_angle = direction;
		}
	}
	magic_timer = 30;
}

//Animate
scr_player_animation_cast();

//End State, Return to Free State
if (keyboard_check(vk_shift) = false) or (blue_special < 20)
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
function scr_projectile_steelorb(){
//Set
lit = true;
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
if (projectile_speed > 0) and (obj_inventory.form_grid[# 3, 8] = false)
{
	projectile_speed = projectile_speed - .15;
}
if (obj_inventory.form_grid[# 3, 8] = true)
{
	if (projectile_speed > 1)
	{
		projectile_speed = projectile_speed - .15;
	}
	if (projectile_speed < 1)
	{ 
		projectile_speed = 1;
	}
}

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	scr_player_attack_calculate_magic(projectile_sprite,self,20,-1,-1,-1,-1,-1,10);
	//instance_destroy();
}
if (place_meeting(x,y,obj_enemy_projectile)) 
{
	
	scr_player_attack_calculate_projectile(projectile_sprite);
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
//
//Ceriver Steelorb Wall Projectile Script
function scr_projectile_steelorb_wall(){
//Set
lit = true;
destructable = false;
speed = projectile_speed;
depth = -4700;
if (timer1 >= 0)
{
	image_speed = 1;
	timer1 = timer1 - 1;
}
else 
{
	image_speed = 0;
}
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
//if (place_meeting(x,y,obj_enemy)) 
//{
	
//	scr_player_attack_calculate_magic(projectile_sprite,self,10,-1,-1,-1,-1,-1,10);
//	//instance_destroy();
//}
if (place_meeting(x,y,obj_enemy_projectile)) 
{
	
	scr_player_attack_calculate_projectile(projectile_sprite);
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
function scr_cursor_ceriver(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 3;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true)
{
	var _plyrSpread = 6 - ((obj_player.projectile_spread - 6) * 1);
	spread = max(2,_plyrSpread);
}
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
function xCeriverCursorDraw(){
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