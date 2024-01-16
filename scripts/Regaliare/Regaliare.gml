//Regaliare Gameplay
//
//
//
//
//
//Regaliare Set (create)
function scr_player_regaliare_set(){
//
form = 0;
form_type = 0;
home_state = scr_player_regaliare_set;
free_state = scr_player_regaliare_free;
state_script = scr_player_regaliare_free;
magicP_script = scr_player_regaliare_goldBurst;
magicA_script = scr_player_regaliare_heavyBurst;
magic_primary = true;
idle_sprite = spr_player_regaliare_idle;
roll_sprite = spr_player_regaliare_roll;
crystal_sprite = spr_player_regaliare_crystal;
recharge_sprite = spr_player_regaliare_recharge;
arm_sprite = spr_player_regaliare_castArm;
obj_cursor.curs_script = scr_cursor_regaliare;
//
weapon_count = -1;
casting = false;
max_weapon_count = -1;
primary_timer = 0;
walk_spd = 1.25;
armor = 10;
max_charge = 200 + (10 * conviction);
max_stamina = 200 + (50 * energy);
max_hp = 200 + (20 * vitality);
primary_cost = 6;
special_cost = 100;
special_timer = 0;
overshield = 0;
projectile_spread = 4;
projectile_spread_timer = 30;
}
//
//
//
//
//
//Regaliare Free (home) state
function scr_player_regaliare_free(){
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
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 16;
		audio_sound_gain(walk_snd,global.volumeEffects * .75,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (hor_spd = 0) and (ver_spd = 0)
{
	walk_snd_delay = 8;	
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
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)
{
	special_timer = special_timer - 1;
}
if (projectile_spread > 4)
{
	projectile_spread = projectile_spread * .9;
}

//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

//Movement 2: Collision
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_regaliare_run;
}
else sprite_index = spr_player_regaliare_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
scr_player_animation();


//Weapon Skill
if (key_attackW) and (stamina >= 10)
{
	if (thundux = false)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		stamina = stamina - 10;
		attack_script = scr_player_regaliare_regalBlade;
		state_script = scr_player_attack;
	}
}

//Primary Skill
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (yellow_primary >= 5)
		{
			attack_script = magicP_script;
			projectile_spread = 4;
			projectile_spread_timer = 30;
			state_script = scr_player_attack;
		}
		if (magic_primary = false) and (yellow_primary >= 10)
		{
			attack_script = magicA_script;
			state_script = scr_player_attack;
		}
	}
}

