//Belurn Knight Void Cast
//
//
//
//
//
//Belurne Knight Void Cast Create
function VoidCastCreate(_damage){
home_state = VoidCastFree;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_voidCast;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 1.8;
local_frame = 0;
hit_by_attack = -1;
damage = _damage;
}
//
//
//
//
//
//Belurne Knight Void Cast Free
function VoidCastFree(){
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
			with (other) instance_destroy();
		}
	}
	
}
if (place_meeting(x,y,break_object)) instance_destroy();
}
}






