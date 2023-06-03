//Tortoise Troll Scripts
//
//
//
//
//
//Tortoise Troll Create
function BossTortoiseTrollCreate(){
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = BossTortoiseTrollFree;
entity_step = BossTortoiseTrollScene1;
entity_drop = BossTortoiseTrollDrop;
enemy_idle = spr_enemy_tortoiseTroll_idle;
enemy_move = spr_enemy_tortoiseTroll_run;
damaged_snd = snd_tortoiseTroll_damaged;
walk_snd = snd_walk_regular;
shadow = 2;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 2500;
hp = 2500;
boss = true;
name = "Tortoise Troll";
enemy_spd = 1.3;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
timerS = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Tortoise Troll Scene 1
function BossTortoiseTrollScene1(){
if (obj_game.gamePaused = false)
{
	invincible = true;
	invincible_timer = 5;
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		sprite_index = spr_enemy_tortoiseTroll_rest;
	}
}
}
//
//
//
//
//
//Tortoise Troll Scene 2
function BossTortoiseTrollScene2(){
if (obj_game.gamePaused = false)
{
	invincible = true;
	invincible_timer = 5;
	path_end();
	hor_spd = 0;
	ver_spd = 0;
	speed = 0;
	if (sprite_index != spr_enemy_tortoiseTroll_scene2)
	{
		//Start Animation From Beginning
		audio_sound_gain(snd_tortoiseTroll_damaged02,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_damaged02,0,false);
		sprite_index = spr_enemy_tortoiseTroll_scene2;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	EnemyAnimation1();
	if (animation_end)
	{
		script_execute(BossTortoiseTrollCreate2);
		entity_step = home_state;
		sprite_index = spr_enemy_tortoiseTroll_idle2;
	}
}
}
//
//
//
//
//
//Tortoise Troll Free
function BossTortoiseTrollFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;

	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		sprite_index = spr_enemy_tortoiseTroll_rest;
	}
	
	if (hp <= (max_hp*.75))
	{
		path_end();
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
		entity_step = BossTortoiseTrollScene2;
	}

	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		EnemyChaseSpecial(obj_game,obj_entity);
		//walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			//walk_snd_delay = 15;
			path_end();
			sprite_index = enemy_idle;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{
			//walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
						audio_play_sound(snd_tortoiseTroll_hammer,0,false);
						timer1 = 7;
						attack_counter = attack_counter + 1;
						if (attack_counter >= 2)
						{
							attack_counter = 0;
							timer1 = 60;
						}
						timer2 = 23;
						entity_step = BossTortoiseTrollHammerSlam;
					}
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					image_index = 0;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
						audio_play_sound(snd_tortoiseTroll_hammer,0,false);
						timer1 = 7;
						attack_counter = attack_counter + 1;
						if (attack_counter >= 2)
						{
							attack_counter = 0;
							timer1 = 60;
						}
						timer2 = 23;
						entity_step = BossTortoiseTrollHammerSlam;
					}
				break;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{
			
			//walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					timer1 = 20;
					entity_step = BossTortoiseTrollHammerMissileFire;
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					timer1 = 14;
					timer2 = 90;
					entity_step = BossTortoiseTrollHammerBlossom;
				break;
			}
				
		}
		//if (!point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer1 <= 0)
		//{
			
		//	//audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
		//	//audio_play_sound(snd_zerwerk_voidRift,0,false);
		//	path_end();
		//	sprite_index = enemy_idle;
		//	timer1 = 15;
		//	entity_step = BossTortoiseTrollHammerBlossom;
		//}
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
//Tortoise Troll Hammer Slam
function BossTortoiseTrollHammerSlam(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerSlam)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerSlam;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerSlam_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = BossTortoiseTrollHammerLunge;
			animation_end = false;
			timer2 = 12;
			hor_spd = 0;
			ver_spd = 0;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
		}
		else
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = BossTortoiseTrollJumpslam;
			animation_end = false;
			timer1 = 60;
			timer2 = 40;
			timer3 = 20;
			timerS = 40;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			//hor_spd = lengthdir_x(3,direction);
			//ver_spd = lengthdir_y(3,direction);
		}
	}
	
}
}
//
//
//
//
//
//Troll Tortoise Hammer Lunge
function BossTortoiseTrollHammerLunge(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerLunge)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerLunge;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 50;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerLunge_hitbox)
	
	if (timer2 <= 0)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(4,direction);
		ver_spd = lengthdir_y(4,direction);
	}
	
	var _collided = EnemyCollision();

	//Animate
	EnemyAnimation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		timer1 = 120;
		timer2 = 120;
		entity_step = BossTortoiseTrollHammerBackslam;
		audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_hammer,0,false);
		direction = (point_direction(x,y,obj_player.x,obj_player.y));
		animation_end = false;
	}
}
}
//
//
//
//
//
//Tortoise Troll Hammer Slam
function BossTortoiseTrollHammerBackslam(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerBackslam)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerBackslam;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerBackslam_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		animation_end = false;
		entity_step = home_state;
		timer1 = 30;
		timer2 = 30;
	}
}
}
//
//
//
//
//
//Troll Tortoise Hammer Jumpslam
function BossTortoiseTrollJumpslam(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (sprite_index != spr_enemy_tortoiseTroll_hammerJumpslam)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerJumpslam;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 110;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerJumpslam_hitbox)
	if (timer3 > 0)
	{
		z = z + 1;
	}
	else
	{
		if (z > 0) z = z - 1;
	}
	if (timer2 > 0)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(2.25,direction);
		ver_spd = lengthdir_y(2.25,direction);
	}
	else
	{
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
	}
	
	//Sound
	if (timerS <= 0)
	{
		timerS = 300;
		audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_hammer,0,false);
	}
	var _collided = EnemyCollision();
	if (_collided = true) or (timer1 < 0)
	{
		z = 0;
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
	}
	
	//Animate
	EnemyAnimation();
	if (animation_end) 
	{
		timer1 = 120;
		timer2 = 120;
		z = 0;
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
//Troll Tortoise Hammer Jumpslam
function BossTortoiseTrollHammerMissileFire(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;

	if (sprite_index != spr_enemy_tortoiseTroll_hammerMissiles)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerMissiles;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	var _dirPos = round(direction/90);
	switch(_dirPos)
	{
		case 0:
			dir_offX = 16;
			dir_offY = -8;
		break;
		
		case 4:
			dir_offX = 16;
			dir_offY = -8;
		break;
		
		case 1:
			dir_offX = 8;
			dir_offY = -24;
		break;
		
		case 2:
			dir_offX = -16;
			dir_offY = -8;
		break;
		
		case 3:
			dir_offX = -8;
			dir_offY = 0;
		break;	
	}
	
	
	//Launch Missles
	if (timer1 <= 0)
	{
		audio_sound_gain(snd_tortoiseTroll_missiles,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_missiles,0,false);
		timer1 = 10;
		with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_enemy_projectile))
		{
			direction = other.direction;
			image_angle = direction;
			home_state = TrollTortoiseMissile;
			timer1 = 180;
			timer2 = 30;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_trollTortoise_missile;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.5;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = EntityHitDestroy;
			speed = enemy_spd;
		}
	}
	else
	
	
	//Animate
	EnemyAnimation();
	if (animation_end) 
	{
		timer1 = 15;
		timer2 = 15;
		z = 0;
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
//Troll Tortoise Hammer Blossom
function BossTortoiseTrollHammerBlossom(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;

	if (sprite_index != spr_enemy_tortoiseTroll_hammerBlossom)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_tortoiseTroll_hammerBlossom;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Launch Missles
	if (timer1 <= 0)
	{
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			home_state = TrollTortoiseMound;
			timer1 = 180;
			timer2 = 0;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_tortoiseTroll_mound;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.25;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65;
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = EntityHitDestroy;
			speed = enemy_spd;
		}
		timer1 = 29;
	}
	
	
	//Animate
	EnemyAnimation1();
	if (animation_end) 
	{
		timer1 = 120;
		timer2 = 120;
		z = 0;
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
//Troll Tortoise Drop
function BossTortoiseTrollDrop(){
var _objects = 3;
var _dropBean = 250;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)
var _drop3 = irandom_range(0,99)
var _angle = random(360);


with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 > 0) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 8;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop3 > 49) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 6;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 3;
		spd = .75 + (.3) + random(0.1);
	}
	
}
obj_inventory.beaowire_dungeon[10] = 2;
obj_inventory.beaowire_dungeon[12] = 2;
obj_inventory.beaowire_dungeon[14] = 2;
obj_inventory.beaowire_dungeon[15] = 1;
if (obj_inventory.quest_grid[# 14, 3] = false)
{
	obj_inventory.quest_grid[# 14, 0] = true;
	obj_inventory.quest_grid[# 14, 1] = obj_inventory.quest_grid[# 14, 2];
	obj_inventory.quest_grid[# 14, 3] = true;
	//with (obj_text)
	//{
	//	text_script = ZerwerkVictoryText;
	//}
	//obj_game.gamePaused = !obj_game.gamePaused;
	//obj_game.textPaused = !obj_game.textPaused;
}

	
}
//
//
//
//
//
//Tortoise Troll Victory Text
function TortoiseTrollVictoryText(){

draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Tortoise Troll Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "Quest Complete - Lair: Yakflower Path\nREWARD:1000 Beans"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 2)
{

	obj_player.beans = obj_player.beans + 1000;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);

}






