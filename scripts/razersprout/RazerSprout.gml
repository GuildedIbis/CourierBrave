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
hit_script = scr_entity_hit_destroy;
entity_drop = Idle;

//Assets
enemy_move = spr_enemy_razerSprout;
enemy_idle = spr_enemy_razerSprout;

//Stats
enemy_spd = 1.5;
damage = 35;

//Animation and Status
invincible = false
healthbar = false;
bullet = true;
inv_dur_timer = 0;
aggro_drop = 300;
timer1 = 60;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
fragment_count = 3;
fragment = obj_fragPlant;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
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






