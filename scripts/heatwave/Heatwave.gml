//Endire Knight Projectiles
//
//
//
//
//
//Rat Arrow Create
function HeatwaveCreate(){
home_state = HeatwaveFree;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_heatwave;
healthbar = false;
bullet = true;
aggro_drop = 300;
timer1 = 0;
enemy_spd = 3.0
local_frame = 0;
hit_by_attack = -1;
damage = 40;
dir_wave = false;
}
//
//
//
//
//
//Rat Arrow Free
function HeatwaveFree(){
if (obj_game.gamePaused = false)
{
if (timer1 > 0)timer1 = timer1 -1;
sprite_index = enemy_move;
speed = enemy_spd;
if (timer1 <= 0)
{
	if (dir_wave = false) dir_wave = true;
	else dir_wave = false;
	timer1 = 30;
}
if (dir_wave = false) direction = direction - 2;
if (dir_wave = true) direction = direction + 2;
image_angle = direction
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
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
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
//Endire Knight Inimar Heatacer Create
function HeatacerCreate(){
home_state = HeatacerFree;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_heatacer;
healthbar = false;
bullet = true;
aggro_drop = 300;
timer1 = 30;
enemy_spd = 1.5
local_frame = 0;
hit_by_attack = -1;
damage = 30;
dir_wave = false;
}
//
//
//
//
//
//Rat Arrow Free
function HeatacerFree(){
if (obj_game.gamePaused = false)
{
if (timer1 > 0)timer1 = timer1 -1;
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_resourcePlant,global.volumeEffects,1);
	audio_play_sound(snd_resourcePlant,0,false);
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
	audio_sound_gain(snd_resourcePlant,global.volumeEffects,1);
	audio_play_sound(snd_resourcePlant,0,false);
	instance_destroy();
}
}
else
{
	speed = 0;
}
}



