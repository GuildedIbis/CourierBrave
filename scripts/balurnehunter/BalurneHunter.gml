//Balurne Hunter
//
//
//
//
//
//Balurne Hunter Create
function scr_enemy_balurne_hunter_create(){
//Scripts
home_state = scr_enemy_balurne_hunter_free;
entity_step = scr_enemy_balurne_hunter_free;
entity_drop = scr_enemy_balurne_hunter_drop;

//Assets
enemy_idle = spr_enemy_balurneHunter_idle;
enemy_move = spr_enemy_balurneHunter_run;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular

//Stats
form_type = 1;
drop_amount = 15;
max_hp = 70 + (35 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.2;

//Animation and Status
targeted = false;	
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
local_frame = 0;
hit_by_attack = -1;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Balurne Hunter Free
function scr_enemy_balurne_hunter_free(){
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
		lit = true;
		if (timer2 > 0) or (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) //(point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{	
			scr_enemy_chase_special(obj_game,obj_entity);
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				if (timer1 <= 0)
				{
					entity_step = scr_enemy_balurne_hunter_slash;
				}		
			
			}
		}
		else
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer2 <= 0) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) 
			{	
				path_end();
				entity_step = scr_enemy_balurne_hunter_shoot;
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
//Balurne Hunter Slash
function scr_enemy_balurne_hunter_slash(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_balurneHunter_slash)
	{
		sprite_index = spr_enemy_balurneHunter_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 40 + (7 * enemy_lvl);
	scr_enemy_attack_calculate(spr_enemy_balurneHunter_slash_hitbox)

	//Animation
	scr_enemy_animation();
	
	//End
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
//Balurne Hunter Shoot
function scr_enemy_balurne_hunter_shoot(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_balurneHunter_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_balurneHunter_shoot;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_arrow,global.volumeEffects,1);
		audio_play_sound(snd_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = scr_projectile_ratArrow;
			entity_step = home_state;
			entity_drop = Idle;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_rat_arrow;
			aggro_drop = 300;
			healthbar = false;
			bullet = true;
			enemy_spd = 3.0;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 30 + (7 * other.enemy_lvl);
			image_alpha = 1;
			sprite_index = enemy_move;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))//(point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			timer1 = 60;
			//timer2 = 60;
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
		else
		{
			if (attack_counter < 2)
			{
				entity_step = scr_enemy_balurne_hunter_shoot;
				timer2 = 0;
			}
			else
			{
				attack_counter = 0;
				timer2 = 60;
				entity_step = home_state;
			}
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
//Balurne Hunter Drop
function scr_enemy_balurne_hunter_drop(){
var _objects = 5;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount);
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
if (_drop2 < 7)
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







