//Lily Cultist Bacwire
//
//
//
//
//
//Lily Cultist Bacwire Create
function LilyCultistBacwireCreate(){
home_state = LilyCultistBacwireFree;
entity_step = home_state;
entity_drop = LilyCultistDrop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_cultistBacwire_idle;
enemy_move = spr_enemy_cultistBacwire_run;
enemy_damaged = spr_enemy_cultistBacwire_damaged;
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
form_type = 1;
max_hp = 135;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
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
//Lilly Cultist Bacwire Free State
function LilyCultistBacwireFree(){
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
			if (timer2 <= 0)
			{
				entity_step = LilyCultistBacwireBurstLeaf;
			}
		}
		if (timer1 <= 0)
		{	
			path_end();
			entity_step = LilyCultistBacwireBowShot;
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
//Lily Cultist Bacwire Shoot
function LilyCultistBacwireBowShot(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 2;
	if (timer3 > 0) timer3 = timer3 - 2;
	if (sprite_index != spr_enemy_cultistBacwire_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistBacwire_shoot;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}


	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		audio_sound_gain(snd_arrow,global.volumeEffects,1);
		audio_play_sound(snd_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = CultistArrowFree;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_cultist_arrow;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.0
			local_frame = 0;
			hit_by_attack = -1;
			timer1 = 60;
			damage = 40;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = EntityHitDestroy;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			timer1 = 120;
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
			timer1 = 120;
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
function CultistArrowFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(snd_player_hit,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
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
//Lily Cultist Bacwire Burst Leaf
function LilyCultistBacwireBurstLeaf(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_cultistBacwire_burstLeaf)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistBacwire_burstLeaf;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}


	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		audio_sound_gain(snd_cultistBacwire_leafShoot,global.volumeEffects,1);
		audio_play_sound(snd_cultistBacwire_leafShoot,0,false);
		for (var i = 0; i <= 3; i = i + 1)
		{
			var _dir = point_direction(x,y,obj_player.x,obj_player.y) + (-9 + 6*i);
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				home_state = CultistLeafFree;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_cultist_leaf;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 2.5;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 25;
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = EntityHitDestroy;
				direction = _dir
				image_angle = direction;
				speed = enemy_spd;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			timer2 = 120;
			timer3 = 60;
			hor_spd = irandom_range(-1,1);
			ver_spd = irandom_range(-1,1);
			if (hor_spd = 0) and (ver_spd = 0)
			{
				hor_spd = choose(-1,1)
				ver_spd = choose(-1,1)
			}
			entity_step = EnemyReposition;
		}
		else
		{
			timer2 = 120;
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
function CultistLeafFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(snd_player_hit,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
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
//Lily Cultist Reposition
function LilyCultistReposition(){
//Timer

if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
if (timer3 > 0) timer3 = timer3 - 1;


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
if (timer3 <= 0)
{
	timer3 = 60;
	entity_step = home_state;
	sprite_index = enemy_idle;
}
}
//
//
//
//
//
//Lily Cultist Drop
function LilyCultistDrop(){
//if (obj_inventory.quest_grid[# 1, 0] = true) and (obj_inventory.quest_grid[# 1, 3] = false)
//{
//	obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 1] + 1;
//}
var _objects = 6;
var _dropBean = irandom_range(20,40);
var _drop1 = irandom_range(0,99)	
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
if (_drop1 < 25)//Form Specific Rog Stone
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
if (_drop1 >= 25) and (_drop1 < 50)//Random Rog Stone
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
		item_id = other.enemy_lvl - 1;
		sprite_index = spr_powerstone_all;
		image_index = item_id;
		direction = (360/_objects * 6) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
}
//else instance_create_layer(x,y,"Instances",_objects[0])


}







