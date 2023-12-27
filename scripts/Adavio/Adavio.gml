//Adavio
//
//
//
//
//
//Adavio Set (create)
function scr_player_adavio_set(){
form = 2;
form_type = 2;
home_state = scr_player_adavio_set;
free_state = scr_player_adavio_free;
state_script = scr_player_adavio_free;
magicP_script = scr_player_adavio_voidSpread;
magicA_script = scr_player_adavio_voidCycle;
magic_primary = true;
idle_sprite = spr_player_adavio_idle;
roll_sprite = spr_player_adavio_roll;
crystal_sprite = spr_player_adavio_crystal;
recharge_sprite = spr_player_regaliare_recharge;
arm_sprite = spr_player_adavio_castArm;
obj_cursor.curs_script = scr_cursor_adavio;

//Dynamic Variables
magic_timer = 0;
walk_spd = 1.25;
armor = 8;
max_charge = 200 + (25 * conviction);
max_stamina = 200 + (25 * energy);
max_hp = 200 + (25 * vitality);
primary_cost = 25;
special_cost = 70;
}
//
//
//
//
//
//Adavio Free (home) state
function scr_player_adavio_free(){
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
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 18;
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

//Movement 2: Collision
scr_player_collision();

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
scr_player_animation();

//Weapon Attack
if (key_attackW) and (stamina >= 10)
{
	if (thundux = false)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		if (weapon_aim = false) direction = round(obj_player.direction/90) * 90;
		stamina = stamina - 10;
		timer1 = 12;
		attack_script = scr_player_adavio_hookThrust;
		state_script = scr_player_attack;
	}
}

//Primary Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (purple_primary >= 25)
		{
			attack_script = magicP_script;
			state_script = scr_player_attack;
		}
		if (magic_primary = false) and (purple_primary >= 25)
		{
			attack_script = magicA_script;
			state_script = scr_player_attack;
		}
	}
}

//Special Attack
if (key_attackS) and (purple_special >= 70)
{
	if (watervice = false)
	{
		timer1 = 35;
		attack_script = scr_player_adavio_riftCrush_cast;
		state_script = scr_player_attack;
		obj_cursor.curs_script = scr_cursor_adavio_riftCrush;
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
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 11, 3] = true)
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
		primary_cost = 25;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
		primary_cost = 25;
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
function scr_player_adavio_hookThrust(){
//Set
attacking = true;
casting = false;
damage = 20 //+ (9 * obj_player.might) + (5 * obj_inventory.form_grid[# 2, 5]);

//Standard Timers
//scr_player_recharge(false,false,true,false,false,false);
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_adavio_hookThrust,global.volumeEffects,1);
	audio_play_sound(snd_adavio_hookThrust,0,0);
	atk_snd_delay = 28;
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
scr_player_attack_calculate_weapon(spr_adavio_hookThrust_hitbox,obj_player,2.0,-1,-1,-1,-1,-1,4);

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
scr_player_animation();

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
		fragment_count = 2;
		fragment = obj_fragGold;
		timer1 = 10;
		damage = 15 //+ (obj_player.might * 11) + ((obj_inventory.form_grid[# 2, 5])*(7));//
		projectile_sprite = spr_adavio_hook_blast;
		projectile_script = scr_projectile_hookBlast;
		idle_sprite = spr_adavio_hook_blast;
		hit_by_attack = -1;
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
function scr_projectile_hookBlast(){
//Step
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
	
	scr_player_attack_calculate_weapon(projectile_sprite,obj_player,-1,-1,-1,-1,-1,-1,3);
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
function scr_player_adavio_voidSpread(){
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
	sprite_index = spr_player_adavio_runCast;
}
else sprite_index = spr_player_adavio_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	purple_primary = purple_primary - 25;
	audio_sound_gain(snd_adavio_voidBits,global.volumeEffects,1);
	audio_play_sound(snd_adavio_voidBits,0,0);
	for (var i = 0; i < 5; i = i + 1)
	{
		with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_projectile))
		{
			break_object = obj_player.break_object;
			magic = true;
			fragment_count = 2;
			fragment = obj_fragPurple;
			damage = 12 //+ (6 * obj_player.grace) + ((obj_inventory.form_grid[# 2, 7])*8);//
			projectile_sprite = spr_adavio_voidBit;
			projectile_script = scr_projectile_voidBit;
			timer1 = 30;
			idle_sprite = spr_adavio_voidBit;
			hit_by_attack = -1;
			direction = (point_direction(x,y,mouse_x,mouse_y) - 16 + (8 * i)) + irandom_range(-6,6);
			image_angle = direction;
			projectile_speed = 4.0;
		}
	}
	magic_timer = 45;
}

//Animate
scr_player_animation_cast();