//Special Attack
if (key_attackS) and (yellow_special >= 100)
{
	if (watervice = false) and (special_timer <= 0)
	{
		yellow_special = yellow_special - 100;
		attack_script = scr_player_regaliare_goldArcs;
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

//Switch Magic Fire Mode
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.form_grid[# 0, 7] = true)
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
		primary_cost = 10;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
		primary_cost = 5;
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
//Regaliare RegalBlade State
function scr_player_regaliare_regalBlade(){
//Set
attacking = true;
damage = 30;//+ (7 * might) + (8 * obj_inventory.form_grid[# 0, 5]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_play_sound(snd_regaliare_regalBlade,0,0,global.volumeEffects);
	atk_snd_delay = 28;
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1; 
}
if (weapon_timer > 0)
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)
{
	special_timer = special_timer - 1;
}

//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

//Attack Start
if (sprite_index != spr_player_regaliare_slash)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_regaliare_slash;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
scr_player_attack_calculate_weapon(spr_player_regaliare_slash_hitbox,obj_player,5,-1,-1,-1,-1,-1,5,1,5);

//Animate
scr_player_animation();
if (animation_end)
{
	if (obj_inventory.form_grid[# 0, 6] = true)
	{
		if (mouse_check_button(mb_right)) and (stamina >= 15)
		{
			stamina = stamina - 15;
			fixed_dir = _cardinalDir
			state_script = scr_player_regaliare_regalBlade_charge;
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
			weapon_charge = 0;
			damage = 0;
			animation_end = false;
			atk_snd_delay = 0;
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
//Regaliare RegalBlade State
function scr_player_regaliare_regalBlade_charge(){
//Set
attacking = true;
walk_spd = .75;

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_play_sound(snd_regaliare_regalBlade,0,0,global.volumeEffects);
	atk_snd_delay = 28;
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1; 
}
if (weapon_timer > 0)
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)
{
	special_timer = special_timer - 1;
}

weapon_charge = weapon_charge + 1;


//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);

//Movement 2: Collision
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_regaliare_spinSlash_chargeMove;
}
else sprite_index = spr_player_regaliare_spinSlash_charge;
//if (_oldSprite != sprite_index) local_frame = 0;

//Attack Start
//if (sprite_index != spr_player_regaliare_spinSlash_charge)
//{
//	//Start Animation From Beginning
//	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
//	sprite_index = spr_player_regaliare_spinSlash_charge;
//	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
//	local_frame = 0;
//	image_index = 0;
//	//Clear Hit List
//	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
//	ds_list_clear(hit_by_attack);
//}



//Animate
scr_player_animation_fixed();
if (animation_end) or (mouse_check_button_released(mb_right))
{
	attacking = false;
	state_script = scr_player_regaliare_regalBlade_release;
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
//Regaliare RegalBlade Release
function scr_player_regaliare_regalBlade_release(){
//Set
attacking = true;
damage = 30 + round(weapon_charge/3);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_play_sound(snd_regaliare_regalBlade,0,0,global.volumeEffects);
	atk_snd_delay = 28;
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1; 
}
if (weapon_timer > 0)
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)
{
	special_timer = special_timer - 1;
}

//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

//Attack Start
if (sprite_index != spr_player_regaliare_spinSlash_release)
{
	sprite_index = spr_player_regaliare_spinSlash_release;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
scr_player_attack_calculate_weapon(spr_player_regaliare_spinSlash_release_hitbox,obj_player,15,-1,-1,-1,-1,-1,5,2,8);

//Animate
scr_player_animation();
if (animation_end)
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
	weapon_charge = 0;

}
}
//
//
//
//
//
//Regaliare Magic State
function scr_player_regaliare_goldBurst(){
//Set
walk_spd = 1.0;
attacking = true;
casting = true;

//Standard Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 20;
		audio_sound_gain(walk_snd,global.volumeEffects * .75,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (hor_spd = 0) and (ver_spd = 0)
{
	walk_snd_delay = 10;	
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
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)
{
	special_timer = special_timer - 1;
}
if (projectile_spread_timer > 0)
{
	projectile_spread_timer = projectile_spread_timer - 1;
}

//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

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
	sprite_index = spr_player_regaliare_runCast;
}
else sprite_index = spr_player_regaliare_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();


//Create Bullet at end timer - timer is length of weapon sprite animation

if (magic_timer <= 0)
{	
	if (projectile_spread_timer <= 0)
	{
		scr_camera_screen_shake(1,5);
		if (projectile_spread < 10)
		{
			projectile_spread  = projectile_spread + 1;
		}
	}
	yellow_primary = yellow_primary - 6;
	
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		projectile_spread = other.projectile_spread;
		audio_play_sound(snd_regaliare_goldBullet,0,0,global.volumeEffects);
		break_object = other.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = 13;//+ (2 * obj_player.grace) + (3 * (obj_inventory.form_grid[# 0, 7]));//
		timer1 = 50;
		projectile_sprite = spr_goldBullet;
		projectile_script = scr_projectile_goldBurst;
		idle_sprite = spr_goldBullet;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-projectile_spread,projectile_spread);//4
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 10;
}

//Animate
scr_player_animation_cast();

//Restart or Return to Free
if (mouse_check_button(mb_left) = false) or (yellow_primary < 6)
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
//Regaliare Gold Bullet Projectile Script
function scr_projectile_goldBurst(){
//Set
lit = true;
speed = projectile_speed;
if (timer1 > 0) timer1 = timer1 - 1;
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
	scr_player_attack_calculate_magic(projectile_sprite,obj_player,-1,-1,-1,-1,-1,-1,1);	

}
if (place_meeting(x,y,break_object)) or (timer1 <= 0)
{
	instance_destroy();
}


}
//
//
//
//
//
//Regaliare Heavy Burst Magic
function scr_player_regaliare_heavyBurst(){
//Set
walk_spd = 1.0;
attacking = true;
casting = true;

//Standard Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 20;
		audio_sound_gain(walk_snd,global.volumeEffects * .75,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (hor_spd = 0) and (ver_spd = 0)
{
	walk_snd_delay = 10;	
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
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}
if (special_timer > 0)
{
	special_timer = special_timer - 1;
}
//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

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
	sprite_index = spr_player_regaliare_runCast;
}
else sprite_index = spr_player_regaliare_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	yellow_primary = yellow_primary - 10;
	scr_camera_screen_shake(1.5,5);
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		//audio_sound_gain(snd_regaliare_goldBullet,global.volumeEffects,1);
		audio_play_sound(snd_regaliare_goldBullet,0,0,global.volumeEffects);
		break_object = obj_player.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = 24;//+ (6 * obj_player.grace) + (6 * (obj_inventory.form_grid[# 0, 7]));//
		projectile_sprite = spr_heavyBullet;
		timer1 = 50;
		projectile_script = scr_projectile_heavyBurst;
		idle_sprite = spr_heavyBullet;
		hit_by_attack = -1;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-6,6);
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 15;
}

//Animate
scr_player_animation_cast();

//Restart or return to free state
if (mouse_check_button(mb_left) = false) or (yellow_primary < 10)
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}

//End Regaliare Heavy Burst Magic State
}
//
//
//
//
//
//Regaliare Heavy Burst Projectile Script
function scr_projectile_heavyBurst(){
//Set
lit = true;
speed = projectile_speed;
destructable = false;
if (timer1 > 0) timer1 = timer1 - 1;
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
if (place_meeting(x,y,obj_interactable)) 
{
	scr_player_attack_calculate_magic(projectile_sprite,self,5,-1,-1,-1,-1,-1,2);
}
if (place_meeting(x,y,break_object)) or (timer1 <= 0)
{
	instance_destroy();
}

//End Player Projectile (Regaliare Heavy Bullet) Free State
}
//
//
//
//
//
//Regaliare Special State
function scr_player_regaliare_goldArcs(){
//Set
attacking = true;

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
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
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}
//Armor Skill (Overshield)
if (obj_inventory.form_grid[# 0, 5] = true)
{
	scr_player_overshield();
}

//Initiate Attack
if (sprite_index != spr_player_regaliare_cast_special)
{
	//Start Animation From Beginning
	sprite_index = spr_player_regaliare_cast_special;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Animation
scr_player_animation();
if (animation_end)
{
	special_timer = 120;
	inv_dur_timer = 120;
	invincible = true;
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		//audio_sound_gain(snd_regaliare_goldArcs,global.volumeEffects,1);
		audio_play_sound(snd_regaliare_goldArcs,0,0,global.volumeEffects);
		follow = true;
		timer1 = 120;
		break_object = obj_player.break_object;
		damage = 22;//+ (obj_player.divinity * 13) + (6 * (obj_inventory.form_grid[# 0, 8]));
		idle_sprite = spr_goldArc;
		projectile_sprite = spr_goldArc;
		projectile_script = scr_projectile_goldArcs;
		hit_by_attack = -1;
		direction = (floor(other.direction/90))*90;
		image_angle = direction;
	}
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}

//End Regaliare Special State
}
//
//
//
//
//
//Regaliare Gold Arcs Projectile Script
function scr_projectile_goldArcs(){
//
//Timers
destructable = false;
if (timer1  > 0) timer1 = timer1  - 1;
if (timer2  > 0) timer2 = timer2  - 1;
//
//State
if (follow = true)
{
	x = obj_player.x;
	y = obj_player.y - 6;
	if (keyboard_check_pressed(vk_shift)) and (obj_inventory.form_grid[# 0, 8] = true)
	{
		follow = false;
		direction = point_direction(x,y,obj_cursor.x,obj_cursor.y);
		speed = 1.5;
	}
}


if (sprite_index != spr_goldArc)
{
	//Start Animation From Beginning
	timer1 = 120;
	sprite_index = spr_goldArc;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{	
	if (follow = true)
	{
		scr_camera_screen_shake(2,7);
	}
	scr_player_attack_calculate_magic(spr_goldArc,obj_player,20,-1,-1,-1,-1,-1,1);
}
if (timer2 <= 0)
{
	timer2 = 15;
	ds_list_clear(hit_by_attack);
}
if (timer1 <= 0)
{
	instance_destroy();
}
}
//
//
//
//
//
//RegaliareCursor
function scr_cursor_regaliare(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 0;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

if (obj_player.magic_primary = true)
{
	var _plyrSpread = 10 - ((obj_player.projectile_spread - 4) * 1.6);
	spread = max(3,_plyrSpread);
}
if (obj_player.magic_primary = false) spread = 6;
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
