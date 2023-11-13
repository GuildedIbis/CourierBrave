//Enemy Zealot Siamire
//
//
//
//
//
//Zealot Siamire Create
function scr_enemy_zealot_create(){

sound = snd_npc_mouse;
timer1 = 40;
idle_sprite = spr_enemy_zealot_idle;
scene = false;
sprite_index = idle_sprite;
image_speed = 0;


//
home_state = scr_enemy_zealot_free;
entity_step = home_state;
entity_drop = scr_enemy_zealot_drop;
name = "Zealot Siamire"
bullet = false;
healthbar = true;
boss = true;
enemy_idle = spr_enemy_zealot_idle;
enemy_move = spr_enemy_zealot_run;
enemy_damaged = spr_enemy_zealot_damaged;
enemy_arm = spr_enemy_zealot_castArm;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
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
form_type = 0;
drop_amount = 20;
max_hp = 600 + (305 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.25;
local_frame = 0;
hit_by_attack = -1;
remain_dist = 64;
timer1 = 60;
timer2 = 60;
timer3 = 60;
timer4 = 300;
timerC = 120;
magic_counter = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;

if (obj_inventory.quest_grid[# 16, 3] = true)
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
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	if (timerC > 0) timerC = timerC - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;
	enemy_spd = 1.25;


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
		if (timerC <= 0) scr_enemy_chase();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				enemy_idle = spr_enemy_zealot_cast;
				enemy_move = spr_enemy_zealot_runCast;
				walk_snd_delay = 15;
				attack_counter = irandom_range(1,3);
				entity_step = scr_enemy_zealot_magic;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			
			if (timer3 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				walk_snd_delay = 15;
				attack_counter = irandom_range(1,2);
				entity_step = scr_enemy_zealot_shoot;
			}
			//else
			//{
			//	if (timer2 <= 0)
			//	{
			//		path_end();
			//		sprite_index = enemy_idle;
			//		attack_counter = irandom_range(2,4);
			//		magic_counter = 4;
			//		timer2 = 45;
			//		hor_spd = irandom_range(-1,1);
			//		ver_spd = irandom_range(-1,1);
			//		if (hor_spd = 0) and (ver_spd = 0)
			//		{
			//			hor_spd = choose(-1,1)
			//			ver_spd = choose(-1,1)
			//		}
			//		entity_step = scr_enemy_acolyte_magic;
			//		animation_end = false;
			//	}
			//}
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
function scr_enemy_zealot_shoot(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	if (animation_end)
	{
		attack_counter = attack_counter - 1;
		audio_sound_gain(snd_arrow,global.volumeEffects,1);
		audio_play_sound(snd_arrow,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = scr_projectile_ratArrow;
			entity_step = home_state;
			entity_drop = Idle;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_rat_arrow;
			aggro_drop = 300;
			healthbar = false;
			bullet = true;
			enemy_spd = 3.0;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 40 + (8 * other.enemy_lvl);
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
		if (attack_counter > 0)
		{
			entity_step = scr_enemy_zealot_shoot;
			timer3 = 0;
		}
		else
		{
			timer3 = 180;
			timerC = 120;
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
function scr_enemy_zealot_magic(){
if (obj_game.gamePaused = false)
{
	casting = true;
	enemy_spd = 1.0;
	//Timer
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	if (timerC > 0) timerC = timerC - 1;


	//Animate
	scr_enemy_animation_cast();
	scr_enemy_projectile_spawn();

	

	//Move
	if (timer1 <= 0)
	{
		attack_counter = attack_counter - 1;
		timer1 = 45;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			//audio_sound_gain(snd_acolyte_nilchrome,global.volumeEffects,1);
			//audio_play_sound(snd_acolyte_nilchrome,0,0);
			projectile_sprite = spr_projectile_zealot_waterSlash;
			home_state = scr_projectile_waterSlash;
			entity_step = home_state;
			invincible = true;
			inv_dur_timer = 0;
			enemy_move = projectile_sprite;
			enemy_idle = projectile_sprite;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 3.0;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 45 + (8 * other.enemy_lvl);
			timer1 = 40;
			timer2 = 20;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragWater;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			direction = point_direction(x,y,obj_player.x,obj_player.y-4)
			image_angle = direction;
			speed = enemy_spd;
		}
	}
	//End
	if (attack_counter <= 0)
	{
		enemy_idle = spr_enemy_zealot_idle;
		enemy_move = spr_enemy_zealot_run;
		casting = false;
		entity_step = scr_enemy_zealot_free;
		timer1 = 330;
	}
}
}
//
//
//
//
//
//Acolyte Antichrome Projectile
function scr_projectile_waterSlash(){
if (obj_game.gamePaused = false)
{
	if (timer1 >= 0) timer1 = timer1 - 1;
	if (timer2 >= 0) timer2 = timer2 - 1;
	if (sprite_index != spr_projectile_zealot_waterSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_projectile_zealot_waterSlash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	speed = 0;
	scr_enemy_attack_calculate(spr_projectile_zealot_waterSlash);
	if (timer1 <= 0)
	{
		instance_destroy();
	}
	if (timer2 <= 0)
	{
		ds_list_clear(hit_by_attack);
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
//AZealot Siamire Drop
function scr_enemy_zealot_drop(){

var _objects = 7;
var _drop1 = irandom_range(0,99);
var _drop2 = irandom_range(0,99);
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
if (_drop1 < 40)//Form Specific Rog Stone
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
if (_drop1 >= 40) and (_drop1 < 80)//Random Rog Stone
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
if (_drop2 < 100)
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
