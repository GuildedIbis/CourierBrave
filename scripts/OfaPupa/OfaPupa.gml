//Ofa Pupa
//
//
//
//
//
//Ofa Pupa Create
function scr_enemy_ofa_pupa_create(){
//Scripts
home_state = scr_enemy_ofa_pupa_free;
entity_step = home_state;
entity_drop = scr_enemy_ofa_pupa_drop;

//Assets
enemy_idle = spr_enemy_ofaPupa_idle;
enemy_move = spr_enemy_ofaPupa_idle;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular

//Stats
form_type = 1;
drop_amount = 10;
max_hp = 300;//+ (155 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.75;

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
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//OfaPupaFree
function scr_enemy_ofa_pupa_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
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
		global.aggroCounter = global.aggroCounter - 1;
	}
	
	//Cannot Be Moved
	knockback = false;
	knockback_dur = 0;
	
	//While Aggro is on}
	if (targeted = true)
	{
		lit = true;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			if (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (timer1 <= 0)
			{
				timer1 = 50;
				sprite_index = enemy_idle;
				proj_dir = point_direction(x,y,obj_player.x,obj_player.y);
				entity_step = scr_enemy_ofa_pupa_cocoonSpike;		
			}
		}
		else
		{
			if (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (timer2 <= 0)
			{	
				timer2 = 60;
				sprite_index = enemy_idle;
				entity_step = scr_enemy_ofa_pupa_cocoonWad;
			}
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
		
	}
	
}
}
//
//
//
//
//
//Ofa Pupa Cocoon Spike
function scr_enemy_ofa_pupa_cocoonSpike(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ofaPupa_cocoonSpike)
	{
		//Start Animation From Beginning
		//direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_ofaPupa_cocoonSpike;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cannot be Moved
	knockback = false;
	knockback_dur = 0;

	//Create Projectiles
	if (timer1 <= 0)
	{
		proj_dir = proj_dir + (irandom_range(30,180))
		timer1 = 3;
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			//enemy_lvl = other.enemy_lvl;
			entity_drop = Idle;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_proj_ofaPupa_cocoonSpike;
			aggro_drop = 300;
			healthbar = false;
			bullet = true;
			enemy_spd = 2.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 35;//+ (7 * enemy_lvl);
			lit = true;
			audio_sound_gain(snd_enemy_ofa_pupa_cocoonSpike,global.volumeEffects,1);
			audio_play_sound(snd_enemy_ofa_pupa_cocoonSpike,0,false);
			direction = other.proj_dir;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragWhite;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			home_state = scr_projectile_pupaSpike_free;
			entity_step = home_state;
		}
	}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		timer1 = 60;
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
//Ofa Pupa Cocoon Wad Shoot
function scr_enemy_ofa_pupa_cocoonWad(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ofaPupa_cocoonWad)
	{
		//Start Animation From Beginning
		//direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_ofaPupa_cocoonWad;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cannot Be MOved
	knockback = false;
	knockback_dur = 0;

	//Create Projectiles
	if (timer2 <= 0)
	{
		audio_sound_gain(snd_enemy_ofa_pupa_cocoonWad,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ofa_pupa_cocoonWad,0,false);
		timer2 = 60;
		for (var i = 0; i < 8; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				//enemy_lvl = other.enemy_lvl;
				entity_drop = Idle;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_proj_ofaPupa_cocoonSpike;
				aggro_drop = 300;
				healthbar = false;
				bullet = true;
				enemy_spd = 3.0;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 35;//+ (7 * enemy_lvl);
				lit = true;
				direction = (point_direction(x,y,obj_player.x,obj_player.y)- 60) + (15*i) ;
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				fragment_count = 0;
				fragment = obj_fragWhite;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
				home_state = scr_projectile_pupaWad_free;
				entity_step = home_state;
			}
		}
	}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		timer2 = 60;
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
//Ofa Pupa Drop
function scr_enemy_ofa_pupa_drop(){
var _objects = 2;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);


with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2)
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2)
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
//if (_drop1 < 5)//Form Specific Rog Stone
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
//if (_drop1 >= 5) and (_drop1 < 10)//Random Rog Stone
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
//if (_drop2 < 5)
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
}
//
//
//
//
//
//Ofa Pupa Spike Free
function scr_projectile_pupaSpike_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
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
//Ofa Pupa Wad Free
function scr_projectile_pupaWad_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
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
}
else
{
	speed = 0;
}
}




