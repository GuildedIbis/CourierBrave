//Elite Hunter
//
//
//
//
//
//Elite Hunter Create
function scr_enemy_hunterElite_create(){
//Scripts
home_state = scr_enemy_hunterElite_free;
entity_step = scr_enemy_hunterElite_free;
entity_drop = scr_enemy_hunterElite_drop;

//Assets
enemy_idle = spr_enemy_eliteHunter_idle;
enemy_move = spr_enemy_eliteHunter_run;
enemy_damaged = spr_enemy_eliteHunter_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular

//Stats
form_type = 3;
drop_amount = 20;
max_hp = 100;
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
//Elite Hunter Free
function scr_enemy_hunterElite_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		scr_enemy_wander_home(60,180,home_x,home_y); //Data Leak if not radius restricted
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
	
	//While Aggro is on}
	if (targeted = true)
	{
		lit = true;
		if (timer2 > 0) or (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) //(point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{	
			if (timerC <= 0) scr_enemy_chase();
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				if (timer1 <= 0) //Heavy Slash A
				{
					entity_step = scr_enemy_hunterElite_slash;
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
				_atkChoose = irandom_range(0,3)
				if (_atkChoose <= 1)
				{
					entity_step = scr_enemy_hunterElite_shoot;
				}
				else entity_step = scr_enemy_hunterElite_shootShatter;
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
//Elite Hunter Slash
function scr_enemy_hunterElite_slash(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_eliteHunter_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_eliteHunter_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 30;
	scr_enemy_attack_calculate(spr_enemy_balurneHunter_slash_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
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
//Elite Hunter Shoot
function scr_enemy_hunterElite_shoot(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_eliteHunter_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_eliteHunter_shoot;
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
		audio_sound_gain(snd_enemy_rat_arrow,global.volumeEffects,1);
		audio_play_sound(snd_enemy_rat_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_ratArrow_create();
			image_alpha = 1;
			sprite_index = enemy_move;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
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
			if (attack_counter < 3)
			{
				entity_step = scr_enemy_hunterElite_shoot;
				timer2 = 0;
			}
			else
			{
				attack_counter = 0;
				timer2 = 60;
				timerC = 60;
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
//Elite Hunter Shoot
function scr_enemy_hunterElite_shootShatter(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_eliteHunter_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_eliteHunter_shoot;
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
		audio_sound_gain(snd_enemy_rat_arrow,global.volumeEffects,1);
		audio_play_sound(snd_enemy_rat_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_hunterElite_shatterArrow_create();
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			
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
			timer2 = 360;
			timerC = 120;
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
//Shatter Arrow Create
function scr_projectile_hunterElite_shatterArrow_create(){
home_state = scr_projectile_hunterElite_shatterArrow_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;


light_size = 24;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_rat_arrowShatter;
enemy_idle = spr_enemy_rat_arrowShatter;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 2.5;
local_frame = 0;
hit_by_attack = -1;
damage = 40;
fragment_count = 3;
fragment = obj_fragWood;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Elite Hunter Shatter Arrow Free
function scr_projectile_hunterElite_shatterArrow_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	invincible = true;
	inv_dur_timer = 30;

	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
	if (place_meeting(x,y,obj_player))
	{
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			scr_projectile_hunterElite_shatterOrb_create();
			image_angle = irandom_range(0,359);
			speed = enemy_spd;
			break_object = other.break_object;
		}
		instance_destroy();
	}
	if (place_meeting(x,y,break_object)) 
	{
		audio_sound_gain(snd_enemy_rat_arrow_hit,global.volumeEffects,1);
		audio_play_sound(snd_enemy_rat_arrow_hit,0,false);
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			scr_projectile_hunterElite_shatterOrb_create();
			image_angle = irandom_range(0,359);
			speed = enemy_spd;
			break_object = other.break_object;
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
//Shatter Orb Create
function scr_projectile_hunterElite_shatterOrb_create(){
home_state = scr_projectile_hunterElite_shatterOrb_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;

path = -1;
timer1 = 130;
timer2 = 15;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_shatterOrb;
enemy_idle = spr_shatterOrb;
aggro_drop = 300;
healthbar = false;
enemy_spd = 1.0;
local_frame = 0;
hit_by_attack = -1;
damage = 15;
fragment_count = 2;
fragment = obj_fragWater;
bullet = true;


if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Elite Hunter Shatter Orb
function scr_projectile_hunterElite_shatterOrb_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	lit = true;

	//Timer
	if (timer1 > 0) timer1 = timer1 - 1;

	//Chase Player
	if (!point_in_circle(obj_player.x,obj_player.y,x,y,4))
	{
		if (path_exists(path)) path_delete(path);
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 4, obj_collision);
		path_start(path, enemy_spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	}
	else path_end();

	//Collision	
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
					audio_play_sound(dmg_snd,0,false);
				}
				inv_dur_timer = 30;
				flash = .35;
				hp = hp - (other.damage - armor);
			}
		}
	}
	
	//Self Destruct
	if (timer1 <= 0) instance_destroy();
}
else
{
	speed = 0;
	path_end();
}
}
//
//
//
//
//
//Elite Hunter Drop
function scr_enemy_hunterElite_drop(){
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







