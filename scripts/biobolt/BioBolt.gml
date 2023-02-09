//Belurn Knight Void Cast
//
//
//
//
//
//Belurne Knight Void Cast Create
function BioBoltCreate(_damage){
home_state = BioBoltFree;
entity_step = home_state;
invincible = false;
inv_dur_timer = 0;
entity_drop = Idle;
follow_timer = 30;
enemy_move = spr_enemy_bioBolt;
aggro_drop = 300;

enemy_spd = 2.0;
local_frame = 0;
hit_by_attack = -1;
damage = _damage;
}
//
//
//
//
//
//Bio Bolt Free
function BioBoltFree(){
if (obj_game.gamePaused = false)
{

if (follow_timer > 0)
{
	follow_timer = follow_timer - 1;
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	image_angle = direction;
}
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
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
if (place_meeting(x,y,break_object)) instance_destroy();
}
}






