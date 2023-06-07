//Elite Skirmisher
//
//
//
//
//
//Elite Skirmisher Create
function EliteSkirmisherCreate(){
home_state = EliteSkirmisherFree;
entity_step = home_state;
entity_drop = EliteSkirmisherDrop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_eliteSkirmisher_idle;
enemy_move = spr_enemy_eliteSkirmisher_run;
enemy_damaged = spr_enemy_eliteSkirmisher_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 0;
max_hp = 180;
hp = max_hp;
enemy_spd = 1.75;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
walk_snd_delay = 0;
path = -1;
return_x = -1;
return_y = -1;
}
//
//
//
//
//
//Elite Skirmisher Free State
function EliteSkirmisherFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (timer1 <= 0)
		{
			EnemyWander(60,180); //Data Leak if not radius restricted
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
	
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		if (timer1 <= 0)
		{
			EnemyChaseSpecial(obj_game,obj_entity);
		}
		if (point_in_rectangle(obj_player.x,obj_player.y,x-24,y-24,x+24,y+24))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0) 
			{
				timer1 = 120;
				if (point_in_rectangle(obj_player.x,obj_player.y,x-12,y-12,x+12,y+12))
				{
					entity_step = EliteSkirmisherSlash;
				}
				else
				{
					timer2 = 20;
					hor_spd = 0;
					ver_spd = 0;
					return_x = x;
					return_y = y;
					direction = (point_direction(x,y,obj_player.x,obj_player.y));
					entity_step = EliteSkirmisherSpinSlash;
				}
				
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
//Elite Skirmisher Slash State
function EliteSkirmisherSlash(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_eliteSkirmisher_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_eliteSkirmisher_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 45;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_rat_slash_hitbox)

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
//Elite Skirmisher Spin Slash State
function EliteSkirmisherSpinSlash(){
if (obj_game.gamePaused = false)
{
	image_speed = 1;
	var _collided
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_eliteSkirmisher_spinSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_eliteSkirmisher_spinSlash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 45;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_eliteSkirmisher_spinSlash_hitbox);
	
	if (timer2 <= 0)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(3,direction);
		ver_spd = lengthdir_y(3,direction);
	}
	
	var _collided = EnemyCollision();
	


	//Animate
	EnemyAnimation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		timer1 = 120;
		timer2 = 600;
		hor_spd = irandom_range(-1,1);
		ver_spd = irandom_range(-1,1);
		if (hor_spd = 0) and (ver_spd = 0)
		{
			hor_spd = choose(-1,1)
			ver_spd = choose(-1,1)
		}
		entity_step = EnemyReposition;
		//entity_step = home_state;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Skirmisher Drop
function EliteSkirmisherDrop(){
if (obj_inventory.quest_grid[# 2, 0] = true) and (obj_inventory.quest_grid[# 2, 3] = false)
{
	obj_inventory.quest_grid[# 2, 1] = obj_inventory.quest_grid[# 2, 1] + 1;
}
var _objects = 6;
var _dropBean = 70;
var _drop1 = irandom_range(0,99)	


with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = 360/_objects;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = other.form_type;
	image_speed = 0;
	direction = 360/_objects * 2;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = 360/_objects * 3;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = 6;
	image_speed = 0;
	direction = 360/_objects * 4;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 50) //Rat Teeth
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 1;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = 360/_objects * 5;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])


}







