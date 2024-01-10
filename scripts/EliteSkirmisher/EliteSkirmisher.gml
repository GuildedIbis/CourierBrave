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

//Assets
enemy_idle = spr_enemy_eliteSkirmisher_idle;
enemy_move = spr_enemy_eliteSkirmisher_run;
enemy_damaged = spr_enemy_eliteSkirmisher_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 10;
max_hp = 110;
hp = max_hp;
enemy_spd = 1.2;

//Animation and Status
bullet = false;
healthbar = true;
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
local_frame = 0;
hit_by_attack = -1;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
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
		//Chase
		if (timerC <= 0)
		{
			if (!point_in_rectangle(obj_player.x,obj_player.y,x-8,y-8,x+8,y+8))
			{
				scr_enemy_chase();
			}
			else
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
			}
		}
		//Attacks Furtherst to Shortest Range
		if (point_in_rectangle(obj_player.x,obj_player.y,x-32,y-32,x+32,y+32)) and (timer2 <= 0)
		{
			path_end();
			walk_snd_delay = 15;
			timer2 = 20;
			hor_spd = 0;
			ver_spd = 0;
			return_x = x;
			return_y = y;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			image_speed = 1;
			audio_sound_gain(snd_slash01,global.volumeEffects,1);
			audio_play_sound(snd_slash01,0,false);
			entity_step = scr_enemy_skirmisherElite_spinSlash;
		}
		if (point_in_rectangle(obj_player.x,obj_player.y,x-12,y-12,x+12,y+12)) and (timer1 <= 0) 
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			
			entity_step = scr_enemy_skirmisherElite_slash;

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
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
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
	
	//Cacluate Attack
	damage = 30;
	scr_enemy_attack_calculate(spr_enemy_rat_slash_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		timer1 = 60;
		timerC = 60;
		hor_spd = irandom_range(-1,1);
		ver_spd = irandom_range(-1,1);
		if (hor_spd = 0) and (ver_spd = 0)
		{
			hor_spd = choose(-1,1)
			ver_spd = choose(-1,1)
		}
		entity_step = scr_enemy_skirmisherElite_reposition;
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
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_eliteSkirmisher_spinSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_eliteSkirmisher_spinSlash;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 55;// + (9 * enemy_lvl);
	scr_enemy_attack_calculate(spr_enemy_eliteSkirmisher_spinSlash_hitbox,self,-1,-1,-1,-1,-1,-1);
	
	//Set Direction
	if (timer2 <= 0)
	{
		timer2 = 240;
		hor_spd = lengthdir_x(2.5,direction);
		ver_spd = lengthdir_y(2.5,direction);
	}
	
	//Collision
	var _xDest = x + hor_spd;
	var _yDest = y + ver_spd;
	if (place_meeting(_xDest, _yDest,obj_entity))
	{
		hor_spd = 0;
		ver_spd = 0;
		sprite_index = enemy_idle;
	}
	path = path_add();
	mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
	path_start(path, 2.5, 0, 0);
	image_speed = 1;


	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		speed = 0;
		sprite_index = enemy_idle;
		timer2 = 360;
		timerC = 60;
		hor_spd = irandom_range(-1,1);
		ver_spd = irandom_range(-1,1);
		if (hor_spd = 0) and (ver_spd = 0)
		{
			hor_spd = choose(-1,1)
			ver_spd = choose(-1,1)
		}
		entity_step = scr_enemy_skirmisherElite_reposition;
		animation_end = false;
		//entity_step = scr_enemy_skirmisherElite_free;
	}
}
}
//
//
//
//
//
//Gorog Reposition
function scr_enemy_skirmisherElite_reposition(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();

	//Set
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation();

	//Move
	if (point_in_circle(obj_player.x,obj_player.y,x,y,96))
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
	if (timerC <= 0)
	{
		timerC = 60;
		entity_step = home_state;
		sprite_index = enemy_idle;
	}
}
else speed = 0;
}
//
//
//
//
//
//Elite Skirmisher Drop
function scr_enemy_skirmisherElite_drop(){
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







