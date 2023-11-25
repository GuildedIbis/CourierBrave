//Vice Bubble (Trap Lily and Mother Lily)
//
//
//
//
//
//Vice Bubble Create
function scr_projectile_viceBubble_create(){
//Scripts
home_state = scr_projectile_viceBubble_free;
entity_step = home_state;
entity_drop = Idle;

//Assets
enemy_move = spr_projectile_viceBubble;

//Stats
enemy_spd = 2.0;

//Animation and Status
invincible = false;
inv_dur_timer = 0;
healthbar = false;
bullet = true;
aggro_drop = 300;
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
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;

	//Collision
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
