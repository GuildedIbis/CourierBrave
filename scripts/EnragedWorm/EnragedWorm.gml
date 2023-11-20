//Enraged Worm
//
//
//
//
//
//Enraged Worm Create
function scr_enemy_enraged_worm_create(){
home_state = scr_enemy_enraged_worm_free;
entity_step = home_state;
entity_drop = scr_enemy_enraged_worm_drop;
enemy_idle = spr_enemy_enragedWorm_idle;
enemy_move = spr_enemy_enragedWorm_dash;
enemy_damaged = spr_enemy_enragedWorm_hit;
damaged_snd = snd_enemy_ofa_worm_damaged;
walk_snd = snd_walk_water2;
shadow = true;
shadow_size = 0;
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
form_type = 2;
drop_amount = 4;
max_hp = 60;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 1.2;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
dash_timer = 360;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Enraged Worm Free
function scr_enemy_enraged_worm_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) and (watervice = false)
	{
		timer1 = timer1 - 1;
	}
	if (timer2 > 0) timer2 = timer2 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;

	//Aggro 
	scr_enemy_aggro();
	
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		lit = true;
		scr_enemy_chase_special(obj_game,obj_entity);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,8))
		{
			path_end();
			sprite_index = enemy_idle;
			entity_step = scr_enemy_enraged_worm_charge;
		}
	}
	
	//Animation
	scr_enemy_animation();
}
else path_end();
}
//
//
//
//
//
//Enraged Worm Dash
function scr_enemy_enraged_worm_charge(){
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
	scr_enemy_animation();
	if (animation_end)
	{
		timer1 = 20;
		entity_step = scr_enemy_enraged_worm_explode;
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
function scr_enemy_enraged_worm_explode(){
if (obj_game.gamePaused = false)
{
	lit = true;
	if (timer1 > 0) timer1 = timer1 - 1;

	if (sprite_index != spr_enemy_enragedWorm_explode)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_enragedWorm_explode;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_enragedWorm_explode,global.volumeEffects,1);
		audio_play_sound(snd_enragedWorm_explode,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 70  + (8 * enemy_lvl);;
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_enragedWorm_explode_hitbox);

	if (timer1 <= 0) image_alpha = image_alpha - .1;
	
	//Animate
	scr_enemy_animation_one();
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
function scr_enemy_enraged_worm_drop(){
	
//if(obj_inventory.quest_grid[# 6, 1] < obj_inventory.quest_grid[# 6, 2]) obj_inventory.quest_grid[# 6, 1] = obj_inventory.quest_grid[# 6, 1] + 1;
var _objects = 6;
//var _dropBean = 15;
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
	drop_amount = round(other.drop_amount/2)
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2)
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 < 2)//Form Specific Rog Stone
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
if (_drop1 >= 2) and (_drop1 < 4)//Random Rog Stone
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
if (_drop2 < 2)
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










