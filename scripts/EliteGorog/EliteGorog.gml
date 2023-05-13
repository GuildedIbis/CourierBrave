//Elite Gorog - Mini-Boss
//
//
//
//
//
//Elite Gorog Create
function EliteGorogCreate(){
name = "Elite Gorog"
boss = false;
home_state = EliteGorogFree;
entity_step = home_state;
entity_drop = EliteGorogDrop;
enemy_idle = spr_enemy_gorogE_idle;
enemy_move = spr_enemy_gorogE_run;
enemy_damaged = spr_enemy_gorogE_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = 1;
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
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 450;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
_destX = 32;
_destY = 32;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Elite Gorog Free State
function EliteGorogFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_circle(obj_player.x, obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			EnemyAlert();
			aggro_drop = 300;
			targeted = true;
		}
		if (point_in_circle(obj_escort.x,obj_escort.y,x,y,192)) and (!collision_line(x,y,obj_escort.x,obj_escort.y,obj_wall,false,false))
		{
			script_execute(EnemyChaseEscort);
		}
		else
		{
			script_execute(EnemyChaseCustom);
		}
		if (point_in_rectangle(obj_escort.x,obj_escort.y,x-12,y-12,x+12,y+12))
		{
			path_end();
			sprite_index = enemy_idle;
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
		script_execute(EnemyChase);
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48)) 
		{	
			
			if (timer1 > 0) and (timer2 > 0) //AI feature: only use shield as last option
			{
				if (timer3 <= 0)//Shield Timer
				{
					path_end();
					timer3 = 180;
					inv_dur_timer = 180;
					entity_step = EliteGorogShield;
				}
			}
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				if (timer1 <= 0) //Heavy Slash A
				{
					entity_step = EliteGorogHeavySlashA;
				}		
			
			}
		}
		else
		{
			if (timer2 <= 0)
			{	
				var _rATK = irandom_range(0,2);
				if (_rATK = 0)
				{
					path_end();
					timer2 = 15;
					entity_step = EliteGorogKnifeThrow;
				}
				else
				{
					path_end();
					timer2 = 24;
					entity_step = EliteGorogChainHookToss;
				}
			}
		}
		
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
		
	}
	
	//Animation
	script_execute(EnemyAnimation);
}
else
{
	path_end();
	
}
}
//
//
//
//
//
//Elite Gorog Shield
function EliteGorogShield(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogE_shield)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorogE_shield;
		local_frame = 0;
		image_index = 0;
	}
	direction = point_direction(x,y,obj_player.x,obj_player.y);

	//Animate
	EnemyAnimation();
	if (timer3 <= 0)
	{
		timer3 = 180;
		entity_step = home_state;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Skirmisher Slash State
function EliteGorogHeavySlashA(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogE_heavySlash_A)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorogE_heavySlash_A;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 65;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_gorogE_heavySlash_A_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,20))
		{
			entity_step = EliteGorogHeavySlashB;
		}
		else 
		{
			timer1 = 30;
			sprite_index = enemy_idle;
			entity_step = EliteGorogFree;
		}
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Gorog Heavy Slash B
function EliteGorogHeavySlashB(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogE_heavySlash_B)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorogE_heavySlash_B;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 50;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_gorogE_heavySlash_B_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer1 = 60;
		hor_spd = irandom_range(-1,1);
		ver_spd = irandom_range(-1,1);
		if (hor_spd = 0) and (ver_spd = 0)
		{
			hor_spd = choose(-1,1)
			ver_spd = choose(-1,1)
		}
		entity_step = EliteGorogReposition;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Gorog Chain Hook Toss
function EliteGorogChainHookToss(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogE_chainHook_toss)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorogE_chainHook_toss;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	if (timer2 <= 0)
	{
		timer2 = 120;
		audio_sound_gain(snd_gorogKnife_throw,global.volumeEffects,1);
		audio_play_sound(snd_gorogKnife_throw,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			script_execute(EliteGorogChainHookCreate);
			direction = (point_direction(x,y,obj_player.x,obj_player.y-4));
			image_angle = direction;
			enemy_spd = 4.5;
			parent = other;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragMetal;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
	}
	//Animate
	EnemyAnimation();
	if (animation_end)
	{	
		attack_counter = 0;
		entity_step = EliteGorogChainHookWait;
		animation_end = false;
		
	}
}
}
//
//
//
//
//
//Elite Gorog Chain Hook Wait
function EliteGorogChainHookWait(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogE_chainHook_wait)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorogE_chainHook_wait;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Animate
	EnemyAnimation();
}
}
//
//
//
//
//
//Elite Gorog Knife Throw
function EliteGorogKnifeThrow(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogE_knifeThrow)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorogE_knifeThrow;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	if (timer2 <= 0)
	{
		timer2 = 15;
		audio_sound_gain(snd_gorogKnife_throw,global.volumeEffects,1);
		audio_play_sound(snd_gorogKnife_throw,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			script_execute(EliteGorogKnifeCreate);
			direction = (point_direction(x,y,obj_player.x,obj_player.y))+irandom_range(-3,3);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragMetal;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
	}
	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		if (attack_counter < 3)
		{
			timer2 = 15;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			sprite_index = spr_enemy_gorogE_knifeThrow;
			local_frame = 0;
			image_index = 0;
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
		}
		if (attack_counter >= 3)
		{
			attack_counter = 0;
			timer2 = 60;
			sprite_index = enemy_idle;
			entity_step = home_state;
			animation_end = false;
		}
	}
}
}
//
//
//
//
//
//EliteGorog Reposition
function EliteGorogReposition(){
//Timer

if (timer1 > 0) timer1 = timer1 - 1;


//Set
if (sprite_index != enemy_move)
{
	//Start Animation From Beginning
	sprite_index = enemy_move;
	local_frame = 0;
	image_index = 0;
}


//Animate
EnemyAnimation();


//Move
if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
{
	if (hor_spd != 0) or (ver_spd != 0) 
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
		path_start(path, enemy_spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	
	}
}
else sprite_index = enemy_idle;


//End
if (timer1 <= 0)
{
	timer1 = 30;
	entity_step = home_state;
	sprite_index = enemy_idle;
}
}
//
//
//
//
//
//Elite Gorog Drop
function EliteGorogDrop(){


var _objects = 3;
var _dropBean = 150;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);
var _drop3 = irandom_range(0,99);
var _angle = random(360);


with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 50) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 3;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 75) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 1;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop3 > 89) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = irandom_range(14,19);
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}

//else instance_create_layer(x,y,"Instances",_objects[0])
//obj_inventory.beaowire_dungeon[2] = 1;

}







