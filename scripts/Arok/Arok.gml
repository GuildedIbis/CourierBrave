//Enemy Arok
//
//
//
//
//
//Arok Create
function scr_enemy_arok_create(){
//Scripts
home_state = scr_enemy_arok_free;
entity_step = scr_enemy_arok_free;
entity_drop = scr_enemy_arok_drop;

//Assets
enemy_idle = spr_enemy_arok_idle;
enemy_move = spr_enemy_arok_run;
enemy_damaged = spr_enemy_arok_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 4;
max_hp = 600; //+ (45 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.5;
name = "Arok";
//Animation and Status
bullet = false;
healthbar = true;
shadow = true;
shadow_size = 2;
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
local_frame = 0;
hit_by_attack = -1;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
walk_snd_delay = 0;
attack_counter = 0;
path = -1;

}

//
//
//
//
//
//Arok Free State
function scr_enemy_arok_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	//if (timerC <= 0)
	//{
	//	path_end();
	//	sprite_index = enemy_idle;
	//	local_frame = 0;
	//	image_speed = 0;
	//	timerC = 520;
	//	timer1 = 180;
	//}
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			scr_enemy_alert();
			aggro_drop = 300;
			targeted = true;
		}
	}	
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		//sprite_index = enemy_idle;
		path_end();
		home_x = x;
		home_y = y;
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
	}
	
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		//Chase
		if (timerC <= 0)
		{
			if (!point_in_rectangle(obj_player.x,obj_player.y,x-8,y-8,x+8,y+8))
			{
				scr_enemy_chase();
			}
			else
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
			}
		}
		
		//Standard Arrow Attack
		if (timer1 <= 0) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) 
		{
			path_end();
			sprite_index = enemy_idle;
			entity_step = scr_enemy_arok_shoot;
		}
		
		//Drop Aggro While Broken LOS
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
			home_x = x;
			home_y = y;
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
//Arok Free State
function scr_enemy_arok_shoot(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_arok_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_arok_shoot;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		audio_sound_gain(snd_enemy_rat_arrow,global.volumeEffects,1);
		audio_play_sound(snd_enemy_rat_arrow,0,false);
		with (instance_create_layer(x,y-22,"Instances",obj_enemy_projectile))
		{
			scr_projectile_arokArrow_create();
			image_alpha = 1;
			sprite_index = enemy_move;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}
		
		//Set State
		if (attack_counter < 2)
		{
			entity_step = scr_enemy_arok_shoot;
			timer1 = 0;
		}
		else
		{
			attack_counter = 0;
			timer1 = 120;
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
//Arok Drop
function scr_enemy_arok_drop(){
var _objects = 3;	
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = 6;
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
}
//
//
//
//
//
//Arok Projectiles
//
//
//
//
//
//Arok Create
function scr_projectile_arokArrow_create(){
home_state = scr_projectile_arokArrow_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;

invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_arok_arrow;
enemy_idle = spr_projectile_arok_arrow;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 3.0;
local_frame = 0;
hit_by_attack = -1;
damage = 25;
fragment_count = 3;
fragment = obj_fragWood;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Arok Arrow Free
function scr_projectile_arokArrow_step(){
if (obj_game.gamePaused = false)
{
	//Resume Speed
	speed = enemy_spd;
	
	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
	if (place_meeting(x,y,break_object)) 
	{
		instance_destroy();
	}
}
else
{
	speed = 0;
}
}







