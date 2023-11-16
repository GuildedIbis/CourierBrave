//Beaowire Effects
//
//
//
//
//
//Effect Beaowire Escort Create
function scr_effect_beaowire_escort_create(){
_destX = 0;
_destY = 0;
dir_switch = 1;
break_object = obj_break;
escort_sprite = spr_escort_beaowire;
escort_step = scr_effect_beaowire_escort_free;
sprite_index = escort_sprite;
escort_end = false;
escort_spd = .6;
escort_rad = 32;
escort_timer = 300;
atk_timer = 20;
proj_dir = 0;
path = -1;
shadow_sprite = -1;
shadow = false;
}
//
//
//
//
//
//Effect Beaowire Escort 
function scr_effect_beaowire_escort_free(){
if (obj_game.gamePaused = false)
{
	image_speed = 1;
	if (escort_end = false)
	{
		if (point_in_circle(obj_player.x, obj_player.y,x,y,escort_rad)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			//var _xDest = x + (lengthdir_x(1,point_direction(x,y,obj_player.x,obj_player.y)))
			//var _yDest = y + (lengthdir_y(1,point_direction(x,y,obj_player.x,obj_player.y)))
			direction = point_direction(x,y,_destX,_destY);
			speed = escort_spd;
		
		}
		else
		{
			speed = 0;

		}
	}
	if (escort_end = false) 
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0)atk_timer = atk_timer - 1;
		if (escort_timer <= 0) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			escort_timer = 45;
			escort_step = scr_effect_beaowire_escort_charge;
			audio_sound_gain(snd_escort_beaowire_charging,global.volumeEffects,1);
			audio_play_sound(snd_escort_beaowire_charging,0,false);
			sprite_index = spr_escort_beaowire_attackCharge;
			image_index = 0;
			speed = 0;
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
//Effect Beaowire Escort 
function scr_effect_beaowire_escort_charge(){
if (obj_game.gamePaused = false)
{
	if (escort_end = false)
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0)atk_timer = atk_timer - 1;
		if (escort_timer <= 0)
		{
			atk_timer = 0;
			escort_timer = 15;
			escort_step = scr_effect_beaowire_escort_attackBurst;
			sprite_index = spr_escort_beaowire_attack;
			image_index = 0;
		}
	}
	else 
	{
		escort_step = scr_effect_beaowire_escort_free;
		sprite_index = spr_escort_beaowire;
		image_index = 0;
	}
}
}
//
//
//
//
//
//Effect Beaowire Escort 
function scr_effect_beaowire_escort_attackBurst(){
if (obj_game.gamePaused = false)
{
	if (escort_end = false)
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0) atk_timer = atk_timer - 1;
		if (atk_timer <= 0)
		{
			atk_timer = 5;
			audio_sound_gain(snd_escort_beaowire_shoot,global.volumeEffects,1);
			audio_play_sound(snd_escort_beaowire_shoot,0,false);
			with (instance_create_layer(x,y-19,"Instances",obj_enemy_projectile))
			{
				home_state = scr_enemy_projectile_beowireEscort_burst;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_escort_beaowire_burst;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 2;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 30;
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				image_angle = direction;
				speed = enemy_spd;
			}
		}
		if (escort_timer <= 0)
		{
			escort_timer = 300;
			escort_step = scr_effect_beaowire_escort_free;
			sprite_index = spr_escort_beaowire;
			image_index = 0;
		}
	}
	else
	{
		escort_step = scr_effect_beaowire_escort_free;
		sprite_index = spr_escort_beaowire;
		image_index = 0;
	}
}
}
//
//
//
//
//
//Beaowire Escort Burst Projectile
function scr_enemy_projectile_beowireEscort_burst(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(snd_player_hit,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	//audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	//audio_play_sound(snd_arrow_hit,0,false);
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
//Effect Beaowire Escort End Create
function scr_effect_beaowire_escortEnd_create(){
frag = false
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_escort_beaowireEnd_idle;
with (instance_create_layer(x-8,y-16,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x-8,y-16,"Wall",obj_break))
{
	image_xscale = 2;
	image_yscale = 1;
	game_paused_image_speed = image_speed;
}
	
}
//
//
//
//
//
//Effect Beaowire Escort End
function scr_effect_beaowire_escortEnd_free(){
frag = false
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.beaowireFortress_map_ary[15][3] < 2)
{
	sprite_index = spr_escort_beaowireEnd_idle;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,512,268,2))
		{
			sprite_index = spr_escort_beaowireEnd;
			image_speed = 1;
			obj_inventory.beaowireFortress_map_ary[15][3] = 2;
		}
		else 
		{
			sprite_index = spr_escort_beaowireEnd_idle;
			image_speed = 1;
			obj_inventory.beaowireFortress_map_ary[15][3] = 1;
		}
	}
}
if (obj_inventory.beaowireFortress_map_ary[15][3] >= 2)
{
	sprite_index = spr_escort_beaowireEnd;
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			obj_inventory.quest_grid[# 15, 1] = 3;
			escort_end = true;
			x = 512;
			y = 268;
		}
	}
}

}

//
//
//
//
//
//Effect Habraf Lake Door Room 11
function scr_effect_door_beaowire_stone(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.beaowireFortress_map_ary[15][3] < 1)
{
	sprite_index = spr_door_beaowire_stone;

}
if (obj_inventory.beaowireFortress_map_ary[15][3] >= 1)
{
	sprite_index = spr_door_beaowire_stone_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	with (break_object)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
}

}
//
//
//
//
//
//Effect Habraf Lake Door Room 11
function scr_effect_door_beaowire_emeraldLock(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.quest_grid[# 15, 1] < 3)
{
	sprite_index = spr_door_beaowire_emeraldLock;

}
if (obj_inventory.quest_grid[# 15, 1] >= 3)
{
	sprite_index = spr_door_beaowire_emeraldLock_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	with (break_object)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
}

}
//
//
//
//
//
//Effect Regaliare Quest Door Create
function scr_effect_beaowire_door_spike(){
frag = false
image_speed = 0;
image_xscale = 1;
image_yscale = 1;
if (obj_inventory.beaowireFortress_map_ary[15][3] < 2)
{
	depth = -y;
	image_index = 0;
	with (instance_create_layer(x-16,y-16,"Wall",obj_wall))
	{
		image_xscale = 4;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-16,y-16,"Wall",obj_break))
	{
		image_xscale = 4;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
}
else
{
	image_index = 1;
	depth = obj_player.depth + 1;
}

}
//
//
//
//
//
//Effect Lekno Lake Path Rat Tent Create
function scr_effect_beaowire_light_torch_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_torchWall_beaowire;
}
	//
//
//
//
//
//Effect Statue Moth
function scr_effect_beaowire_light_torch(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_torchWall_beaowire;
}
}