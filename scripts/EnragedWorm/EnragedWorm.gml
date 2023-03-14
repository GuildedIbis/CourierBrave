//Enraged Worm
//
//
//
//
//
//Enraged Worm Create
function EnragedWormCreate(){
home_state = EnragedWormFree;
entity_step = home_state;
entity_drop = EnragedWormDrop;
enemy_idle = spr_enemy_enragedWorm_idle;
enemy_move = spr_enemy_enragedWorm_dash;
enemy_damaged = spr_enemy_enragedWorm_hit;
damaged_snd = snd_ofaWorm_damaged;
walk_snd = snd_walk_water;
shadow = 0;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 60;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 1.4;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
dash_timer = 720;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Enraged Worm Free
function EnragedWormFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) and (watervice = false)
	{
		timer1 = timer1 - 1;
	}
	if (timer2 > 0) timer2 = timer2 - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Aggro 
	EnemyAggro();
	
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,8))
		{
			path_end();
			sprite_index = enemy_idle;
			entity_step = EnragedWormCharge;
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
//Enraged Worm Dash
function EnragedWormCharge(){
if (obj_game.gamePaused = false)
{
	if (sprite_index != spr_enemy_enragedWorm_charge)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedWorm_charge;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer1 = 20;
		entity_step = EnragedWormExplode;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Enraged Worm Dash
function EnragedWormExplode(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;

	if (sprite_index != spr_enemy_enragedWorm_explode)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedWorm_explode;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 70;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_enragedWorm_explode_hitbox);

	if (timer1 <= 0) image_alpha = image_alpha - .1;
	
	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		instance_destroy();
		if (targeted = true) global.aggroCounter = global.aggroCounter - 1;
	}
}
}
//
//
//
//
//
//Enraged Worm Drop
function EnragedWormDrop(){
	
//if(obj_inventory.quest_grid[# 6, 1] < obj_inventory.quest_grid[# 6, 2]) obj_inventory.quest_grid[# 6, 1] = obj_inventory.quest_grid[# 6, 1] + 1;
var _objects = 1;
var _dropBean = 15;
var _drop1 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 94) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 8;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}










