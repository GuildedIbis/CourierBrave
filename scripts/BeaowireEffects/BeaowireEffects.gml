//Beaowire Effects
//
//
//
//
//
//Effect Beaowire Escort Create
function EffectBeaowireEscortCreate(){
_destX = 0;
_destY = 0;
dir_switch = 1;
break_object = obj_break;
escort_sprite = spr_escort_beaowire;
escort_step = EffectBeaowireEscortFree;
sprite_index = escort_sprite;
escort_end = false;
escort_spd = .4;
escort_rad = 32;
escort_timer = 300;
atk_timer = 20;
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
function EffectBeaowireEscortFree(){
if (obj_game.gamePaused = false)
{
	if (escort_end = false)
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0)atk_timer = atk_timer - 1;
		if (escort_timer <= 0)
		{
			escort_timer = 45;
			escort_step = EffectBeaowireEscortCharge;
			audio_sound_gain(snd_escort_beaowire_charging,global.volumeEffects,1);
			audio_play_sound(snd_escort_beaowire_charging,0,false);
			sprite_index = spr_escort_beaowire_attackCharge;
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
//Effect Beaowire Escort 
function EffectBeaowireEscortCharge(){
if (obj_game.gamePaused = false)
{
	if (escort_end = false)
	{
		if (escort_timer > 0) escort_timer = escort_timer - 1;
		if (atk_timer > 0)atk_timer = atk_timer - 1;
		if (escort_timer <= 0)
		{
			escort_timer = 11;
			escort_step = EffectBeaowireEscortAttackBurst;
			sprite_index = spr_escort_beaowire_attack;
			image_index = 0;
		}
	}
	else 
	{
		escort_step = EffectBeaowireEscortFree;
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
function EffectBeaowireEscortAttackBurst(){
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
				home_state = EscortBeaowireBurstFree;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_escort_beaowire_burst;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 4;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 30;
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = EntityHitDestroy;
				direction = point_direction(x,y,obj_player.x,obj_player.y);
				image_angle = direction;
				speed = enemy_spd;
			}
		}
		if (escort_timer <= 0)
		{
			escort_timer = 300;
			escort_step = EffectBeaowireEscortFree;
			sprite_index = spr_escort_beaowire;
			image_index = 0;
		}
	}
	else
	{
		escort_step = EffectBeaowireEscortFree;
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
function EscortBeaowireBurstFree(){
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
function EffectBeaowireEscortEndCreate(){
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
function EffectBeaowire11EscortEnd(){
frag = false
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.beaowire_dungeon[10] < 2)
{
	sprite_index = spr_escort_beaowireEnd_idle;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,376,198,2))
		{
			sprite_index = spr_escort_beaowireEnd;
			image_speed = 1;
			obj_inventory.beaowire_dungeon[10] = 2;
			obj_inventory.beaowire_dungeon[12] = obj_inventory.beaowire_dungeon[12] + 1;
		}
		else 
		{
			sprite_index = spr_escort_beaowireEnd_idle;
			image_speed = 1;
			obj_inventory.beaowire_dungeon[10] = 1;
		}
	}
}
if (obj_inventory.beaowire_dungeon[10] >= 2)
{
	sprite_index = spr_escort_beaowireEnd;
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 376;
			y = 198;
		}
	}
}

}
//
//
//
//
//
//Effect Beaowire Escort End
function EffectBeaowire15EscortEnd(){
frag = false
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.beaowire_dungeon[14] < 2)
{
	sprite_index = spr_escort_beaowireEnd_idle;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,187,75,2))
		{
			sprite_index = spr_escort_beaowireEnd;
			image_speed = 1;
			obj_inventory.beaowire_dungeon[14] = 2;
			obj_inventory.beaowire_dungeon[12] = obj_inventory.beaowire_dungeon[12] + 1;
		}
		else 
		{
			sprite_index = spr_escort_beaowireEnd_idle;
			image_speed = 1;
			obj_inventory.beaowire_dungeon[14] = 1;
		}
	}
}
if (obj_inventory.beaowire_dungeon[14] >= 2)
{
	sprite_index = spr_escort_beaowireEnd;
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 187;
			y = 75;
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
function EffectBeaowireDoorCreate(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
if (obj_inventory.beaowire_dungeon[12] < 2) image_index = 0;
else image_index = 1;

}
//
//
//
//
//
//Effect Regaliare Quest Door Create
function EffectBeaowireDoor2Create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
image_index = 1;

}
//
//
//
//
//
//Effect Regaliare Quest Door Create
function EffectBeaowireDoorSpikeCreate(){
frag = false
image_speed = 0;
image_xscale = 1;
image_yscale = 1;
if (obj_inventory.beaowire_dungeon[12] < 2)
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
//Effect Fortress Mausoleum
function EffectFortressMausoleumCreate(){
image_speed = 0;
sprite_index = spr_fortress_mausoleum;
//Create Collision
with (instance_create_layer(x-24,y-56,"Wall",obj_wall))
{
	image_xscale = 6;
	image_yscale = 8;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-24,y-56,"Break",break_object))
	{
		image_xscale = 6;
		image_yscale = 7;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = true;
sx1 = x - 20;
sy1 = y - 56;
sx2 = x + 28;
sy2 = y - 56;
sx3 = x + 24;
sy3 = y + 8;
sx4 = x - 24;
sy4 = y + 8;


//event_inherited();
}
//
//
//
//
//
//Effect Fortress Mausoleum
function EffectFortressMausoleum(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_fortress_mausoleum;
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
//Effect Lekno Lake Path Rat Tent Create
function EffectTorchBeaowireCreate(){
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
function EffectTorchBeaowire(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_torchWall_beaowire;

}