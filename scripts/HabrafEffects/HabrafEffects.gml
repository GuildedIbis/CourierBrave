//Effects for Habraf Lake Lair
//
//
//
//
//
//Effect Yakflower Door Create
function EffectHabrafLakeDoorCreate(){
	frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_door_habraf;
if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
{
	with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
	{
		image_xscale = 6;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-16,"Wall",break_object))
	{
		image_xscale = 6;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-16,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+8,y-16,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+8,y-16,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
}
	
}
//
//
//
//
//
//Effect Habraf Lake Door Room 14
function EffectHabrafLakeDoor14(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habrafLake_map_ary[15][3] < 2)
{
	sprite_index = spr_door_habraf;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,96,104,4))
		{
			sprite_index = spr_door_habraf_open;
			image_speed = 0;
			obj_inventory.habrafLake_map_ary[15][3] = 2;
		}
		else 
		{
			sprite_index = spr_door_habraf;
			image_speed = 0;
			obj_inventory.habrafLake_map_ary[15][3] = 1;
		}
	}
}
if (obj_inventory.habrafLake_map_ary[15][3] >= 2)
{
	sprite_index = spr_door_habraf_open;
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
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 96;
			y = 104;
			escort_end = true;
		}
	}
}

}
//
//
//
//
//Effect Habraf Escort Create
function EffectHabrafEscortCreate(){
_destX = 0;
_destY = 0;
dir_switch = 1;
escort_sprite = spr_escort_habraf_crystal;
escort_step = EffectHabrafEscortStep;
sprite_index = escort_sprite;
escort_end = false;
escort_spd = .5;
escort_rad = 48;
escort_timer = 0;
atk_timer = 0;
proj_dir = 0;
break_object = obj_break;
path = -1;
shadow_sprite = -1;
shadow = false;
}
//
//
//
//
//
//Effect Habraf Escort Step
function EffectHabrafEscortStep(){
if (obj_game.gamePaused = false)
{
	_destX = obj_player.x;
	_destY = obj_player.y;
	if (escort_end = false)
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0)atk_timer = atk_timer - 1;
		if (escort_timer <= 0)
		{
			escort_timer = 45;
			escort_step = EffectHabrafEscortCharge;
			audio_sound_gain(snd_escort_beaowire_charging,global.volumeEffects,1);
			audio_play_sound(snd_escort_beaowire_charging,0,false);
			sprite_index = spr_escort_habraf_crystalCharge;
			image_index = 0;
		}
		
	}
}
}
//
//
//
//
//
//Effect Habraf Escort 
function EffectHabrafEscortCharge(){
if (obj_game.gamePaused = false)
{
	if (escort_end = false)
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0)atk_timer = atk_timer - 1;
		if (escort_timer <= 0)
		{
			escort_timer = 14;
			atk_timer = 0;
			proj_dir = point_direction(x,y,obj_player.x,obj_player.y)-15;
			escort_step = EffectHabrafEscortAttackBurst;
			sprite_index = spr_escort_habraf_crystalAttack;
			image_index = 0;
		}
	}
	else 
	{
		escort_step = EffectHabrafEscortStep;
		sprite_index = spr_escort_habraf_crystal;
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
function EffectHabrafEscortAttackBurst(){
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
				home_state = EscortHabrafBurstFree;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_escort_habraf_burst;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 2.2;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 30;
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = EntityHitDestroy;
				direction = other.proj_dir;
				image_angle = direction;
				speed = enemy_spd;
			}
			proj_dir = proj_dir + 15;
		}
		if (escort_timer <= 0)
		{
			escort_timer = 300;
			escort_step = EffectHabrafEscortStep;
			sprite_index = spr_escort_habraf_crystal;
			image_index = 0;
		}
	}
	else
	{
		escort_step = EffectHabrafEscortStep;
		sprite_index = spr_escort_habraf_crystal;
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
function EscortHabrafBurstFree(){
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