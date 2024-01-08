//Mother Lily Scripts
//
//
//
//
//
//Mother Lily Create
function scr_enemy_mother_lily_create(){
home_state = scr_enemy_mother_lily_free;
entity_step = home_state;
entity_drop = scr_enemy_mother_lily_drop;

//Assets
enemy_idle = spr_enemy_motherLily;
enemy_move = spr_enemy_motherLily_move;
damaged_snd = snd_enemy_motherLily_damaged;

//Stats
form_type = 1;
drop_amount = 20;
max_hp = 1450;//+ (725 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.0;

//Animation and Status
name = "Mother Lily"
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
shadow = false;
shadow_size = 3;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
boss = true;
local_frame = 0;
hit_by_attack = -1;
timer1 = 30;
timer2 = 30;
timer3 = 30;
timer4 = 30;
timerC = 30;
walk_snd_delay = 0;
path = -1;

//Self Destruct
if (obj_inventory.quest_grid[# 12, 3] = true)
{
	instance_destroy();
}
}
//
//
//
//
//
//Mother Lily Free
function scr_enemy_mother_lily_free(){
if (obj_game.gamePaused = false)
{	
	//Timers
	scr_enemy_timer_countdown();
	
	//While Aggro if off
	if (targeted = false)
	{
		lit = false;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
			global.bossCounter = global.bossCounter + 1;
		}
	}
	
	//When Aggro is switched off
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
		walk_snd_delay = walk_snd_delay - 1;
		
		//Short Range Attacks - Slash
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) and (timer1 <= 0)
		{
			walk_snd_delay = 45;
			path_end();
			sprite_index = enemy_idle;
			audio_sound_gain(snd_enemy_motherLily_leafSlash,global.volumeEffects,1);
			audio_play_sound(snd_enemy_motherLily_leafSlash,0,false);
			timer1 = 23;
			entity_step = scr_enemy_mother_lily_leafSlash;
		}

		//Mid Range Attacks - Razer Sprouts and Scissor Leaf
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer2 <= 0)
		{
			var _atkChoose = irandom_range(0,1);
			switch(_atkChoose)
			{
				case 0:
					walk_snd_delay = 15;
					path_end();
					sprite_index = enemy_idle;
					timer2 = 23;
					entity_step = scr_enemy_mother_lily_razerSprout;
					break;
					
				case 1:
					walk_snd_delay = 15;
					path_end();
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					sprite_index = enemy_idle;
					timer2 = 30;
					hor_spd = 0;
					ver_spd = 0;
					entity_step = scr_enemy_mother_lily_scissorLeaf;
					with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
					{
						scr_projectile_scissorLeaf_create();
						image_angle = other.direction;	
						break_object = other.break_object;
					}
				break;
			}
		}
		
		//Long Range Attacks - Void Bomb
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer3 <= 0)
		{
			walk_snd_delay = 15;
			audio_sound_gain(snd_enemy_motherLily_viceBomb,global.volumeEffects,1);
			audio_play_sound(snd_enemy_motherLily_viceBomb,0,false);
			path_end();
			sprite_index = enemy_idle;
			timer1 = 23;
			entity_step = scr_enemy_mother_lily_viceBomb;
		}
		
		//Drop Lily Pods
		if (timer4 <= 0)
		{
			timer4 = 600;
			with (instance_create_layer(x,y,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_lily_pod_create();
				timer1 = 30;
				timer2 = 30;
				timer3 = 180;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
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
//Mother Lily Right Slash 
function scr_enemy_mother_lily_leafSlash(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_motherLily_leafSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_leafSlash;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Cacluate Attack
	damage = 55;
	scr_enemy_attack_calculate(spr_enemy_motherLily_leafSlash_hitbox,self,-1,-1,-1,-1,-1,-1);

	//Animate
	scr_enemy_animation();
	
	//End
	if (animation_end)
	{
		timer1 = 90;
		timerC = 60;
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
//Mother Lily Scissor Leaf 
function scr_enemy_mother_lily_scissorLeaf(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_motherLily_move)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_move;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	
	//Collision
	var _collided = scr_enemy_collision();
	if (_collided = false)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(2.25,direction);
		ver_spd = lengthdir_y(2.25,direction);
	}
	if (_collided = true)
	{
		hor_spd = 0;
		ver_spd = 0;
	}


	//Animate
	scr_enemy_animation();
	
	//End
	if (timer2 <= 0)
	{
		timer2 = 120;
		timerC = 60;
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
//Scissor Leaf create
function scr_projectile_scissorLeaf_create(){
home_state = scr_projectile_scissorLeaf_step;
hit_script = scr_entity_hit_damage;
entity_step = home_state;

timer1 = 30;
timer2 = 10;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_motherLily_scissorLeaf;
aggro_drop = 300;
healthbar = false;
enemy_spd = 4.0;
local_frame = 0;
hit_by_attack = -1;
damage = 45;
parent = other;
fragment_count = 0;
fragment = obj_fragPlant;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Scissor Leaf Free
function scr_projectile_scissorLeaf_step(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	invincible = true;
	inv_dur_timer = 30;
	
	//Setup
	if (sprite_index != spr_motherLily_scissorLeaf)
	{
		//Start Animation From Beginning
		sprite_index = spr_motherLily_scissorLeaf;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}

	//Follow Parent (Mother Lily)
	x = parent.x;
	y = parent.y - 8;
	
	//Delayed Audio
	if (timer2 <= 0)
	{
		timer2 = 60;
		audio_sound_gain(snd_enemy_motherLily_leafSlash,global.volumeEffects,1);
		audio_play_sound(snd_enemy_motherLily_leafSlash,0,false);
	}
	
	//Collision
	scr_enemy_attack_calculate_projectile(spr_motherLily_scissorLeaf,self,-1,-1,-1,-1,-1,-1);
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (timer1 <= 0)
	{
		instance_destroy();
	}
}
}
//
//
//
//
//
//Mother Lily Razer Sprout
function scr_enemy_mother_lily_razerSprout(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_motherLily_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_cast;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		var _dir = irandom_range(0,359);
		audio_sound_gain(snd_enemy_motherLily_razerSprout,global.volumeEffects,1);
		audio_play_sound(snd_enemy_motherLily_razerSprout,0,false);
		for (var i = 0; i < 8; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				scr_projectile_razorSprout_create();
				break_object = other.break_object;
				speed = enemy_spd;
				direction = _dir + (45 * i)
				if (i > 3) image_xscale = -1;
				speed = enemy_spd;
			}
		}
		timer2 = 180;
		timerC = 60;
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
//Mother Lily Vice Bomb 
function scr_enemy_mother_lily_viceBomb(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_motherLily_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_cast;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		audio_play_sound(snd_enemy_lily_viceBubble,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			scr_projectile_viceBomb_create();
			break_object = other.break_object;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
		}
		timer3 = 300;
		entity_step = scr_enemy_mother_lily_exposed;
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
//Trap Lily Exposed
function scr_enemy_mother_lily_exposed(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();
	
	//Setup
	if (sprite_index != spr_enemy_motherLily_exposed)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_exposed;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Animate
	scr_enemy_animation_one();
	
	//End
	if (animation_end)
	{
		timerC = 60;
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
//Mother Lily Drop
function scr_enemy_mother_lily_drop(){
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

if (obj_inventory.quest_grid[# 12, 3] = false)
{
	obj_inventory.quest_grid[# 12, 0] = true;
	obj_inventory.quest_grid[# 12, 1] = obj_inventory.quest_grid[# 12, 2];
	obj_inventory.quest_grid[# 12, 3] = true;
}
}







