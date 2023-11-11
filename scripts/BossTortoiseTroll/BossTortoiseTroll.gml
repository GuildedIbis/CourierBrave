//Tortoise Troll Scripts
//
//
//
//
//
//Tortoise Troll Create
function scr_enemy_trollTortoise_create(){
activate_args = 0;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = scr_enemy_trollTortoise_free;
entity_step = scr_enemy_trollTortoise_free;
entity_drop = scr_enemy_trollTortoise_drop;
enemy_idle = spr_enemy_tortoiseTroll_idle;
enemy_move = spr_enemy_tortoiseTroll_run;
damaged_snd = snd_tortoiseTroll_damaged;
walk_snd = snd_walk_regular;
shadow = true;
shadow_size = 2;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
form_type = 4;
max_hp = 2200 + (1100 * enemy_lvl);
hp = max_hp;
boss = true;
name = "Tortoise Troll";
enemy_spd = 1.3;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
timerS = 0;
timerC = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Tortoise Troll Scene 1
function scr_enemy_trollTortoise_scene1(){
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
function scr_enemy_trollTortoise_scene2(){
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
	scr_enemy_animation_one();
	if (animation_end)
	{
		script_execute(scr_enemy_trollTortoise_create2);
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
function scr_enemy_trollTortoise_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;

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
		entity_step = scr_enemy_trollTortoise_scene2;
	}

	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		if (timerC <= 0)
		{
			scr_enemy_chase_special(obj_game,obj_entity);
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			path_end();
			sprite_index = enemy_idle;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{	
			path_end();
			sprite_index = enemy_idle;
			audio_sound_gain(snd_tortoiseTroll_hammer,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_hammer,0,false);
			entity_step = scr_enemy_trollTortoise_hammerSlam;
				
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer2 <= 0)
		{
			
			//walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					sprite_index = enemy_idle;
					timer2 = 20;
					entity_step = scr_enemy_trollTortoise_hammerMissile;
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					//timer1 = 14;
					timer2 = 14;
					entity_step = scr_enemy_trollTortoise_hammerBlossom;
				break;
			}
				
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
//Tortoise Troll Hammer Slam
function scr_enemy_trollTortoise_hammerSlam(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	damage = 50 + (7 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerSlam_hitbox)

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = scr_enemy_trollTortoise_hammerLunge;
			animation_end = false;
			timer1 = 12;
			hor_spd = 0;
			ver_spd = 0;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
		}
		else
		{
			audio_sound_gain(snd_tortoiseTroll_lunge,global.volumeEffects,1);
			audio_play_sound(snd_tortoiseTroll_lunge,0,false);
			entity_step = scr_enemy_trollTortoise_jumpslam;
			animation_end = false;
			timer1 = 40;
			timer3 = 20;
			timerS = 40;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
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
function scr_enemy_trollTortoise_hammerLunge(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	damage = 50 + (7 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerLunge_hitbox)
	
	if (timer1 <= 0)
	{
		hor_spd = lengthdir_x(4,direction);
		ver_spd = lengthdir_y(4,direction);
	}
	
	var _collided = scr_enemy_collision();

	//Animate
	scr_enemy_animation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		entity_step = scr_enemy_trollTortoise_hammerBackslam;
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
function scr_enemy_trollTortoise_hammerBackslam(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	damage = 60 + (9 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerBackslam_hitbox)

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		animation_end = false;
		entity_step = home_state;
		sprite_index = enemy_idle;
		timer1 = 120;
		timerC = 60;
	}
}
}
//
//
//
//
//
//Troll Tortoise Hammer Jumpslam
function scr_enemy_trollTortoise_jumpslam(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	damage = 80 + (13 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_tortoiseTroll_hammerJumpslam_hitbox)
	if (timer3 > 0)
	{
		z = z + 1;
	}
	else
	{
		if (z > 0) z = z - 1;
	}
	if (timer1 > 0)
	{
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
	var _collided = scr_enemy_collision();
	if (_collided = true) or (timer1 < 0)
	{
		z = 0;
		hor_spd = 0;
		ver_spd = 0;
		speed = 0;
	}
	
	//Animate
	scr_enemy_animation();
	if (animation_end) 
	{
		timer1 = 120;
		timerC = 120;
		sprite_index = enemy_idle;
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
function scr_enemy_trollTortoise_hammerMissile(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	if (timer2 <= 0)
	{
		audio_sound_gain(snd_tortoiseTroll_missiles,global.volumeEffects,1);
		audio_play_sound(snd_tortoiseTroll_missiles,0,false);
		timer2 = 10;
		with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_enemy_projectile))
		{
			direction = other.direction;
			image_angle = direction;
			enemy_lvl = other.enemy_lvl;
			home_state = scr_projectile_trollTortoise_missile;
			timer1 = 90;
			timer2 = 30;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_trollTortoise_missile;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 2.0;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 45 + (8 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			speed = enemy_spd;
		}
	}
	else
	
	
	//Animate
	scr_enemy_animation();
	if (animation_end) 
	{
		timer2 = 300;
		timerC = 60;
		z = 0;
		sprite_index = enemy_idle;
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
function scr_enemy_trollTortoise_hammerBlossom(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timerS > 0) timerS = timerS - 1;
	if (timerC > 0) timerC = timerC - 1;
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
	if (timer2 <= 0)
	{
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			direction = (point_direction(x,y,obj_player.x,obj_player.y));
			home_state = scr_projectile_trollTortoise_mound;
			timer1 = 180;
			timer2 = 0;
			path = -1;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_tortoiseTroll_mound;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 1.25;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 55 + (9 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			speed = enemy_spd;
		}
		timer2 = 29;
	}
	
	
	//Animate
	scr_enemy_animation_one();
	if (animation_end) 
	{
		timer2 = 300;
		timerC = 60;
		z = 0;
		entity_step = home_state;
		sprite_index = enemy_idle;
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
function scr_enemy_trollTortoise_drop(){
var _objects = 7;
//var _dropBean = 250;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99);	
var _angle = irandom_range(0,359);

//with (instance_create_layer(x,y,"Instances",obj_itemBean))
//{
//	drop_amount = _dropBean;
//	sprite_index = spr_bean;
//	direction = (360/_objects) + _angle;
//	spd = .75 + (.3) + random(0.1);
//}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = other.form_type;
	image_speed = 0;
	direction = (360/_objects * 2) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
with (instance_create_layer(x,y,"Instances",obj_itemCharge))
{
	drop_amount = 10;
	sprite_index = spr_charge_drop;
	image_index = irandom_range(0,5);
	image_speed = 0;
	direction = (360/_objects * 3) + _angle;
	image_angle = direction;
	spd = .75 + (.3) + random(0.1);
}
if (_drop1 < 50)//Form Specific Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = other.form_type;
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 4) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop1 >= 50) //Random Rog Stone
{
	with (instance_create_layer(x,y,"Instances",obj_itemRog))
	{
		item_id = irandom_range(0,5);
		sprite_index = spr_rog_all;
		image_index = item_id;
		direction = (360/_objects * 5) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 >= 0)
{
	with (instance_create_layer(x,y,"Instances",obj_itemPS))
	{
		item_id = other.enemy_lvl;
		sprite_index = spr_powerstone_all;
		image_index = item_id;
		direction = (360/_objects * 6) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
}
//obj_inventory.beaowire_dungeon[10] = 2;
//obj_inventory.beaowire_dungeon[12] = 2;
//obj_inventory.beaowire_dungeon[14] = 2;
//obj_inventory.beaowire_dungeon[15] = 1;
//if (obj_inventory.quest_grid[# 14, 3] = false)
//{
//	obj_inventory.quest_grid[# 14, 0] = true;
//	obj_inventory.quest_grid[# 14, 1] = obj_inventory.quest_grid[# 14, 2];
//	obj_inventory.quest_grid[# 14, 3] = true;
//	//with (obj_text)
//	//{
//	//	text_script = ZerwerkVictoryText;
//	//}
//	//obj_game.gamePaused = !obj_game.gamePaused;
//	//obj_game.textPaused = !obj_game.textPaused;
//}

	
}
//
//
//
//
//
//Tortoise Troll Victory Text
function scr_text_trollTortoise_victory(){

draw_set_font(xfnt_text);
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
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);

}






