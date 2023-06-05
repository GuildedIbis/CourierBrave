//Elite Hunter
//
//
//
//
//
//Elite Hunter Create
function EliteHunterCreate(){
targeted = false;	
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = EliteHunterFree;
entity_step = home_state;
entity_drop = EliteHunterDrop;
enemy_idle = spr_enemy_eliteHunter_idle;
enemy_move = spr_enemy_eliteHunter_run;
enemy_damaged = spr_enemy_eliteHunter_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular
shadow = 1;
lit = false;
light_size = 32;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 300;
hp = max_hp;
enemy_spd = 1.75;
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
//Elite Hunter Free
function EliteHunterFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false
		if (timer1 <= 0)
		{
			EnemyWander(60,180); //Data Leak if not radius restricted?
		}
		else sprite_index = enemy_idle;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			EnemyAlert();
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
	

	//While Aggro is on}
	if (targeted = true)
	{
		lit = true;
		if (timer2 > 0) or (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) //(point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{	
			script_execute(EnemyChase);
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				if (timer1 <= 0) //Heavy Slash A
				{
					entity_step = EliteHunterSlash;
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
					entity_step = EliteHunterShoot;
				}
				else entity_step = EliteHunterShootShatter;
			}
		}
		
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
//Elite Hunter Slash
function EliteHunterSlash(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
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
	damage = 35;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_balurneHunter_slash_hitbox);

	//Animate
	EnemyAnimation();
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
		entity_step = EnemyReposition;
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
function EliteHunterShoot(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
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
	damage = 35;


	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_arrow,global.volumeEffects,1);
		audio_play_sound(snd_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			script_execute(RatArrowCreate);
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = EntityHitDestroy;
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
			entity_step = EnemyReposition;
			animation_end = false;
		}
		else
		{
			if (attack_counter < 3)
			{
				entity_step = EliteHunterShoot;
				timer2 = 0;
			}
			else
			{
				attack_counter = 0;
				timer2 = 60;
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
function EliteHunterShootShatter(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
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
	damage = 35;
	//Cacluate Attack
	//EnemyAttackCalculate(spr_enemy_rat_slash_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_arrow,global.volumeEffects,1);
		audio_play_sound(snd_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = EliteHunterShatterArrowFree;
			entity_step = home_state;
			entity_drop = Idle;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_rat_arrowShatter;
			aggro_drop = 300;
			healthbar = false;
			bullet = true;
			enemy_spd = 4.0
			local_frame = 0;
			hit_by_attack = -1;
			damage = 50;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = EntityHitDestroy;
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
			entity_step = EnemyReposition;
			animation_end = false;
		}
		else
		{
			attack_counter = 0;
			timer2 = 60;
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
//Elite Hunter Shatter Arrow Free
function EliteHunterShatterArrowFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
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

	with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
	{
		
		home_state = EliteHunterShatterOrb;
		path = -1;
		timer1 = 130;
		timer2 = 15;
		entity_step = home_state;
		invincible = false;
		inv_dur_timer = 0;
		enemy_move = spr_shatterOrb;
		aggro_drop = 300;
		healthbar = false;
		enemy_spd = 1.0;
		local_frame = 0;
		hit_by_attack = -1;
		damage = 22;
		break_object = other.break_object;
		fragment_count = 2;
		fragment = obj_fragWater;
		bullet = true;
		hit_script = EntityHitDestroy;
		image_angle = irandom_range(0,359);
		speed = enemy_spd;
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
	{
		
		home_state = EliteHunterShatterOrb;
		path = -1
		timer1 = 130;
		timer2 = 15;
		entity_step = home_state;
		invincible = false;
		inv_dur_timer = 0;
		enemy_move = spr_shatterOrb;
		aggro_drop = 300;
		healthbar = false;
		enemy_spd = 1.0;
		local_frame = 0;
		hit_by_attack = -1;
		damage = 22;
		break_object = other.break_object;
		fragment_count = 2;
		fragment = obj_fragWater;
		bullet = true;
		hit_script = EntityHitDestroy;
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_angle = irandom_range(0,359);
		speed = enemy_spd;
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
//Elite Hunter Shatter Orb
function EliteHunterShatterOrb(){
if (obj_game.gamePaused = false)
{
if (timer1 > 0) timer1 = timer1 - 1;
sprite_index = enemy_move;
speed = enemy_spd;

//Chase


if (path_exists(path)) path_delete(path);
path = path_add();
mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_wall);
path_start(path, enemy_spd, 0, 0);
image_speed = 1;
sprite_index = enemy_move;
if (point_in_circle(obj_player.x,obj_player.y,x,y,4)) path_end();


		
			
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
if (timer1 <= 0) instance_destroy();
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
//Elite Hunter Drop
function EliteHunterDrop(){
if (obj_inventory.quest_grid[# 2, 0] = true) and (obj_inventory.quest_grid[# 2, 3] = false)
{
	obj_inventory.quest_grid[# 2, 1] = obj_inventory.quest_grid[# 2, 1] + 1;
}

var _objects = 4;
var _dropBean = 95;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;	
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 50) //White String
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 7;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 75) //Rat Teeth
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 1;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
	
}
}







