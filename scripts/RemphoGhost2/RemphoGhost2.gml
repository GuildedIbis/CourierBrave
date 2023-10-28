//Rempho Ghost 2
//
//
//
//
//
//Rempho Ghost 2 Create
function scr_enemy_rempho_ghost2_create(){
targeted = false;	
invincible = false;
healthbar = true;
inv_dur_timer = 0;
home_state = scr_enemy_rempho_ghost2_free;
entity_step = home_state;
entity_drop = scr_enemy_rempho_ghost_drop;
enemy_idle = spr_enemy_ghost2_idle;
enemy_move = spr_enemy_ghost2_move;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_ghost_damaged;
walk_snd = snd_walk_regular
shadow = false;
shadow_size = 1;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_alpha = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 0;
drop_amount = 15;
max_hp = 180 + (90 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.1;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
passable = true;
}
//
//
//
//
//
//Rempho Ghost 2 Free
function scr_enemy_rempho_ghost2_free(){
//if (global.dayPhase != 2)
//{
//	invincible = true;
//	inv_dur_timer = 30;
//}
if (obj_game.gamePaused = false)// and (global.dayPhase = 2)
{
	//Timers
	if (timer1 >= 0) timer1 = timer1 - 1;
	if (timer2 >= 0) timer2 = timer2 - 1;
	if (timer3 >= 0) timer3 = timer3 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x, obj_player.y,x-32,y-32,x+32,y+32)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			passable = false;
			if (image_alpha != 1) image_alpha = 1;
			scr_enemy_alert();
			timer1 = 60;
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
		passable = false;
		scr_enemy_chase();
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		{
			
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 36;
			timer2 = 120;
			entity_step = scr_enemy_rempho_ghost2_shadowShiftA;
			audio_sound_gain(snd_ghost_shift_up,global.volumeEffects,1);
			audio_play_sound(snd_ghost_shift_up,0,false);
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
//Rempho Ghost 2 Shadow Shift A
function scr_enemy_rempho_ghost2_shadowShiftA(){
if (obj_game.gamePaused = false)
{
	lit = false;
	healthbar = false;
	//Timers
	if (timer1 >= 0) timer1 = timer1 - 1;
	if (timer2 >= 0) timer2 = timer2 - 1;
	if (timer3 >= 0) timer3 = timer3 - 1;
	//Set
	if (sprite_index != spr_enemy_ghost2_shadowShiftA)
	{
		//Start Animation From Beginning
		image_alpha = 1;
		sprite_index = spr_enemy_ghost2_shadowShiftA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	
	//Collision Damage
	if (timer1 <= 0)
	{
		//Chase: create and execute a path towards player
		passable = true;
		shadow = false;
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_entity);
		path_start(path, enemy_spd * 2, 0, 0);
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
	if (animation_end = true)
	{
		lit = true;
		shadow = 1;
		healthbar = true;
		path_end();
		timer2 = 42;
		entity_step = scr_enemy_rempho_ghost2_shadowShiftB;
		animation_end = false;
		audio_sound_gain(snd_ghost_shift_down,global.volumeEffects,1);
		audio_play_sound(snd_ghost_shift_down,0,false);
	}
	
	
}
else path_end();
}
//
//
//
//
//
//Rempho Ghost 2 Shadow Shift B
function scr_enemy_rempho_ghost2_shadowShiftB(){
if (obj_game.gamePaused = false)
{
	//Set
	if (timer1 >= 0) timer1 = timer1 - 1;
	if (timer2 >= 0) timer2 = timer2 - 1;
	if (timer3 >= 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_ghost2_shadowShiftB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghost2_shadowShiftB;
		local_frame = 0;
		image_index = 0;
	}
	scr_enemy_attack_calculate(spr_ghost2_shadowShiftB_hitbox)
	//Animation
	damage = 30 + (8 * enemy_lvl);
	//Cacluate Attack
	if (timer2 <= 0)
	{	
		passable = false;
		timer2 = 84;
		audio_sound_gain(snd_ghost_soulSkull,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulSkull,0,false);
	}
		
	scr_enemy_animation_one();
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		entity_step = scr_enemy_rempho_ghost2_free;
		if (attack_counter < 3) timer1 = 0;
		else
		{
			timer1 = 300;
			attack_counter = 0;
		}
		audio_sound_gain(snd_ghost_soulFlare,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulFlare,0,false);
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
			damage = 50 + (9 * other.enemy_lvl);
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
			damage = 50 + (9 * other.enemy_lvl);
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
			damage = 50 + (9 * other.enemy_lvl);
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
			damage = 50 + (9 * other.enemy_lvl);
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
//Drop Script same as other Rempho Ghost







