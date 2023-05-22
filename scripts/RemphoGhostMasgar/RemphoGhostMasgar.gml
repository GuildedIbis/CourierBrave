//Rempho Ghost
//
//
//
//
//
//Rempho Ghost Create
function RemphoGhostMasgarCreate(){
targeted = false;	
invincible = false;
healthbar = true;
boss = true;
name = "Masgar's Ghost";
inv_dur_timer = 0;
home_state = RemphoGhostMasgarFree;
entity_step = home_state;
entity_drop = RemphoGhostMasgarDrop;
enemy_idle = spr_enemy_ghostMasgar_idle;
enemy_move = spr_enemy_ghostMasgar_move;
enemy_damaged = spr_enemy_balurneHunter_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular
shadow = false;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_alpha = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 700;
hp = max_hp;
enemy_spd = 1.5;
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
//Rempho Ghost Free
function RemphoGhostMasgarFree(){
//if (global.dayPhase != 2)
//{
//	invincible = true;
//	inv_dur_timer = 30;
//}
if (obj_game.gamePaused = false)//and (global.dayPhase = 2)
{
	//Timers
	if (timer1 > 0) and (watervice = false)
	{
		timer1 = timer1 - 1;
	}
	if (flash > 0) entity_step = EnemyDamaged;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x, obj_player.y,x-32,y-32,x+32,y+32)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			if (image_alpha != 1) image_alpha = 1;
			EnemyAlert();
			aggro_drop = 300;
			targeted = true;
		}
	}
	
	//if (aggro_drop <= 0)
	//{
	//	image_alpha = image_alpha - .05;
	//	if (image_alpha <= 0)
	//	{
	//		image_speed = 0;
	//		sprite_index = enemy_idle;
	//		path_end();
	//		aggro_drop = 300;
	//		targeted = false;
	//		global.aggroCounter = global.aggroCounter - 1;
	//	}
	//}
	if (aggro_drop <= 0)
	{
		image_alpha = image_alpha - .05;
		if (image_alpha <= 0)
		{
			image_speed = 0;
			sprite_index = enemy_idle;
			path_end();
			aggro_drop = 300;
			targeted = false;
			global.aggroCounter = global.aggroCounter - 1;
		}
	}
	//While Aggro is on
	if (targeted = true) and (thundux = false)
	{
		
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,8))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
		}

		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) and (timer1 <= 0)
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			entity_step = RemphoGhostMasgarSlash;
		}
		if (timer2 <= 0)
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 120;
			timer2 = 23;
			entity_step = RemphoGhostMasgarShadowShiftA;
		}
		if (timer3 <= 0)
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 120;
			timer2 = 23;
			entity_step = RemphoGhostMasgarPhantomBladeSummon;
		}
		//if (walk_snd_delay <= 0)
		//{
		//	walk_snd_delay = 30;
		//	if (point_in_circle(obj_player.x, obj_player.y,x,y,32)) audio_play_sound(walk_snd,1,0);
		//}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
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
//Rempho Ghost
function RemphoGhostMasgarShadowShiftA(){
if (obj_game.gamePaused = false)
{
	image_alpha = 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_ghostMasgar_shadowShiftA)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghostMasgar_shadowShiftA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		//audio_play_sound(snd_arrow,0,false);
		//with (instance_create_layer(x,y-8,"Instances",obj_enemy))
		//{
		//	script_execute(RatArrowCreate);
		//	direction = point_direction(x,y,obj_player.x,obj_player.y);
		//	image_angle = direction;
		//	speed = enemy_spd;
		//	break_object = other.break_object;
		//	fragment_count = 3;
		//	fragment = obj_fragWood;
		//	bullet = true;
		//	hit_script = EntityHitDestroy;
		//}
		timer2 = 42;
		x = obj_player.x;
		y = obj_player.y;
		entity_step = RemphoGhostMasgarShadowShiftB;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Rempho Ghost
function RemphoGhostMasgarShadowShiftB(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	//Set
	if (sprite_index != spr_enemy_ghostMasgar_shadowShiftB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghostMasgar_shadowShiftB;
		local_frame = 0;
		image_index = 0;
	}
	EnemyAttackCalculate(spr_enemy_ghostMasgar_shadowShiftB_hitbox)
	//Animation
	damage = 70;
	//Cacluate Attack
	if (timer3 <= 0)
	{	
		timer3 = 84;
		audio_sound_gain(snd_ghost_soulSkull,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulSkull,0,false);
	}
	EnemyAnimation1();
	if (animation_end = true)
	{
		attack_counter = attack_counter + 1;
		entity_step = RemphoGhostMasgarFree;
		if (attack_counter < 3) timer2 = 0;
		else 
		{
			attack_counter = 0;
			timer2 = 180;
		}
		audio_sound_gain(snd_ghost_soulFlare,global.volumeEffects,1);
		audio_play_sound(snd_ghost_soulFlare,0,false);
		with (instance_create_layer(x+22,y-8,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 0;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x,y-24,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 90;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x-22,y-8,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 180;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x,y+16,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 270;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x+16,y+6,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 315;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x+16,y-21,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 45;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x-16,y-21,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 135;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
		with (instance_create_layer(x-16,y+6,"Instances",obj_enemy_projectile))
		{
			SoulFlareCreate();
			direction = 225;
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 0;
			fragment = obj_fragment;
			bullet = true;
			hit_script = EntityHitDestroy;
		}

	}
}
}
//
//
//
//
//
//Balurne Skirmisher Slash State
function RemphoGhostMasgarSlash(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_ghostMasgar_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghostMasgar_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_ghostMasgar_slash_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer1 = 60;
		entity_step = RemphoGhostMasgarFree;
		sprite_index = enemy_idle;
	}
}
}
//
//
//
//
//
//Rempho Ghost Masgar Phantom Blade
function RemphoGhostMasgarPhantomBladeSummon(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_ghostMasgar_phantomBlade_summon)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_ghostMasgar_phantomBlade_summon;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}


	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer3 = 600;
		entity_step = RemphoGhostMasgarFree;
		sprite_index = enemy_idle;
		with (instance_create_layer(x,y-4,"Instances",obj_enemy_projectile))
		{
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			home_state = PhantomBlade;
			attack_counter = 0;
			timer1 = 300;
			timer2 = 60;
			timer3 = 30;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_ghostMasgar_phantomBlade;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 3;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 80;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragGold;
			bullet = true;
			hit_script = EntityHitDestroy;
			speed = enemy_spd;
		}
	}
}
}
//
//
//
//
//
//Masgar Phantom Blade
function PhantomBlade(){
if (obj_game.gamePaused = false)
{

//Set
sprite_index = spr_enemy_ghostMasgar_phantomBlade;
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
if (timer3 > 0) timer3 = timer3 - 1;

if (timer3 <= 0)
{
	speed = .25;
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	image_angle = direction;
}
if (timer2 <= 0)
{
	audio_sound_gain(snd_ghost_soulFlare,global.volumeEffects,1);
	audio_play_sound(snd_ghost_soulFlare,0,false);
	timer2 = 30;
	with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		home_state = PhantomDagger;
		exploded = false;
		path = -1;
		entity_step = home_state;
		invincible = false;
		inv_dur_timer = 0;
		enemy_move = spr_enemy_ghostMasgar_phantomDagger;
		aggro_drop = 300;
		healthbar = false;
		enemy_spd = 3;
		local_frame = 0;
		hit_by_attack = -1;
		damage = 30;
		break_object = other.break_object;
		fragment_count = 1;
		fragment = obj_fragGold;
		bullet = true;
		hit_script = EntityHitDestroy;
		speed = enemy_spd;
	}
}

if (timer1 <= 0) instance_destroy();

if (place_meeting(x,y,break_object)) 
{
	speed = 0;
}
}
}
//
//
//
//
//
//Phantom Dagger
function PhantomDagger(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_gorogKnife_hit,global.volumeEffects,1);
	audio_play_sound(snd_gorogKnife_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(dmg_snd,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
			
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_gorogKnife_hit,global.volumeEffects,1);
	audio_play_sound(snd_gorogKnife_hit,0,false);
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
//Balurne Hunter Drop
function RemphoGhostMasgarDrop(){

var _objects = 3;
var _dropBean = 30;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)	
var _angle = random(360);



with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;	
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 50) //White String
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 3;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 50) //Rat Teeth
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 8;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
	
}
}







