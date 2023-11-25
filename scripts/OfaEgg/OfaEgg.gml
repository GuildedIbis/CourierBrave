//Ofa EGg
//
//
//
//
//
//Ofa Egg Create
function scr_enemy_ofa_egg_create(){
//Scripts
home_state = scr_enemy_ofa_egg_free;
entity_step = scr_enemy_ofa_egg_free;
entity_drop = scr_enemy_ofa_egg_drop;

//Assets
enemy_idle = spr_enemy_ofaEgg;
enemy_move = spr_enemy_ofaEgg;
enemy_damaged = spr_enemy_ofaEgg;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular

//Stats
form_type = 1;
max_hp = 50 + (30 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.25;

//Animation and Status
targeted = false;	
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
attack_counter = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Ofa Egg Free
function scr_enemy_ofa_egg_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	//Can't Be Knocked Back
	knockback = false;
	knockback_dur = 0;
	
	//Breaks Immediately
	if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) or (targeted = true)
	{
		hp = 0;
	}
}
}
//
//
//
//
//
//Ofa Egg Drop
function scr_enemy_ofa_egg_drop(){
var _objects = 4;
var _drop1 = irandom_range(0,99);	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);


//Create Worms
with (instance_create_layer(x + 8,y,"Instances",obj_enemy))
{
	image_alpha = 1;
	scr_enemy_ofa_worm_create();
	enemy_lvl = 1;
	global.aggroCounter = global.aggroCounter + 1;
	targeted = true;
	break_object = obj_break;
}
with (instance_create_layer(x,y-8,"Instances",obj_enemy))
{
	image_alpha = 1;
	scr_enemy_ofa_worm_create();
	enemy_lvl = 1;
	global.aggroCounter = global.aggroCounter + 1;
	targeted = true;
	break_object = obj_break;
}
with (instance_create_layer(x-8,y,"Instances",obj_enemy))
{
	image_alpha = 1;
	scr_enemy_ofa_worm_create();
	enemy_lvl = 1;
	global.aggroCounter = global.aggroCounter + 1;
	targeted = true;
	break_object = obj_break;
}
with (instance_create_layer(x,y+8,"Instances",obj_enemy))
{
	image_alpha = 1;
	scr_enemy_ofa_worm_create();
	enemy_lvl = 1;
	global.aggroCounter = global.aggroCounter + 1;
	targeted = true;
	break_object = obj_break;
}
}





