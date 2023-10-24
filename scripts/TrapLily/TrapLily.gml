//Rift Sabi
//
//
//
//
//
//Sabi Create
function scr_enemy_trap_lily_create(){
home_state = scr_enemy_trap_lily_free;
entity_step = home_state;
entity_drop = scr_enemy_trap_lily_drop;
enemy_idle = spr_enemy_trapLily;
enemy_move = spr_enemy_trapLily;
enemy_damaged = spr_enemy_trapLily;
damaged_snd = snd_trapLily_hit;
walk_snd = snd_walk_regular;
form_type = 1;
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
max_hp = 80 + (40 * enemy_lvl);
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 2.0;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
special_timer = -1;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Sabi Free
function scr_enemy_trap_lily_free(){

if (obj_game.gamePaused = false)
{

	
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (special_timer > 0) special_timer = special_timer - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;
	knockback = false;
	knockback_dur = 0;

	//Toggle Aggro 
	//if (timer1 <= 0)
	//{
	//	scr_enemy_wander(60,180);
	//}
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
	else sprite_index = enemy_idle;
	if (targeted = true)
	{
		lit = true;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,128)) and (special_timer <= 0)
		{
			if (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (watervice = false)
			{
				special_timer = 180;
				timer2 = 36;
				entity_step = scr_enemy_trap_lily_bubbleFlail;
			}
		}
	}
	//if (walk_snd_delay <= 0)
	//{
	//	walk_snd_delay = 30;
	//	if (point_in_circle(obj_player.x, obj_player.y,x,y,32)) audio_play_sound(walk_snd,1,0);
	//}
	if (targeted = true)
	{
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			walk_snd_delay = 15;
			aggro_drop = aggro_drop - 1;
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
//Trap Lily Bubble Flail
function scr_enemy_trap_lily_bubbleFlail(){
if (obj_game.gamePaused = false)
{
	knockback = false;
	knockback_dur = 0;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_trapLily_open)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_trapLily_open;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 35 + (7 * enemy_lvl);
	
	if (timer2 <= 0)
	{
		timer2 = 36;
		audio_sound_gain(snd_enemy_lily_viceBubble,global.volumeEffects,1);
		audio_play_sound(snd_enemy_lily_viceBubble,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = scr_projectile_viceBubble_free;
			enemy_lvl = other.enemy_lvl
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_projectile_viceBubble;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.5;
			local_frame = 0;
			hit_by_attack = -1;
			timer1 = 60;
			damage = 65 + (10 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 5;
			fragment = obj_fragWater;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
		}
	}
	//Animate
	scr_enemy_animation_one();
	if (animation_end)
	{
		entity_step = scr_enemy_trap_lily_exposed;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Trap Lily Exposed
function scr_enemy_trap_lily_exposed(){
if (obj_game.gamePaused = false)
{
	knockback = false;
	knockback_dur = 0;
	if (sprite_index != spr_enemy_trapLily_exposed)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_trapLily_exposed;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Animate
	scr_enemy_animation_one();
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
//Trap Lily Drop
function scr_enemy_trap_lily_drop(){
var _objects = 6;
//var _dropBean = 35;
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
if (_drop1 < 3)//Form Specific Rog Stone
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
if (_drop1 >= 3) and (_drop1 < 6)//Random Rog Stone
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
if (_drop2 < 3)
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

