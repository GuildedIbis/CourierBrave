//Dusk Legion Dur-Oc
//
//
//
//
//
//Dusk Legion Dur-Oc
function DuskDurOcCreate(){
home_state = DuskDurOcFree;
entity_step = home_state;
entity_drop = DuskDurOcDrop;
enemy_idle = spr_enemy_duskDurOc_idle;
enemy_move = spr_enemy_duskDurOc_run;
damaged_snd = snd_rat_damaged;
shadow = 0;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 5;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 2.0;
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
//Dusk Legion Dur-Oc
function DuskDurOcFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		if (timer1 <= 0)
		{
			EnemyWander(180);
		}
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
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
		script_execute(EnemyChase);
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
	}
		
	//Death and Collision
	damage = 20;
	if (place_meeting(x,y,obj_player))
	{
		with (obj_player)
		{
			if (invincible = false)
			{
				flash = .35;
				hp = hp - other.damage;
				with (other) 
				{
					global.aggroCounter = global.aggroCounter - 1;
					instance_destroy();
				}
			}
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
//Dusk Legion Dur-Oc
function TargeliChargerDrop(){

var _objects = 3;
var _dropBean = 9
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
if (_drop1 > 49) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 4;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 25) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 2;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}







