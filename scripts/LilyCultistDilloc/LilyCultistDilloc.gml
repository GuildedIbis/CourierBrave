//Lily Cultist Dilloc
//
//
//
//
//
//Lily Cultist Dilloc Create
function LilyCultistDillocCreate(){
home_state = LilyCultistDillocFree;
entity_step = home_state;
entity_drop = LilyCultistDrop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_cultistDilloc_idle;
enemy_move = spr_enemy_cultistDilloc_run;
enemy_damaged = spr_enemy_cultistDilloc_damaged;
damaged_snd = snd_cultist_damaged;
walk_snd = snd_walk_regular;
shadow = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 2;
max_hp = 100;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
target = -1;
friend_in_range = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
attack_counter = 0;
walk_snd_delay = 0;
_destX = 32;
_destY = 32;
dir_switch = 1;
path = -1;
}
//
//
//
//
//
//Lilly Cultist Dilloc Free State
function LilyCultistDillocFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//If 
	if (targeted = false)
	{
		lit = false;
		if (point_in_circle(obj_player.x, obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			EnemyAlert();
			aggro_drop = 300;
			targeted = true;
		}
		//if (point_in_circle(obj_escort.x,obj_escort.y,x,y,192)) and (!collision_line(x,y,obj_escort.x,obj_escort.y,obj_wall,false,false))
		//{
		//	script_execute(EnemyChaseEscort);
		//}
		//else
		//{
		//	script_execute(EnemyChaseCustom);
		//}
		//if (point_in_rectangle(obj_escort.x,obj_escort.y,x-12,y-12,x+12,y+12))
		//{
		//	path_end();
		//	sprite_index = enemy_idle;
		//}
		//EnemyChaseCustom();
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
		script_execute(EnemyChase);
		if (point_in_circle(obj_player.x, obj_player.y,x,y,48)) 
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer2 <= 0) and (point_in_circle(obj_player.x, obj_player.y,x,y,16)) 
			{
				entity_step = LilyCultistDillocTripleStab;
			}
		}
		if (timer1 <= 0)
		{	
			path_end();
			sprite_index = enemy_idle;
			attack_counter = 0;
			entity_step = LilyCultistDillocLifeLeaf;
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
//Lily Cultist Dilloc Life Leaf
function LilyCultistDillocLifeLeaf(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 2;
	if (timer3 > 0) timer3 = timer3 - 2;
	if (sprite_index != spr_enemy_cultistDilloc_lifeLeaf)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistDilloc_lifeLeaf;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
		if (!ds_exists(friend_in_range,ds_type_list)) friend_in_range = ds_list_create();
		ds_list_clear(friend_in_range);
		var _num = collision_circle_list(x,y,64,obj_enemy,false,true,friend_in_range,true);
		if (_num > 0)
		{
			target = friend_in_range[| 0];
		}
	}


	//Animate
	EnemyAnimation();
	if (timer1 <= 0)
	{
		timer1 = 30;
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_cultistDilloc_leafShoot,global.volumeEffects,1);
		audio_play_sound(snd_cultistDilloc_leafShoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = CultistLifeLeafFree;
			shooter = other;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_cultist_lifeLeaf;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.0
			local_frame = 0;
			hit_by_attack = -1;
			heal = false
			target = other.target
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
			timer1 = 60;
			damage = 5;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragPlant;
			bullet = true;
			//hit_script = EntityHitDestroy;
			if (target != -1) and (instance_exists(target))
			{
				direction = point_direction(x,y,target.x,target.y);
			}
			else direction = point_direction(x,y,obj_player.x,obj_player.y-4);
			image_angle = direction;
			speed = enemy_spd;
		}
	}
	if (attack_counter >= 3)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
		{
			timer1 = 180;
			timer3 = 60;
			hor_spd = irandom_range(-1,1);
			ver_spd = irandom_range(-1,1);
			if (hor_spd = 0) and (ver_spd = 0)
			{
				hor_spd = choose(-1,1)
				ver_spd = choose(-1,1)
			}
			entity_step = LilyCultistReposition;
		}
		else
		{
			timer1 = 180;
			entity_step = home_state;
		}
		sprite_index = enemy_idle;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Cultist Arrow Free
function CultistLifeLeafFree(){
if (obj_game.gamePaused = false)
{
	sprite_index = enemy_move;

	if (heal = false)
	{
		speed = enemy_spd;
		if (place_meeting(x,y,obj_player))
		{
			heal = true;
			audio_sound_gain(snd_cultistDilloc_lifeLeaf_heal,global.volumeEffects,1);
			audio_play_sound(snd_cultistDilloc_lifeLeaf_heal,0,false);
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
					var _damageTaken = max(1, (other.damage * 4) - armor);
					hp = hp - _damageTaken;
				}
			}
	
		}
		if (place_meeting(x,y,break_object)) 
		{
			heal = true;
			sprite_index = spr_cultist_lifeLeaf_healBurst;
			audio_sound_gain(snd_cultistDilloc_lifeLeaf_heal,global.volumeEffects,1);
			audio_play_sound(snd_cultistDilloc_lifeLeaf_heal,0,false);
		}
		if (!place_meeting(x,y,shooter))
		{
			if (place_meeting(x,y,obj_enemy))
			{
				heal = true;
				audio_sound_gain(snd_cultistDilloc_lifeLeaf_heal,global.volumeEffects,1);
				audio_play_sound(snd_cultistDilloc_lifeLeaf_heal,0,false);
			}
		}
	}
	if (heal = true)
	{
		with (instance_create_layer(x,y,"Instances",obj_effect))
		{
			image_xscale = 1;
			image_yscale = 1;
			spd = 0
			damage = other.damage;
			sprite_index = spr_cultist_lifeLeaf_healBurst;
			effect_script = EffectLifeLeafHealBurst;
			image_speed = 1;
			hit_by_attack = -1;
			timer1 = 50;
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
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
//Effect Life Leaf Heal Burst
function EffectLifeLeafHealBurst(){
timer1 = timer1 - 1;
if (sprite_index != spr_cultist_lifeLeaf_healBurst)
{
	sprite_index = spr_cultist_lifeLeaf_healBurst;
	image_speed = 1;
	image_index = 0;
}
EnemyHealCalculate(spr_cultist_lifeLeaf_healBurst);
if (timer1 <= 0) instance_destroy();
}

//
//
//
//
//
//Lily Cultist Dilloc Triple Stab
function LilyCultistDillocTripleStab(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_cultistDilloc_stab)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_cultistDilloc_stab;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_cultistDilloc_stab,global.volumeEffects,1);
		audio_play_sound(snd_cultistDilloc_stab,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 30;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_cultistDilloc_stab_hitbox)

	if (timer2 <= 0)
	{
		timer2 = 15;
		ds_list_clear(hit_by_attack);
	}
	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer2 = 60;
		timer3 = 60;
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