//Reset or return to free state
if (mouse_check_button(mb_left) = false) or (purple_primary < 25)
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
function scr_projectile_voidBit(){
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
	
	scr_player_attack_calculate_magic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
	//instance_destroy();
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
//Special Void Bit
function scr_projectile_voidBit_special(){
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
//SD
//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	scr_player_attack_calculate_magic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
	//instance_destroy();
}
if (place_meeting(x,y,break_object)) or (timer1 = 0)
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
function scr_player_adavio_voidCycle(){
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
	sprite_index = spr_player_adavio_runCast;
}
else sprite_index = spr_player_adavio_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	purple_primary = purple_primary - 25;
	audio_sound_gain(snd_adavio_voidCycle,global.volumeEffects,1);
	audio_play_sound(snd_adavio_voidCycle,0,0);
	with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_projectile))
	{
		break_object = obj_player.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragPurple;
		damage = 22 //+ (obj_player.grace * 9) + ((obj_inventory.form_grid[# 2, 7])*(7));//
		projectile_sprite = spr_adavio_voidCycle;
		projectile_script = scr_projectile_voidCycle;
		timer1 = 20;
		idle_sprite = spr_adavio_voidCycle;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (point_direction(x,y,mouse_x,mouse_y));
		image_angle = direction;
		projectile_speed = 2.0;
	}
	magic_timer = 35;
}

//Animate
scr_player_animation_cast();

//Reset or Return to free state
if (mouse_check_button(mb_left) = false) or (purple_primary < 25)
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
function scr_projectile_voidCycle(){
//Set
//if (follow_timer > 0) follow_timer = follow_timer - 1;
lit = true;
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
			damage = 13 //+ (6 * obj_player.grace) + ((obj_inventory.form_grid[# 2, 7])*6);////
			projectile_sprite = spr_adavio_voidBit;
			projectile_script = scr_projectile_voidBit;
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
	
	scr_player_attack_calculate_magic(projectile_sprite,self,1,-1,-1,-1,-1,-1,2);
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
//Adavio Rift Crush A Script
function scr_player_adavio_riftCrush_cast(){
//
//Timers
//Standard Timers
//scr_player_recharge(false,false,true,false,false,false);
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
scr_player_collision();

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
if (!place_meeting(mouse_x,mouse_y,obj_wall)) and (!collision_line(mouse_x,mouse_y,obj_player.x,obj_player.y,obj_wall,false,false))
{
	if (!collision_line(mouse_x,mouse_y,obj_player.x,obj_player.y,obj_stair2,false,false))
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
}
else
{
	with (obj_cursor)
	{
		blocked = true;
	}
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (mouse_check_button_pressed(mb_left)) and (obj_cursor.blocked = false)
{	
	//magic_count = magic_count - 1;
	if (!place_meeting(mouse_x,mouse_y,obj_wall))
	{
		purple_special = purple_special - 75;
		special_timer = 90;
		dest_x = mouse_x;
		dest_y = mouse_y;
		state_script = scr_player_adavio_riftCrush_drop;
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
			obj_cursor.curs_script = scr_cursor_adavio;
		}
	}
}

//Animate
scr_player_animation();

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
function scr_player_adavio_riftCrush_drop(){
//
//Timers
//Standard Timers
inv_dur_timer = 30;
invincible = true;
//scr_player_recharge(false,false,true,false,false,false);
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
if (special_timer > 0)//Time for special affects
{
	special_timer = special_timer - 1;
}
speed = 0;
hor_spd = 0;
ver_spd = 0;

//Movement 2: Collision
scr_player_collision();

//Animation: Update Sprite
if (special_timer > 45)
{
	sprite_index = spr_player_adavio_riftCrushA;
}
if (special_timer <= 45)
{
	x = dest_x;
	y = dest_y;
	if (timer1 > 0) timer1 = timer1 - 1;
	sprite_index = spr_player_adavio_riftCrushB;
	damage = 39 //+ (obj_player.divinity * 18) + ((obj_inventory.form_grid[# 2, 8])*17);
	if (special_timer <= 30)
	{
		scr_player_attack_calculate_weapon(spr_player_adavio_riftCrushB_hitbox,obj_player,3,-1,-1,-1,-1,.2,5)
	}
}

if (timer1 <= 0) 
{
	timer1 = 90;
	audio_sound_gain(snd_adavio_voidBits,global.volumeEffects,1);
	audio_play_sound(snd_adavio_voidBits,0,0);
	for (var i = 0; i < 8; i = i + 1)
	{
		with (instance_create_layer(x,y,"Instances",obj_projectile))
		{
			break_object = obj_player.break_object;
			magic = true;
			fragment_count = 2;
			fragment = obj_fragPurple;
			damage = 13 //+ (6 * obj_player.divinity) + ((obj_inventory.form_grid[# 2, 8])*6);////
			projectile_sprite = spr_adavio_voidBit;
			projectile_script = scr_projectile_voidBit_special;
			timer1 = 15;
			idle_sprite = spr_adavio_voidBit;
			hit_by_attack = -1;
			direction = 0 + (45 * i);
			image_angle = direction;
			projectile_speed = 3.0;
		}
	}
}
	

//Create Bullet at end timer - timer is length of weapon sprite animation


//Animate
scr_player_animation_one();

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
function scr_cursor_adavio(){
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
function scr_cursor_adavio_riftCrush(){
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
