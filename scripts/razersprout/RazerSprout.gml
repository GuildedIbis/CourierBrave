//Rat Arrow
//
//
//
//
//
//Rat Arrow Create
function RazerSproutCreate(){
home_state = RazerSproutFree;
entity_step = home_state;
entity_drop = Idle;
invincible = false
healthbar = false;
bullet = true;
inv_dur_timer = 0;
enemy_move = spr_enemy_razerSprout;
aggro_drop = 300;
timer1 = 60;
enemy_spd = 2.0
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
function RazerSproutFree(){
if (obj_game.gamePaused = false)
{
if (timer1 > 0) timer1 = timer1 -1;
sprite_index = enemy_move;
speed = enemy_spd;
if (timer1 <= 0)
{
	timer1 = 60;
	direction = irandom_range(0,359);
}
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






