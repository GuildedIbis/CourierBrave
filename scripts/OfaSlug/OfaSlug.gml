//Ofa Worm
//
//
//
//
//
//Ofa Worm Create
function OfaWormCreate(){
home_state = OfaWormFree;
entity_step = home_state;
entity_drop = OfaWormDrop;
enemy_idle = spr_enemy_ofaWorm_idle;
enemy_move = spr_enemy_ofaWorm_move;
enemy_damaged = spr_enemy_ofaWorm_hit;
damaged_snd = snd_ofaWorm_damaged;
walk_snd = snd_walk_water;
shadow = 0;
targeted = false;
invincible = false;
bullet = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 60;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 1.1;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
walk_snd_delay = 0;
}
//
//
//
//
//
//Ofa Worm Free
function OfaWormFree(){
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
		timer2 = timer2 - 1;
		walk_snd_delay = walk_snd_delay - 1;
		script_execute(EnemyChase);
		if (timer2 <= 120)
		{
			if (walk_snd_delay <= 0)
			{
				//audio_sound_gain(snd_ofaWorm_dash,global.volumeEffects,1);
				//audio_play_sound(snd_ofaWorm_dash,0,false);
				walk_snd_delay = 121;
			}	
			enemy_move = spr_enemy_ofaWorm_dash;
			enemy_spd = 2.0;
			if (timer2 <= 0) timer2 = 540;
		}
		else 
		{
			enemy_spd = .75;
			enemy_move = spr_enemy_ofaWorm_move;
		}
		
		
	}
		
	//Collision Damage
	damage = 30;
	if (place_meeting(x,y,obj_player)) and (timer1 <= 0)
	{
		with (obj_player)
		{
			if (invincible = false)
			{
				flash = .35;
				hp = hp - other.damage;
			}
		}
		timer1 = 180;
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
//Sabi Drop
function OfaWormDrop(){
	
if(obj_inventory.quest_grid[# 6, 1] < obj_inventory.quest_grid[# 6, 2]) obj_inventory.quest_grid[# 6, 1] = obj_inventory.quest_grid[# 6, 1] + 1;
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







