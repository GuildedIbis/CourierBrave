//Regaliare Gameplay
//
//
//
//
//
//Regaliare Set (create)
function RegaliareSet(){
form = 0;
form_type = 0;
home_state = RegaliareSet;
free_state = RegaliareFree;
state_script = RegaliareFree;
magicP_script = RegaliareGoldBurst;
magicA_script = RegaliareHeavyBurst;
magic_primary = true;
//weapon_aim = false;
idle_sprite = spr_player_regaliare_idle;
roll_sprite = spr_player_regaliare_roll;
crull_sprite = spr_player_regaliare_crull;
recharge_sprite = spr_player_regaliare_recharge;
arm_sprite = spr_player_regaliare_castArm;
obj_cursor.curs_script = RegaliareCursor;

weapon_draw = RegaliareRegalBladeMenu;
magic_draw = RegaliareGoldBurstMenu;
armor_draw = RegaliareRegalArmorMenu;
special_draw = RegaliareGoldArcMenu;



//Dynamic Variables
weapon_count = -1;
casting = false;
max_weapon_count = -1;
magic_timer = 0;
walk_spd = 1.75;
armor = 12 + (6 * (obj_inventory.form_grid[# 0, 6] -1));
max_charge = 100 + (10 * conviction);
max_stamina = 100 + (50 * energy); //50 + (3* (might + round(might/15)));
max_hp = 200 + (20 * vitality);


}
//
//
//
//
//
//Regaliare Free (home) state
function RegaliareFree(){
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
if (yellow_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		yellow_crystal = yellow_crystal + 1;
	}
}
//if (yellow_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 12;
//		yellow_special = yellow_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)
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
	sprite_index = spr_player_regaliare_run;
}
else sprite_index = spr_player_regaliare_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Weapon Skill
if (key_attackW)
{
	if (thundux = false)// and (stamina >= 20)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		//stamina = stamina - 20;
		attack_script = RegaliareRegalBlade;
		state_script = PlayerStateAttack;
	}
}

//Magic Skill
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (yellow_crystal >= 5)
		{
			attack_script = magicP_script;
			state_script = PlayerStateAttack;
		}
		if (magic_primary = false) and (yellow_crystal >= 10)
		{
			attack_script = magicA_script;
			state_script = PlayerStateAttack;
		}
	}
}

//Special Attack
if (key_attackS) and (yellow_special >= 50)
{
	if (watervice = false)
	{
		yellow_special = yellow_special - 50;
		attack_script = RegaliareSpecial;
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

//Crull Stone State
if (keyboard_check_pressed(ord("C"))) and (crull_stone >= 1)
{
	audio_sound_gain(snd_player_crull,global.volumeEffects,1);
	audio_play_sound(snd_player_crull,0,false);
	state_script = PlayerStateCrull;
	
}

//Switch Magic Fire Mode
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 10, 3] = true)
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
//Regaliare RegalBlade State
function RegaliareRegalBlade(){
//Set
attacking = true;
damage = 20 + (14 * might) + (11 * obj_inventory.form_grid[# 0, 5]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	//audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	atk_snd_delay = 28;
}
if (yellow_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		yellow_crystal = yellow_crystal + 1;
	}
}
//if (yellow_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 12;
//		yellow_special = yellow_special + 1;
//	}
//}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1; 
}
if (weapon_timer > 0)
{
	weapon_timer = weapon_timer - 1;
}
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//}


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
AttackCalculateWeapon(spr_player_regaliare_slash_hitbox,obj_player,1.5,-1,-1,-1,-1,-1,5);

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
//Regaliare Magic State
function RegaliareGoldBurst(){
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
//if (yellow_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 12;
//		yellow_special = yellow_special + 1;
//	}
//}
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
	sprite_index = spr_player_regaliare_runCast;
}
else sprite_index = spr_player_regaliare_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
PlayerBulletSpawnPosition();


//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	yellow_crystal = yellow_crystal - 5;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		audio_play_sound(snd_goldBullet,0,0);
		break_object = other.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = 5 + (6 * obj_player.grace) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));//
		projectile_sprite = spr_goldBullet;
		projectile_script = RegaliareGoldBullet;
		idle_sprite = spr_goldBullet;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-4,4);
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 10;
}

//Animate
PlayerAnimationCast();

//Restart or Return to Free
if (mouse_check_button(mb_left) = false) or (yellow_crystal < 5)
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
function RegaliareGoldBullet(){
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
	
	AttackCalculateMagic(projectile_sprite,obj_player,-1,-1,-1,-1,-1,-1,1);
	instance_destroy();
	
}
if (place_meeting(x,y,break_object))
{
	instance_destroy();
}
//Ricochet
//var _normal = ProjectileCollisionNormal(x,y,break_object,4,1);
//if (_normal != -1)
//{
//	var _diff = direction - (_normal + 180);
//	direction = _normal - _diff;
//	image_angle = _normal - _diff;
//}
}
//
//
//
//
//
//Regaliare Heavy Burst Magic
function RegaliareHeavyBurst(){
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
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
//if (yellow_special < max_special) //Special Recharge
//{
//	if (special_timer > 0) special_timer = special_timer - 1;
//	if (special_timer <= 0)
//	{
//		special_timer = 12;
//		yellow_special = yellow_special + 1;
//	}
//}
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
	sprite_index = spr_player_regaliare_runCast;
}
else sprite_index = spr_player_regaliare_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
PlayerBulletSpawnPosition();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	yellow_crystal = yellow_crystal - 10;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		audio_play_sound(snd_goldBullet,0,0);
		break_object = obj_player.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = 6 + (8 * obj_player.grace) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));//
		projectile_sprite = spr_heavyBullet;
		projectile_script = RegaliareHeavyBullet;
		idle_sprite = spr_heavyBullet;
		hit_by_attack = -1;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-6,6);
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 15;
}

//Animate
PlayerAnimationCast();

//Restart or return to free state
if (mouse_check_button(mb_left) = false) or (yellow_crystal < 10)
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
//Regaliare Heavy Bullet Projectile Script
function RegaliareHeavyBullet(){
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
	AttackCalculateMagic(projectile_sprite,self,1.5,-1,-1,-1,-1,-1,2);
}
if (place_meeting(x,y,break_object))
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
function RegaliareSpecial(){
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
if (yellow_crystal < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		yellow_crystal= yellow_crystal + 1;
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

//Initiate Attack
if (sprite_index != spr_player_regaliare_cast_special)
{
	//Start Animation From Beginning
	sprite_index = spr_player_regaliare_cast_special;
	//sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Animation
PlayerAnimation();
if (animation_end)
{
	inv_dur_timer = 120;
	invincible = true;
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldArcs,global.volumeEffects,1);
		audio_play_sound(snd_goldArcs,0,0);
		timer1 = 120;
		break_object = obj_player.break_object;
		damage = 22 + (obj_player.divinity * 13) + (6 * (obj_inventory.form_grid[# 0, 8] - 1));
		idle_sprite = spr_goldArc;
		projectile_sprite = spr_goldArc;
		projectile_script = RegaliareGoldArcs;
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
function RegaliareGoldArcs(){
//
//Timers
if (timer1  > 0) timer1 = timer1  - 1;
if (timer2  > 0) timer2 = timer2  - 1;
//
//State
x = obj_player.x;
y = obj_player.y - 6;
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
	AttackCalculateMagic(spr_goldArc,obj_player,3,-1,-1,-1,-1,-1,1);
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
function RegaliareCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 0;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

if (obj_player.magic_primary = true) spread = 10;
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
