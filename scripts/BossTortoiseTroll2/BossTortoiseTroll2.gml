//Tortoise Troll Scripts
//
//
//
//
//
//Tortoise Troll Create
function scr_enemy_trollTortoise_create2(){
targeted = true;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = scr_enemy_trollTortoise_free2;
entity_step = home_state
entity_drop = scr_enemy_trollTortoise_drop;
enemy_idle = spr_enemy_tortoiseTroll_idle2;
enemy_move = spr_enemy_tortoiseTroll_run2;
damaged_snd = snd_tortoiseTroll_damaged;
walk_snd = snd_walk_regular;
shadow = 2;
lit = true;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 2200 + (1100 * enemy_lvl);
hp = round(max_hp * .75);
boss = true;
name = "Tortoise Troll";
enemy_spd = 1.3;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
timerS = 0;
timerC = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Tortoise Troll Free
function scr_enemy_trollTortoise_free2(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		scr_enemy_chase_special(obj_game,obj_entity);
		//walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			//walk_snd_delay = 15;
			path_end();
			sprite_index = enemy_idle;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{
			//walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
					audio_play_sound(snd_tortoiseTroll_hammer,0,false);
					entity_step = scr_enemy_trollTortoise_hammerSlam2;
				break;
				
				case 1:
					path_end();
					audio_sound_gain(snd_tortoiseTroll_damaged02,global.volumeEffects,1);
					audio_play_sound(snd_tortoiseTroll_damaged02,0,false);
					sprite_index = enemy_idle;
					timer1 = 55;
					entity_step = scr_enemy_trollTortoise_vineErupt2;
				break;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer2 <= 0)
		{
			
			//walk_snd_delay = 15;
			attack_chose = irandom_range(0,2)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					timer1 = 20;
					entity_step = scr_enemy_trollTortoise_hammerMissile2;
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					timer1 = 14;
					timer2 = 90;
					entity_step = scr_enemy_trollTortoise_hammerBlossom2;
				break;
				
				case 2:
					path_end();
					sprite_index = enemy_idle;
					image_index = 0;
					audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
					audio_play_sound(snd_tortoiseTroll_hammer,0,false);
					timer2 = 45;
					entity_step = scr_enemy_trollTortoise_vineToss2;
				break;
			}
				
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
//Tortoise Troll Hammer Slam
function scr_enemy_trollTortoise_hammerSlam2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerSlam2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerSlam2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 60;
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerSlam_hitbox)

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = scr_enemy_trollTortoise_hammerLunge2;
			animation_end = false;
			timer1 = 12;
			hor_spd = 0;
			ver_spd = 0;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
		}
		else
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = scr_enemy_trollTortoise_jumpslam2;
			animation_end = false;
			timer1 = 40;
			timer3 = 20;
			timerS = 40;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
		}
	}
	
}
}
//
//
//
//
//
//Troll Tortoise Hammer Lunge
function scr_enemy_trollTortoise_hammerLunge2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerLunge2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerLunge2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 50;
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerLunge_hitbox)
	
	if (timer1 <= 0)
	{
		hor_spd = lengthdir_x(4,direction);
		ver_spd = lengthdir_y(4,direction);
	}
	
	var _collided = scr_enemy_collision();

	//Animate
	scr_enemy_animation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		entity_step = scr_enemy_trollTortoise_backslam2;
		audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_hammer,0,false);
		direction = (point_direction(x,y,obj_player.x,obj_player.y));
		animation_end = false;
	}
}
}
//
//
//
//
//
//Tortoise Troll Hammer Backslam
function scr_enemy_trollTortoise_backslam2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerBackslam2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerBackslam2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 60 + (9 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerBackslam_hitbox)

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		animation_end = false;
		entity_step = home_state;
		timer1 = 120;
		timerC = 60;
	}
}
}
//
//
//
//
//
//Troll Tortoise Hammer Jumpslam
function scr_enemy_trollTortoise_jumpslam2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerJumpslam2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerJumpslam2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80 + (13 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerJumpslam_hitbox)
	if (timer3 > 0)
	{
		z = z + 1;
	}
	else
	{
		if (z > 0) z = z - 1;
	}
	if (timer1 > 0)
	{
		hor_spd = lengthdir_x(2.25,direction);
		ver_spd = lengthdir_y(2.25,direction);
	}
	else
	{
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
	}
	
	//Sound
	if (timerS <= 0)
	{
		timerS = 300;
		audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_hammer,0,false);
	}
	var _collided = scr_enemy_collision();
	if (_collided = true) or (timer1 < 0)
	{
		z = 0;
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
	}
	
	//Animate
	scr_enemy_animation();
	if (animation_end) 
	{
		timer1 = 120;
		timerC = 120;
		sprite_index = enemy_idle;
		z = 0;
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
//Tortoise Troll Spiked Vine Toss
function scr_enemy_trollTortoise_vineToss2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_vineToss2)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_tortoiseTroll_vineToss2;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	if (timer2 <= 0)
	{
		timer2 = 120;
		audio_sound_gain(snd_gorogKnife_throw,global.volumeEffects,1);
		audio_play_sound(snd_gorogKnife_throw,0,false);
		for (var i = 0; i < 3; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				enemy_lvl = other.enemy_lvl
				scr_projectile_trollTortoise_spikedVine_create();
				direction = (point_direction(x,y,obj_player.x,obj_player.y-4)) - 15 + (15 * i);
				image_angle = direction;
				enemy_spd = 3.5;
				parent = other;
				break_object = other.break_object;
				fragment_count = 3;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
			}
		}
	}
	//Animate
	scr_enemy_animation();
	if (animation_end)
	{	
		attack_counter = 0;
		entity_step = scr_enemy_trollTortoise_vineToss2_wait;
		animation_end = false;
		
	}
}
}
//
//
//
//
//
//Boss Tortoise Troll Vine Toss Wait
function scr_enemy_trollTortoise_vineToss2_wait(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_vineToss_wait)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_tortoiseTroll_vineToss_wait;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Animate
	scr_enemy_animation();
}
}
//
//
//
//
//
//Troll Tortoise Hammer Jumpslam
function scr_enemy_trollTortoise_hammerMissile2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerMissiles2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerMissiles2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	var _dirPos = round(direction/90);
	switch(_dirPos)
	{
		case 0:
			dir_offX = 16;
			dir_offY = -8;
		break;
		
		case 4:
			dir_offX = 16;
			dir_offY = -8;
		break;
		
		case 1:
			dir_offX = 8;
			dir_offY = -24;
		break;
		
		case 2:
			dir_offX = -16;
			dir_offY = -8;
		break;
		
		case 3:
			dir_offX = -8;
			dir_offY = 0;
		break;	
	}
	
	
	//Launch Missles
	if (timer1 <= 0)
	{
		audio_sound_gain(snd_tortoiseTroll_missiles,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_missiles,0,false);
		timer1 = 10;
		with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			direction = other.direction;
			image_angle = direction;
			home_state = scr_projectile_trollTortoise_missile;
			timer1 = 150;
			timer2 = 30;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_trollTortoise_missile;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.0;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 45 + (8 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			speed = enemy_spd;
		}
	}
	else
	
	
	//Animate
	scr_enemy_animation();
	if (animation_end) 
	{
		timer1 = 15;
		timer2 = 15;
		z = 0;
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
//Troll Tortoise Hammer Blossom
function scr_enemy_trollTortoise_hammerBlossom2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerBlossom2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerBlossom2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Launch Missles
	if (timer1 <= 0)
	{
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			home_state = scr_projectile_trollTortoise_mound;
			timer1 = 180;
			timer2 = 0;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_tortoiseTroll_mound;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 1.25;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 55 + (9 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			speed = enemy_spd;
		}
		timer1 = 29;
	}
	
	
	//Animate
	scr_enemy_animation_one();
	if (animation_end) 
	{
		timer1 = 120;
		timer2 = 120;
		timerC = 120;
		z = 0;
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
//Troll Tortoise Hammer Blossom
function scr_enemy_trollTortoise_vineErupt2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_vineErupt2)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_vineErupt2;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Launch Missles
	if (timer1 <= 0)
	{
		for (var i = 0; i < 32; i = i + 1)
		{
			with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
			{
				enemy_lvl = other.enemy_lvl;
				direction = (point_direction(x,y,obj_player.x,obj_player.y)) + round(11.25 * i);
				image_angle = direction;
				home_state = scr_projectile_trollTortoise_vineShot;
				timer1 = 180;
				path = -1;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_enemy_tortoiseTroll_vineShot;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 1.5;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 70 + (10 * enemy_lvl);
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
				speed = enemy_spd;
				image_speed = 0;
				image_index = irandom_range(0,4);
			}
			timer1 = 60;
		}
	}
	
	
	//Animate
	scr_enemy_animation_one();
	if (animation_end) 
	{
		timer1 = 120;
		timer2 = 120;
		z = 0;
		entity_step = home_state;
		animation_end = false;
	}
}
}
