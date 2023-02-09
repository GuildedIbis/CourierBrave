//Dusk Leach
//
//
//
//
//
//Dusk Leech Create
function DuskLeechCreate(){
home_state = DuskLeechFree;
entity_step = home_state;
entity_drop = DuskLeechDrop;
enemy_idle = spr_enemy_duskLeech_idle;
enemy_move = spr_enemy_duskLeech_run;
enemy_damaged = spr_enemy_duskLeech_damaged;
damaged_snd = snd_rat_damaged;
shadow = 1;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 320;
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
walk_snd_delay = 0;
}
//
//
//
//
//
//Dusk Leech Free State
function DuskLeechFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;

	//Toggle Aggro 
	EnemyAggro();
	
	//While Aggro is on
	if (targeted = true)
	{
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,24))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				timer1 = 60;//How Long Until it can attack again
				//timer2 = 23;
				entity_step = DuskLeechThunder;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		{
			
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			timer1 = 120;//How long until it can attack again
			timer2 = 18;
			entity_step = DuskLeechBioBolt;
		}
		if (walk_snd_delay <= 0)
		{
			walk_snd_delay = 15;
			audio_play_sound(snd_walk_regular,1,0);
		}
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
//Dusk Leech Thunder State
function DuskLeechThunder(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_duskLeech_thunderForce)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_duskLeech_thunderForce;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 95;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_duskLeech_thunder_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		entity_step = home_state;
		animation_end = false;
	}
}
}
//
//
//
//
//
//BalurneRat Voidcast State 
function DuskLeechBioBolt(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_duskLeech_bioBolt)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_duskLeech_bioBolt;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 90;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_duskLeech_bioBolt_hitbox)
	
	//Shoot
	if (timer2 <= 0)
	{
		timer2 = 12;
		with (instance_create_layer(x,y,"Instances",obj_enemy))
		{
			BioBoltCreate(55);
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
			break_object = other.break_object;
			fragment_count = 6;
			fragment = obj_fragElectric;
			bullet = true;
			hit_script = EntityHitDestroy;
		}
	}
	
	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		
		entity_step = home_state;
		animation_end = false;
	}
}
}
//
//
//
//
//
//Dusk Leech Drop
function DuskLeechDrop(){
if (obj_inventory.quest_grid[# 1, 0] = true) and (obj_inventory.quest_grid[# 1, 3] = false)
{
	obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 1] + 1;
}
var _objects = 2;
var _dropBean = 31;
var _drop1 = irandom_range(0,99)	
var _angle = random(360);


with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}

if (_drop1 > 50) //Rat Teeth
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 1;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])


}







