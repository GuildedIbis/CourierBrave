//Lilly Guard
//
//
//
//
//
//Lilly Guard Create
function LillyGuardCreate(){
home_state = LillyGuardFree;
entity_step = home_state;
entity_drop = LillyGuardDrop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_lillyGuard_idle;
enemy_move = spr_enemy_lillyGuard_run;
enemy_damaged = spr_enemy_lillyGuard_damaged;
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
timer3 = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Lilly Guard Free State
function LillyGuardFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x,obj_player.y,x-180,y-90,x+180,y+90)) and (timer1 <= 0)
		{
			EnemyWander(60,180); //Data Leak if not radius restricted
		}
		else sprite_index = enemy_idle;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			EnemyAlert();
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
		script_execute(EnemyChase);
		if (point_in_rectangle(obj_player.x,obj_player.y,x-12,y-12,x+12,y+12))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0) 
			{
				timer1 = 150;
				timer2 = 0;
				entity_step = LillyGuardTripleThrust;
				
			}
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
		//if (walk_snd_delay <= 0)
		//{
		//	walk_snd_delay = 30;
		//	if (point_in_circle(obj_player.x, obj_player.y,x,y,32)) audio_play_sound(walk_snd,1,0);
		//}
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
//Balurne Skirmisher Slash State
function LillyGuardTripleThrust(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_lillyGuard_tripleThrust)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_lillyGuard_tripleThrust;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 35;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_lillyGuard_tripleThrust_hitbox)

	if (timer2 <= 0)
	{
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		timer2 = 30;
		ds_list_clear(hit_by_attack);
	}
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
		entity_step = EnemyReposition;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Lilly Guard Drop
function LillyGuardDrop(){
//if (obj_inventory.quest_grid[# 1, 0] = true) and (obj_inventory.quest_grid[# 1, 3] = false)
//{
//	obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 1] + 1;
//}
var _objects = 2;
var _dropBean = 31;
var _drop1 = irandom_range(0,99)	
var _angle = random(360);


with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}

if (_drop1 > 50) //Rat Teeth
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 1;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])


}







