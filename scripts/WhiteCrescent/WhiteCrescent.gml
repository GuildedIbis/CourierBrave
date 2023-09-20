//White Crescent - Ofa Moth
//
//
//
//
//
//White Crescent Create
function scr_projectile_whiteCrescent_create(){
home_state = scr_projectile_whiteCrescent_free;
entity_step = home_state;
entity_drop = Idle;
invincible = false;
lit = true;
light_size = 16;
bullet = true;
healthbar = false;
boss = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_whiteCrescent;
aggro_drop = 300;
timer1 = 150;
enemy_spd = 1.2
local_frame = 0;
hit_by_attack = -1;
damage = 35;
hp = 60;
max_hp = 60;
}
//
//
//
//
//
//White Crescent Free
function scr_projectile_whiteCrescent_free(){
if (obj_game.gamePaused = false)
{
	timer1 = timer1 - 1;
	//if (aggro_drop > 0)
	//{
	//	script_execute(EnemyChase);
	//	aggro_drop = aggro_drop - 1;
	//}
	//else 
	//{
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	//}
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
	if (timer1 <= 0) instance_destroy();
}
else
{
	speed = 0;
}
}






