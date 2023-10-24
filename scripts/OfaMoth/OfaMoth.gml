//Ofa Worm
//
//
//
//
//
//Ofa Worm Create
function scr_enemy_ofa_moth_create(){
home_state = scr_enemy_ofa_moth_free;
entity_step = home_state;
entity_drop = scr_enemy_ofa_moth_drop;
enemy_idle = spr_enemy_ofaMoth;
enemy_move = spr_enemy_ofaMoth;
enemy_damaged = spr_enemy_ofaMoth;
damaged_snd = snd_enemy_ofa_moth_damaged;
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
max_hp = 250 + (130 * enemy_lvl);
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
//Ofa Moth Free
function scr_enemy_ofa_moth_free(){
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
			entity_step = scr_enemy_ofa_moth_dustStep;
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
//Ofa Moth Dash
function scr_enemy_ofa_moth_dustStep(){
if (obj_game.gamePaused = false)
{
	lit = false;
	healthbar = false;
	//Timers
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer1 > 0) timer1 = timer1 - 1;
	
	//Set
	if (sprite_index != spr_enemy_ofaMoth_dustStep)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_dustStep;
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
		lit = true;
		shadow = 1;
		path_end();
		var _atk = irandom_range(0,1);
		if (_atk = 0)
		{
			healthbar = true;
			entity_step = scr_enemy_ofa_moth_crescentFire;
		}
		else 
		{
			healthbar = true;
			timer2 = 20;
			entity_step = scr_enemy_ofa_moth_moonBlast;
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
//Ofa Moth Dash
function scr_enemy_ofa_moth_crescentFire(){
if (obj_game.gamePaused = false)
{

	//Set
	if (sprite_index != spr_enemy_ofaMoth_whiteMoon)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_whiteMoon;
		local_frame = 0;
		image_index = 0;
	}

	//Animation
	scr_enemy_animation_one();
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			scr_projectile_whiteCrescent_create();
			break_object = other.break_object;
			shadow = 0;
			fragment_count = 0;
			fragment = obj_fragment;
			healthbar = true;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		for (var i = 0; i < 6; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				enemy_lvl = other.enemy_lvl;
				scr_projectile_whiteRod_create();
				direction = point_direction(x,y,obj_player.x,obj_player.y) - 45 + (15 * i);
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				fragment_count = 0;
				fragment = obj_fragment;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
			}
		}
		if (attack_counter >= 4)
		{
			timer1 = 180;
			entity_step = scr_enemy_ofa_moth_free;
		}
		else
		{
			timer1 = 21;
			timer2 = 50;
			entity_step = scr_enemy_ofa_moth_dustStep;
		}
			
	}
	
}
}
//
//
//
//
//
//Ofa Moth Moon Blast
function scr_enemy_ofa_moth_moonBlast(){
if (obj_game.gamePaused = false)
{

	//Set
	if (sprite_index != spr_enemy_ofaMoth_moonBlast)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_ofaMoth_orb,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_orb,0,false);
		sprite_index = spr_enemy_ofaMoth_moonBlast;
		local_frame = 0;
		image_index = 0;
	}
	timer2 = timer2 - 1;

	//Animation
	scr_enemy_animation_one();
	
	if (timer2 <= 0)
	{
		timer2 = 10;
		audio_sound_gain(snd_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			scr_projectile_whiteRod_create();
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
		attack_counter = attack_counter + 1;
		if (attack_counter >= 4)
		{
			timer1 = 180;
			sprite_index = enemy_idle;
			entity_step = scr_enemy_ofa_moth_free;
		}
		else
		{
			timer1 = 21;
			timer2 = 50;
			entity_step = scr_enemy_ofa_moth_dustStep;
		}
	}
	
}
}
//
//
//
//
//
//Ofa Moth Drop
function scr_enemy_ofa_moth_drop(){

var _objects = 6;
//var _dropBean = 45;
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
if (_drop1 < 7)//Form Specific Rog Stone
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
if (_drop1 >= 7) and (_drop1 < 15)//Random Rog Stone
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







