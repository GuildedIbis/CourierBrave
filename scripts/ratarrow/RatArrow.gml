//Rat Arrow
//
//
//
//
//
//Rat Arrow Create
function scr_projectile_ratArrow_create(){
home_state = scr_projectile_ratArrow_step;
hit_script = scr_entity_hit_destroy;
entity_step = home_state;
entity_drop = Idle;

invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_rat_arrow;
enemy_idle = spr_enemy_rat_arrow;
aggro_drop = 300;
healthbar = false;
bullet = true;
enemy_spd = 3.0;
local_frame = 0;
hit_by_attack = -1;
damage = 25;
fragment_count = 3;
fragment = obj_fragWood;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Rat Arrow Free
function scr_projectile_ratArrow_step(){
if (obj_game.gamePaused = false)
{
	//Resume Speed
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






