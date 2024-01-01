//Endire Knights
//
//
//
//
//
//Endire Knight Create
function scr_enemy_endire_knight_create(){
//Scripts
home_state = scr_enemy_endire_knight_free;
entity_step = scr_enemy_endire_knight_free;
entity_drop = scr_enemy_endire_knight_drop;

//Assets
enemy_idle = spr_enemy_endireKnight_idle;
enemy_move = spr_enemy_endireKnight_run;
enemy_damaged = spr_enemy_endireKnight_damaged;
damaged_snd = snd_enemy_endireKnight_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 3;
drop_amount = 15;
max_hp = 400;//+ (200 * enemy_lvl);
hp = max_hp;

enemy_spd = 1.15;

//Animation and Status
name = "Endire Knight";
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
boss = false;
local_frame = 0;
hit_by_attack = -1;
attack_counter = 0;
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
		if (timerC <= 0) scr_enemy_chase();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) path_end();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,24)) and (timer1 <= 0) //Firestrike
		{
			path_end();
			entity_step = scr_enemy_endire_knight_fireStrike;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer2 <= 0)//Heatwave
		{
			path_end();
			direction =  point_direction(x,y,obj_player.x,obj_player.y);
			timer2 = 40;
			entity_step = scr_enemy_endire_knight_heatwave;
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
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_endireKnight_fireStrike)
	{
		//Start Animation From Beginning
		direction =  point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_endireKnight_fireStrike;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_enemy_endireKnight_fireStrike,global.volumeEffects,1);
		audio_play_sound(snd_enemy_endireKnight_fireStrike,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 45;
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_fireStrike_hitbox,7)

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		timer1 = 30;
		timerC = 60;
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
//Endire Knight Heatwave
function scr_enemy_endire_knight_heatwave(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_endireKnight_heatwave)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_endireKnight_heatwave;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_fireStrike,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_fireStrike,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Calculate Attack
	damage = 35;
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_heatwave_hitbox,7);
	
	//Create Projectiles
	if (timer2 <= 0)
	{
		audio_sound_gain(snd_enemy_endireKnight_heatwave,global.volumeEffects,1);
		audio_play_sound(snd_enemy_endireKnight_heatwave,0,false);
		timer2 = 60;
		for (var i = 0; i < 3; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				//enemy_lvl = other.enemy_lvl;
				scr_projectile_heatwave_create();
				timer1 = 15;
				direction = (point_direction(x,y,obj_player.x,obj_player.y) - 20) + (20 * i);
				image_angle = direction
				speed = enemy_spd;
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
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		timer2 = 300;
		timerC = 60;
		entity_step = home_state;
		sprite_index = enemy_idle;
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



