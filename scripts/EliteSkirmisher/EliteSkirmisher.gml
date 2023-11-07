//Elite Skirmisher
//
//
//
//
//
//Elite Skirmisher Create
function scr_enemy_skirmisherElite_create(){
home_state = scr_enemy_skirmisherElite_free;
entity_step = home_state;
entity_drop = scr_enemy_skirmisherElite_drop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_eliteSkirmisher_idle;
enemy_move = spr_enemy_eliteSkirmisher_run;
enemy_damaged = spr_enemy_eliteSkirmisher_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
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
form_type = 0;
drop_amount = 10;
max_hp = 130 + (65 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.2;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
walk_snd_delay = 0;
path = -1;
return_x = -1;
return_y = -1;
}
//
//
//
//
//
//Elite Skirmisher Free State
function scr_enemy_skirmisherElite_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (timer1 <= 0)
		{
			scr_enemy_wander_home(60,180,home_x,home_y); //Data Leak if not radius restricted
		}
		else sprite_index = enemy_idle;
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
		aggro_drop = 300;
		targeted = false;
		home_x = x;
		home_y = y;
		global.aggroCounter = global.aggroCounter - 1;
	}
	
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		if (timer1 <= 0)
		{
			scr_enemy_chase_special(obj_game,obj_entity);
		}
		if (point_in_rectangle(obj_player.x,obj_player.y,x-24,y-24,x+24,y+24))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0) 
			{
				timer1 = 120;
				if (point_in_rectangle(obj_player.x,obj_player.y,x-12,y-12,x+12,y+12))
				{
					entity_step = scr_enemy_skirmisherElite_slash;
				}
				else
				{
					timer2 = 20;
					hor_spd = 0;
					ver_spd = 0;
					return_x = x;
					return_y = y;
					direction = (point_direction(x,y,obj_player.x,obj_player.y));
					entity_step = scr_enemy_skirmisherElite_spinSlash;
				}
				
			}
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
//Elite Skirmisher Slash State
function scr_enemy_skirmisherElite_slash(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_eliteSkirmisher_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_eliteSkirmisher_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 40 + (8 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_rat_slash_hitbox)

	//Animate
	scr_enemy_animation();
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
		entity_step = scr_enemy_reposition;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Skirmisher Spin Slash State
function scr_enemy_skirmisherElite_spinSlash(){
if (obj_game.gamePaused = false)
{
	image_speed = 1;
	var _collided
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_eliteSkirmisher_spinSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_eliteSkirmisher_spinSlash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 55 + (9 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_eliteSkirmisher_spinSlash_hitbox);
	
	if (timer2 <= 0)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(2.5,direction);
		ver_spd = lengthdir_y(2.5,direction);
	}
	
	var _collided = scr_enemy_collision();
	
	if (_collided = true)
	{
		hor_spd = 0;
		ver_spd = 0;
	}


	//Animate
	scr_enemy_animation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		timer1 = 120;
		timer2 = 600;
		hor_spd = irandom_range(-1,1);
		ver_spd = irandom_range(-1,1);
		if (hor_spd = 0) and (ver_spd = 0)
		{
			hor_spd = choose(-1,1)
			ver_spd = choose(-1,1)
		}
		entity_step = scr_enemy_reposition;
		//entity_step = home_state;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Skirmisher Drop
function scr_enemy_skirmisherElite_drop(){
//if (obj_inventory.quest_grid[# 2, 0] = true) and (obj_inventory.quest_grid[# 2, 3] = false)
//{
//	obj_inventory.quest_grid[# 2, 1] = obj_inventory.quest_grid[# 2, 1] + 1;
//}
var _objects = 7;
//var _dropBean = 70;
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
if (_drop1 < 5)//Form Specific Rog Stone
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
if (_drop1 >= 5) and (_drop1 < 10)//Random Rog Stone
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
if (_drop2 < 5)
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
}







