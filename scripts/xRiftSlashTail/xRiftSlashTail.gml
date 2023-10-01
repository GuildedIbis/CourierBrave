//Zerwerk Rift Slash
//
//
//
//
//Rift Slash Tail Create
function xscr_projectile_riftSlash_tail_create(){
home_state = scr_projectile_riftSlash_tail_free;
entity_step = home_state;
entity_drop = Idle;
enemy_idle = spr_enemy_riftSlash;
invincible = false;
healthbar = false;
bullet = true;
inv_dur_timer = 0;
shadow = 0;
lit = true;
light_size = 32;
max_hp = 140;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 12;
timer2 = 12;
}
//
//
//
//
//
//Rift Slash Tail Free
function xscr_projectile_riftSlash_tail_free(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) 
	{
		timer1 = timer1 - 1;
		x = obj_player.x;
		y = obj_player.y;
	}
	if (timer1 <= 0)
	{
		speed = 0;
	}
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer2 <= 0)
	{
		audio_sound_gain(snd_zerwerk_slash,global.volumeEffects,1);
		audio_play_sound(snd_zerwerk_slash,0,false);
		timer2 = 60;
	}
	if (sprite_index != spr_enemy_riftSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_riftSlash;
		sprite_set_speed(sprite_index,12,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	//Cacluate Attack
	damage = 60;
	EnemyAttackCalculate(spr_enemy_hitbox_riftSlash)

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		instance_destroy();
	}
}

}









