//Balurne Gorog
//
//
//
//
//
//Balurne Skirmisher Create
function scr_enemy_balurne_gorog_create(){
home_state = scr_enemy_balurne_gorog_free;
entity_step = home_state;
entity_drop = scr_enemy_balurne_gorog_drop;
enemy_idle = spr_enemy_gorog_idle;
enemy_move = spr_enemy_gorog_run;
enemy_damaged = spr_enemy_gorog_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
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
form_type = 1;
drop_amount = 20;
max_hp = 150 + (75 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Balurne Skirmisher Free State
function scr_enemy_balurne_gorog_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (timer1 <= 0)
		{
			scr_enemy_wander_home(60,180,home_x,home_y); //Data Leak if not radius restricted
		}
		else sprite_index = enemy_idle;
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
					entity_step = scr_enemy_balurne_gorog_shield;
				}
			}
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				sprite_index = enemy_idle;
				if (timer1 <= 0) //Heavy Slash A
				{
					entity_step = scr_enemy_balurne_gorog_heavySlash;
				}		
			
			}
		}
		else
		{
			if (timer2 <= 0)
			{	
				path_end();
				timer2 = 15;
				entity_step = scr_enemy_balurne_gorog_knifeThrow;
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
//Balurne Gorog Shield
function scr_enemy_balurne_gorog_shield(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorogShield_idle)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorogShield_idle;
		local_frame = 0;
		image_index = 0;
	}
	direction = point_direction(x,y,obj_player.x,obj_player.y);

	//Animate
	scr_enemy_animation();
	if (timer3 <= 0)
	{
		timer3 = 180;
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
//Balurne Skirmisher Slash State
function scr_enemy_balurne_gorog_heavySlash(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorog_heavySlash_A)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorog_heavySlash_A;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 55 + (9 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_gorog_heavySlash_A_hitbox)

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,20))
		{
			entity_step = scr_enemy_balurne_gorog_heavySlash_back;
		}
		else 
		{
			timer1 = 30;
			sprite_index = enemy_idle;
			entity_step = scr_enemy_balurne_gorog_free;
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
//Balurne Skirmisher Slash State
function scr_enemy_balurne_gorog_heavySlash_back(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorog_heavySlash_B)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_gorog_heavySlash_B;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 65 + (10 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_gorog_heavySlash_B_hitbox)

	//Animate
	scr_enemy_animation();
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
		entity_step = scr_enemy_balurne_gorog_reposition;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Balurne Gorog Knife Throw
function scr_enemy_balurne_gorog_knifeThrow(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_gorog_knifeThrow)
	{
		//Start Animation From Beginning
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_gorog_knifeThrow;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	if (timer2 <= 0)
	{
		timer2 = 50;
		audio_sound_gain(snd_gorogKnife_throw,global.volumeEffects,1);
		audio_play_sound(snd_gorogKnife_throw,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			home_state = scr_projectile_balurne_gorog_knife;
			entity_step = home_state;
			entity_drop = Idle;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_gorogKnife;
			aggro_drop = 300;
			healthbar = false;
			bullet = true;
			enemy_spd = 3.0
			local_frame = 0;
			hit_by_attack = -1;
			damage = 45 + (8 * enemy_lvl);
			direction = (point_direction(x,y,obj_player.x,obj_player.y)) - 5;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragMetal;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			home_state = scr_projectile_balurne_gorog_knife;
			entity_step = home_state;
			entity_drop = Idle;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_gorogKnife;
			aggro_drop = 300;
			healthbar = false;
			bullet = true;
			enemy_spd = 3.0
			local_frame = 0;
			hit_by_attack = -1;
			damage = 45 + (8 * enemy_lvl);
			direction = (point_direction(x,y,obj_player.x,obj_player.y)) + 5;
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
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
		if (attack_counter < 2)
		{
			timer2 = 15;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			sprite_index = spr_enemy_gorog_knifeThrow;
			local_frame = 0;
			image_index = 0;
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
		}
		if (attack_counter >= 2)
		{
			attack_counter = 0;
			timer2 = 120;
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
//Gorog Reposition
function scr_enemy_balurne_gorog_reposition(){
//Timer

if (timer1 > 0) timer1 = timer1 - 1;


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
if (timer1 <= 0)
{
	timer1 = 30;
	entity_step = home_state;
	sprite_index = enemy_idle;
}
}
//
//
//
//
//
//Balurne Gorog Drop
function scr_enemy_balurne_gorog_drop(){

var _objects = 7;
//var _dropBean = 150;
var _drop1 = irandom_range(0,99);
var _drop2 = irandom_range(0,99);
var _angle = irandom_range(0,359);


//with (instance_create_layer(x,y,"Instances",obj_itemBean))
//{
//	drop_amount = _dropBean;
//	sprite_index = spr_bean;
//	direction = (360/_objects) + _angle;
//	spd = .75 + (.3) + random(0.1);
//}
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
if (_drop1 < 10)//Form Specific Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = obj_player.form_type;
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 4) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop1 >= 10) and (_drop1 < 20)//Random Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = irandom_range(0,5);
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 5) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 < 10)
{
	with (instance_create_layer(x,y,"Instances",obj_itemPS))
	{
		item_id = other.enemy_lvl;
		sprite_index = spr_powerstone_all;
		image_index = item_id;
		direction = (360/_objects * 6) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
}
}
//
//
//
//
//
//Gorog Knife Free
function scr_projectile_balurne_gorog_knife(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_gorogKnife_hit,global.volumeEffects,1);
	audio_play_sound(snd_gorogKnife_hit,0,false);
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
	audio_sound_gain(snd_gorogKnife_hit,global.volumeEffects,1);
	audio_play_sound(snd_gorogKnife_hit,0,false);
	instance_destroy();
}
}
else
{
	speed = 0;
}
}






