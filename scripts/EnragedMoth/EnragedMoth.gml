//Enraged Moth
//
//
//
//
//
//Enraged Moth Create
function scr_enemy_enraged_moth_create(){
name = "Enraged Moth"
boss = true;
home_state = scr_enemy_enraged_moth_free;
entity_step = home_state;
entity_drop = scr_enemy_enraged_moth_drop;
enemy_idle = spr_enemy_enragedMoth;
enemy_move = spr_enemy_enragedMoth;
enemy_damaged = spr_enemy_enragedMoth;
damaged_snd = snd_ofaMoth_damaged;
walk_snd = snd_ofaWorm_dash;
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
form_type = 2;
max_hp = 600 + (305 * enemy_lvl);
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
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
	healthbar = true;
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;

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
			audio_sound_gain(snd_ofaMoth_dustStep,global.volumeEffects,1);
			audio_play_sound(snd_ofaMoth_dustStep,0,false);
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
	lit = false;
	healthbar = false;
	//Timers
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer1 > 0) timer1 = timer1 - 1;
	
	//Set
	if (sprite_index != spr_enemy_enragedMoth_dustStep)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedMoth_dustStep;
		local_frame = 0;
		image_index = 0;
	}

	
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

	//Set
	healthbar = true;
	if (sprite_index != spr_enemy_enragedMoth_rageCharge)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_enragedMoth_rageCharge,global.volumeEffects,1);
		audio_play_sound(snd_enragedMoth_rageCharge,0,false);
		sprite_index = spr_enemy_enragedMoth_rageCharge;
		local_frame = 0;
		image_index = 0;
	}
	
	//Animation
	scr_enemy_animation_one();
	if (animation_end = true)
	{
		entity_step = scr_enemy_enraged_moth_rageRush;
		audio_sound_gain(snd_enragedMoth_rageRush,global.volumeEffects,1);
		audio_play_sound(snd_enragedMoth_rageRush,0,false);
		damage = 70  + (11 * enemy_lvl);
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
	if (timer1 > 0) timer1 = timer1 - 1;
	//Set
	healthbar = true;
	if (sprite_index != spr_enemy_enragedMoth_rageRush)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedMoth_rageRush;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

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
		scr_enemy_attack_calculate(spr_enemy_enragedMoth_rageRush_hitbox);
	
	}
	else speed = 0;
		
	//Animation
	scr_enemy_animation();
	if (animation_end)
	{
		speed = 0;
		attack_counter = attack_counter + 1;
		if (attack_counter <= 2)
		{
			animation_end = false;
			audio_sound_gain(snd_enragedMoth_rageRush,global.volumeEffects,1);
			audio_play_sound(snd_enragedMoth_rageRush,0,false);
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
//Ofa Moth Moon Blast
function scr_enemy_enraged_moth_rageSpawn(){
if (obj_game.gamePaused = false)
{

	//Set
	if (sprite_index != spr_enemy_enragedMoth_spawnOrb)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_ofaMoth_orb,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_orb,0,false);
		sprite_index = spr_enemy_enragedMoth_spawnOrb;
		local_frame = 0;
		image_index = 0;
	}
	timer2 = timer2 - 1;

	//Animation
	scr_enemy_animation_one();
	
	if (timer2 <= 0)
	{
		timer2 = 25;
		audio_sound_gain(snd_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			scr_projectile_wormEgg_create();
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
home_state = scr_projectile_wormEgg_free;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
bullet = true;
healthbar = false;
boss = false;
inv_dur_timer = 0;
enemy_move = spr_enragedMoth_wormEgg;
damage = 45 + (8 * enemy_lvl);
aggro_drop = 300;
timer1 = 150;
enemy_spd = 2.0;
local_frame = 0;
hit_by_attack = -1;
hp = 60;
max_hp = 60;
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
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
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
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with instance_create_layer(x,y,"Instances",obj_enemy)
	{
		image_alpha = 1;
		enemy_lvl =  other.enemy_lvl;
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
var _objects = 6;
//var _dropBean = 600;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);

//with (instance_create_layer(x,y,"Instances",obj_itemBean))
//{
//	drop_amount = _dropBean;
//	sprite_index = spr_bean;
//	direction = (360/_objects) + _angle;
//	spd = .75 + (.3) + random(0.1);
//}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = other.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 < 30)//Form Specific Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = other.form_type;
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 4) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop1 >= 30) and (_drop1 < 60)//Random Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = irandom_range(0,5);
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 5) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 < 15)
{
	with (instance_create_layer(x,y,"Instances",obj_itemPS))
	{
		item_id = other.enemy_lvl;
		sprite_index = spr_powerstone_all;
		image_index = item_id;
		direction = (360/_objects * 6) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}







