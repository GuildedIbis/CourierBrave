//Elite Gorog - Mini-Boss
//
//
//
//
//
//Elite Gorog Create
function scr_enemy_gorogElite_create(){
//Scripts
home_state = scr_enemy_gorogElite_free;
entity_step = home_state;
entity_drop = scr_enemy_gorogElite_drop;


//Assets
enemy_idle = spr_enemy_gorogE_idle;
enemy_move = spr_enemy_gorogE_run;
enemy_damaged = spr_enemy_gorogE_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 1;
drop_amount = 30;
max_hp = 350;
hp = max_hp;
enemy_spd = 1.2;

//Animation and Status
name = "Elite Gorog"
boss = false;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
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
_destX = 32;
_destY = 32;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Elite Gorog Free State
function scr_enemy_gorogElite_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;

	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		scr_enemy_wander_home(60,180,home_x,home_y); //Data Leak if not radius restricted
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
		aggro_drop = 300;
		targeted = false;
		home_x = x;
		home_y = y;
		global.aggroCounter = global.aggroCounter - 1;
	}
	

	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		scr_enemy_chase();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48)) 
		{	
			
			if (timer1 > 0) and (timer2 > 0) //AI feature: only use shield as last option
			{
				if (timer3 <= 0)//Shield Timer
				{
					path_end();
					timer3 = 180;
					inv_dur_timer = 180;
					entity_step = scr_enemy_gorogElite_shield;
				}
			}
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				if (timer1 <= 0) //Heavy Slash A
				{
					entity_step = scr_enemy_gorogElite_heavySlashA;
				}		
			
			}
		}
		else
		{
			if (timer2 <= 0)
			{	
				var _rATK = irandom_range(0,2);
				if (_rATK = 0)
				{
					path_end();
					timer2 = 15;
					entity_step = scr_enemy_gorogElite_knifeThrow;
				}
				else
				{
					path_end();
					timer2 = 24;
					entity_step = scr_enemy_gorogElite_chainHook_toss;
				}
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
else
{
	path_end();
	
}
}
//
//
//
//
//
//Elite Gorog Shield
function scr_enemy_gorogElite_shield(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	
	//Track Player
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	
	if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
	{
		path_end();
		sprite_index = spr_enemy_gorogE_shield;
	}
	else
	{
		enemy_move = spr_enemy_gorogE_shieldMove;
		enemy_spd = .5;
		scr_enemy_chase();	
	}
	
	//Shielded
	shielded = true;
	
	//Animate
	scr_enemy_animation();
	
	//End
	if (timer3 <= 0)
	{
		timer3 = 180;
		enemy_move = spr_enemy_gorogE_run;
		enemy_idle = spr_enemy_gorogE_idle;
		entity_step = home_state;
		animation_end = false;
	}
}
else
{
	path_end();
}
}
//
//
//
//
//
//Elite Gorog Heavy Slash A
function scr_enemy_gorogElite_heavySlashA(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_gorogE_heavySlash_A)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorogE_heavySlash_A;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 45;
	scr_enemy_attack_calculate(spr_enemy_gorogE_heavySlash_A_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,20))
		{
			entity_step = scr_enemy_gorogElite_heavySlashB;
		}
		else 
		{
			timer1 = 30;
			timerC = 60;
			sprite_index = enemy_idle;
			entity_step = scr_enemy_gorogElite_free;
		}
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Gorog Heavy Slash B
function scr_enemy_gorogElite_heavySlashB(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_gorogE_heavySlash_B)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorogE_heavySlash_B;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 50;
	scr_enemy_attack_calculate(spr_enemy_gorogE_heavySlash_B_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		timer1 = 90;
		timerC = 60;
		hor_spd = irandom_range(-1,1);
		ver_spd = irandom_range(-1,1);
		if (hor_spd = 0) and (ver_spd = 0)
		{
			hor_spd = choose(-1,1)
			ver_spd = choose(-1,1)
		}
		entity_step = scr_enemy_gorogElite_reposition;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Elite Gorog Chain Hook Toss
function scr_enemy_gorogElite_chainHook_toss(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_gorogE_chainHook_toss)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorogE_chainHook_toss;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Create Projectile (mid-animation)
	if (timer2 <= 0)
	{
		timer2 = 120;
		audio_sound_gain(snd_enemy_gorogKnife_throw,global.volumeEffects,1);
		audio_play_sound(snd_enemy_gorogKnife_throw,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_gorogElite_chainHook_create();
			direction = (point_direction(x,y,obj_player.x,obj_player.y-4));
			image_angle = direction;
			
			parent = other;
			break_object = other.break_object;
			
			
		}
	}
	
	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{	
		attack_counter = 0;
		entity_step = scr_enemy_gorogElite_chainHook_wait;
		animation_end = false;
		
	}
}
}
//
//
//
//
//
//Elite Gorog Chain Hook Wait
function scr_enemy_gorogElite_chainHook_wait(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_gorogE_chainHook_wait)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorogE_chainHook_wait;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Animate
	scr_enemy_animation();
	
	//End initiated by projectile
}
}
//
//
//
//
//
//Elite Gorog Knife Throw
function scr_enemy_gorogElite_knifeThrow(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_gorogE_knifeThrow)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorogE_knifeThrow;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Create Projectiles (mid-animation)
	if (timer2 <= 0)
	{
		timer2 = 15;
		audio_sound_gain(snd_enemy_gorogKnife_throw,global.volumeEffects,1);
		audio_play_sound(snd_enemy_gorogKnife_throw,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			script_execute(scr_projectile_gorogElite_knife_create);
			direction = (point_direction(x,y,obj_player.x,obj_player.y))+irandom_range(-3,3);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragMetal;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
	}
	
	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		if (attack_counter < 3)
		{
			timer2 = 15;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			sprite_index = spr_enemy_gorogE_knifeThrow;
			local_frame = 0;
			image_index = 0;
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
		}
		if (attack_counter >= 3)
		{
			attack_counter = 0;
			timer2 = 60;
			sprite_index = enemy_idle;
			entity_step = home_state;
			animation_end = false;
		}
	}
}
}
//
//
//
//
//
//EliteGorog Reposition
function scr_enemy_gorogElite_reposition(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();

	//Set
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation();

	//Move
	if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
	{
		if (hor_spd != 0) or (ver_spd != 0) 
		{
			var _xDest = x + (hor_spd * (enemy_spd))
			var _yDest = y + (ver_spd * (enemy_spd))
			if (place_meeting(_xDest, _yDest,obj_entity))
			{
				hor_spd = -hor_spd;
				ver_spd = -ver_spd;
				//sprite_index = enemy_idle;
			}
			path = path_add();
			mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
			path_start(path, enemy_spd, 0, 0);
			image_speed = 1;
			sprite_index = enemy_move;
	
		}
	}
	else sprite_index = enemy_idle;

	//End
	if (timerC <= 0)
	{
		timerC = 60;
		entity_step = home_state;
		sprite_index = enemy_idle;
	}
}
}
//
//
//
//
//
//Elite Gorog Drop
function scr_enemy_gorogElite_drop(){
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







