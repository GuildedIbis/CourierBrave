//Evarel
//
//
//
//
//
//Evarel Set (create)
function scr_player_evarel_set(){
form = 4;
form_type = 4;
home_state = scr_player_evarel_set;
free_state = scr_player_evarel_free;
state_script = scr_player_evarel_free;
idle_sprite = spr_player_evarel_idle;
roll_sprite = spr_player_evarel_roll;
crystal_sprite = spr_player_evarel_crystal;
arm_sprite = spr_player_evarel_castArm;
magicP_script = scr_player_evarel_flexthorn;
magicA_script = scr_player_evarel_bristlerod;
magic_primary = true;
obj_cursor.curs_script = scr_cursor_evarel;



//Dynamic Variables
weapon_count = -1;
max_weapon_count = -1;
magic_timer = 0;
attack_counter = 0;
max_attack_counter = 0;
walk_spd = 1.25;
special_count = -1;
max_special_count = -1;
armor = 9;//+ (5 * (obj_inventory.form_grid[# 4, 6] -1));
max_charge = 200;//+ (10 * conviction);
max_stamina = 100;//+ (50 * energy);
max_hp = 200;//+ (20 * vitality);
primary_cost = 15;
special_cost = 40;
}
//
//
//
//
//
//Evarel Free (home) state
function scr_player_evarel_free(){
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

//Timers
//scr_player_recharge(false,false,false,false,true,false);
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 18;
		audio_sound_gain(walk_snd,(global.volumeEffects)/2,1);
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
if (weapon_timer > 0) //Weapon time between attacks
{
	weapon_timer = weapon_timer - 1;
}


//Movement 2: Collision
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_evarel_run;
}
else sprite_index = spr_player_evarel_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
scr_player_animation();


//Weapon Attack
if (key_attackW)
{
	if (thundux = false) and (stamina >= 50)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		stamina = stamina - 50;
		attack_script = scr_player_evarel_daggerDash;
		state_script = scr_player_attack;
		
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (green_primary >= 15)
		{
			attack_counter = 0;
			attack_script = magicP_script;
			state_script = scr_player_attack;
		}
		if (magic_primary = false) and (green_primary >= 15)
		{
			audio_sound_gain(snd_evarel_bristlerod,global.volumeEffects,1);
			audio_play_sound(snd_evarel_bristlerod,0,0);
			magic_timer = 60;
			attack_script = magicA_script;
			state_script = scr_player_attack;
		}
	}
}

//Special Attack
if (key_attackS) and (green_special >= 40)
{
	if (watervice = false)
	{
		green_special = green_special - 40;
		attack_script = scr_player_evarel_thornrise;
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

//crystal Stone State
//if (keyboard_check_pressed(ord("C"))) and (crystal_use[crystal_selected] = false)
//{
//	var _crystalID = crystal_ary[crystal_selected];
//	audio_sound_gain(snd_player_crystal,global.volumeEffects,1);
//	audio_play_sound(snd_player_crystal,0,false);
//	state_script = obj_inventory.crystal_script[_crystalID];
//}

//Switch Magic Fire
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 22, 3] = true)
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
		primary_cost = 15;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
		primary_cost = 15;
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
//Ceriver Orb Rush State
function scr_player_evarel_daggerDash(){
//Set
attacking = true;
damage = 19;//+ (9 * obj_player.might) + (7 * obj_inventory.form_grid[# 4, 5]);
invincible = true;
inv_dur_timer = 5;

//Standard Timers
//scr_player_recharge(false,false,false,true,false,false);
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	//audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
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

//Attack Start
if (sprite_index != spr_player_evarel_daggerDash)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_evarel_daggerDash;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

hor_spd = lengthdir_x(3,direction);
ver_spd = lengthdir_y(3,direction);
var _collided = scr_player_collision();





//Collision
if (_collided = true)
{
	state_script = free_state;
	scr_camera_screen_shake(4,15);
}

//Calcuate Hit Entitites
scr_player_attack_calculate_weapon(spr_player_evarel_daggerDash_hitbox,obj_player,1,-1,-1,-1,-1,-1,6);

//Animate
scr_player_animation();

if (animation_end = true)
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
//Evarel Bristlerod Cast State
function scr_player_evarel_bristlerod(){
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
		audio_sound_gain(walk_snd,(global.volumeEffects)/2,1);
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
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_evarel_runCast;
}
else sprite_index = spr_player_evarel_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();


//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	green_primary = green_primary - 15;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		//audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		//audio_play_sound(snd_goldBullet,0,0);
		break_object = other.break_object;
		magic = true;
		timer1 = 6;
		distance = 0;
		fragment_count = 1;
		fragment = obj_fragPlant;
		damage = 30;//+ (16 * obj_player.grace) + ((obj_inventory.form_grid[# 4, 7] + 1)*(distance));
		projectile_sprite = spr_evarel_bristlerod;
		projectile_script = scr_projectile_bristlerod;
		idle_sprite = spr_evarel_bristlerod;
		hit_by_attack = -1;
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
		projectile_speed = 7.0;
	}
	if (mouse_check_button(mb_left) = false) or (green_primary < 20)
	{
		attacking = false;
		state_script = free_state;
		damage = 0;
		animation_end = false;
		atk_snd_delay = 0;
	}
	else
	{
		audio_sound_gain(snd_evarel_bristlerod,global.volumeEffects,1);
		audio_play_sound(snd_evarel_bristlerod,0,0);
		magic_timer = 60;
	}
}

