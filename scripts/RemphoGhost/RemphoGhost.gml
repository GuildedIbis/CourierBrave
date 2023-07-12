//Rempho Ghost
//
//
//
//
//
//Rempho Ghost Create
function RemphoGhostCreate(){
targeted = false;	
invincible = false;
healthbar = true;
inv_dur_timer = 0;
home_state = RemphoGhostFree;
entity_step = home_state;
entity_drop = RemphoGhostDrop;
enemy_idle = spr_enemy_ghost_idle;
enemy_move = spr_enemy_ghost_move;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular
shadow = false;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_alpha = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 0;
max_hp = 180;
hp = max_hp;
enemy_spd = 1.2;
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
//Rempho Ghost Free
function RemphoGhostFree(){
//if (global.dayPhase != 2)
//{
//	invincible = true;
//	inv_dur_timer = 30;
//}
if (obj_game.gamePaused = false)// and (global.dayPhase = 2)
{
	//Timers
	if (timer1 > 0) and (watervice = false)
	{
		timer1 = timer1 - 1;
	}
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x, obj_player.y,x-32,y-32,x+32,y+32)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			if (image_alpha != 1) image_alpha = 1;
			EnemyAlert();
			aggro_drop = 300;
			targeted = true;
		}
	}
	
	//if (aggro_drop <= 0)
	//{
	//	image_alpha = image_alpha - .05;
	//	if (image_alpha <= 0)
	//	{
	//		image_speed = 0;
	//		sprite_index = enemy_idle;
	//		path_end();
	//		aggro_drop = 300;
	//		targeted = false;
	//		global.aggroCounter = global.aggroCounter - 1;
	//	}
	//}
	if (aggro_drop <= 0)
	{
		image_alpha = image_alpha - .05;
		if (image_alpha <= 0)
		{
			image_speed = 0;
			sprite_index = enemy_idle;
			path_end();
			aggro_drop = 300;
			targeted = false;
			global.aggroCounter = global.aggroCounter - 1;
		}
	}
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		{
			
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 36;
			timer2 = 120;
			entity_step = RemphoGhostShadowShiftA;
		}
		//if (walk_snd_delay <= 0)
		//{
		//	walk_snd_delay = 30;
		//	if (point_in_circle(obj_player.x, obj_player.y,x,y,32)) audio_play_sound(walk_snd,1,0);
		//}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
	}
	
	//Animation
	script_execute(EnemyAnimation);
}
else path_end();
}
//
//
//
//
//
//Rempho Ghost Shadow Shift A
function RemphoGhostShadowShiftA(){
if (obj_game.gamePaused = false)
{
	lit = false;
	healthbar = false;
	//Timers
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer1 > 0) timer1 = timer1 - 1;
	
	//Set
	if (sprite_index != spr_enemy_ghost_shadowShiftA)
	{
		//Start Animation From Beginning
		image_alpha = 1;
		sprite_index = spr_enemy_ghost_shadowShiftA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	
	//Collision Damage
	if (timer1 <= 0)
	{
		//Chase: create and execute a path towards player
		shadow = false;
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_entity);
		path_start(path, enemy_spd * 2, 0, 0);
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
	script_execute(EnemyAnimation1);
	if (animation_end = true)
	{
		lit = true;
		shadow = 1;
		healthbar = true;
		path_end();
		timer2 = 42;
		entity_step = RemphoGhostShadowShiftB;
		animation_end = false;
	}
	
	
}
else path_end();
}
//
//
//
//
//
//Rempho Ghost
function RemphoGhostShadowShiftB(){
if (obj_game.gamePaused = false)
{
	//Set
	if (sprite_index != spr_enemy_ghost_shadowShiftB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghost_shadowShiftB;
		local_frame = 0;
		image_index = 0;
	}
	EnemyAttackCalculate(spr_ghost_shadowShiftB_hitbox)
	//Animation
	damage = 30;
	//Cacluate Attack
	if (timer2 <= 0)
	{	
		timer2 = 84;
		audio_sound_gain(snd_ghost_soulSkull,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulSkull,0,false);
	}
	EnemyAnimation1();
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		entity_step = RemphoGhostFree;
		if (attack_counter < 3) timer1 = 0;
		else
		{
			timer1 = 300;
			attack_counter = 0;
		}
		audio_sound_gain(snd_ghost_soulFlare,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulFlare,0,false);
		with (instance_create_layer(x+22,y-8,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 0;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x,y-24,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 90;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x-22,y-8,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 180;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x,y+16,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 270;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}

	}
}
}
//
//
//
//
//
//Balurne Hunter Drop
function RemphoGhostDrop(){

var _objects = 6;
var _dropBean = 30;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = (360/_objects) + _angle;
	spd = .75 + (.3) + random(0.1);
}
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
if (_drop1 < 5)//Form Specific Rog Stone
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
if (_drop1 >= 5) and (_drop1 < 10)//Random Rog Stone
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
if (_drop2 < 5)
{
	with (instance_create_layer(x,y,"Instances",obj_itemPS))
	{
		item_id = other.enemy_lvl - 1;
		sprite_index = spr_powerstone_all;
		image_index = item_id;
		direction = (360/_objects * 6) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
}
}







