//Enemy Browncap
//
//
//
//
//
//Browncap Create
function scr_enemy_browncap_create(){
//Scripts
home_state = scr_enemy_browncap_free;
entity_step = scr_enemy_browncap_free;
entity_drop = scr_enemy_browncap_drop;

//Assets
enemy_idle = spr_enemy_browncap_idle;
enemy_move = spr_enemy_browncap_run;
enemy_damaged = spr_enemy_browncap_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 4;
max_hp = 60; //+ (45 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.1;

//Animation and Status
bullet = false;
healthbar = true;
shadow = true;
shadow_size = 0;
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
path = -1;

}
//
//
//
//
//
//Browncap Spawn
function scr_enemy_browncap_spawn()
{
if (obj_game.gamePaused = false)
{
	//Invincible During Spawn Animation
	invincible = true;
	inv_dur_timer = 5;
	
	//Setup
	if (sprite_index != spr_enemy_browncap_spawn)
	{
		sprite_index = spr_enemy_browncap_spawn;
		local_frame = 0;
		image_index = 0;
	}
	
	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end = true)
	{
		entity_step = home_state;
	}
}
}
//
//
//
//
//
//Browncap Free State
function scr_enemy_browncap_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		sprite_index = spr_enemy_browncap_buried;
		//scr_enemy_wander_home(60,180,home_x,home_y); 
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
		if (timer1 <= 0) scr_enemy_chase();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,6))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				//timer1 = 120;
				entity_step = scr_enemy_browncap_sporeSlam;
				
			}
		}
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
//Browncap Sporeslam
function scr_enemy_browncap_sporeSlam(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_browncap_sporeSlam)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_browncap_sporeSlam;
		local_frame = 0;
		image_index = 0;
		audio_play_sound(snd_enemy_browncap_sporeSlam,0,0,global.volumeEffects);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 20;
	scr_enemy_attack_calculate(spr_enemy_browncap_sporeSlam_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
	scr_enemy_animation();
	
	//End
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
		entity_step = scr_enemy_reposition;
		animation_end = false;
	}
}
}

//
//
//
//
//
//Browncap Drop
function scr_enemy_browncap_drop(){
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







