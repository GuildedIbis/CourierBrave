//Endire Knight Projectiles
//
//
//
//
//
//Heatwave Create
function scr_projectile_heatwave_create(){
home_state = scr_projectile_heatwave_step;
hit_script = scr_entity_hit_destroy;
entity_drop = Idle;
entity_step = home_state;

damage = 40;
fragment_count = 3;
fragment = obj_fragPlant;
lit = true;
light_size = 16;
bullet = true;
light_size = 24;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_heatwave;
enemy_idle = spr_enemy_heatwave;
healthbar = false;
bullet = true;
aggro_drop = 300;
timer1 = irandom_range(0,14);
enemy_spd = 2.0;
local_frame = 0;
hit_by_attack = -1;
dir_wave = false;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Heatwave Free
function scr_projectile_heatwave_step(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0)timer1 = timer1 -1;
	
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Wave Direction
	if (timer1 <= 0)
	{
		if (dir_wave = false) dir_wave = true;
		else dir_wave = false;
		timer1 = 15;
	}
	if (dir_wave = false) direction = direction - 2;
	if (dir_wave = true) direction = direction + 2;
	image_angle = direction;
	
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
//
//
//
//
//
//Endire Knight Inimar Heatacer Create
function scr_projectile_heatacer_create(){
home_state = scr_projectile_heatacer_step;
hit_script = scr_entity_hit_destroy;
entity_drop = Idle;
entity_step = home_state;

light_size = 24;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_enemy_heatacer;
enemy_idle = spr_enemy_heatacer;
healthbar = false;
bullet = true;
aggro_drop = 300;
timer1 = 30;
enemy_spd = 1.5
local_frame = 0;
hit_by_attack = -1;
damage = 30;
dir_wave = false;

fragment_count = 3;
fragment = obj_fragFire;
lit = true;
light_size = 16;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Heatacer Free
function scr_projectile_heatacer_step(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0)timer1 = timer1 -1;

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



