//White Crescent - Ofa Moth
//
//
//
//
//
//White Crescent Create
function scr_projectile_whiteCrescent_create(){
home_state = scr_projectile_whiteCrescent_free;
hit_script = scr_entity_hit_destroy;
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
enemy_idle = spr_enemy_whiteCrescent;
aggro_drop = 300;
timer1 = 150;
enemy_spd = 1.0;
local_frame = 0;
hit_by_attack = -1;
damage = 45;
shadow = 0;
fragment_count = 3;
fragment = obj_fragWhite;
healthbar = true;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
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
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
	if (place_meeting(x,y,break_object)) 
	{
		instance_destroy();
	}
	if (timer1 <= 0) instance_destroy();
}
else
{
	speed = 0;
}
}






