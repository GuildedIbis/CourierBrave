//Enraged Moth
//
//
//
//
//
//Enraged Moth Create
function scr_enemy_enraged_moth_create(){
//Scripts
home_state = scr_enemy_enraged_moth_free;
entity_step = home_state;
entity_drop = scr_enemy_enraged_moth_drop;

//Assets
enemy_idle = spr_enemy_enragedMoth;
enemy_move = spr_enemy_enragedMoth;
enemy_damaged = spr_enemy_enragedMoth;
damaged_snd = snd_enemy_ofa_moth_damaged;
walk_snd = snd_enemy_ofaWorm_dash;

//Stats
form_type = 2;
drop_amount = 20;
max_hp = 915;//+ (450 * enemy_lvl);
hp = max_hp;
enemy_spd = 5;

//Animation and Status
name = "Enraged Moth"
boss = true;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
hor_spd = 0;
ver_spd = 0;
local_frame = 0;
hit_by_attack = -1;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;

//Self Destruct
if (obj_inventory.quest_grid[# 11, 1] >= 1)
{
	instance_destroy();
}
}
//
//
//
//
//
//Enraged Moth Free
function scr_enemy_enraged_moth_free(){
if (obj_game.gamePaused = false)
{
	
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;

	//Return visibility
	healthbar = true;
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_circle(obj_player.x, obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			scr_enemy_alert();
			global.bossCounter = global.bossCounter + 1;
			aggro_drop = 300;
			targeted = true;
		}
	}
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		sprite_index = enemy_idle;
		path_end();
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
		global.bossCounter = global.bossCounter - 1;
	}

	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		if (timer1 <= 0)
		{
			timer1 = 21;
			timer2 = 50;
			attack_counter = 0;
			entity_step = scr_enemy_enraged_moth_dustStep;
			audio_sound_gain(snd_enemy_ofaMoth_dustStep,global.volumeEffects,1);
			audio_play_sound(snd_enemy_ofaMoth_dustStep,0,false);
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
		else aggro_drop = 300;
	}
	
	//Animation
	scr_enemy_animation_one();
}
else path_end();
}
//
//
//
//
//
//Enraged Moth Dash
function scr_enemy_enraged_moth_dustStep(){
if (obj_game.gamePaused = false)
{
	
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_enragedMoth_dustStep)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedMoth_dustStep;
		local_frame = 0;
		image_index = 0;
	}

	//Become Invisible
	lit = false;
	healthbar = false;
	
	//Collision Damage
	if (timer1 <= 0)
	{
		//Chase: create and execute a path towards player
		shadow = false;
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_entity);
		path_start(path, enemy_spd, 0, 0);
		walk_snd_delay = walk_snd_delay - 1;
		if (timer2 <= 0)
		{
			walk_snd_delay = 15;
			path_end();
		}
	}
	else 
	{
		shadow = 1;
		path_end();
	}
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		shadow = 1;
		path_end();
		healthbar = true;
		lit = true;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,20))
		{
			entity_step = scr_enemy_enraged_moth_rageCharge;
		}
		else
		{
			timer2 = 20;
			entity_step = scr_enemy_enraged_moth_rageSpawn;
		}
	}
	
	
}
else path_end();
}
//
//
//
//
//
//Enraged Moth Rage Charge
function scr_enemy_enraged_moth_rageCharge(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_enragedMoth_rageCharge)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_enemy_enragedMoth_rageCharge,global.volumeEffects,1);
		audio_play_sound(snd_enemy_enragedMoth_rageCharge,0,false);
		sprite_index = spr_enemy_enragedMoth_rageCharge;
		local_frame = 0;
		image_index = 0;
	}
	
	//Resume Visibility
	healthbar = true;
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		entity_step = scr_enemy_enraged_moth_rageRush;
		audio_sound_gain(snd_enemy_enragedMoth_rageRush,global.volumeEffects,1);
		audio_play_sound(snd_enemy_enragedMoth_rageRush,0,false);
		damage = 70;//+ (11 * enemy_lvl);
		hor_spd = 0;
		ver_spd = 0;
		var _dir = round(point_direction(x,y,obj_player.x,obj_player.y)/90)
		switch(_dir)
		{
			case 0:
				hor_spd = 1;
				ver_spd = 0;
			break;
			case 1:
				hor_spd = 0;
				ver_spd = -1;
			break;
			case 2:
				hor_spd = -1;
				ver_spd = 0;
			break;
			case 3:
				hor_spd = 0;
				ver_spd = 1;
			break;
		}
		timer1 = 10;
	}
}
}
//
//
//
//
//
//Enraged Moth Rage Rush
function scr_enemy_enraged_moth_rageRush(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_enragedMoth_rageRush)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedMoth_rageRush;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Resume Visibility
	healthbar = true;
	
	//Collision
	if (timer1 <= 0) 
	{
		var _xDest = x + (hor_spd * (enemy_spd))
		var _yDest = y + (ver_spd * (enemy_spd))
		if (place_meeting(_xDest, _yDest,obj_entity))
		{
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
			//sprite_index = enemy_idle;
		}
		path = path_add();
		mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
		path_start(path, 3, 0, 0);
		damage = 45;
		scr_enemy_attack_calculate(spr_enemy_enragedMoth_rageRush_hitbox);
	
	}
	else speed = 0;
		
	//Animation
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		speed = 0;
		attack_counter = attack_counter + 1;
		if (attack_counter <= 2)
		{
			animation_end = false;
			audio_sound_gain(snd_enemy_enragedMoth_rageRush,global.volumeEffects,1);
			audio_play_sound(snd_enemy_enragedMoth_rageRush,0,false);
			var _dir = round(point_direction(x,y,obj_player.x,obj_player.y)/90)
			switch(_dir)
			{
				case 0:
					hor_spd = 1;
					ver_spd = 0;
				break;
				case 1:
					hor_spd = 0;
					ver_spd = -1;
				break;
				case 2:
					hor_spd = -1;
					ver_spd = 0;
				break;
				case 3:
					hor_spd = 0;
					ver_spd = 1;
				break;
			}
			timer1 = 10;
			image_index = 0;
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
		}
		else
		{
			entity_step = scr_enemy_enraged_moth_rageSpawn;
		}
	}
	
}
else
{
	speed = 0;
}
}
//
//
//
//
//
//Enraged Moth Rage Spawn
function scr_enemy_enraged_moth_rageSpawn(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_enragedMoth_spawnOrb)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_enemy_ofaMoth_orb,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ofaMoth_orb,0,false);
		sprite_index = spr_enemy_enragedMoth_spawnOrb;
		local_frame = 0;
		image_index = 0;
	}

	//Create Projectile
	if (timer2 <= 0)
	{
		timer2 = 25;
		audio_sound_gain(snd_enemy_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			//enemy_lvl = other.enemy_lvl;
			scr_projectile_wormEgg_create();
			lit = true;
			depth = other.depth - 1;
			direction = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-3,3);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
	}
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		timer1 = 120;
		sprite_index = enemy_idle;
		entity_step = scr_enemy_enraged_moth_free;
	}
	
}
}
//
//
//
//
//
//Worm Egg Create
function scr_projectile_wormEgg_create(){
//Scripts
home_state = scr_projectile_wormEgg_free; 
entity_step = scr_projectile_wormEgg_free;
entity_drop = Idle;

//Assets
enemy_move = spr_enragedMoth_wormEgg;

//Stats
max_hp = 60;
hp = max_hp;
damage = 45;
enemy_spd = 1.5;

//Animation and Status
invincible = false;
bullet = true;
healthbar = false;
boss = false;
inv_dur_timer = 0;
aggro_drop = 300;
timer1 = 150;
local_frame = 0;
hit_by_attack = -1;

}
//
//
//
//
//
//Worm Egg Free
function scr_projectile_wormEgg_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Collision
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_projectile_hit,global.volumeEffects,1);
		audio_play_sound(snd_projectile_hit,0,false);
		with (obj_player)
		{
			if (invincible = false)
			{
				if (dmg_snd_delay <= 0)
				{
					dmg_snd_delay = 15;
					audio_sound_gain(dmg_snd,global.volumeEffects,1);
					audio_play_sound(dmg_snd,0,false);
				}
				flash = .35;
				hp = hp - (other.damage - armor);
			}
		}
		with instance_create_layer(x,y,"Instances",obj_enemy)
		{
			image_alpha = 1;
			enemy_lvl =  other.enemy_lvl;
			scr_enemy_enraged_worm_create();
			timer1 = 20;
			entity_step = scr_enemy_enraged_worm_explode;
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			break_object = other.break_object;
		}
		instance_destroy();
	}
	if (place_meeting(x,y,break_object)) 
	{
		audio_sound_gain(snd_projectile_hit,global.volumeEffects,1);
		audio_play_sound(snd_projectile_hit,0,false);
		with instance_create_layer(x,y,"Instances",obj_enemy)
		{
			image_alpha = 1;
			//enemy_lvl =  other.enemy_lvl;
			scr_enemy_enraged_worm_create();
			timer1 = 20;
			entity_step = scr_enemy_enraged_worm_free;
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			break_object = other.break_object;
		}
		instance_destroy();
	}
}
else
{
	speed = 0;
}
}
//
//
//
//
//
//Enraged Moth Drop
function scr_enemy_enraged_moth_drop(){
var _objects = 3;	
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = 6;
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}

obj_inventory.quest_grid[# 11, 0] = true;
obj_inventory.quest_grid[# 11, 1] = 1;
}







