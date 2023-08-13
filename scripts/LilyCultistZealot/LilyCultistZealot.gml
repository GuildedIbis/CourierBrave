//Lily Cultist Zealot
//
//
//
//
//
//Lily Cultist Zealot Create
function LilyCultistZealotCreate(){
name = "Zealot Cultist"
boss = true;
home_state = LilyCultistZealotFree;
entity_step = home_state;
entity_drop = LilyCultistZealotDrop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_cultistZealot_idle;
enemy_move = spr_enemy_cultistZealot_run;
enemy_damaged = spr_enemy_cultistZealot_damaged;
damaged_snd = snd_cultist_damaged;
walk_snd = snd_walk_regular;
shadow = true;
shadow_size = 1;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 1;
max_hp = 550;
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
//Lilly Cultist Zealot Free State
function LilyCultistZealotFree(){
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
			//global.bossCounter = global.bossCounter + 1;
			aggro_drop = 300;
			targeted = true;
		}
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
		global.bossCounter = global.bossCounter - 1;
	}
	
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		script_execute(EnemyChase);
		if (point_in_circle(obj_player.x, obj_player.y,x,y,16)) 
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer2 <= 0)
			{
				entity_step = LilyCultistZealotWaterSlash;
			}
		}
		else
		{
			if (timer1 <= 0)
			{	
				path_end();
				var _attack = irandom_range(0,3);
				if (_attack <= 1)
				{
					entity_step = LilyCultistZealotBowShot;
				}
				else
				{
					entity_step = LilyCultistZealotWaterEdge;
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
//Lily Cultist Zealot Shoot
function LilyCultistZealotBowShot(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 2;
	if (timer3 > 0) timer3 = timer3 - 2;
	if (sprite_index != spr_enemy_cultistZealot_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistZealot_shoot;
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
			home_state = ZealotArrowFree;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_cultist_arrow;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 3.0
			local_frame = 0;
			hit_by_attack = -1;
			timer1 = 60;
			damage = 50;
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
			entity_step = LilyCultistZealotReposition;
		}
		else
		{
			timer1 = 60;
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
function ZealotArrowFree(){
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
//Lily Cultist Zealot Water Slash
function LilyCultistZealotWaterSlash(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 2;
	if (timer3 > 0) timer3 = timer3 - 2;
	if (sprite_index != spr_enemy_cultistZealot_waterSlash)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_cultistZealot_waterSlash,global.volumeEffects,1);
		audio_play_sound(snd_cultistZealot_waterSlash,0,false);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistZealot_waterSlash;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 45;
	EnemyAttackCalculate(spr_enemy_cultistZealot_waterSlash_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer2 = 12
		entity_step = LilyCultistZealotWaterSlashBack;
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
//Lily Cultist Zealot Water Slash Back
function LilyCultistZealotWaterSlashBack(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 2;
	if (timer3 > 0) timer3 = timer3 - 2;
	if (sprite_index != spr_enemy_cultistZealot_waterSlash_back)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_cultistZealot_waterSlash,global.volumeEffects,1);
		audio_play_sound(snd_cultistZealot_waterSlash,0,false);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistZealot_waterSlash_back;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 45;
	EnemyAttackCalculate(spr_enemy_cultistZealot_waterSlash_back_hitbox)
	if (timer2 <= 0)
	{
		timer2 = 150;
		for (var i = 0; i <= 2; i = i + 1)
		{
			var _dir = (round(direction/90) * 90) + (-8 + 8*i);
			with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
			{
				home_state = ZealotWaterLeafFree;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_cultistZealot_waterLeaf;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 3.5;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 25;
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragWater;
				bullet = true;
				hit_script = EntityHitDestroy;
				direction = _dir
				image_angle = direction;
				speed = enemy_spd;
			}
		}
	}
	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer2 = 150;
		entity_step = home_state;
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
//Lily Cultist Bacwire Burst Leaf
function LilyCultistZealotWaterEdge(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_cultistZealot_waterEdge)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_cultistZealot_waterEdge;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}


	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		audio_sound_gain(snd_cultistZealot_waterEdge,global.volumeEffects,1);
		audio_play_sound(snd_cultistZealot_waterEdge,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = ZealotWaterEdgeFree;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_cultistZealot_waterEdge;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 55;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragWater;
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
			entity_step = LilyCultistZealotReposition;
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
//ZealotWaterEdgeFree
function ZealotWaterEdgeFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_cultistZealot_waterEdge_burst,global.volumeEffects,1);
	audio_play_sound(snd_cultistZealot_waterEdge_burst,0,false);
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
	audio_sound_gain(snd_cultistZealot_waterEdge_burst,global.volumeEffects,1);
	audio_play_sound(snd_cultistZealot_waterEdge_burst,0,false);
	for (var i = 0; i <= 4; i = i + 1)
	{
		var _dir = (direction - 180) + (-9 + 6*i);
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			home_state = ZealotWaterLeafFree;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_cultistZealot_waterLeaf;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 3.0;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 25;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragWater;
			bullet = true;
			hit_script = EntityHitDestroy;
			direction = _dir
			image_angle = direction;
			speed = enemy_spd;
		}
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
//Cultist Zealot Water Leaf Free
function ZealotWaterLeafFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
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
function LilyCultistZealotReposition(){
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
function LilyCultistZealotDrop(){
//if (obj_inventory.quest_grid[# 1, 0] = true) and (obj_inventory.quest_grid[# 1, 3] = false)
//{
//	obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 1] + 1;
//}
var _objects = 6;
//var _dropBean = 300;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);

//with (instance_create_layer(x,y,"Instances",obj_itemBean))
//{
//	drop_amount = _dropBean;
//	sprite_index = spr_bean;
//	direction = (360/_objects) + _angle;
//	spd = .75 + (.3) + random(0.1);
//}
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
if (_drop1 < 40)//Form Specific Rog Stone
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
if (_drop1 >= 40) and (_drop1 < 80)//Random Rog Stone
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
if (_drop2 < 25)
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







