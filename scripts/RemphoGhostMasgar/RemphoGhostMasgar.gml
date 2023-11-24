//Ghost Masgar
//
//
//
//
//
//Ghost Masgar Create
function scr_enemy_masgar_ghost_create(){
//Scripts
home_state = scr_enemy_masgar_ghost_free;
entity_step = scr_enemy_masgar_ghost_free;
entity_drop = scr_enemy_masgar_ghost_drop;

//Assests
enemy_idle = spr_enemy_ghostMasgar_idle;
enemy_move = spr_enemy_ghostMasgar_move;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular

//Stats
form_type = 0;
drop_amount = 20;
max_hp = 1100 + (550 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.25;

//Animation and Status
name = "Masgar's Ghost";
targeted = false;	
invincible = false;
healthbar = true;
boss = true;
inv_dur_timer = 0;
shadow = false;
shadow_size = 1;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_alpha = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
local_frame = 0;
hit_by_attack = -1;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
passable = true;

//Self Destruct
if (obj_inventory.quest_grid[# 3, 1] >= 1)
{
	instance_destroy();
}
}
//
//
//
//
//
//Ghost Masgar Free
function scr_enemy_masgar_ghost_free(){
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
		image_alpha = image_alpha - .05;
		if (image_alpha <= 0)
		{
			image_speed = 0;
			sprite_index = enemy_idle;
			path_end();
			aggro_drop = 300;
			targeted = false;
			global.aggroCounter = global.aggroCounter - 1;
		}
	}
	
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		lit = true;
		passable = false;
		scr_enemy_chase();
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,8))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
		}

		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) and (timer1 <= 0)
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			entity_step = scr_enemy_masgar_ghost_slash;
		}
		if (timer2 <= 0)
		{
			lit = false;
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timerS = 0;
			timer2 = 23;
			entity_step = scr_enemy_masgar_ghost_shadowShiftA;
			audio_sound_gain(snd_ghost_shift_up,global.volumeEffects,1);
			audio_play_sound(snd_ghost_shift_up,0,false);
		}
		if (timer3 <= 0)
		{
			lit = true;
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			entity_step = scr_enemy_masgar_ghost_phantomBlade;
		}
		//if (walk_snd_delay <= 0)
		//{
		//	walk_snd_delay = 30;
		//	if (point_in_circle(obj_player.x, obj_player.y,x,y,32)) audio_play_sound(walk_snd,1,0);
		//}
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
//Ghost Masgar Shadowshift Up
function scr_enemy_masgar_ghost_shadowShiftA(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ghostMasgar_shadowShiftA)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghostMasgar_shadowShiftA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Hidden 
	lit = false;
	image_alpha = 1;
	if (timer2 <= 0)
	{
		passable = true;
	}

	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		lit = true;
		timer2 = 42;
		timerS = 42;
		x = obj_player.x;
		y = obj_player.y;
		entity_step = scr_enemy_masgar_ghost_shadowShiftB;
		animation_end = false;
		audio_sound_gain(snd_ghost_shift_down,global.volumeEffects,1);
		audio_play_sound(snd_ghost_shift_down,0,false);
	}
}
}
//
//
//
//
//
//Ghost Masgar Shadowshift Down
function scr_enemy_masgar_ghost_shadowShiftB(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ghostMasgar_shadowShiftB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghostMasgar_shadowShiftB;
		local_frame = 0;
		image_index = 0;
	}
	
	//Cacluate Attack
	damage = 70;
	scr_enemy_attack_calculate(spr_enemy_ghostMasgar_shadowShiftB_hitbox)
	
	//Return from Hiding
	if (timerS <= 0)
	{	
		passable = false;
		timerS = 84;
		audio_sound_gain(snd_ghost_soulSkull,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulSkull,0,false);
	}
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		entity_step = scr_enemy_masgar_ghost_free;
		if (attack_counter < 3) timer2 = 0;
		else 
		{
			attack_counter = 0;
			timer2 = 180;
		}
		audio_sound_gain(snd_ghost_soulFlare,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulFlare,0,false);
		with (instance_create_layer(x+22,y-8,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);
			direction = 0;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x,y-24,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);
			direction = 90;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x-22,y-8,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);;
			direction = 180;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x,y+16,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);;
			direction = 270;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x+16,y+6,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);;
			direction = 315;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x+16,y-21,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);;
			direction = 45;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x-16,y-21,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);;
			direction = 135;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x-16,y+6,"Instances",obj_enemy_projectile))
		{
			invincible = false;
			inv_dur_timer = 0;
			home_state = scr_projectile_soulFlare;
			entity_step = home_state;
			entity_drop = Idle;
			lit = true;
			light_size = 16;
			enemy_move = spr_ghost_soulFlare;
			sprite_index = spr_ghost_soulFlare;
			aggro_drop = 300;

			enemy_spd = 3.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 60 + (10 * other.enemy_lvl);;
			direction = 225;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}

	}
}
}
//
//
//
//
//
//Ghost Masgar Slash State
function scr_enemy_masgar_ghost_slash(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ghostMasgar_slash)
	{
		lit = true;
		sprite_index = spr_enemy_ghostMasgar_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 80 + (11 * other.enemy_lvl);
	scr_enemy_attack_calculate(spr_enemy_ghostMasgar_slash_hitbox)

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		timer1 = 60;
		entity_step = scr_enemy_masgar_ghost_free;
		sprite_index = enemy_idle;
	}
}
}
//
//
//
//
//
//Ghost Masgar Phantom Blade
function scr_enemy_masgar_ghost_phantomBlade(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ghostMasgar_phantomBlade_summon)
	{
		lit = true;
		sprite_index = spr_enemy_ghostMasgar_phantomBlade_summon;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		timer3 = 600;
		entity_step = scr_enemy_masgar_ghost_free;
		sprite_index = enemy_idle;
		audio_sound_gain(snd_ghost_phantomBlades,global.volumeEffects,1);
		audio_play_sound(snd_ghost_phantomBlades,0,false);
		with (instance_create_layer(x,y-4,"Instances",obj_enemy_projectile))
		{
			dir_x = obj_player.x;
			dir_y = obj_player.y;
			direction = (point_direction(x,y,dir_x,dir_y));
			image_angle = direction;
			home_state = scr_projectile_phantomBlade;
			lit = true;
			enemy_lvl = other.enemy_lvl;
			attack_counter = 0;
			timer1 = 300;
			timer2 = 60;
			timer3 = 30;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_ghostMasgar_phantomBlade;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 85 + (12 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragGold;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			speed = enemy_spd;
			sprite_index = enemy_move;
		}
	}
}
}
//
//
//
//
//
//Projectile Phantom Blade
function scr_projectile_phantomBlade(){
if (obj_game.gamePaused = false)
{
	
//Set
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
if (timer3 > 0) timer3 = timer3 - 1;

if (timer3 <= 0) or (point_in_circle(dir_x,dir_y,x,y,8))
{
	speed = .4;
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	image_angle = direction;
}
if (timer2 <= 0)
{
	audio_sound_gain(snd_ghost_phantomBlades,global.volumeEffects,1);
	audio_play_sound(snd_ghost_phantomBlades,0,false);
	timer2 = 10;
	with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_angle = direction;
		sprite_index = spr_enemy_ghostMasgar_phantomDagger;
		home_state = scr_projectile_phantomDagger;
		lit = true;
		exploded = false;
		path = -1;
		entity_step = home_state;
		invincible = false;
		inv_dur_timer = 0;
		enemy_move = spr_enemy_ghostMasgar_phantomDagger;
		aggro_drop = 300;
		healthbar = false;
		enemy_spd = 2.5;
		local_frame = 0;
		hit_by_attack = -1;
		damage = 25 + (6 * other.enemy_lvl);
		break_object = other.break_object;
		fragment_count = 1;
		fragment = obj_fragGold;
		bullet = true;
		hit_script = scr_entity_hit_destroy;
		speed = enemy_spd;
	}
}
if (timer1 <= 0) instance_destroy();

if (place_meeting(x,y,break_object)) 
{
	speed = 0;
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
//Projectile Phantom Dagger
function scr_projectile_phantomDagger(){
if (obj_game.gamePaused = false)
{
	//Resume Speed
	speed = enemy_spd;
	
	//Collision
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_gorogKnife_hit,global.volumeEffects,1);
		audio_play_sound(snd_gorogKnife_hit,0,false);
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
		audio_sound_gain(snd_gorogKnife_hit,global.volumeEffects,1);
		audio_play_sound(snd_gorogKnife_hit,0,false);
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
//Ghost Masgar Drop
function scr_enemy_masgar_ghost_drop(){
var _objects = 5;
var _drop1 = irandom_range(0,99);
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
if (_drop1 < 40)//Form Specific Rog Stone
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
if (_drop1 >= 40) and (_drop1 < 80)//Random Rog Stone
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
if (_drop2 < 50)
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
obj_inventory.quest_grid[# 3, 0] = true;
obj_inventory.quest_grid[# 3, 1] = 1;
}







