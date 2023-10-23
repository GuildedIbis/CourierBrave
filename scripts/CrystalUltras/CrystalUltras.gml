// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_projectile_ultraBlue(){
//Set
speed = projectile_speed;
destructable = false;
if (timer1 > 0) timer1 = timer1 - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	scr_player_attack_calculate_magic(projectile_sprite,obj_player,-1,-1,-1,-1,-1,-1,1);
	projectile_script = scr_projectile_ultraBlue_explode;
	timer1 = 27; 
}
if (place_meeting(x,y,break_object)) or (timer1 <= 0)
{
	projectile_script = scr_projectile_ultraBlue_explode;
	timer1 = 27;
}
}
//
//
//
//
//
//Enraged Worm Dash
function scr_projectile_ultraBlue_explode(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;

	if (sprite_index != spr_projectile_ultraBlue_explosion)
	{
		//Start Animation From Beginning
		sprite_index = spr_projectile_ultraBlue_explosion;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_enragedWorm_explode,global.volumeEffects,1);
		audio_play_sound(snd_enragedWorm_explode,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 100 + (50 * obj_player.receptivity);

	scr_player_attack_calculate_magic(spr_projectile_ultraBlue_explosion_hitbox,obj_player,-1,-1,-1,-1,-1,-1,1);
	if (timer1 <= 0) 
	{
		instance_destroy();
	}
}
}