//Enemy Acorn Spider
//
//
//
//
//
//Acorn Spider Create
function scr_enemy_acornSpider_create(){
//Scripts
home_state = scr_enemy_acornSpider_free;
entity_step = scr_enemy_acornSpider_free;
entity_drop = scr_enemy_acornSpider_drop;

//Assets
enemy_idle = spr_enemy_acornSpider_idle;
enemy_move = spr_enemy_acornSpider_run;
enemy_damaged = spr_enemy_acornSpider_damaged;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 4;
max_hp = 600; //+ (45 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.2;
name = "Acorn Spider";
//Animation and Status
bullet = false;
healthbar = true;
shadow = true;
shadow_size = 2;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
local_frame = 0;
hit_by_attack = -1;
timerC = 60 + irandom_range(-15,15);
timerW = 180 + irandom_range(-30,30);
walk_snd_delay = 0;
path = -1;

}

//
//
//
//
//
//Acorn Spider Free State
function scr_enemy_acornSpider_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	if (timerC <= 0)
	{
		path_end();
		sprite_index = enemy_idle;
		local_frame = 0;
		image_speed = 0;
		timerC = 520;
		timer1 = 180;
	}
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			scr_enemy_alert();
			aggro_drop = 300;
			targeted = true;
		}
	}	
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		//sprite_index = enemy_idle;
		path_end();
		home_x = x;
		home_y = y;
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
	}
	
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		if (timer1 <= 0) scr_enemy_chase();
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
			home_x = x;
			home_y = y;
		}
	}
	
	//Animation
	scr_enemy_animation();
}
else path_end();
}

//
//
//
//
//
//Acorn Spider Drop
function scr_enemy_acornSpider_drop(){
var _objects = 3;	
var _angle = irandom_range(0,359);

with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = obj_player.form_type;
	image_speed = 0;
	direction = (360/_objects) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = round(other.drop_amount/2);
	sprite_index = spr_charge_drop;
	image_index = 6;
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
}







