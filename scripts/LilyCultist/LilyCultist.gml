//Lily Cultist
//
//
//
//
//
//Lily Cultist Create
function scr_enemy_lilyCultist_create(){
//Scripts
home_state = scr_enemy_lilyCultist_free;
entity_step = scr_enemy_lilyCultist_free;
entity_drop = scr_enemy_lilyCultist_drop;

//Assets
enemy_idle = spr_enemy_lilyCultist_idle;
enemy_move = spr_enemy_lilyCultist_run;
enemy_damaged = spr_enemy_lilyCultist_damaged;
damaged_snd = snd_cultist_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 2;
drop_amount = 15;
max_hp = 100 + (50 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.2;


//Animation and Status
bullet = false;
healthbar = true;
shadow = true;
shadow_size = 1;
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
local_frame = 0;
hit_by_attack = -1;
target = -1;
friend_in_range = -1;
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
//Lilly Cultist Free State
function scr_enemy_lilyCultist_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		scr_enemy_wander_home(60,180,home_x,home_y); 
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
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
		home_x = x;
		home_y = y;
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
	}
	
	//While Aggro is on
	if (targeted = true)
	{
		scr_enemy_chase();
		lit = true;
		if (point_in_circle(obj_player.x, obj_player.y,x,y,64)) 
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer2 <= 0) and (point_in_circle(obj_player.x, obj_player.y,x,y,16)) 
			{
				entity_step = scr_enemy_lilyCultist_slash;
			}
		}
		if (timer1 <= 0) 
		{	
			path_end();
			sprite_index = enemy_idle;
			attack_counter = 0;
			entity_step = scr_enemy_lilyCultist_lifeLeaf;
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
	}
		
	//Animation
	scr_enemy_animation();
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
//Lily Cultist Life Leaf
function scr_enemy_lilyCultist_lifeLeaf(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_lilyCultist_lifeLeaf)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_lilyCultist_lifeLeaf;
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

	//Create Projectile (mid-animation)
	if (timer1 <= 0)
	{
		timer1 = 30;
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_lilyCultist_leafShoot,global.volumeEffects,1);
		audio_play_sound(snd_lilyCultist_leafShoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = scr_projectile_lifeLeaf_free;
			lit = true;
			enemy_lvl = other.enemy_lvl;
			shooter = other;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_projectile_lifeLeaf;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.0;
			local_frame = 0;
			hit_by_attack = -1;
			heal = false
			target = other.target
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
			timer1 = 60;
			damage = 30 + (6 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragPlant;
			bullet = true;
			//hit_script = EntityHitDestroy;
			if (target != -1) and (instance_exists(target))
			{
				if (target.hp < target.max_hp) and (!collision_line(x,y,target.x,target.y,obj_wall,true,true))
				{
					direction = point_direction(x,y,target.x,target.y);
				}
				else direction = point_direction(x,y,obj_player.x,obj_player.y-4);
			}
			else direction = point_direction(x,y,obj_player.x,obj_player.y-4);
			image_angle = direction;
			speed = enemy_spd;
		}
	}
	
	//Animate
	scr_enemy_animation();
	
	//End
	if (attack_counter >= 3)
	{
		attack_counter = 0;
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
			entity_step = scr_enemy_lilyCultist_reposition;
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
//Cultist Life Leaf Free
function scr_projectile_lifeLeaf_free(){
if (obj_game.gamePaused = false)
{
	//Set
	sprite_index = enemy_move;

	//Before Collision
	if (heal = false)
	{
		speed = enemy_spd;
		if (place_meeting(x,y,obj_player))
		{
			heal = true;
			audio_sound_gain(snd_lilyCultist_lifeLeaf_heal,global.volumeEffects,1);
			audio_play_sound(snd_lilyCultist_lifeLeaf_heal,0,false);
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
	
		}
		if (place_meeting(x,y,break_object)) 
		{
			heal = true;
			sprite_index = spr_projectile_lifeLeaf_healBurst;
			audio_sound_gain(snd_lilyCultist_lifeLeaf_heal,global.volumeEffects,1);
			audio_play_sound(snd_lilyCultist_lifeLeaf_heal,0,false);
		}
		if (!place_meeting(x,y,shooter))
		{
			if (place_meeting(x,y,obj_enemy))
			{
				heal = true;
				audio_sound_gain(snd_lilyCultist_lifeLeaf_heal,global.volumeEffects,1);
				audio_play_sound(snd_lilyCultist_lifeLeaf_heal,0,false);
			}
		}
	}
	
	//After Collision
	if (heal = true)
	{
		with (instance_create_layer(x,y,"Instances",obj_effect))
		{
			lit = true;
			image_xscale = 1;
			image_yscale = 1;
			spd = 0
			damage = other.damage;
			sprite_index = spr_projectile_lifeLeaf_healBurst;
			effect_script = scr_projectile_lifeLeaf_healBurst;
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
function scr_projectile_lifeLeaf_healBurst(){
if (obj_game.gamePaused = false)
{
	//Timer
	timer1 = timer1 - 1;
	
	//Setup
	if (sprite_index != spr_projectile_lifeLeaf_healBurst)
	{
		sprite_index = spr_projectile_lifeLeaf_healBurst;
		image_speed = 1;
		image_index = 0;
	}
	
	//Calculate Attack
	scr_enemy_attack_calculate_heal(spr_projectile_lifeLeaf_healBurst);
	
	//Self Destruct
	if (timer1 <= 0) instance_destroy();
}
else speed = 0;
}
//
//
//
//
//
//Lily Cultist Slash
function scr_enemy_lilyCultist_slash(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_lilyCultist_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_lilyCultist_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_lilyCultist_stab,global.volumeEffects,1);
		audio_play_sound(snd_lilyCultist_stab,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 30;
	scr_enemy_attack_calculate(spr_enemy_lilyCultist_slash_hitbox)

	//Animate
	scr_enemy_animation();
	
	//End
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
		entity_step = scr_enemy_lilyCultist_reposition;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Lily Cultist Reposition
function scr_enemy_lilyCultist_reposition(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();

	//Set
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation();

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
	if (timer3 <= 0)
	{
		timer3 = 60;
		entity_step = home_state;
		sprite_index = enemy_idle;
	}
}
else speed = 0;
}
//
//
//
//
//
//Lily Cultist Zealot Spawn
function scr_enemy_lilyCultist_zealotSpawn(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Set
	if (sprite_index != spr_enemy_lilyCultist_zealotSpawn)
	{
		speed = 0;
		sprite_index = spr_enemy_lilyCultist_zealotSpawn;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation_one();

	//End
	if (animation_end)
	{
		entity_step = scr_enemy_lilyCultist_free;
		sprite_index = enemy_idle;
	}
}
else speed = 0;
}
//
//
//
//
//
//Lily Cultist Drop
function scr_enemy_lilyCultist_drop(){
var _objects = 5;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);


with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 < 10)//Form Specific Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = obj_player.form_type;
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 4) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop1 >= 10) and (_drop1 < 20)//Random Rog Stone
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
if (_drop2 < 10)
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