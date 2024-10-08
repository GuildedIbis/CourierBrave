//Rempho Ghost 2
//
//
//
//
//
//Rempho Ghost 2 Create
function scr_enemy_rempho_ghost2_create(){
//Scripts
home_state = scr_enemy_rempho_ghost2_free;
entity_step = scr_enemy_rempho_ghost2_free;
entity_drop = scr_enemy_rempho_ghost_drop;

//Assets
enemy_idle = spr_enemy_ghost2_idle;
enemy_move = spr_enemy_ghost2_move;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular

//Stats
form_type = 0;
drop_amount = 15;
max_hp = 180;//+ (90 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.1;

//Animation and Status
targeted = false;	
invincible = false;
healthbar = true;
inv_dur_timer = 0;
shadow = false;
shadow_size = 1;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_alpha = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
local_frame = 0;
hit_by_attack = -1;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
passable = true;
}
//
//
//
//
//
//Rempho Ghost 2 Free
function scr_enemy_rempho_ghost2_free(){
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
		image_alpha = image_alpha - .05;
		if (image_alpha <= 0)
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
	}
	
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		lit = true;
		passable = false;
		scr_enemy_chase();
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		{
			lit = false;
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 36;
			timer2 = 120;
			entity_step = scr_enemy_rempho_ghost2_shadowShiftA;
			audio_sound_gain(snd_enemy_ghost_shift_up,global.volumeEffects,1);
			audio_play_sound(snd_enemy_ghost_shift_up,0,false);
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
//Rempho Ghost 2 Shadow Shift A
function scr_enemy_rempho_ghost2_shadowShiftA(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Hidden during state
	lit = false;
	healthbar = false;
	
	//Setup
	if (sprite_index != spr_enemy_ghost2_shadowShiftA)
	{
		//Start Animation From Beginning
		image_alpha = 1;
		sprite_index = spr_enemy_ghost2_shadowShiftA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	
	//Chase Player
	if (timer1 <= 0)
	{
		passable = true;
		shadow = false;
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_entity);
		path_start(path, enemy_spd * 2, 0, 0);
		walk_snd_delay = walk_snd_delay - 1;
		if (timer2 <= 0)
		{
			walk_snd_delay = 15;
			path_end();
		}
	}
	else 
	{
		shadow = 1;
		path_end();
	}
	
	//Animation
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		lit = true;
		shadow = 1;
		healthbar = true;
		path_end();
		timer2 = 42;
		entity_step = scr_enemy_rempho_ghost2_shadowShiftB;
		animation_end = false;
		audio_sound_gain(snd_enemy_ghost_shift_down,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ghost_shift_down,0,false);
	}
	
	
}
else path_end();
}
//
//
//
//
//
//Rempho Ghost 2 Shadow Shift B
function scr_enemy_rempho_ghost2_shadowShiftB(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_ghost2_shadowShiftB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghost2_shadowShiftB;
		local_frame = 0;
		image_index = 0;
	}
	
	
	//Return from Hiding
	if (timer2 <= 0)
	{	
		passable = false;
		timer2 = 84;
		audio_sound_gain(snd_enemy_ghost_soulSkull,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ghost_soulSkull,0,false);
	}
	
	//Animation	
	scr_enemy_animation_one();
	
	//End
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		entity_step = scr_enemy_rempho_ghost2_free;
		if (attack_counter < 3) timer1 = 0;
		else
		{
			timer1 = 300;
			attack_counter = 0;
		}
		audio_sound_gain(snd_enemy_ghost_soulFlare,global.volumeEffects,1);
		audio_play_sound(snd_enemy_ghost_soulFlare,0,false);
		with (instance_create_layer(x+16,y+6,"Instances",obj_enemy_projectile))
		{
			scr_projectile_soulFlare_create();
			direction = 315;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}
		with (instance_create_layer(x+16,y-21,"Instances",obj_enemy_projectile))
		{
			scr_projectile_soulFlare_create();
			direction = 45;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}
		with (instance_create_layer(x-16,y-21,"Instances",obj_enemy_projectile))
		{
			scr_projectile_soulFlare_create();
			direction = 135;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}
		with (instance_create_layer(x-16,y+6,"Instances",obj_enemy_projectile))
		{
			scr_projectile_soulFlare_create();
			direction = 225;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
		}

	}
}
}
//
//
//
//
//
//Drop Script same as other Rempho Ghost







