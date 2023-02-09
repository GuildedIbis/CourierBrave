//Rat Arrow
//
//
//
//
//
//Rat Arrow Create
function RatArrowCreate(){
home_state = RatArrowFree;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_rat_arrow;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 4.0
local_frame = 0;
hit_by_attack = -1;
damage = 40;
}
//
//
//
//
//
//Rat Arrow Free
function RatArrowFree(){
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
			audio_sound_gain(snd_player_hit,global.volumeEffects,1);
			audio_play_sound(snd_player_hit,0,false);
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






