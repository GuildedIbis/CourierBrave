//Ofa Worm
//
//
//
//
//
//Ofa Worm Create
function scr_enemy_ofa_moth_create(){
//Scripts
home_state = scr_enemy_ofa_moth_free;
entity_step = home_state;
entity_drop = scr_enemy_ofa_moth_drop;

//Assets
enemy_idle = spr_enemy_ofaMoth;
enemy_move = spr_enemy_ofaMoth;
enemy_damaged = spr_enemy_ofaMoth;
damaged_snd = snd_enemy_ofa_moth_damaged;
walk_snd = snd_enemy_ofaWorm_dash;

//Stats
form_type = 2;
drop_amount = 15;
max_hp = 250;//+ (130 * enemy_lvl);
hp = max_hp;
enemy_spd = 5;

//Animation and Status
shadow = true;
shadow_size = 1;
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
hor_spd = 0;
ver_spd = 0;
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
//Ofa Moth Free
function scr_enemy_ofa_moth_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;

	//Resume Visibility
	healthbar = true;
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_circle(obj_player.x, obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
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
			timer1 = 21;
			timer2 = 50;
			attack_counter = 0;
			entity_step = scr_enemy_ofa_moth_dustStep;
			audio_sound_gain(snd_enemy_ofaMoth_dustStep,global.volumeEffects,1);
			audio_play_sound(snd_enemy_ofaMoth_dustStep,0,false);
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
		else aggro_drop = 300;
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
//Ofa Moth Dash
function scr_enemy_ofa_moth_dustStep(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Set
	if (sprite_index != spr_enemy_ofaMoth_dustStep)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_dustStep;
		local_frame = 0;
		image_index = 0;
	}

	//Become Invisible
	lit = false;
	healthbar = false;
	
	//Collision Damage
	if (timer1 <= 0)
	{
		//Chase: create and execute a path towards player
		shadow = false;
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_entity);
		path_start(path, enemy_spd, 0, 0);
		walk_snd_delay = walk_snd_delay - 1;
		if (timer2 <= 0)
		{
			walk_snd_delay = 15;
			path_end();
		}
	}
	else 
	{
		shadow = 1;
		path_end();
	}
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		lit = true;
		shadow = 1;
		path_end();
		var _atk = irandom_range(0,1);
		if (_atk = 0)
		{
			healthbar = true;
			entity_step = scr_enemy_ofa_moth_crescentFire;
		}
		else 
		{
			healthbar = true;
			timer2 = 20;
			entity_step = scr_enemy_ofa_moth_moonBlast;
		}
	}
	
}
else path_end();
}
//
//
//
//
//
//Ofa Moth Dash
function scr_enemy_ofa_moth_crescentFire(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ofaMoth_whiteMoon)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_whiteMoon;
		local_frame = 0;
		image_index = 0;
	}

	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_enemy_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_whiteCrescent_create();
			break_object = other.break_object;
			
		}
		for (var i = 0; i < 6; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				scr_projectile_whiteRod_create();
				direction = point_direction(x,y,obj_player.x,obj_player.y) - 45 + (15 * i);
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
			}
		}
		if (attack_counter >= 4)
		{
			timer1 = 180;
			entity_step = scr_enemy_ofa_moth_free;
		}
		else
		{
			timer1 = 21;
			timer2 = 50;
			entity_step = scr_enemy_ofa_moth_dustStep;
		}
			
	}
	
}
}
//
//
//
//
//
//Ofa Moth Moon Blast
function scr_enemy_ofa_moth_moonBlast(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ofaMoth_moonBlast)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_enemy_ofaMoth_orb,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ofaMoth_orb,0,false);
		sprite_index = spr_enemy_ofaMoth_moonBlast;
		local_frame = 0;
		image_index = 0;
	}

	//Create Projectiles
	if (timer2 <= 0)
	{
		timer2 = 10;
		audio_sound_gain(snd_enemy_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_whiteRod_create();
			depth = other.depth - 1;
			direction = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-3,3);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}
	}
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		if (attack_counter >= 4)
		{
			timer1 = 180;
			sprite_index = enemy_idle;
			entity_step = scr_enemy_ofa_moth_free;
		}
		else
		{
			timer1 = 21;
			timer2 = 50;
			entity_step = scr_enemy_ofa_moth_dustStep;
		}
	}
	
}
}
//
//
//
//
//
//Ofa Moth Drop
function scr_enemy_ofa_moth_drop(){
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







