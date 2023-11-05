//Tortoise Troll Projectiles
//
//
//
//
//
//Troll Tortoise Mound
function scr_projectile_trollTortoise_mound(){
if (obj_game.gamePaused = false)
{

//Set
sprite_index = enemy_move;
speed = enemy_spd;
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;

//Direction
if (path_exists(path)) path_delete(path);
path = path_add();
mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_wall);
path_start(path, enemy_spd, 0, 0);

if (timer2 <= 0)
{
	audio_sound_gain(snd_tortoiseTroll_mound_move,global.volumeEffects,1);
	audio_play_sound(snd_tortoiseTroll_mound_move,0,false);
	timer2 = 30;
}
//Collision		
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_tortoiseTroll_blossom,global.volumeEffects,1);
	audio_play_sound(snd_tortoiseTroll_blossom,0,false);
	entity_step = scr_projectile_trollTortoise_blossom;
	timer1 = 55;
	timer2 = 60;
	timer3 = 0;
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
//Troll Tortoise Blossom
function scr_projectile_trollTortoise_blossom(){
if (obj_game.gamePaused = false)
{

//Set
sprite_index = spr_enemy_tortoiseTroll_blossom;
speed = 0;
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;

if (timer1 <= 0)
{
	audio_sound_gain(snd_tortoiseTroll_blossomShoot,global.volumeEffects,1);
	audio_play_sound(snd_tortoiseTroll_blossomShoot,0,false);
	timer1 = 120;
	for (var i = 0; i < 3; i = i + 1)
	{	
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			direction = ((point_direction(x,y,obj_player.x,obj_player.y) - 10) + (10 * i));
			home_state = scr_projectile_trollTortoise_blossomOrb;
			exploded = false;
			timer1 = 19;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_tortoiseTroll_blossomOrb;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 3;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 70;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			speed = enemy_spd;
		}
	}

}

if (timer2 <= 0) instance_destroy();
}
}
//
//
//
//
//
//Troll Tortoise Blossom Orb
function scr_projectile_trollTortoise_blossomOrb(){
if (obj_game.gamePaused = false)
{
	//Explode on player
	if (point_in_circle(obj_player.x,obj_player.y,x,y,6)) and (exploded = false)
	{
		audio_sound_gain(snd_blossomOrb_explode,global.volumeEffects,1);
		audio_play_sound(snd_blossomOrb_explode,0,false);
		exploded = true;
		speed = 0;
	}
	
	//Sprite Update
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
	

	//Collision	with player (damage)	
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
				inv_dur_timer = 30;
				flash = .35;
				hp = hp - (other.damage - armor);
			}
		}
	}
	
	//Collision with solid objects
	if (place_meeting(x,y,break_object)) and (exploded = false)
	{
		audio_sound_gain(snd_blossomOrb_explode,global.volumeEffects,1);
		audio_play_sound(snd_blossomOrb_explode,0,false);
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
function scr_projectile_trollTortoise_missile(){
if (obj_game.gamePaused = false)
{

//Set
sprite_index = enemy_move;
speed = enemy_spd;
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
//var _playerDis = abs (direction - point_direction(x,y,obj_player.x,obj_player.y));


//Collision		
if (place_meeting(x,y,obj_player))
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
			inv_dur_timer = 30;
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	image_angle = direction;
}
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
function scr_projectile_trollTortoise_vineShot(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
image_speed = 0;
speed = enemy_spd;
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
//Tortoise Troll Spiked Vine Create
function scr_projectile_trollTortoise_spikedVine_create(){
home_state = scr_projectile_trollTortoise_spikedVine_free;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
contacted = false;
inv_dur_timer = 0;
enemy_move = spr_tortoiseTroll_spikedVine;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 2.5;
timer1 = 45;
local_frame = 0;
hit_by_attack = -1;
damage = 65 + (10 * enemy_lvl);
returning = false;
special_draw = scr_projectile_trollTortoise_spikedVine_rope;
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
timer1 = timer1 - 1;
sprite_index = enemy_move;
speed = enemy_spd;
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
if (point_in_circle(parent.x,parent.y,x,y,16))  //(point_in_circle(parent.x,parent.y,x,y,16))
{
	if (returning = true)
	{
		with (parent) 
		{
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



