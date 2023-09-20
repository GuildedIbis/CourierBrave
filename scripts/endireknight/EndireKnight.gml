//Endire Knights
//
//
//
//
//
//Endire Knight Create
function scr_enemy_endire_knight_create(){
home_state = scr_enemy_endire_knight_free;
entity_step = home_state;
entity_drop = scr_enemy_endire_knight_drop;
enemy_idle = spr_enemy_endireKnight_idle;
enemy_move = spr_enemy_endireKnight_run;
enemy_damaged = spr_enemy_endireKnight_damaged;
damaged_snd = snd_endireKnight_damaged;
walk_snd = snd_walk_regular;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
aggro_drop = 400;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 3;
max_hp = 300 + (150 * enemy_lvl);
hp = max_hp;
boss = false;
name = "Endire Knight";
enemy_spd = 1.2;
local_frame = 0;
hit_by_attack = -1;
attack_counter = 0;
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
//Endire Knight Free State
function scr_enemy_endire_knight_free(){
if (obj_game.gamePaused = false)
{
	//Timers and counters
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;
	if (attack_counter > 2)
	{ 
		timer1 = 180;
		attack_counter = 0;
	}
	
	
	//Toggle Aggro On
	if (targeted = false)
	{
		lit = false;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
			global.bossCounter = global.bossCounter + 1;
		}
	}
	
	//Toggle Aggro Off
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
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) path_end();
		walk_snd_delay = walk_snd_delay - 1;
		if (timer1 <= 0) and (attack_counter <= 2)
		{
			if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) //Heatwave
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				direction =  point_direction(x,y,obj_player.x,obj_player.y);
				timer2 = 40;
				attack_counter = attack_counter + 1;
				entity_step = scr_enemy_endire_knight_heatwave;
			}
			//if (point_in_circle(obj_player.x,obj_player.y,x,y,48)) //Cinder Dash
			//{
			//	path_end();
			//	walk_snd_delay = 15;
			//	sprite_index = enemy_idle;
			//	audio_sound_gain(snd_slash01,global.volumeEffects,1);
			//	audio_play_sound(snd_slash01,0,false);
			//	direction =  point_direction(x,y,obj_player.x,obj_player.y);
			//	timer2 = 23;
			//	entity_step = EndireKnightCinderDash;
			//}
			if (point_in_circle(obj_player.x,obj_player.y,x,y,24)) //Firestrike
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				timer2 = 23;
				entity_step = scr_enemy_endire_knight_fireStrike();
			}
			
		}
		if (walk_snd_delay <= 0)
		{
			walk_snd_delay = 15;
			audio_play_sound(walk_snd,1,0);
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
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
//Endire Knight Fire Strike State
function scr_enemy_endire_knight_fireStrike(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_endireKnight_fireStrike)
	{
		//Start Animation From Beginning
		direction =  point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_endireKnight_fireStrike;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_fireStrike,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_fireStrike,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 70;
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_fireStrike_hitbox,7)

	//Animate
	scr_enemy_animation();
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
//Endire Knight Cinder Dash
function scr_enemy_endire_knight_cinderDash(){
if (obj_game.gamePaused = false)
{
	
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer2 <= 0)	speed = 2.5;
	if (sprite_index != spr_enemy_endireKnight_cinderDash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_endireKnight_cinderDash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_cinderDash,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_cinderDash,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_cinderDash_hitbox,7);
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	
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
//Endire Knight Heatwave
function scr_enemy_endire_knight_heatwave(){
if (obj_game.gamePaused = false)
{
	
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_endireKnight_heatwave)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_endireKnight_heatwave;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_heatwave,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_heatwave,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 60;
	if (timer2 <= 0)
	{
		timer2 = 60;
		for (var i = 0; i < 3; i = i + 1)
		{
			audio_sound_gain(snd_endireKnight_heatwave_proj,global.volumeEffects,1);
			audio_play_sound(snd_endireKnight_heatwave_proj,0,false);
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				scr_projectile_heatwave_create();
				timer1 = 15;
				direction = (point_direction(x,y,obj_player.x,obj_player.y) - 20) + (20 * i);
				image_angle = direction
				speed = 1.1;
				break_object = other.break_object;
				fragment_count = 3;
				lit = true;
				light_size = 16;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
			}
		}
	}
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_heatwave_hitbox,7);
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	
	//Animate
	scr_enemy_animation_one();
	if (animation_end)
	{
		entity_step = home_state;
		animation_end = false;
	}
}
}//
//
//
//
//
//Endire Knight Drop
function scr_enemy_endire_knight_drop(){

var _objects = 6;
//var _dropBean = 200;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);	


//with (instance_create_layer(x,y,"Instances",obj_itemBean))
//{
//	drop_amount = _dropBean;
//	sprite_index = spr_bean;
//	direction = 360/_objects;	
//	spd = .75 + (.3) + random(0.1);
//}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = other.form_type;
	image_speed = 0;
	direction = 360/_objects * 2;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = 360/_objects * 3;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 < 10)//Form Specific Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = other.form_type;
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = 360/_objects * 5;
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
		direction = 360/_objects * 5;
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
//if (obj_inventory.quest_grid[# 3, 3] = false)
//{
//	obj_player.beans = obj_player.beans + 250;
	
//	obj_inventory.quest_grid[# 3, 0] = true;
//	obj_inventory.quest_grid[# 3, 1] = 1;
//	obj_inventory.quest_grid[# 3, 3] = true;
	
//	//with (obj_text)
//	//{
//	//	text_script = EndireKnightTnaksVictoryText;
//	//}
//	//obj_game.gamePaused = !obj_game.gamePaused;
//	//obj_game.textPaused = !obj_game.textPaused;
//}


}



