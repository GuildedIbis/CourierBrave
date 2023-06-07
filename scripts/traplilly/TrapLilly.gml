//Rift Sabi
//
//
//
//
//
//Sabi Create
function TrapLilyCreate(){
home_state = TrapLilyFree;
entity_step = home_state;
entity_drop = TrapLilyDrop;
enemy_idle = spr_enemy_trapLily;
enemy_move = spr_enemy_trapLily;
enemy_damaged = spr_enemy_trapLily;
damaged_snd = snd_trapLily_hit;
walk_snd = snd_walk_regular;
shadow = 1;
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
max_hp = 105;
hp = max_hp;
hor_spd = 0;
ver_spd = 0;
enemy_spd = 2.0;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
special_timer = -1;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Sabi Free
function TrapLilyFree(){

if (obj_game.gamePaused = false)
{

	
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (special_timer > 0) special_timer = special_timer - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	if (timer1 <= 0)
	{
		EnemyWander(60,180);
	}
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
		lit = false
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
		}
	}
	else sprite_index = enemy_idle;
	if (targeted = true)
	{
		lit = true;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (special_timer <= 0)
		{
			if (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (watervice = false)
			{
				special_timer = 180;
				timer2 = 36;
				entity_step = TrapLilyBubbleFlail
			}
		}
	}
	//if (walk_snd_delay <= 0)
	//{
	//	walk_snd_delay = 30;
	//	if (point_in_circle(obj_player.x, obj_player.y,x,y,32)) audio_play_sound(walk_snd,1,0);
	//}
	if (targeted = true)
	{
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			walk_snd_delay = 15;
			aggro_drop = aggro_drop - 1;
		}
	}
	//Animation
	script_execute(EnemyAnimation);
}
else path_end();
}
//
//
//
//
//
//Trap Lily Bubble Flail
function TrapLilyBubbleFlail(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_trapLily_open)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_trapLily_open;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 35;
	
	if (timer2 <= 0)
	{
		timer2 = 36;
		audio_sound_gain(snd_viceBubble,global.volumeEffects,1);
		audio_play_sound(snd_viceBubble,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			script_execute(ViceBubbleCreate);
			direction =  point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWood;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
	}
	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		entity_step = TrapLilyExposed;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Trap Lily Exposed
function TrapLilyExposed(){
if (obj_game.gamePaused = false)
{
	if (sprite_index != spr_enemy_trapLily_exposed)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_trapLily_exposed;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		entity_step = home_state;
		animation_end = false;
		invincible = true;
	}
}
}
//
//
//
//
//
//Sabi Drop
function TrapLilyDrop(){
var _objects = 6;
var _dropBean = 35;
var _drop1 = irandom_range(0,99)	
var _angle = random(360);


with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = 360/_objects;	
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = other.form_type;
	image_speed = 0;
	direction = 360/_objects * 2;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = 360/_objects * 3;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = 6;
	image_speed = 0;
	direction = 360/_objects * 4;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 94) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 4;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = 360/_objects * 5;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])

	
}

