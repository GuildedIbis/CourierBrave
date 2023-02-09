//Vice Bomb
//
//
//
//
//
//Vice Bomb Create
function ViceBombCreate(){
invincible = false;
inv_dur_timer = 0;
home_state = ViceBombFree;
entity_step = home_state;
entity_drop = Idle;
healthbar = false;
bullet = true;
enemy_move = spr_enemy_trapLily_viceBubble32;
aggro_drop = 300;

enemy_spd = 4.0
local_frame = 0;
hit_by_attack = -1;
damage = 65;
}
//
//
//
//
//
//Rat Arrow Free
function ViceBombFree(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_viceBubble_hit,global.volumeEffects,1);
	audio_play_sound(snd_viceBubble_hit,0,false);
	with (instance_create_layer(x,y,"Instances",obj_effect))
	{
		sprite_index = spr_enemy_motherLily_viceEffect;
		effect_script = EffectWaterVice;
		image_speed = 1;
		direction = irandom_range(0,359);
		image_angle = direction;
		spd = .75 + (.3) + random(0.1);
	}
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






