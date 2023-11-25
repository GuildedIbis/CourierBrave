//Razor Sprout (Mother Lily)
//
//
//
//
//
//Razor Sprout Create
function scr_projectile_razorSprout_create(){
//Scripts
home_state = scr_projectile_razorSprout;
entity_step = scr_projectile_razorSprout;
entity_drop = Idle;

//Assets
enemy_move = spr_enemy_razerSprout;

//Stats
enemy_spd = 1.5;
damage = 40 + (7 * enemy_lvl);

//Animation and Status
invincible = false
healthbar = false;
bullet = true;
inv_dur_timer = 0;
aggro_drop = 300;
timer1 = 60;
local_frame = 0;
hit_by_attack = -1;
}
//
//
//
//
//
//Razor Sprout (Mother Lily) Free
function scr_projectile_razorSprout(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;

	//Timers
	if (timer1 > 0) timer1 = timer1 -1;

	//Change Directions
	if (timer1 <= 0)
	{
		timer1 = 60;
		direction = irandom_range(0,359);
	}
	
	//Collision
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_projectile_hit,global.volumeEffects,1);
		audio_play_sound(snd_projectile_hit,0,false);
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






