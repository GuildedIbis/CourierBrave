//Ofa Worm
//
//
//
//
//
//Ofa Worm Create
function OfaWormCreate(){
home_state = OfaWormFree;
entity_step = home_state;
entity_drop = OfaWormDrop;
enemy_idle = spr_enemy_ofaWorm_idle;
enemy_move = spr_enemy_ofaWorm_move;
enemy_damaged = spr_enemy_ofaWorm_hit;
damaged_snd = snd_ofaWorm_damaged;
walk_snd = snd_walk_water;
shadow = 0;
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
max_hp = 60;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 1.1;
local_frame = 0;
hit_by_attack = -1;
timer1 = 180;
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
//Ofa Worm Free
function OfaWormFree(){
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
		lit = true;
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (dash_timer > 0) dash_timer = dash_timer - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,8))
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				timer1 = 150;
				entity_step = OfaWormHeadbutt;
			}
		}

		if (dash_timer <= 0)
		{
			audio_sound_gain(snd_ofaWorm_dash,global.volumeEffects,1);
			audio_play_sound(snd_ofaWorm_dash,0,false);	
			dash_timer = 720;
			timer2 = 90;
		}
		if (timer2 > 0)
		{
			enemy_move = spr_enemy_ofaWorm_dash;
			enemy_spd = 2.0;	
		}
		else
		{
			enemy_spd = .75;
			enemy_move = spr_enemy_ofaWorm_move;
			
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
//Ofa Worm Dash
function OfaWormHeadbutt(){
if (obj_game.gamePaused = false)
{
	if (sprite_index != spr_enemy_ofaWorm_headbutt)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaWorm_headbutt;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 21;
	//Cacluate Attack
	EnemyAttackCalculate(spr_ofaWorm_headbutt_hitbox);

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
//Sabi Drop
function OfaWormDrop(){
	
//if(obj_inventory.quest_grid[# 6, 1] < obj_inventory.quest_grid[# 6, 2]) obj_inventory.quest_grid[# 6, 1] = obj_inventory.quest_grid[# 6, 1] + 1;
var _objects = 1;
var _dropBean = 12;
var _drop1 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 97) 
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