//Animate
scr_player_animation_cast();


}
//
//
//
//
//
//Evarel Bristlerod Projectile Script
function scr_projectile_bristlerod(){
//Set
lit = true;
speed = projectile_speed;
distance = distance + 1;
damage = 30;//+ (16 * obj_player.grace) + ((obj_inventory.form_grid[# 4, 7] + 1)*(distance));


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
	
	scr_player_attack_calculate_magic(projectile_sprite,self,3,-1,-1,-1,-1,-1,5);
	//instance_destroy();
	
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
//Evarel Reflex Thorn Cast
function scr_player_evarel_flexthorn(){
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
		audio_sound_gain(walk_snd,(global.volumeEffects)/2,1);
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
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_evarel_runCast;
}
else sprite_index = spr_player_evarel_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();


//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	attack_counter = attack_counter + 1;
	green_primary = green_primary - 5;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_evarel_reflexthorn,global.volumeEffects,1);
		audio_play_sound(snd_evarel_reflexthorn,0,0);
		break_object = other.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragPlant;
		timer1 = 60;
		damage = 12;//+ (6 * obj_player.grace) + ((obj_inventory.form_grid[# 4, 7])*(5));//
		projectile_sprite = spr_evarel_reflexthorn;
		projectile_script = scr_projectile_flexthorn;
		idle_sprite = spr_evarel_reflexthorn;
		hit_by_attack = -1;
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
		projectile_speed = 4.0;
	}
	if (attack_counter <= 2)
	{
		magic_timer = 5;
	}
	if (attack_counter >= 3)
	{
		magic_timer = 30;
		attack_counter = 0;
	}
}

//Animate
scr_player_animation_cast();

//Restart or Return to Free
if (mouse_check_button(mb_left) = false) and (attack_counter = 0) 
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}
if (green_primary < 10)
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
//Evarel Reflex Thorn
function scr_projectile_flexthorn(){
//Set
lit = true;
if (timer1 > 0) timer1 = timer1 - 1;
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
	
	scr_player_attack_calculate_magic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
	//instance_destroy();
	
}
//Ricochet
var _normal = scr_projectile_collision_normal(x,y,break_object,4,1);
if (_normal != -1)
{
	var _diff = direction - (_normal + 180);
	direction = _normal - _diff;
	image_angle = _normal - _diff;
}
if (timer1 <= 0) instance_destroy();
}
//
//
//
//
//
//Evarel Thornrise State
function scr_player_evarel_thornrise(){
//Set
attacking = true;

//Standard Timers
//scr_player_recharge(false,false,false,true,false,false);
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 20;
}
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}

//Initiate Attack
if (sprite_index != spr_player_evarel_thornrise_cast)
{
	//Start Animation From Beginning
	sprite_index = spr_player_evarel_thornrise_cast;
	//sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
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
	with (instance_create_layer(x,y,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_evarel_thornrise,global.volumeEffects,1);
		audio_play_sound(snd_evarel_thornrise,0,0);
		timer1 = 300;
		timer3 = 30;
		break_object = obj_player.break_object;
		damage = 11;//+ (6 * obj_player.divinity) + (4 * (obj_inventory.form_grid[# 4, 8]));
		idle_sprite = spr_evarel_thornrise;
		projectile_sprite = spr_evarel_thornrise;
		projectile_script = scr_projectile_thornrise;
		hit_by_attack = -1;
		image_speed = 1;
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
//Evarel Thornrise Projectile Script
function scr_projectile_thornrise(){
//
//Timers
lit = true;
destructable = false;
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
if (timer3 > 0) timer3 = timer3 - 1;

if (sprite_index != spr_evarel_thornrise)
{
	//Start Animation From Beginning
	sprite_index = spr_evarel_thornrise;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{	
	scr_player_attack_calculate_magic(spr_evarel_thornrise,obj_player,-1,-1,-1,-1,-1,-1,1);
}
if (timer2 <= 0)
{
	timer2 = 15;
	ds_list_clear(hit_by_attack);
}
if (timer1 <= 0)
{
	image_alpha = image_alpha - .05;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
if (timer3 <= 0)
{
	image_speed = 0;
}
}
//
//
//
//
//
//Evarel Cursor
function scr_cursor_evarel(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 3;

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

	curs_width = 8 //+ (point_distance(x,y,obj_player.x,obj_player.y)/spread);
	curs_height = 8 //+ (point_distance(x,y,obj_player.x,obj_player.y)/spread);

}


depth = -5000;
}