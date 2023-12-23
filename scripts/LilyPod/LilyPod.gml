//Lily Pod
//
//
//
//
//
//Lily Pod
function scr_enemy_lily_pod_create(){
//Scripts
home_state = scr_enemy_lily_pod_free;
entity_step = scr_enemy_lily_pod_free;
entity_drop = scr_enemy_lily_pod_drop;

//Assets
enemy_idle = spr_enemy_lily_pod;
enemy_move = spr_enemy_lily_pod;
enemy_damaged = spr_enemy_lily_pod;
damaged_snd = snd_trapLily_hit;
walk_snd = snd_walk_regular;

//Stats
form_type = 1;
drop_amount = 6;
max_hp = 60;//+ (30 * enemy_lvl);
hp = max_hp;
enemy_spd = 2.0;

//Animation and Status
shadow = false;
shadow_size = 1;
lit = false;
light_size = 18;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
hor_spd = 0;
ver_spd = 0;
local_frame = 0;
hit_by_attack = -1;
timer3 = 600;
special_timer = -1;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Lily Pod Free
function scr_enemy_lily_pod_free(){

if (obj_game.gamePaused = false)
{
	
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	
	//Cannot be moved
	knockback = false;
	knockback_dur = 0;

	//Toggle Aggro
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		sprite_index = enemy_idle;
		path_end();
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
	}
	if (targeted = false)
	{
		lit = false;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
		}
	}
	
	//While aggro is on
	if (targeted = true)
	{
		if (timer3 <= 0)
		{
			image_alpha = 1;
			scr_enemy_lilyCultist_create();
			targeted = true;
			timer1 = 30;
			timer2 = 30;
			timer3 = 30;
		}
		lit = true;
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
	}
	
	//Animation
	scr_enemy_animation_one();
}
else path_end();
}
//
//
//
//
//
//Lily Pod Drop
function scr_enemy_lily_pod_drop(){
var _objects = 2;
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}

}

