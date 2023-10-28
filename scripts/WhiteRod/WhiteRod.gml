//White Rod
//
//
//
//
//
//White Rod Create
function scr_projectile_whiteRod_create(){
home_state = scr_projectile_whiteRod_free;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
inv_dur_timer = 0;
lit = true;
light_size = 16;
enemy_move = spr_enemy_whiteRod;
aggro_drop = 300;
healthbar = false;
bullet = true;
damage = 25 + (6 * enemy_lvl)
enemy_spd = 2.5;
local_frame = 0;
hit_by_attack = -1;
damage = 25;
}
//
//
//
//
//
//White Rod Free
function scr_projectile_whiteRod_free(){
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






