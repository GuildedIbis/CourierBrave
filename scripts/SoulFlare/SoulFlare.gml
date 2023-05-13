//Soul Flare: Ghosts
//
//
//
//
//
//Soul Flare Create
function SoulFlareCreate(){
invincible = false;
inv_dur_timer = 0;
home_state = SoulFlareFree;
entity_step = home_state;
entity_drop = Idle;
lit = true;
light_size = 16;
enemy_move = spr_ghost_soulFlare;
sprite_index = spr_ghost_soulFlare;
aggro_drop = 300;

enemy_spd = 4.2;
local_frame = 0;
hit_by_attack = -1;
damage = 50;
}
//
//
//
//
//
//Soul Flare Free
function SoulFlareFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
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






