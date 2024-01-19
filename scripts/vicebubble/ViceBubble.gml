//Vice Bubble (Trap Lily and Mother Lily)
//
//
//
//
//
//Vice Bubble Create
function scr_projectile_viceBubble_create(){
//Scripts
home_state = scr_projectile_viceBubble_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;

//Assets
enemy_move = spr_projectile_viceBubble;
enemy_idle = spr_projectile_viceBubble;

//Stats
enemy_spd = 2.0;

//Animation and Status
invincible = false;
inv_dur_timer = 0;
healthbar = false;
bullet = true;
aggro_drop = 300;
local_frame = 0;
hit_by_attack = -1;
timer1 = 60;
damage = 35;
fragment_count = 5;
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
//Vice Bubble Free
function scr_projectile_viceBubble_step(){
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
