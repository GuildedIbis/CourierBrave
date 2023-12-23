//Sepirel Gameplay
//
//
//
//
//
//Sepirel Set (create)
function scr_player_sepirel_set(){
//
form = 7;
form_type = 1;
home_state = scr_player_sepirel_set;
free_state = scr_player_sepirel_free;
state_script = scr_player_sepirel_free;
magicP_script = scr_player_sepirel_helixStone;
magicA_script = scr_player_sepirel_helixStone;
magic_primary = true;
idle_sprite = spr_player_sepirel_idle;
roll_sprite = spr_player_sepirel_roll;
crystal_sprite = spr_player_sepirel_crystal;
//recharge_sprite = spr_player_sepirel_recharge;
arm_sprite = spr_player_sepirel_castArm;
obj_cursor.curs_script = scr_cursor_sepirel;
//
weapon_count = -1;
casting = false;
max_weapon_count = -1;
primary_timer = 0;
walk_spd = 1.25;
armor = 15;//+ (5 * (obj_inventory.form_grid[# 0, 6]));
max_charge = 200;//+ (10 * conviction);
max_stamina = 100;//+ (50 * energy);
max_hp = 200;//+ (20 * vitality);
primary_cost = 6;
special_cost = 100;
}
//
//
//
//
//
//Sepirel Free (home) state
function scr_player_sepirel_free(){
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
//if (yellow_primary < max_charge) and (watervice = false)//charge Recharge
//{
//	if (charge_timer > 0) charge_timer = charge_timer - 1;
//	if (charge_timer <= 0) 
//	{
//		charge_timer = 6;
//		yellow_primary = yellow_primary + 1;
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
scr_player_collision();


//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_sepirel_run;
}
else sprite_index = spr_player_sepirel_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
scr_player_animation();


//Weapon Skill
if (key_attackW)
{
	if (thundux = false)// and (stamina >= 20)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		//stamina = stamina - 20;
		attack_script = scr_player_sepirel_regalBlade;
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
	if (watervice = false)
	{
		yellow_special = yellow_special - 100;
		attack_script = scr_player_sepirel_goldArcs;
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
if (keyboard_check_pressed(ord("C"))) and (crystal_use[crystal_selected] = false)
{
	var _crystalID = crystal_ary[crystal_selected];
	audio_sound_gain(snd_player_crystal,global.volumeEffects,1);
	audio_play_sound(snd_player_crystal,0,false);
	state_script = obj_inventory.crystal_script[_crystalID];
}

//Switch Magic Fire Mode
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 3, 3] = true)
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
//Sepirel Melee State
function scr_player_sepirel_melee(){
//Set
attacking = true;
damage = 30;//+ (7 * might) + (8 * obj_inventory.form_grid[# 0, 5]);

//Standard Timers
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	//audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	atk_snd_delay = 28;
}
//if (yellow_primary < max_charge) and (watervice = false)//charge Recharge
//{
//	if (charge_timer > 0) charge_timer = charge_timer - 1;
//	if (charge_timer <= 0) 
//	{
//		charge_timer = 6;
//		yellow_primary = yellow_primary + 1;
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


//Attack Start
if (sprite_index != spr_player_sepirel_melee)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_sepirel_melee;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
//scr_player_attack_calculate_weapon(spr_player_sepirel_slash_hitbox,obj_player,1.5,-1,-1,-1,-1,-1,5);

//Animate
scr_player_animation();
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
//Sepirel Magic State
function scr_player_sepirel_helixStone(){
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
	sprite_index = spr_player_sepirel_runCast;
}
else sprite_index = spr_player_sepirel_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();


//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	yellow_primary = yellow_primary - 6;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		//audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		//audio_play_sound(snd_goldBullet,0,0);
		break_object = other.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = 10;//+ (2 * obj_player.grace) + (3 * (obj_inventory.form_grid[# 0, 7]));//
		timer1 = 50;
		projectile_sprite = spr_projectile_sepirel_helixStone;
		projectile_script = scr_projectile_helixStone;
		idle_sprite = spr_projectile_sepirel_helixStone;
		hit_by_attack = -1;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-4,4);
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
//Sepirel Helix Stone Projectile Script
function scr_projectile_helixStone(){
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
//Sepirel Special State
function scr_player_sepirel_special(){
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
//if (yellow_primary < max_charge) and (watervice = false)//charge Recharge
//{
//	if (charge_timer > 0) charge_timer = charge_timer - 1;
//	if (charge_timer <= 0) 
//	{
//		charge_timer = 6;
//		yellow_primary = yellow_primary + 1;
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

//Initiate Attack
if (sprite_index != spr_player_sepirel_cast_special)
{
	//Start Animation From Beginning
	sprite_index = spr_player_sepirel_cast_special;
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
	inv_dur_timer = 120;
	invincible = true;
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		//audio_sound_gain(snd_goldArcs,global.volumeEffects,1);
		//audio_play_sound(snd_goldArcs,0,0);
		timer1 = 120;
		break_object = obj_player.break_object;
		damage = 22;//+ (obj_player.divinity * 13) + (6 * (obj_inventory.form_grid[# 0, 8]));
		idle_sprite = spr_projectile_sepirel_heatBomb;
		projectile_sprite = spr_projectile_sepirel_heatBomb;
		projectile_script = scr_projectile_heatBomb;
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

//End Sepirel Special State
}
//
//
//
//
//
//Sepirel Gold Arcs Projectile Script
function scr_projectile_heatBomb(){
//
//Timers
destructable = false;
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
	scr_player_attack_calculate_magic(spr_goldArc,obj_player,3,-1,-1,-1,-1,-1,1);
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
//Sepirel Cursor
function scr_cursor_sepirel(){
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
