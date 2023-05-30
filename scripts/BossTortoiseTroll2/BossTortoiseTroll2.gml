//Tortoise Troll Scripts
//
//
//
//
//
//Tortoise Troll Create
function BossTortoiseTrollCreate2(){
targeted = true;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = BossTortoiseTrollFree2;
entity_step = home_state
entity_drop = BossTortoiseTrollDrop;
enemy_idle = spr_enemy_tortoiseTroll_idle2;
enemy_move = spr_enemy_tortoiseTroll_run2;
damaged_snd = snd_tortoiseTroll_damaged;
walk_snd = snd_walk_regular;
shadow = 2;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 2500;
hp = 1250;
boss = true;
name = "Tortoise Troll";
enemy_spd = 1.3;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
timerS = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Tortoise Troll Free
function BossTortoiseTrollFree2(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;

	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		EnemyChaseSpecial(obj_game,obj_entity);
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
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
						audio_play_sound(snd_tortoiseTroll_hammer,0,false);
						timer1 = 7;
						attack_counter = attack_counter + 1;
						if (attack_counter >= 2)
						{
							attack_counter = 0;
							timer1 = 60;
						}
						timer2 = 23;
						entity_step = BossTortoiseTrollHammerSlam2;
					}
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					image_index = 0;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
						audio_play_sound(snd_tortoiseTroll_hammer,0,false);
						timer1 = 7;
						attack_counter = attack_counter + 1;
						if (attack_counter >= 2)
						{
							attack_counter = 0;
							timer1 = 60;
						}
						timer2 = 23;
						entity_step = BossTortoiseTrollHammerSlam2;
					}
				break;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{
			
			//walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					timer1 = 20;
					entity_step = BossTortoiseTrollHammerMissileFire2;
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					timer1 = 14;
					timer2 = 90;
					entity_step = BossTortoiseTrollHammerBlossom2;
				break;
			}
				
		}
		//if (!point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		//{
			
		//	//audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
		//	//audio_play_sound(snd_zerwerk_voidRift,0,false);
		//	path_end();
		//	sprite_index = enemy_idle;
		//	timer1 = 15;
		//	entity_step = BossTortoiseTrollHammerBlossom;
		//}
	}
	
	//Animation
	script_execute(EnemyAnimation);
}
else path_end();
}
//
//
//
//
//
//Tortoise Troll Hammer Slam
function BossTortoiseTrollHammerSlam2(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
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
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerSlam_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = BossTortoiseTrollHammerLunge2;
			animation_end = false;
			timer2 = 12;
			hor_spd = 0;
			ver_spd = 0;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
		}
		else
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = BossTortoiseTrollJumpslam2;
			animation_end = false;
			timer1 = 60;
			timer2 = 40;
			timer3 = 20;
			timerS = 40;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			//hor_spd = lengthdir_x(3,direction);
			//ver_spd = lengthdir_y(3,direction);
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
function BossTortoiseTrollHammerLunge2(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
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
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerLunge_hitbox)
	
	if (timer2 <= 0)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(4,direction);
		ver_spd = lengthdir_y(4,direction);
	}
	
	var _collided = EnemyCollision();

	//Animate
	EnemyAnimation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		timer1 = 120;
		timer2 = 120;
		entity_step = BossTortoiseTrollHammerBackslam2;
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
//Tortoise Troll Hammer Slam
function BossTortoiseTrollHammerBackslam2(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
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
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerBackslam_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		animation_end = false;
		entity_step = home_state;
		timer1 = 30;
		timer2 = 30;
	}
}
}
//
//
//
//
//
//Troll Tortoise Hammer Jumpslam
function BossTortoiseTrollJumpslam2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
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
	damage = 110;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerJumpslam_hitbox)
	if (timer3 > 0)
	{
		z = z + 1;
	}
	else
	{
		if (z > 0) z = z - 1;
	}
	if (timer2 > 0)
	{
		//speed = enemy_spd * 1.5;
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
	var _collided = EnemyCollision();
	if (_collided = true) or (timer1 < 0)
	{
		z = 0;
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
	}
	
	//Animate
	EnemyAnimation();
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
//
//
//
//
//
//Troll Tortoise Hammer Jumpslam
function BossTortoiseTrollHammerMissileFire2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;

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
			direction = other.direction;
			image_angle = direction;
			home_state = TrollTortoiseMissile;
			timer1 = 150;
			timer2 = 30;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_trollTortoise_missile;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = EntityHitDestroy;
			speed = enemy_spd;
		}
	}
	else
	
	
	//Animate
	EnemyAnimation();
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
function BossTortoiseTrollHammerBlossom2(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;

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
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			home_state = TrollTortoiseMound;
			timer1 = 180;
			timer2 = 0;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_tortoiseTroll_mound;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.25;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = EntityHitDestroy;
			speed = enemy_spd;
		}
		timer1 = 29;
	}
	
	
	//Animate
	EnemyAnimation1();
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
