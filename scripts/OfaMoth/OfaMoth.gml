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
max_hp = 180;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
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
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		aggro_drop = 300;
		targeted = true;
		global.aggroCounter = global.aggroCounter + 1;
	}
	

	//While Aggro is on
	if (targeted = true) and (timer1 <= 0)
	{
		timer1 = 21;
		timer2 = 50;
		entity_step = OfaMothDustStep;
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
		entity_step = OfaMothCrescentFire;
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
		audio_sound_gain(snd_ofaMoth_shoot,global.volumeEffects,1);
		audio_play_sound(snd_ofaMoth_shoot,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy))
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
			with (instance_create_layer(x,y-8,"Instances",obj_enemy))
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
		timer1 = 300;
		entity_step = OfaMothFree;
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
var _dropBean = 11;
//var _drop1 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
//if (_drop1 > 50) 
//{
//	with (instance_create_layer(x,y,"Instances",obj_item))
//	{
//		item_id = 8;
//		amount = 1;
//		sprite_index = spr_item_all;
//		image_index = item_id;
//		direction = _angle/_objects;
//		spd = .75 + (.3) + random(0.1);
//	}
	
//}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}







