//Enemy Leach Mage
//
//
//
//
//
//Leach Mage Create
function scr_enemy_leachMage_create(){
//Scripts
home_state = scr_enemy_leachMage_free;
entity_step = scr_enemy_leachMage_free;
entity_drop = scr_enemy_leachMage_drop;

//Assets
enemy_idle = spr_enemy_leachMage_idle;
enemy_move = spr_enemy_leachMage_run;
enemy_damaged = spr_enemy_leachMage_damaged;
enemy_arm = spr_enemy_leachMage_castArm;
damaged_snd = snd_enemy_rat_damaged;
walk_snd = snd_walk_regular;

//Stats
form_type = 0;
drop_amount = 10;
max_hp = 400; //+ (45 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.2;

//Animation and Status
bullet = false;
healthbar = true;
shadow = true;
shadow_size = 1;
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
//Leach Mage Free State
function scr_enemy_leachMage_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	if (flash > 0) entity_step = scr_enemy_damaged;
	casting = false;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		scr_enemy_wander_home(60,180,home_x,home_y); 
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
		sprite_index = enemy_idle;
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
		if (timerC <= 0)
		{
			if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
			{
				if (hor_spd = 0) and (ver_spd = 0) 
				{
					hor_spd = irandom_range(-1,1);
					ver_spd = irandom_range(-1,1);
				}
		
				if (hor_spd != 0) or (ver_spd != 0) 
				{
					var _xDest = x + (hor_spd * (enemy_spd))
					var _yDest = y + (ver_spd * (enemy_spd))
					if (place_meeting(_xDest, _yDest,obj_entity))
					{
						hor_spd = -hor_spd;
						ver_spd = -ver_spd;
						//sprite_index = enemy_idle;
					}
					path = path_add();
					mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
					path_start(path, enemy_spd, 0, 0);
					image_speed = 1;
					sprite_index = enemy_move;
	
				}
			}
			else
			{
				speed = 0;
				sprite_index = enemy_idle;
				hor_spd = 0;
				ver_spd = 0;
				path_end();
			}	
		}	
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			
			if (timer2 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				walk_snd_delay = 15;
				timer2 = choose(120,180,240);
				timer3 = 60;
				enemy_idle = spr_enemy_leachMage_cast;
				enemy_move = spr_enemy_leachMage_runCast;
				entity_step = scr_enemy_leachMage_speedSpore;
			}
			if (timer4 <= 0)
			{
				path_end();
				sprite_index = enemy_idle;
				timer4 = 120;
				entity_step = scr_enemy_leachMage_redcap_spawn;
			}
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
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
//Leach Mage Sporeblast State
function scr_enemy_leachMage_speedSpore(){
if (obj_game.gamePaused = false)
{
	//Timers
	scr_enemy_timer_countdown();
	
	//Dynamic Casting Arm
	casting = true;
	
	//Set
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	
	//Move
	if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
	{
		if (hor_spd = 0) and (ver_spd = 0) 
		{
			hor_spd = irandom_range(-1,1);
			ver_spd = irandom_range(-1,1);
		}
		
		if (hor_spd != 0) or (ver_spd != 0) 
		{
			var _xDest = x + (hor_spd * (enemy_spd))
			var _yDest = y + (ver_spd * (enemy_spd))
			if (place_meeting(_xDest, _yDest,obj_entity))
			{
				hor_spd = -hor_spd;
				ver_spd = -ver_spd;
				//sprite_index = enemy_idle;
			}
			path = path_add();
			mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
			path_start(path, enemy_spd, 0, 0);
			image_speed = 1;
			sprite_index = enemy_move;
	
		}
	}
	else
	{
		speed = 0;
		sprite_index = enemy_idle;
		hor_spd = 0;
		ver_spd = 0;
		path_end();
	}
	
	//Animate
	scr_enemy_animation_cast();
	scr_enemy_projectile_spawn(8);

	//Create Projectiles (mid-animation, several bursts)
	if (timer3 <= 0)
	{
		timer3 = 60;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			//audio_sound_gain(snd_enemy_acolyte_nilchrome,global.volumeEffects,1);
			//audio_play_sound(snd_enemy_acolyte_nilchrome,0,0);
			scr_projectile_speedSpore_create();
			direction = point_direction(x,y,obj_player.x,obj_player.y-4);
			image_angle = direction;
			speed = enemy_spd;
			sprite_index = enemy_move;
			break_object = other.break_object;
		}
	}

	
	//End
	if (timer2 <= 0)
	{
		casting = false;
		enemy_idle = spr_enemy_leachMage_idle;
		enemy_move = spr_enemy_leachMage_run;
		sprite_index = enemy_idle;
		entity_step = scr_enemy_leachMage_free;
		timer2 = 360;
		timerC = max(timerC,180);
	}
}
}
//
//
//
//
//
//Leach Mage Redcap Spawn
function scr_enemy_leachMage_redcap_spawn(){
if (obj_game.gamePaused = false)
{

	//Timers
	scr_enemy_timer_countdown();
	
	
	//Set
	if (sprite_index != spr_enemy_leachMage_redcapSpawn)
	{
		sprite_index = spr_enemy_leachMage_redcapSpawn;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation_one()

	//Spawn Recap Enemy
	if (timer4 <= 0)
	{
		if (!place_meeting(x,y+16,obj_entity))
		{
			with (instance_create_layer(x,y+16,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_redcap_create();
				entity_step = scr_enemy_redcap_spawn;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = other.break_object;
				sprite_index = spr_enemy_redcap_spawn;
				local_frame = 0;
			}
		}
		entity_step = scr_enemy_leachMage_free;
		timer4 = 600;
	}
}
}
//
//
//
//
//
//Leach Mage Drop
function scr_enemy_leachMage_drop(){
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
//
//
//
//
//
//Projectiles
//
//
//
//
//
//Leach Mage Projectile Speedspore Create
function scr_projectile_speedSpore_create(){
home_state = scr_projectile_speedSpore_step;
entity_step = home_state;

lit = true;
invincible = false;
inv_dur_timer = 0;
enemy_move = spr_projectile_leachMage_speedSpore;
enemy_idle = spr_projectile_leachMage_speedSpore;
aggro_drop = 300;
healthbar = false;
enemy_spd = 4.5;
local_frame = 0;
hit_by_attack = -1;
damage = 40;
fragment_count = 2;
fragment = obj_fragBlue;
bullet = true;
hit_script = scr_entity_hit_destroy;

sprite_index = enemy_idle;
speed = enemy_spd;
image_speed = 1;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Leach Mage Projectile Speedspore Step
function scr_projectile_speedSpore_step(){
if (obj_game.gamePaused = false)
{
	//Resume Speed
	speed = enemy_spd;
	image_speed = 0;
	
	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1,-1);
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


