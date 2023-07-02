//Rat Arrow
//
//
//
//
//
//Vice Bubble Create
function ViceBubbleCreate(){
invincible = false;
inv_dur_timer = 0;
home_state = ViceBubbleFree;
entity_step = home_state;
entity_drop = Idle;
healthbar = false;
bullet = true;
enemy_move = spr_enemy_trapLily_viceBubble;
aggro_drop = 300;

enemy_spd = 3.0
local_frame = 0;
hit_by_attack = -1;
}
//
//
//
//
//
//Vice Bubble Free
function ViceBubbleFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_viceBubble_hit,global.volumeEffects,1);
	audio_play_sound(snd_viceBubble_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			watervice_dur_timer = 125;
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
	audio_sound_gain(snd_viceBubble_hit,global.volumeEffects,1);
	audio_play_sound(snd_viceBubble_hit,0,false);
	instance_destroy();
}
}
else
{
	speed = 0;
}
}






