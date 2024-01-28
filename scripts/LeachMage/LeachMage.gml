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
max_hp = 200; //+ (45 * enemy_lvl);
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
		if (timerC <= 0) scr_enemy_chase();
		//if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		//{
		//	path_end();
		//	sprite_index = enemy_idle;
		//	if (timer1 <= 0)
		//	{
		//		attack_counter = 0;
		//		walk_snd_delay = 15;
		//		timer1 = 32;
		//		entity_step = scr_enemy_sarcap_slash;
		//	}
		//}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			
			if (timer2 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				walk_snd_delay = 15;
				timer2 = irandom_range(60,120);
				timer3 = 0;
				enemy_idle = spr_enemy_leachMage_cast;
				enemy_move = spr_enemy_leachMage_runCast;
				entity_step = scr_enemy_leachMage_sporeBlast;
			}
			//if (timer4 <= 0)
			//{
			//	path_end();
			//	sprite_index = enemy_idle;
			//	timer4 = 120;
			//	entity_step = scr_enemy_sarcap_browncap_spawn;
			//}
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
function scr_enemy_leachMage_sporeBlast(){
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
	if (point_in_circle(obj_player.x,obj_player.y,x,y,32))
	{
		path_end();
		sprite_index = enemy_idle;
	}
	else
	{
		scr_enemy_chase();
	}
	
	//Animate
	scr_enemy_animation_cast();
	scr_enemy_projectile_spawn(8);

	//Create Projectiles (mid-animation, several bursts)
	if (timer3 <= 0)
	{
		timer3 = 3;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			//audio_sound_gain(snd_enemy_acolyte_nilchrome,global.volumeEffects,1);
			//audio_play_sound(snd_enemy_acolyte_nilchrome,0,0);
			scr_projectile_sporeBlast_create();
			image_speed = 0;
			image_index = irandom_range(0,2);
			direction = point_direction(x,y,obj_player.x,obj_player.y-4) + (irandom_range(-12,12));
			image_angle = irandom_range(0,359);
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
	if (sprite_index != spr_enemy_sarcap_browncapSpawn)
	{
		sprite_index = spr_enemy_sarcap_browncapSpawn;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation_one()

	//Spawn Decoy Enemies (mid-animation)
	if (timer4 <= 0)
	{
		timer4 = 660;
		if (!place_meeting(x-16,y,obj_entity))
		{
			with (instance_create_layer(x-16,y,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_browncap_create();
				entity_step = scr_enemy_browncap_spawn;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = other.break_object;
				sprite_index = spr_enemy_browncap_spawn;
				local_frame = 0;
			}
		}
		if (!place_meeting(x+16,y,obj_entity))
		{
			with (instance_create_layer(x+16,y,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_browncap_create();
				invincible = true;
				inv_dur_timer = 5;
				entity_step = scr_enemy_browncap_spawn;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = other.break_object;
				sprite_index = spr_enemy_browncap_spawn;
				local_frame = 0;
			}
		}
		if (!place_meeting(x,y-16,obj_entity))
		{
			with (instance_create_layer(x,y-16,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_browncap_create();
				entity_step = scr_enemy_browncap_spawn;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = other.break_object;
				sprite_index = spr_enemy_browncap_spawn;
				local_frame = 0;
			}
		}
		if (!place_meeting(x,y+16,obj_entity))
		{
			with (instance_create_layer(x,y+16,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_browncap_create();
				entity_step = scr_enemy_browncap_spawn;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = other.break_object;
				sprite_index = spr_enemy_browncap_spawn;
				local_frame = 0;
			}
		}
		entity_step = scr_enemy_sarcap_free;
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



