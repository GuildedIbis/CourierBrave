//Effects for Habraf Lake Lair

//
//
//
//
//
//Effect Statue Lily Create [Lake Path 5]
function scr_effect_habrafLake_statueLily_create(){
image_speed = 0;
sprite_index = spr_statue_lily;

//Create Collision
with (instance_create_layer(x-16,y-8,"Wall",obj_wall))
{
	image_xscale = 4;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-16,y-8,"Break",break_object))
	{
		image_xscale = 4;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = true;
sx1 = x - 5;
sy1 = y - 16;
sx2 = x + 32;
sy2 = y - 16;
sx3 = x + 16;
sy3 = y + 7;
sx4 = x - 15;
sy4 = y + 7;


//event_inherited();
}
//
//
//
//
//
//Effect Statue Moth
function scr_effect_habrafLake_statueLily(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_statue_lily;
if (place_meeting(x,y,obj_player))
{
	if (depth < obj_player.depth)
	{
		if (image_alpha > .5) image_alpha = image_alpha - .05
	}
	else
	{
		if (image_alpha < 1) image_alpha = image_alpha + .05;
	}
}
else 
{
	if (image_alpha < 1) image_alpha = image_alpha + .05;
}
depth = -y;
}
//
//
//
//
//
//Effect Habraf Lake Mothwing Door Create
function scr_effect_door_habrafLake_mothwing_create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
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
//
//Effect Habraf Lake Mothwing Door 
function scr_effect_door_habrafLake_mothwing(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habrafLake_map_ary[10][3] < 1)
{
	sprite_index = spr_door_habrafLake_mothwing;
}
if (obj_inventory.habrafLake_map_ary[10][3] >= 1)
{
	sprite_index = spr_door_habrafLake_mothwing_open;
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
//Effect Habraf Lake Stone Door Create
function scr_effect_door_habrafLake_stone_create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
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
//Effect Habraf Lake Stone Door 
function scr_effect_door_habrafLake_stone(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.quest_grid[# 10, 1] < 2)
{
	sprite_index = spr_door_habrafLake_stone;
}
if (obj_inventory.quest_grid[# 10, 1] >= 2)
{
	sprite_index = spr_door_habrafLake_stone_open;
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
//Effect Habraf Lake Red Crystal Door Create
function scr_effect_door_habrafLake_redCrystal_create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
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
//Effect Habraf Lake Red Crystal Door 
function scr_effect_door_habrafLake_redCrystal(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habrafLake_map_ary[14][3] < 10)
{
	sprite_index = spr_door_habrafLake_redCrystal;
	image_index = obj_inventory.habrafLake_map_ary[14][3];
}
if (obj_inventory.habrafLake_map_ary[14][3] >= 10)
{
	sprite_index = spr_door_habrafLake_redCrystal_open;
	obj_inventory.quest_grid[# 10, 0] = true;
	obj_inventory.quest_grid[# 10, 1] = 1;
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
//Effect Habraf Escort Create
function scr_effect_habrafLake_escort_create(){
destX = 0;
destY = 0;
endX = 64;
endY = 280;
dir_switch = 1;
escort_sprite = spr_escort_habraf_crystal;
escort_step = scr_effect_habrafLake_escort;
sprite_index = escort_sprite;
escort_end = false;
escort_spd = .75;
escort_rad = 64;
escort_timer = 0;
atk_timer = 0;
proj_dir = 0;
break_object = obj_break;
path = -1;
shadow_sprite = -1;
collision = true;
shadow = false;
lit = true;
light_size = 24;
if (obj_inventory.quest_grid[# 10, 1] >= 2)
{
	escort_end = true;
	x = endX;
	y = endY;
}
}
//
//
//
//
//
//Effect Habraf Escort Step
function scr_effect_habrafLake_escort(){
if (obj_game.gamePaused = false)
{
	if (obj_inventory.quest_grid[# 10, 1] = 1)
	{
		destX = obj_player.x;
		destY = obj_player.y;
		endX = 64;
		endY = 280;
		image_speed = 1;
		if (escort_end = false)
		{
			if (point_in_circle(obj_player.x, obj_player.y,x,y,escort_rad)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
			{
				//var _xDest = x + (lengthdir_x(1,point_direction(x,y,obj_player.x,obj_player.y)))
				//var _yDest = y + (lengthdir_y(1,point_direction(x,y,obj_player.x,obj_player.y)))
				if (point_in_circle(obj_player.x, obj_player.y,x,y,10))
				{
					speed = 0;
				}
				else
				{
					direction = point_direction(x,y,destX,destY);
					speed = escort_spd;
				}
			}
			else
			{
				speed = 0;
			}
		}
	
		if (point_in_circle(endX,endY,x,y,4)) and (escort_end = false)
		{
			obj_inventory.quest_grid[# 10, 1] = 2;
			escort_end = true;
			x = endX;
			y = endY;
			speed = 0;
		}
	}
	if (obj_inventory.quest_grid[# 10, 1] = 0)
	{
		lit = false;
		sprite_index = spr_escort_habraf_crystal_sleeping;
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
//Effect Habraf Escort 
function scr_effect_habrafLake_escort_charge(){
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
function scr_effect_habrafLake_escort_attackBurst(){
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
function srr_projectile_escort_attackBurst(){
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