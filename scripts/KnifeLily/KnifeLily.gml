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
damaged_snd = snd_enemy_trapLily_hit;
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
			scr_projectile_returnLeaf_create();
			parent = other;
			break_object = other.break_object;
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
//Projectile: Knife Lily Return-Leaf Create
function scr_projectile_returnLeaf_create(){
home_state = scr_projectile_returnLeaf_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;

invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_spinLeaf;
enemy_idle = spr_projectile_spinLeaf;
aggro_drop = 300;
healthbar = false;
enemy_spd = 2;
local_frame = 0;
hit_by_attack = -1;
timer1 = 60;
timer2 = 119;
damage = 45;
fragment_count = 5;
fragment = obj_fragPlant;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Projectile: Knife Lily Return-Leaf
function scr_projectile_returnLeaf_step(){
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
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
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
	scr_enemy_attack_calculate(spr_enemy_knifeLily_knifeSpin_hitbox,self,-1,-1,-1,-1,-1,-1)

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
var _objects = 3;	
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = 6;
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
	
}

