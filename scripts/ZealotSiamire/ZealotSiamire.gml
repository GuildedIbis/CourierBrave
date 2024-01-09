//Enemy Zealot Siamire
//
//
//
//
//
//Zealot Siamire Create
function scr_enemy_zealot_create(){
//Scripts
home_state = scr_enemy_zealot_free;
entity_step = home_state;
entity_drop = scr_enemy_zealot_drop;

//Assets
enemy_idle = spr_enemy_zealot_idle;
enemy_move = spr_enemy_zealot_run;
enemy_damaged = spr_enemy_zealot_damaged;
enemy_arm = spr_enemy_zealot_castArm;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 20;
max_hp = 1250;//+ (625 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.25;

//Animation and Status
name = "Zealot Siamire"
bullet = false;
healthbar = true;
boss = true;
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
direction = 180;
local_frame = 0;
hit_by_attack = -1;
remain_dist = 64;
timer1 = 60;
timer2 = 60;
timer3 = 60;
timer4 = 60;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
magic_counter = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
scene = false;

//Self Destruct
if (obj_inventory.quest_grid[# 16, 1] = 1)
{
	instance_destroy();
}
}
//
//
//
//
//
//
//Zealot Siamire Free
function scr_enemy_zealot_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;


	//Toggle Aggro 
	if (targeted = false) and (hp > 250)
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
			if (timerC <= 0) scr_enemy_chase();
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				enemy_idle = spr_enemy_zealot_cast;
				enemy_move = spr_enemy_zealot_runCast;
				attack_counter = irandom_range(1,3);
				entity_step = scr_enemy_zealot_waterSlash;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			
			if (timer2 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				attack_counter = irandom_range(1,2);
				entity_step = scr_enemy_zealot_bowshot;
			}
		
			if (timer3 <= 0)
			{
				path_end();
				sprite_index = enemy_idle;
				entity_step = scr_enemy_zealot_waterEdge;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,32))
		{
			if (timer4 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				entity_step = scr_enemy_zealot_cultistSpawn;
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
//Zealot Siamire Shoot
function scr_enemy_zealot_bowshot(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_zealot_shoot)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_zealot_shoot;
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
		attack_counter = attack_counter - 1;
		audio_sound_gain(snd_enemy_rat_arrow,global.volumeEffects,1);
		audio_play_sound(snd_enemy_rat_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_ratArrow_create();
			image_alpha = 1;
			sprite_index = enemy_move;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}
		if (attack_counter > 0)
		{
			entity_step = scr_enemy_zealot_bowshot;
			timer2 = 0;
		}
		else
		{
			timer2 = 120;
			timerC = 0;
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
//Zealot Siamire Magic
function scr_enemy_zealot_waterSlash(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();

	//Casting
	casting = true;
	if (!point_in_circle(obj_player.x,obj_player.y,x,y,6))
	{
		scr_enemy_chase_cast();
	}
	else path_end();

	//Create Projectiles (mid-animation
	scr_enemy_projectile_spawn();
	if (attack_counter > 0) and (timer1 <= 0)
	{
		attack_counter = attack_counter - 1;
		timer1 = 45;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			scr_projectile_waterSlash_create();
			
			direction = point_direction(x,y,obj_player.x,obj_player.y-4)
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			parent = other;
		}
	}
	
	//Animate
	scr_enemy_animation_cast();
	
	//End
	if (attack_counter <= 0) and (timer1 <= 0)
	{
		enemy_idle = spr_enemy_zealot_idle;
		enemy_move = spr_enemy_zealot_run;
		casting = false;
		entity_step = scr_enemy_zealot_free;
		timer1 = 330;
		timerC = 120;
	}
}
else 
{
	path_end();
	speed = 0;
}
}
//
//
//
//
//
//Zealot Siamire Wateredge Special
function scr_enemy_zealot_waterEdge(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_zealot_waterEdge)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_zealot_waterEdge;
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
		audio_sound_gain(snd_enemy_zealot_waterEdge,global.volumeEffects,1);
		audio_play_sound(snd_enemy_zealot_waterEdge,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_waterEdge_create();
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}

		timer3 = 480;
		timerC = 0;
		entity_step = home_state;
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
//Zealot Siamire Wateredge Special
function scr_enemy_zealot_cultistSpawn(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//SEtup
	if (sprite_index != spr_enemy_zealot_dillocSpawn)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_zealot_dillocSpawn;
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
		audio_sound_gain(snd_enemy_zealot_cultistSpawn,global.volumeEffects,1);
		audio_play_sound(snd_enemy_zealot_cultistSpawn,0,false);
		with (instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_enemy))
		{
			image_alpha = 1;
			scr_enemy_lilyCultist_create();
			entity_step = scr_enemy_lilyCultist_zealotSpawn;
			//enemy_lvl = other.enemy_lvl;
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			break_object = other.break_object;
		}
		timer4 = 600;
		timerC = 0;
		entity_step = home_state;
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
//Zealot Siamire Projectile Waterslash
function scr_projectile_waterSlash_create(){
home_state = scr_projectile_waterSlash_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;

projectile_sprite = spr_projectile_zealot_waterSlash;
dir_offX = 0;
dir_offY = 0;
lit = true;
invincible = true;
inv_dur_timer = 0;
enemy_move = projectile_sprite;
enemy_idle = projectile_sprite;
aggro_drop = 300;
healthbar = false;
enemy_spd = 3.0;
local_frame = 0;
hit_by_attack = -1;
damage = 45 ;
timer1 = 40;
timer2 = 20;
timer3 = 0;
fragment_count = 2;
fragment = obj_fragWater;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Zealot Siamire Projectile Waterslash
function scr_projectile_waterSlash_step(){
if (obj_game.gamePaused = false)
{
	//Timer
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	
	//Setup
	if (sprite_index != spr_projectile_zealot_waterSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_projectile_zealot_waterSlash;
		audio_sound_gain(snd_enemy_zealot_waterSlash,global.volumeEffects,1);
		audio_play_sound(snd_enemy_zealot_waterSlash,0,false);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Follow Parent (Siamire) and Adjust Aim
	var _aimAngle = point_direction(parent.x + dir_offX,parent.y + dir_offY,obj_player.x,obj_player.y-4);
	image_angle = _aimAngle;
	var _dirPos = round(_aimAngle/90);
	x = (parent.x + lengthdir_x(6, _aimAngle)) + dir_offX;
	y = (parent.y + lengthdir_y(6, _aimAngle)) + dir_offY;
	switch(_dirPos)
	{
		case 0:
			dir_offX = 0;
			dir_offY = -7;
		break;
		
		case 4:
			dir_offX = 0;
			dir_offY = -7;
		break;
		
		case 1:
			dir_offX = -2;
			dir_offY = -7;
		break;
		
		case 2:
			dir_offX = 0;
			dir_offY = -7;
		break;
		
		case 3:
			dir_offX = 2;
			dir_offY = -7;
		break;	
	}
	
	//Calculate Attack
	damage = 45;
	scr_enemy_attack_calculate(spr_projectile_zealot_waterSlash,self,-1,-1,-1,-1,-1,-1);
	
	//Clear Attack (Attack Hits Twice)
	if (timer2 <= 0)
	{
		timer2 = 30;
		audio_sound_gain(snd_enemy_zealot_waterSlash,global.volumeEffects,1);
		audio_play_sound(snd_enemy_zealot_waterSlash,0,false);
		ds_list_clear(hit_by_attack);
	}
	
	//Self Destruct
	if (timer1 <= 0)
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
//Zealot Water Edge Projectile
function scr_projectile_waterEdge_create(){
home_state = scr_projectile_waterEdge_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;
lit = true;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_zealot_waterEdge;
enemy_idle = spr_projectile_zealot_waterEdge;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = .75;
local_frame = 0;
hit_by_attack = -1;
timer1 = 600;
damage = 50;
fragment_count = 3;
fragment = obj_fragWater;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Zealot Water Edge Projectile
function scr_projectile_waterEdge_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;

	//Slowly Track Player
	if (timer1 > 0)
	{
		timer1 = timer1 - 1;
		var target_dir = point_direction(x,y,obj_player.x,obj_player.y);
		direction = direction + (sin(degtorad(target_dir - direction)) * 1.5);
		image_angle = direction;
	}
	
	//Self Destruct into Multiple Projectiles
	if (timer1 <= 0)
	{
		audio_sound_gain(snd_enemy_zealot_waterEdge_burst,global.volumeEffects,1);
		audio_play_sound(snd_enemy_zealot_waterEdge_burst,0,false);
		for (var i = 0; i < 9; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				scr_projectile_waterPin_create();
				direction = point_direction(x,y,obj_player.x,obj_player.y) + (40 * i);
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				
			}
		}
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
//Zealot Water Pin Create
function scr_projectile_waterPin_create(){
home_state = scr_projectile_waterPin_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;
lit = true;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_zealot_waterPin;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
damage = 30;
fragment_count = 3;
fragment = obj_fragWater;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Zealot Water Pin
function scr_projectile_waterPin_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Collision
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_projectile_hit,global.volumeEffects,1);
		audio_play_sound(snd_projectile_hit,0,false);
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
		instance_destroy();
	}
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
//Zealot Siamire Drop
function scr_enemy_zealot_drop(){
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

obj_inventory.quest_grid[# 15, 0] = true;
obj_inventory.quest_grid[# 15, 1] = 1;
obj_inventory.quest_grid[# 15, 2] = true;
}
