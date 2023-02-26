//Ofa Worm
//
//
//
//
//
//Ofa Worm Create
function OfaMothCreate(){
home_state = OfaMothFree;
entity_step = home_state;
entity_drop = OfaMothDrop;
enemy_idle = spr_enemy_ofaMoth;
enemy_move = spr_enemy_ofaMoth;
enemy_damaged = spr_enemy_ofaMoth;
damaged_snd = snd_ofaMoth_damaged;
walk_snd = snd_ofaWorm_dash;
shadow = 0;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 250;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 5;
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
//Ofa Moth Free
function OfaMothFree(){
if (obj_game.gamePaused = false)
{
	healthbar = true;
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_circle(obj_player.x, obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
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

	//While Aggro is on
	if (targeted = true)
	{
		if (timer1 <= 0)
		{
			timer1 = 21;
			timer2 = 50;
			attack_counter = 0;
			entity_step = OfaMothDustStep;
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
		else aggro_drop = 300;
	}
		
	
	
	//Animation
	script_execute(EnemyAnimation1);
}
else path_end();
}
//
//
//
//
//
//Ofa Moth Dash
function OfaMothDustStep(){
if (obj_game.gamePaused = false)
{
	healthbar = false;
	//Timers
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer1 > 0) timer1 = timer1 - 1;
	
	//Set
	if (sprite_index != spr_enemy_ofaMoth_dustStep)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_dustStep;
		local_frame = 0;
		image_index = 0;
	}

	
	//Collision Damage
	if (timer1 <= 0)
	{
		//Chase: create and execute a path towards player
		shadow = -1;
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
		shadow = 0;
		path_end();
	}
	
	//Animation
	script_execute(EnemyAnimation1);
	if (animation_end = true)
	{
		shadow = 0;
		path_end();
		var _atk = irandom_range(0,1);
		if (_atk = 0)
		{
			healthbar = true;
			entity_step = OfaMothCrescentFire;
		}
		else 
		{
			healthbar = true;
			timer2 = 20;
			entity_step = OfaMothMoonBlast;
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
function OfaMothCrescentFire(){
if (obj_game.gamePaused = false)
{

	//Set
	if (sprite_index != spr_enemy_ofaMoth_whiteMoon)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_whiteMoon;
		local_frame = 0;
		image_index = 0;
	}

	//Animation
	script_execute(EnemyAnimation1);
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			WhiteCrescentCreate();
			break_object = other.break_object;
			shadow = 0;
			fragment_count = 0;
			fragment = obj_fragment;
			healthbar = true;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		for (var i = 0; i < 6; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				WhiteRodCreate();
				direction = point_direction(x,y,obj_player.x,obj_player.y) - 45 + (15 * i);
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				fragment_count = 0;
				fragment = obj_fragment;
				bullet = true;
				hit_script = EntityHitDestroy;
			}
		}
		if (attack_counter >= 4)
		{
			timer1 = 180;
			entity_step = OfaMothFree;
		}
		else
		{
			timer1 = 21;
			timer2 = 50;
			entity_step = OfaMothDustStep;
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
function OfaMothMoonBlast(){
if (obj_game.gamePaused = false)
{

	//Set
	if (sprite_index != spr_enemy_ofaMoth_moonBlast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaMoth_moonBlast;
		local_frame = 0;
		image_index = 0;
	}
	timer2 = timer2 - 1;

	//Animation
	script_execute(EnemyAnimation1);
	
	if (timer2 <= 0)
	{
		timer2 = 10;
		audio_sound_gain(snd_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			WhiteRodCreate();
			depth = other.depth - 1;
			direction = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-3,3);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
	}
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		if (attack_counter >= 4)
		{
			timer1 = 180;
			sprite_index = enemy_idle;
			entity_step = OfaMothFree;
		}
		else
		{
			timer1 = 21;
			timer2 = 50;
			entity_step = OfaMothDustStep;
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
function OfaMothDrop(){
	
obj_inventory.quest_grid[# 6, 1] = obj_inventory.quest_grid[# 6, 1] + 1;
var _objects = 1;
var _dropBean = 45;
var _drop1 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 49) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 8;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}







