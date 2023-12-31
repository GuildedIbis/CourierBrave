//Ofa Worm
//
//
//
//
//
//Ofa Worm Create
function scr_enemy_ofa_worm_create(){
//Scripts
home_state = scr_enemy_ofa_worm_free;
entity_step = home_state;
entity_drop = scr_enemy_ofa_worm_drop;

//Assets
enemy_idle = spr_enemy_ofaWorm_idle;
enemy_move = spr_enemy_ofaWorm_move;
enemy_damaged = spr_enemy_ofaWorm_hit;
damaged_snd = snd_enemy_ofa_worm_damaged;
walk_snd = snd_walk_water2;

//Stats
drop_amount = 4;
max_hp = 60;//+ (30 * enemy_lvl);
hp = max_hp;
form_type = 2;
enemy_spd = 1.1;

//Animation and Status
shadow = true;
shadow_size = 0;
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
image_index = 3;
hor_spd = 0;
ver_spd = 0;
local_frame = 0;
hit_by_attack = -1;
dash_timer = 360;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Ofa Worm Free
function scr_enemy_ofa_worm_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;

	//Aggro 
	scr_enemy_aggro();
	
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		lit = true;
		scr_enemy_chase();
		walk_snd_delay = walk_snd_delay - 1;
		if (dash_timer > 0) dash_timer = dash_timer - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,6))
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				timer1 = 60;
				entity_step = scr_enemy_ofa_worm_headbutt;
			}
		}

		if (dash_timer <= 0)
		{
			audio_sound_gain(snd_ofaWorm_dash,global.volumeEffects,1);
			audio_play_sound(snd_ofaWorm_dash,0,false);	
			dash_timer = 720;
			timer2 = 90;
		}
		if (timer2 > 0)
		{
			enemy_move = spr_enemy_ofaWorm_dash;
			enemy_spd = 2.0;	
		}
		else
		{
			enemy_spd = .75;
			enemy_move = spr_enemy_ofaWorm_move;
			
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
//Ofa Worm Dash
function scr_enemy_ofa_worm_headbutt(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ofaWorm_headbutt)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ofaWorm_headbutt;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 20;
	scr_enemy_attack_calculate(spr_ofaWorm_headbutt_hitbox);

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		entity_step = home_state;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Ofa Worm Drop
function scr_enemy_ofa_worm_drop(){
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










