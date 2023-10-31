//Vice Bubble
//
//
//
//
//
//Vice Bubble Create
function scr_projectile_viceBubble_create(){
invincible = false;
inv_dur_timer = 0;
home_state = scr_projectile_viceBubble_free;
entity_step = home_state;
entity_drop = Idle;
healthbar = false;
bullet = true;
enemy_move = spr_enemy_trapLily_viceBubble;
aggro_drop = 300;

enemy_spd = 2.5;
local_frame = 0;
hit_by_attack = -1;
}
//
//
//
//
//
//Vice Bubble Free
function scr_projectile_viceBubble_free(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_enemy_lily_viceBubble_hit,global.volumeEffects,1);
	audio_play_sound(snd_enemy_lily_viceBubble_hit,0,false);
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
	instance_destroy();
}
}
else
{
	speed = 0;
}
}
