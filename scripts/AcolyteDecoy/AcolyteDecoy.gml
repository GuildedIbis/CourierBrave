//Enemy Acolyte Decoy
//
//
//
//
//
//Acolyte Decoy Create
function scr_enemy_acolyteDecoy_create(){
//Scripts
home_state = scr_enemy_acolyteDecoy_free;
entity_drop = scr_enemy_acolyteDecoy_drop;

//Assests
enemy_idle = spr_enemy_acolyte_idle;
enemy_move = spr_enemy_acolyte_run;
enemy_damaged = spr_enemy_skirmisher_damaged;
enemy_arm = spr_enemy_acolyte_castArm;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
idle_sprite = spr_enemy_acolyte_idle;
sound = snd_npc_mouse;

//Stats
form_type = 0;
drop_amount = 10;
max_hp = 100 //+ (50 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.25;

//Animation and Status
timer1 = 40;
scene = false;
image_speed = 0;
bullet = false;
healthbar = true;
boss = false;
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
direction = 270;
local_frame = 0;
hit_by_attack = -1;
remain_dist = 64;
timer1 = 0;
magic_counter = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;

}
//
//
//
//
//
//Acolyte Decoy Spawn
function scr_enemy_acolyteDecoy_spawn()
{
	//Invincible During Spawn Animation
	invincible = true;
	inv_dur_timer = 5;
	
	//Setup
	if (sprite_index != spr_enemy_acolyte_decoySpawn)
	{
		sprite_index = spr_enemy_acolyte_decoySpawn;
		local_frame = 0;
		image_index = 0;
	}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		entity_step = home_state;
	}
}
//
//
//
//
//
//
//Acolyte Decoy Free
function scr_enemy_acolyteDecoy_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
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
		scr_enemy_chase_special(obj_game,obj_entity);
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				walk_snd_delay = 15;
				timer1 = 120;
				attack_counter = irandom_range(1,3);
				entity_step = scr_enemy_acolyteDecoy_slash;
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
//Acolyte Decoy Slash
function scr_enemy_acolyteDecoy_slash(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_acolyte_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_acolyte_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 15;
	scr_enemy_attack_calculate(spr_hitbox_acolyte_slash)

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		timer1 = 120;
		attack_counter = attack_counter - 1;
		if (attack_counter <= 0)
		{
			entity_step = scr_enemy_acolyteDecoy_free;
			sprite_index = spr_enemy_acolyte_idle;
		}
		else
		{
			direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
			sprite_index = spr_enemy_acolyte_slash;
			local_frame = 0;
			image_index = 0;
			audio_sound_gain(snd_slash01,global.volumeEffects,1);
			audio_play_sound(snd_slash01,0,false);
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
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
//Acolyte Decoy Drop
function scr_enemy_acolyteDecoy_drop(){
var _objects = 2;
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
}

