//Tortoise Troll Projectiles
//
//
//
//
//
//Troll Tortoise Mound Create
function scr_projectile_trollTortoise_mound_create(){
home_state = scr_projectile_trollTortoise_mound_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;

timer1 = 180;
timer2 = 0;
path = -1;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_tortoiseTroll_mound;
enemy_idle = spr_enemy_tortoiseTroll_mound;
aggro_drop = 300;
healthbar = false;
enemy_spd = 1.25;
local_frame = 0;
hit_by_attack = -1;
damage = 45;
fragment_count = 2;
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
//Troll Tortoise Mound Step
function scr_projectile_trollTortoise_mound_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;

	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;

	//Follow Player
	if (path_exists(path)) path_delete(path);
	path = path_add();
	mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_wall);
	path_start(path, enemy_spd, 0, 0);

	//Sound
	if (timer2 <= 0)
	{
		audio_sound_gain(snd_enemy_tortoiseTroll_mound_move,global.volumeEffects,1);
		audio_play_sound(snd_enemy_tortoiseTroll_mound_move,0,false);
		timer2 = 60;
	}
	//Collision		
	if (point_in_circle(obj_player.x,obj_player.y,x,y,8)) or (timer1 <= 0)
	{
		speed = 0;
		path_end()
		audio_sound_gain(snd_enemy_tortoiseTroll_blossom,global.volumeEffects,1);
		audio_play_sound(snd_enemy_tortoiseTroll_blossom,0,false);
		entity_step = scr_projectile_trollTortoise_blossom;
		timer1 = 55;
		timer2 = 60;
		timer3 = 0;
	}
}
else
{
	speed = 0;
	path_end();
}
}
//
//
//
//
//
//Troll Tortoise Blossom
function scr_projectile_trollTortoise_blossom(){
if (obj_game.gamePaused = false)
{
	//Resume
	lit = true;
	sprite_index = spr_enemy_tortoiseTroll_blossom;
	speed = 0;

	//Timer
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;

	//Create Projectiles
	if (timer1 <= 0)
	{
		audio_sound_gain(snd_enemy_tortoiseTroll_blossomShoot,global.volumeEffects,1);
		audio_play_sound(snd_enemy_tortoiseTroll_blossomShoot,0,false);
		timer1 = 120;
		for (var i = 0; i < 3; i = i + 1)
		{	
			with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
			{
				scr_projectile_trollTortoise_blossomOrb_create();
				direction = ((point_direction(x,y,obj_player.x,obj_player.y) - 10) + (10 * i));
				speed = enemy_spd;
				break_object = other.break_object;
			}
		}

	}

	//Self Destruct
	if (timer2 <= 0) instance_destroy();
}
}
//
//
//
//
//
//Troll Tortoise Blossom Orb Create
function scr_projectile_trollTortoise_blossomOrb_create(){
home_state = scr_projectile_trollTortoise_blossomOrb_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;

timer2 = 360;
lit = true;
light_size = 20;
exploded = false;
timer1 = 19;
path = -1;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_tortoiseTroll_blossomOrb;
enemy_idle = spr_enemy_tortoiseTroll_blossomOrb;
aggro_drop = 300;
healthbar = false;
enemy_spd = 2.25;
local_frame = 0;
hit_by_attack = -1;
damage = 35;
fragment_count = 2;
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
//Troll Tortoise Blossom Orb Step
function scr_projectile_trollTortoise_blossomOrb_step(){
if (obj_game.gamePaused = false)
{
	//Explode on player
	timer2 = timer2 - 1;
	if (timer2 <= 0) instance_destroy();
	if (point_in_circle(obj_player.x,obj_player.y,x,y,6)) and (exploded = false)
	{
		audio_sound_gain(snd_enemy_blossomOrb_explode,global.volumeEffects,1);
		audio_play_sound(snd_enemy_blossomOrb_explode,0,false);
		exploded = true;
		speed = 0;
	}
	if (exploded = true)
	{
		timer1 = timer1 - 1;
		if (timer1 <= 0) instance_destroy();
		sprite_index = spr_enemy_tortoiseTroll_blossomOrb_explode;
	}
	else
	{
		sprite_index = spr_enemy_tortoiseTroll_blossomOrb;
		speed = enemy_spd;
	}
	
	//Collision With Player
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);

	
	//Collision with solid objects
	if (place_meeting(x,y,break_object)) and (exploded = false)
	{
		audio_sound_gain(snd_enemy_blossomOrb_explode,global.volumeEffects,1);
		audio_play_sound(snd_enemy_blossomOrb_explode,0,false);
		sprite_index = spr_enemy_tortoiseTroll_blossomOrb_explode;
		exploded = true;
		speed = 0;
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
//Troll Tortoise Missile
function scr_projectile_trollTortoise_missile_create(){
home_state = scr_projectile_trollTortoise_missile_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;

timer1 = 90;
timer2 = 30;
path = -1;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_trollTortoise_missile;
enemy_idle = spr_trollTortoise_missile;
aggro_drop = 300;
healthbar = false;
enemy_spd = 2.0;
local_frame = 0;
hit_by_attack = -1;
damage = 35;//+ (8 * enemy_lvl);
fragment_count = 2;
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
//Troll Tortoise Missile
function scr_projectile_trollTortoise_missile_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	lit = true;
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;

	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
	if (place_meeting(x,y,break_object)) 
	{
		instance_destroy();
	}
	
	//Self Destruct
	if (timer1 <= 0) instance_destroy();
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
//Troll Tortoise Vine Shot
function scr_projectile_trollTortoise_vineShot_create(){
home_state = scr_projectile_trollTortoise_vineShot_step;
hit_script = scr_entity_hit_destroy;

timer1 = 180;
path = -1;
entity_step = home_state;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_tortoiseTroll_vineShot;
enemy_idle = spr_enemy_tortoiseTroll_vineShot;
aggro_drop = 300;
healthbar = false;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
damage = 30;
fragment_count = 2;
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
//Troll Tortoise Vine Shot
function scr_projectile_trollTortoise_vineShot_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	image_speed = 0;
	speed = enemy_spd;
	
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
//Tortoise Troll Spiked Vine Create
function scr_projectile_trollTortoise_spikedVine_create(){
home_state = scr_projectile_trollTortoise_spikedVine_free;
entity_step = scr_projectile_trollTortoise_spikedVine_free;
entity_drop = Idle;
special_draw = scr_projectile_trollTortoise_spikedVine_rope;
hit_script = scr_entity_hit_destroy;

//Assets
enemy_move = spr_tortoiseTroll_spikedVine;
enemy_idle = spr_tortoiseTroll_spikedVine;

//Stats
enemy_spd = 2.0;
damage = 65;

//Snimation and Status
invincible = true;
contacted = false;
inv_dur_timer = 5;
aggro_drop = 300;
healthbar = false;
bullet = true;
timer1 = 45;
local_frame = 0;
hit_by_attack = -1;
returning = false;
enemy_spd = 3.5;
fragment_count = 3;
fragment = obj_fragPlant;
				

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Tortoise Troll Spiked Vine Free
function scr_projectile_trollTortoise_spikedVine_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;

	//Timer
	timer1 = timer1 - 1;

	//Doesn't Break on Player
	invincible = true;
	inv_dur_timer = 5;

	//Collision
	if (contacted = true)
	{
		with (obj_player)
		{
			knockback_dur = 1;
			knockback_dir = -1;
			x = other.x;
			y = other.y;
		}
	}
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_projectile_hit,global.volumeEffects,1);
		audio_play_sound(snd_projectile_hit,0,false);
		if (contacted = false)
		{
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
		}
		contacted = true;
		direction = point_direction(x,y,parent.x,parent.y);
		returning = true;
	}
	if (place_meeting(x,y,break_object)) 
	{
		direction = point_direction(x,y,parent.x,parent.y);
		returning = true;
	}
	if (timer1 <= 0)
	{
		direction = point_direction(x,y,parent.x,parent.y);
		returning = true;
	}
	if (point_in_circle(parent.x,parent.y,x,y,16))  
	{
		if (returning = true)
		{
			with (parent) 
			{
				sprite_index = enemy_idle;
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				entity_step = scr_enemy_trollTortoise_free2;
			}
			instance_destroy();
		}
		if (contacted = true)
		{
			with (parent) 
			{
				if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
				{
					entity_step = scr_enemy_trollTortoise_backslam2;
				}
				else
				{
					sprite_index = enemy_idle;
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					entity_step = scr_enemy_trollTortoise_free2;
				}
			}
			instance_destroy();
		}
	
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
//Tortoise Troll Spiked Vine Rope
function scr_projectile_trollTortoise_spikedVine_rope(){
draw_sprite_ext(spr_tortoiseTroll_vineRope,0,x,y,round(point_distance(x,y,parent.x,parent.y)/7),1,image_angle,c_white,1.0);
}



