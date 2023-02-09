//Folio Bulb Scripts
//
//
//
//
//
//Folio Bulb Create
function FolioBulbCreate(){
targeted = false;	
invincible = false;
healthbar = true;
bullet = false;
inv_dur_timer = 0;
home_state = FolioBulbFree;
entity_step = home_state;
entity_drop = FolioBulbDrop;
enemy_idle = spr_enemy_folioBulb_idle;
enemy_move = spr_enemy_folioBulb_run;
damaged_snd = snd_folioBulb_hit;
walk_snd = snd_walk_regular;
shadow = 1;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 300;
hp = max_hp;
boss = false;
enemy_spd = 1.1;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
walk_snd_delay = 0;
}
//
//
//
//
//
//Zerwerk Free
function FolioBulbFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;

	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
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
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			walk_snd_delay = 15;
			path_end();
			sprite_index = enemy_idle;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,24)) and (timer1 <= 0)
		{
			walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_folioBulb_rootRise,global.volumeEffects,1);
						audio_play_sound(snd_folioBulb_rootRise,0,false);
						timer1 = 90;
						entity_step = FolioBulbRootRise1;
					}
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					image_index = 0;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_folioBulb_rootRise,global.volumeEffects,1);
						audio_play_sound(snd_folioBulb_rootRise,0,false);
						timer1 = 90;
						entity_step = FolioBulbRootRise2;
					}
				break;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (timer1 <= 0)
		{
			
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 120;
			timer2 = 23;
			entity_step = FolioBulbPitFire;
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
//Zerwerk Tail Lash
function FolioBulbRootRise1(){
if (obj_game.gamePaused = false)
{
	if (sprite_index != spr_enemy_folioBulb_rootRise1)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_folioBulb_rootRise1;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_folioBulb_rootRise1_hitbox)

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		audio_sound_gain(snd_folioBulb_pitFire,global.volumeEffects,1);
		audio_play_sound(snd_folioBulb_pitFire,0,false);
		for (var i = 0; i <= 3; i = i + 1)
		{	
			with (instance_create_layer(x,y-8,"Instances",obj_enemy))
			{
				script_execute(BulbPitCreate);
				direction = 45 + (90 * i);
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				fragment_count = 3;
				fragment = obj_fragWood;
				bullet = true;
				hit_script = EntityHitDestroy;
			}
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
//Zerwerk Tail Lash
function FolioBulbRootRise2(){
if (obj_game.gamePaused = false)
{
	if (sprite_index != spr_enemy_folioBulb_rootRise2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_folioBulb_rootRise2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_folioBulb_rootRise2_hitbox)

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		audio_sound_gain(snd_folioBulb_pitFire,global.volumeEffects,1);
		audio_play_sound(snd_folioBulb_pitFire,0,false);
		for (var i = 0; i <= 3; i = i + 1)
		{	
			with (instance_create_layer(x,y-8,"Instances",obj_enemy))
			{
				script_execute(BulbPitCreate);
				direction = 90 * i;
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				fragment_count = 3;
				fragment = obj_fragWood;
				bullet = true;
				hit_script = EntityHitDestroy;
			}
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
//Folio Bulb Shoot
function FolioBulbPitFire(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_folioBulb_pitFire)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_folioBulb_pitFire;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 65;
	
	if (timer2 <= 0)
	{
		timer2 = 12
		audio_sound_gain(snd_folioBulb_pitFire,global.volumeEffects,1);
		audio_play_sound(snd_folioBulb_pitFire,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy))
		{
			script_execute(BulbPitCreate);
			direction =  point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
	}
	//Animate
	EnemyAnimation1();
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
//Zerwerk Drop
function FolioBulbDrop(){
var _objects = 3;
var _dropBean = 60;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;	
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 25) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 4;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 25) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 2;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}


	
}






