//Enemy Sarcap
//
//
//
//
//
//Sarcap Create
function scr_enemy_sarcap_create(){
//Scripts
home_state = scr_enemy_sarcap_free;
entity_step = scr_enemy_sarcap_free;
entity_drop = scr_enemy_balurne_sarcap_drop;

//Assets
enemy_idle = spr_enemy_sarcap_idle;
enemy_move = spr_enemy_sarcap_run;
enemy_damaged = spr_enemy_sarcap_damaged;
enemy_arm = spr_enemy_sarcap_castArm;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 10;
max_hp = 200; //+ (45 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.2;

//Animation and Status
bullet = false;
healthbar = true;
shadow = true;
shadow_size = 1;
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
//Sarcap Free State
function scr_enemy_sarcap_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		scr_enemy_wander_home(60,180,home_x,home_y); 
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
		sprite_index = enemy_idle;
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
		if (timerC <= 0) scr_enemy_chase();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				walk_snd_delay = 15;
				timer1 = 32;
				entity_step = scr_enemy_sarcap_slash;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			
			if (timer2 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				walk_snd_delay = 15;
				timer2 = irandom_range(60,120);
				timer3 = 0;
				enemy_idle = spr_enemy_sarcap_cast;
				enemy_move = spr_enemy_sarcap_runCast;
				entity_step = scr_enemy_sarcap_sporeBlast;
			}
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
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
//Sarcap Slash State
function scr_enemy_sarcap_slash(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_sarcap_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_sarcap_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 25;
	scr_enemy_attack_calculate(spr_enemy_sarcap_slash_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
	scr_enemy_animation();
	scr_enemy_projectile_spawn(8);
	
	if (timer1 <= 0)
	{
		timer1 = 180;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			//audio_sound_gain(snd_enemy_acolyte_nilchrome,global.volumeEffects,1);
			//audio_play_sound(snd_enemy_acolyte_nilchrome,0,0);
			scr_projectile_sarcap_sporeWall_create();
			image_speed = 1;
			direction = other.direction;
			image_angle = direction;
			speed = enemy_spd;
			sprite_index = projectile_sprite;
			break_object = other.break_object;
		}
	}
	
	//End
	if (animation_end)
	{
		timer1 = 180;
		timerC = 60;
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
//Acolyte Magic
function scr_enemy_sarcap_sporeBlast(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Dynamic Casting Arm
	casting = true;
	
	//Set
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	
	//Move
	if (point_in_circle(obj_player.x,obj_player.y,x,y,32))
	{
		path_end();
		sprite_index = enemy_idle;
	}
	else
	{
		scr_enemy_chase();
	}
	
	//Animate
	scr_enemy_animation_cast();
	scr_enemy_projectile_spawn(8);

	//Create Projectiles (mid-animation, several bursts)
	if (timer3 <= 0)
	{
		timer3 = 3;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			//audio_sound_gain(snd_enemy_acolyte_nilchrome,global.volumeEffects,1);
			//audio_play_sound(snd_enemy_acolyte_nilchrome,0,0);
			scr_projectile_sporeBlast_create();
			image_speed = 0;
			image_index = irandom_range(0,2);
			direction = point_direction(x,y,obj_player.x,obj_player.y-4) + (irandom_range(-12,12));
			image_angle = irandom_range(0,359);
			speed = enemy_spd;
			sprite_index = enemy_move;
			break_object = other.break_object;
		}
	}

	
	//End
	if (timer2 <= 0)
	{
		casting = false;
		enemy_idle = spr_enemy_sarcap_idle;
		enemy_move = spr_enemy_sarcap_run;
		entity_step = scr_enemy_sarcap_free;
		timer2 = 360;
	}
}
}
//
//
//
//
//
function scr_projectile_sporeBlast_create(){
home_state = scr_projectile_sporeBlast_step;
entity_step = home_state;

lit = true;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_sarcap_sporeBlast;
enemy_idle = spr_projectile_sarcap_sporeBlast;
aggro_drop = 300;
healthbar = false;
enemy_spd = 2.5;
sd_timer = 30;
local_frame = 0;
hit_by_attack = -1;
damage = 15;
fragment_count = 2;
fragment = obj_fragYellow;
bullet = true;
hit_script = scr_entity_hit_destroy;

sprite_index = enemy_idle;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Acolyte Antichrome Projectile
function scr_projectile_sporeBlast_step(){
if (obj_game.gamePaused = false)
{
	//Resume Speed
	speed = enemy_spd;
	image_speed = 0;
	
	//SD
	sd_timer = sd_timer - 1;
	if (sd_timer <= 0)
	{
		instance_destroy();
	}
	
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
//
//
//
//
//
//
//Sarcap Spore Wall Projectile Script Create
function scr_projectile_sarcap_sporeWall_create(){
home_state = scr_projectile_sarcap_sporeWall_step;
entity_step = home_state;

lit = true;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_sarcap_sporeWall;
enemy_idle = spr_projectile_sarcap_sporeWall;
projectile_sprite = spr_projectile_sarcap_sporeWall;
aggro_drop = 300;
healthbar = false;
enemy_spd = 2.5;
timer1 = 20;
sd_timer = 300;
local_frame = 0;
hit_by_attack = -1;
damage = 0;
fragment_count = 2;
fragment = obj_fragYellow;
bullet = true;
hit_script = scr_entity_hit_destroy;


if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
// 
//Sarcap Spore Wall Projectile Script Step
function scr_projectile_sarcap_sporeWall_step(){
//Set
lit = true;
destructable = false;
speed = enemy_spd;
depth = -4700;
if (timer1 >= 0)
{
	image_speed = 1;
	timer1 = timer1 - 1;
}
else 
{
	image_speed = 0;
}
//if (place_meeting(x,y,obj_player)) depth = obj_player.depth - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//Timers
if (sd_timer > 0) sd_timer = sd_timer - 1;
if (enemy_spd > 0) enemy_spd = enemy_spd - .10;
if (enemy_spd < 0) enemy_spd = 0;

//Collision
if (place_meeting(x,y,obj_projectile)) 
{
	
	scr_enemy_attack_calculate_shield(enemy_move,self);
}
if (place_meeting(x,y,break_object))
{
	speed = 0;
}
if (sd_timer <= 0) instance_destroy();

}
//
//
//
//
//
//Balurne sarcap Drop
function scr_enemy_balurne_sarcap_drop(){
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







