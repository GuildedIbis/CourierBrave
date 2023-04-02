//Rempho Ghost 2
//
//
//
//
//
//Rempho Ghost 2 Create
function RemphoGhost2Create(){
targeted = false;	
invincible = false;
healthbar = true;
inv_dur_timer = 0;
home_state = RemphoGhost2Free;
entity_step = home_state;
entity_drop = RemphoGhostDrop;
enemy_idle = spr_enemy_ghost2_idle;
enemy_move = spr_enemy_ghost2_move;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_ghost_damaged;
walk_snd = snd_walk_regular
shadow = false;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_alpha = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 180;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Rempho Ghost 2 Free
function RemphoGhost2Free(){
if (global.dayPhase != 2)
{
	invincible = true;
	inv_dur_timer = 30;
}
if (obj_game.gamePaused = false) and (global.dayPhase = 2)
{
	//Timers
	if (timer1 > 0) and (watervice = false)
	{
		timer1 = timer1 - 1;
	}
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x, obj_player.y,x-32,y-32,x+32,y+32)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			if (image_alpha != 1) image_alpha = 1;
			EnemyAlert();
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
		
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		{
			
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 120;
			timer2 = 23;
			entity_step = RemphoGhost2ShadowShiftA;
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
	script_execute(EnemyAnimation);
}
else path_end();
}
//
//
//
//
//
//Rempho Ghost
function RemphoGhost2ShadowShiftA(){
if (obj_game.gamePaused = false)
{
	image_alpha = 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_ghost2_shadowShiftA)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghost2_shadowShiftA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		//audio_play_sound(snd_arrow,0,false);
		//with (instance_create_layer(x,y-8,"Instances",obj_enemy))
		//{
		//	script_execute(RatArrowCreate);
		//	direction = point_direction(x,y,obj_player.x,obj_player.y);
		//	image_angle = direction;
		//	speed = enemy_spd;
		//	break_object = other.break_object;
		//	fragment_count = 3;
		//	fragment = obj_fragWood;
		//	bullet = true;
		//	hit_script = EntityHitDestroy;
		//}
		timer2 = 42;
		x = obj_player.x;
		y = obj_player.y;
		entity_step = RemphoGhost2ShadowShiftB;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Rempho Ghost
function RemphoGhost2ShadowShiftB(){
if (obj_game.gamePaused = false)
{
	//Set
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_ghost2_shadowShiftB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghost2_shadowShiftB;
		local_frame = 0;
		image_index = 0;
	}
	EnemyAttackCalculate(spr_ghost2_shadowShiftB_hitbox)
	//Animation
	damage = 30;
	//Cacluate Attack
	if (timer2 <= 0)
	{	
		timer2 = 84;
		audio_sound_gain(snd_ghost_soulSkull,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulSkull,0,false);
	}
		
	EnemyAnimation1();
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		entity_step = RemphoGhost2Free;
		if (attack_counter < 3) timer1 = 0;
		else timer1 = 300;
		audio_sound_gain(snd_ghost_soulFlare,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulFlare,0,false);
		with (instance_create_layer(x+16,y+6,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 315;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x+16,y-21,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 45;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x-16,y-21,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 135;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x-16,y+6,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 225;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
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







