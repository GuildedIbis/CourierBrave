//Knife Lily
//
//
//
//
//
//Knife Lily Create
function scr_enemy_knife_lily_create(){
//Scripts
home_state = scr_enemy_knife_lily_free;
entity_step = scr_enemy_knife_lily_free;
entity_drop = scr_enemy_knife_lily_drop;

//Assets
enemy_idle = spr_enemy_knifeLily;
enemy_move = spr_enemy_knifeLily;
enemy_damaged = spr_enemy_knifeLily;
damaged_snd = snd_trapLily_hit;
walk_snd = snd_walk_regular;

//Stats
form_type = 1;
drop_amount = 10;
max_hp = 110;//+ (55 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.0;

//Animation and Status
shadow = false;
shadow_size = 1;
lit = false;
light_size = 18;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
hor_spd = 0;
ver_spd = 0;
local_frame = 0;
hit_by_attack = -1;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Knife Lily Free
function scr_enemy_knife_lily_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	//Cannot be moved
	knockback = false;
	knockback_dur = 0;

	//Toggle Aggro 
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		sprite_index = enemy_idle;
		path_end();
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
	}
	if (targeted = false)
	{
		lit = false
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
		}
	}
	
	//Toggle Aggro 
	if (targeted = true)
	{
		lit = true;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,128)) and (timerS <= 0)
		{
			if (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (watervice = false)
			{
				timerS = 180;
				timer2 = 50;
				entity_step = scr_enemy_knife_lily_returnLeaf;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,24))
		{
			entity_step = scr_enemy_knife_lily_knifeSpin;
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			walk_snd_delay = 15;
			aggro_drop = aggro_drop - 1;
		}
	}
	
	//Animation
	scr_enemy_animation_one();
}
else path_end();
}
//
//
//
//
//
//Knife Lily Return-Leaf
function scr_enemy_knife_lily_returnLeaf(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//setup
	if (sprite_index != spr_enemy_knifeLily_open)
	{
		sprite_index = spr_enemy_knifeLily_open;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cannot be moved
	knockback = false;
	knockback_dur = 0;

	//Create projectiles (mid-animation)
	if (timer2 <= 0)
	{
		timer2 = 50;
		audio_sound_gain(snd_enemy_knife_lily_returnLeaf,global.volumeEffects,1);
		audio_play_sound(snd_enemy_knife_lily_returnLeaf,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = scr_projectile_returnLeaf_free;
			parent = other;
			enemy_lvl = other.enemy_lvl
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_projectile_spinLeaf;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2;
			local_frame = 0;
			hit_by_attack = -1;
			timer1 = 60;
			timer2 = 119;
			damage = 65;//+ (10 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 5;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
		}
	}

	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		entity_step = scr_enemy_knife_lily_exposed;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Projectile: Knife Lily Return-Leaf
function scr_projectile_returnLeaf_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Timer
	scr_enemy_timer_countdown();
	
	//Direction
	if (timer1 <= 0) direction = point_direction(x,y,parent.x,parent.y);
	
	//Self Destruct
	if (timer2 <= 0) instance_destroy();
	
	//Collision
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_projectile_hit,global.volumeEffects,1);
		audio_play_sound(snd_projectile_hit,0,false);
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
		instance_destroy();
	}
	if (place_meeting(x,y,break_object)) 
	{
		instance_destroy();
	}
	if (place_meeting(x,y,parent)) and (timer1 <= 0)
	{
		instance_destroy();
	}
	if (x = parent.x) and (y = parent.y)
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
//Balurne Skirmisher Slash State
function scr_enemy_knife_lily_knifeSpin(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_knifeLily_knifeSpin)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_knifeLily_knifeSpin;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cannot be moved
	knockback = false;
	knockback_dur = 0;
	
	//Cacluate Attack
	damage = 55;//+ (9 * enemy_lvl);
	scr_enemy_attack_calculate(spr_enemy_knifeLily_knifeSpin_hitbox)

	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		entity_step = scr_enemy_knife_lily_exposed;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Knife Lily Exposed
function scr_enemy_knife_lily_exposed(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_knifeLily_exposed)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_knifeLily_exposed;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cannot be moved
	knockback = false;
	knockback_dur = 0;
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		entity_step = home_state;
		animation_end = false;
		invincible = true;
	}
}
}
//
//
//
//
//
//Knife Lily Drop
function scr_enemy_knife_lily_drop(){
var _objects = 2;
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
//if (_drop1 < 3)//Form Specific Rog Stone
//{
//	with (instance_create_layer(x,y,"Instances",obj_itemRog))
//	{
//		item_id = obj_player.form_type;
//		sprite_index = spr_rog_all;
//		image_index = item_id;
//		direction = (360/_objects * 4) + _angle;
//		spd = .75 + (.3) + random(0.1);
//	}
	
//}
//if (_drop1 >= 3) and (_drop1 < 6)//Random Rog Stone
//{
//	with (instance_create_layer(x,y,"Instances",obj_itemRog))
//	{
//		item_id = irandom_range(0,5);
//		sprite_index = spr_rog_all;
//		image_index = item_id;
//		direction = (360/_objects * 5) + _angle;
//		spd = .75 + (.3) + random(0.1);
//	}
	
//}
//if (_drop2 < 3)
//{
//	with (instance_create_layer(x,y,"Instances",obj_itemPS))
//	{
//		item_id = other.enemy_lvl;
//		sprite_index = spr_powerstone_all;
//		image_index = item_id;
//		direction = (360/_objects * 6) + _angle;
//		spd = .75 + (.3) + random(0.1);
//	}
//}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}

