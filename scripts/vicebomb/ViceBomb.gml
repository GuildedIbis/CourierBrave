//Vice Bomb (Mother Lily)
//
//
//
//
//
//Vice Bomb Create
function scr_projectile_viceBomb_create(){
//Scripts
home_state = scr_projectile_viceBomb_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;

//Assets
enemy_move = spr_projectile_viceBubble32;
enemy_idle = spr_projectile_viceBubble32;

//Stats
enemy_spd = 2.5;
damage = 50;

//Animation and Status
invincible = false;
inv_dur_timer = 0;
healthbar = false;
bullet = true;
aggro_drop = 300;
local_frame = 0;
hit_by_attack = -1;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
healthbar = false;
enemy_spd = 3.0
local_frame = 0;
hit_by_attack = -1;
fragment_count = 3;
fragment = obj_fragWater;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Vice Bomb Free
function scr_projectile_viceBomb_step(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;

	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
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






