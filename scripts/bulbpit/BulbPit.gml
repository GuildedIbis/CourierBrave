//Rat Arrow
//
//
//
//
//
//Rat Arrow Create
function BulbPitCreate(){
invincible = false;
inv_dur_timer = 0;
home_state = BulbPitFree;
entity_step = home_state;
entity_drop = Idle;

enemy_move = spr_enemy_folioBulb_pit;
aggro_drop = 300;

enemy_spd = 4.2
local_frame = 0;
hit_by_attack = -1;
damage = 15;
}
//
//
//
//
//
//Rat Arrow Free
function BulbPitFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			audio_sound_gain(snd_player_hit,global.volumeEffects,1);
			audio_play_sound(snd_player_hit,0,false);
			flash = .35;
			hp = hp - (other.damage - armor);
			with (other) instance_destroy();
		}
	}
	
}
if (place_meeting(x,y,break_object)) 
{
	//audio_play_sound(snd_arrow_hit,0,false);
	instance_destroy();
}
}
}






