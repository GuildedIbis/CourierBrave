//Belurne Knight
//
//
//
//
//
//Belurne Knight Create
function BelurneKnightCreate(){
home_state = BelurneKnightFree;
entity_step = home_state;
entity_drop = BelurneKnightDrop;
enemy_idle = spr_enemy_knight_idle;
enemy_move = spr_enemy_knight_run;
enemy_damaged = spr_enemy_knight_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = 1;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 200;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
walk_snd_delay = 0;
//walk = false;
}
//
//
//
//
//
//Belurne Knight Free State
function BelurneKnightFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	EnemyAggro();
	//While Aggro is on
	if (targeted = true)
	{
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,24))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				timer1 = 60;
				timer2 = 23;
				entity_step = BelurneKnightFireblade;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		{
			
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 120;
			timer2 = 23;
			entity_step = BelurneKnightVoidCast;
		}
		if (walk_snd_delay <= 0)
		{
			walk_snd_delay = 15;
			audio_play_sound(snd_walk_regular,1,0);
		}
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
//BalurneRat Fireblade State
function BelurneKnightFireblade(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_knight_fireblade)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_knight_fireblade;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 60;
	//Cacluate Attack
	EnemyAttackCalculateAblaze(spr_enemy_knight_fireblade_hitbox,7)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
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
//BalurneRat Voidcast State 
function BelurneKnightVoidCast(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_knight_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_knight_cast;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 45;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_rat_slash_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		with (instance_create_layer(x,y,"Instances",obj_enemy))
		{
			VoidCastCreate(30);
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 6;
			fragment = obj_fragFire;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
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
//Belurne Knight Drop
function BelurneKnightDrop(){
if (obj_inventory.quest_grid[# 1, 0] = true) and (obj_inventory.quest_grid[# 1, 3] = false)
{
	obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 1] + 1;
}

var _objects = 3;
var _dropBean = 89;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);
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
}







