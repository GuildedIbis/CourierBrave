//Zerwerk Scripts
//
//
//
//
//
//Zerwerk Create
function scr_enemy_zerwerk_create(){
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = scr_enemy_zerwerk_free;
entity_step = home_state;
entity_drop = scr_enemy_zerwerk_drop;
enemy_idle = spr_enemy_bossZerwerk_idle;
enemy_move = spr_enemy_bossZerwerk_run;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
attack_timer = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
form_type = 2;
max_hp = 1200 + (125 * enemy_lvl);
hp = max_hp;
boss = true;
name = "Rift Giant Zerwerk";
enemy_spd = 1.3;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Zerwerk Free
function scr_enemy_zerwerk_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (attack_timer > 0) attack_timer = attack_timer - 1;
	if (attack_counter >= 5)
	{
		attack_timer = 180;
		attack_counter = 0;
	}
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
			global.bossCounter = global.bossCounter + 1;
		}
	}
	
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		sprite_index = enemy_idle;
		path_end();
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
		global.bossCounter = global.bossCounter - 1;
	}
	//While Aggro is on
	if (targeted = true)
	{
		lit = true;
		if (attack_timer <= 0)
		{
			
			walk_snd_delay = walk_snd_delay - 1;
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				walk_snd_delay = 15;
				path_end();
				sprite_index = enemy_idle;
			}
			var _atk = irandom_range(0,1)
			scr_enemy_zerwerk_attack_choose(_atk);
			if (walk_snd_delay <= 0)
			{
				walk_snd_delay = 15;
				audio_sound_gain(walk_snd,global.volumeEffects,1);
				audio_play_sound(walk_snd,1,0);
			}
			script_execute(EnemyAnimation);
		}
		if (attack_timer > 0)
		{
			if (attack_timer < 60)
			{
				script_execute(EnemyChase);
				script_execute(EnemyAnimation);
			}
			else
			{
				sprite_index = spr_enemy_bossZerwerk_rest;
				script_execute(EnemyAnimation1);
			}
		}
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
		{
			aggro_drop = aggro_drop - 1;
		}
	}
	
	//Animation
	
}
else path_end();
}
//
//
//
//
//
//Zerwerk Attack Choose
function scr_enemy_zerwerk_attack_choose(attack_chose){
if (point_in_circle(obj_player.x,obj_player.y,x,y,32)) 
{
	walk_snd_delay = 15;
	switch (attack_chose)
	{
		case 0:
			path_end();
			sprite_index = enemy_idle;
			audio_sound_gain(snd_zerwerk_slash,global.volumeEffects,1);
			audio_play_sound(snd_zerwerk_slash,0,false);
			timer1 = 7;
			attack_counter = attack_counter + 1;
			timer2 = 23;
			entity_step = scr_enemy_zerwerk_taillash;
		break;
				
		case 1:
			path_end();
			sprite_index = enemy_idle;
			image_index = 0;
			audio_sound_gain(snd_zerwerk_slash,global.volumeEffects,1);
			audio_play_sound(snd_zerwerk_slash,0,false);
			timer1 = 7;
			attack_counter = attack_counter + 1;
			timer2 = 23;
			entity_step = scr_enemy_zerwerk_voidblade;
		break;
	}
}
else
{
	walk_snd_delay = 15;
	switch (attack_chose)
	{
		case 0:
			audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
			audio_play_sound(snd_zerwerk_voidRift,0,false);
			path_end();
			sprite_index = enemy_idle;
			timer1 = 30;
			timer2 = 23;
			attack_counter = attack_counter + 1;
			entity_step = scr_enemy_zerwerk_riftslash;
		break;
				
		case 1:
			audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
			audio_play_sound(snd_zerwerk_voidRift,0,false);
			path_end();
			sprite_index = enemy_idle;
			timer1 = 180;
			timer2 = 23;
			timer3 = 24;
			attack_counter = attack_counter + 1;
			entity_step = scr_enemy_zerwerk_riftslam_up;
		break;
	}
				
}
}
//
//
//
//
//
//Zerwerk Tail Lash
function scr_enemy_zerwerk_taillash(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_bossZerwerk_tailLash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_bossZerwerk_tailLash;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 70 + (9 * enemy_lvl);
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_tailLash)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		if (attack_counter <= 4) and (point_in_circle(obj_player.x,obj_player.y,x,y,128))
		{
			var _atk = irandom_range(0,1)
			scr_enemy_zerwerk_attack_choose(_atk);
			image_index = 0;
		}
		else
		{
			entity_step = home_state;
		}
		animation_end = false;
	}
}
}
//
//
//
//
//
//Zerwerk Void Blade
function scr_enemy_zerwerk_voidblade(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_bossZerwerk_voidBlade)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_bossZerwerk_voidBlade;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 65 + (9 * enemy_lvl);
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_voidBlade)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		if (attack_counter <= 4) and (point_in_circle(obj_player.x,obj_player.y,x,y,128))
		{
			var _atk = irandom_range(0,1)
			scr_enemy_zerwerk_attack_choose(_atk);
			image_index = 0;
		}
		else
		{
			entity_step = home_state;
		}
		animation_end = false;
	}
}
}
//
//
//
//
//
//Zerwerk Rift Slash
function scr_enemy_zerwerk_riftslash(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_bossZerwerk_riftSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_bossZerwerk_riftSlash;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
		
	}
	damage = 45 + (8 * enemy_lvl);
	
	if (timer1 <= 0)
	{
		timer1 = 120;
		audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
		audio_play_sound(snd_zerwerk_voidRift,0,false);
		with (instance_create_layer(x,y,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl
			home_state = scr_enemy_projectile_riftslash;
			entity_step = home_state;
			entity_drop = Idle;
			enemy_idle = spr_enemy_riftSlash;
			invincible = false;
			healthbar = false;
			bullet = true;
			inv_dur_timer = 0;
			shadow = 0;
			lit = true;
			light_size = 32;
			max_hp = 140;
			hp = max_hp;
			enemy_spd = 1.5;
			local_frame = 0;
			hit_by_attack = -1;
			timer1 = 42;
			timer2 = 54;
			x = obj_player.x;
			y = obj_player.y;
			speed = enemy_spd;
			fragment_count = 0;
			fragment = obj_fragFlesh;
			sprite_index = spr_enemy_shadow;
			bullet = false;
			hit_script = EntityHitNPC;
		}
	}
	
	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		if (attack_counter <= 4) and (point_in_circle(obj_player.x,obj_player.y,x,y,128))
		{
			var _atk = irandom_range(0,1)
			scr_enemy_zerwerk_attack_choose(_atk);
			image_index = 0;
		}
		else
		{
			entity_step = home_state;
		}
		animation_end = false;
	}
}
}
//
//
//
//
//
//Zerwerk Rift Slam Up
function scr_enemy_zerwerk_riftslam_up(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_bossZerwerk_riftSlamUp)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_bossZerwerk_riftSlamUp;
		local_frame = 0;
		image_index = 0;
	}
	if (timer3 <= 0)
	{
		passable = true;
	}
	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		attack_chose = irandom_range(0,1)
		if (attack_chose = 0) 
		{
			snd_timer = 48;
			timer2 = 23;
			timer3 = 60;
			entity_step = scr_enemy_zerwerk_riftslam_downA;
		}
		else
		{
			timer1 = 60;
			timer2 = 23;
			timer3 = 60;
			snd_timer = 48;
			entity_step = scr_enemy_zerwerk_riftslam_downB;
		}
	}
}
}
//
//
//
//
//
//Zerwerk Rift Slam (Down A)
function scr_enemy_zerwerk_riftslam_downA(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) //Following the Player (init 23)
	{
		x = obj_player.x;
		y = obj_player.y;
		timer2 = timer2 - 1;
	}
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer3 <= 0)
	{
		passable = false;
	}
	if (snd_timer > 0) snd_timer = snd_timer -1;
	if (snd_timer = 0)
	{
		audio_sound_gain(snd_zerwerk_riftSlam,global.volumeEffects,1);
		audio_play_sound(snd_zerwerk_riftSlam,0,false);
		audio_sound_gain(snd_zerwerk_fireball,global.volumeEffects,1);
		audio_play_sound(snd_zerwerk_fireball,0,false);
		snd_timer = 60;
	}
	if (sprite_index != spr_enemy_bossZerwerk_riftSlamDownA)
	{
		//Start Animation From Beginning
		
		sprite_index = spr_enemy_bossZerwerk_riftSlamDownA;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 115 + (15 * enemy_lvl);
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_riftSlamDownA)

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		passable = false;
		if (attack_counter <= 4) and (point_in_circle(obj_player.x,obj_player.y,x,y,128))
		{
			var _atk = irandom_range(0,1)
			scr_enemy_zerwerk_attack_choose(_atk);
			image_index = 0;
		}
		else
		{
			entity_step = home_state;
		}
		animation_end = false;
	}
}
	
}
//
//
//
//
//
//Zerwerk Rift Slam (Down A)
function scr_enemy_zerwerk_riftslam_downB(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) 
	{
		x = obj_player.x;
		y = obj_player.y;
		timer2 = timer2 - 1;
	}
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer3 <= 0)
	{
		passable = false;
	}
	if (snd_timer > 0) snd_timer = snd_timer -1;
	if (snd_timer = 0)
	{
		audio_play_sound(snd_zerwerk_riftSlam,0,false);
		audio_play_sound(snd_zerwerk_fireball,0,false);
		snd_timer = 60;
	}
	if (sprite_index != spr_enemy_bossZerwerk_riftSlamDownB)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_bossZerwerk_riftSlamDownB;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 60 + (9 * enemy_lvl);
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_riftSlamDownB)
	if (timer1 <= 0)
	{
		timer1 = 90;
		for (var i = 0; i < 5; i = i + 1)
		{
			with (instance_create_layer(x,y+8,"Instances",obj_enemy_projectile))
			{
				enemy_lvl = other.enemy_lvl;
				home_state = scr_enemy_projectile_voidcast;
				entity_step = home_state;
				entity_drop = Idle;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_enemy_voidCast;
				aggro_drop = 300;
				healthbar = false;
				bullet = true;
				enemy_spd = 1.8;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 75 + (11 * enemy_lvl)
				direction = (point_direction(x,y,obj_player.x,obj_player.y) - 44) + (i * 22);
				image_angle = direction;
				speed = enemy_spd;
				break_object = other.break_object;
				projectile_sprite = spr_enemy_voidCast;
				fragment_count = 6;
				fragment = obj_fragFire;
				bullet = true;
				hit_script = EntityHitDestroy;
			}
		}
	}
	

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		if (attack_counter <= 4) and (point_in_circle(obj_player.x,obj_player.y,x,y,128))
		{
			var _atk = irandom_range(0,1)
			scr_enemy_zerwerk_attack_choose(_atk);
			image_index = 0;
		}
		else
		{
			entity_step = home_state;
		}
		animation_end = false;
	}
}
	
}
//
//
//
//
//
//Zerwerk Drop
function scr_enemy_zerwerk_drop(){
var _objects = 6;
//var _dropBean = 250;
var _drop1 = irandom_range(0,99);
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
if (_drop1 >= 50) and (_drop1 < 100)//Random Rog Stone
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
if (_drop2 <= 10)
{
	with (instance_create_layer(x,y,"Instances",obj_itemPS))
	{
		item_id = other.enemy_lvl + 1;
		sprite_index = spr_powerstone_all;
		image_index = item_id;
		direction = (360/_objects * 6) + _angle;
		spd = .75 + (.3) + random(0.1);
	}
}
if (_drop2 > 10) and (_drop2 < 50)
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

//obj_inventory.yakflower_lair[4] = 1;
//if (obj_inventory.quest_grid[# 8, 3] = false)
//{
//	obj_inventory.quest_grid[# 8, 0] = true;
//	obj_inventory.quest_grid[# 8, 1] = obj_inventory.quest_grid[# 8, 2];
//	obj_inventory.quest_grid[# 8, 3] = true;
//	with (obj_text)
//	{
//		text_script = ZerwerkVictoryText;
//	}
//	obj_game.gamePaused = !obj_game.gamePaused;
//	obj_game.textPaused = !obj_game.textPaused;
//}

	
}
//
//
//
//
//
//Zerwerk Victory Text
function scr_text_zerwerk_victory(){

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
	text_string = "Zerwerk of Du-Belurne Defeated." 
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

	obj_inventory.beans = obj_inventory.beans + 1000;
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
//
//
//
//
//
////////Zerwerk Projectiles///////
//
//
//
//
//Zerwerk Void Cast Free
function scr_enemy_projectile_voidcast(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
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
			with (other) instance_destroy();
		}
	}
	
}
if (place_meeting(x,y,break_object)) instance_destroy();
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
//Rift Slash Tail Free
function scr_enemy_projectile_riftslash(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) 
	{
		timer1 = timer1 - 1;
		x = obj_player.x;
		y = obj_player.y;
	}
	if (timer1 <= 0)
	{
		speed = 0;
	}
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer2 <= 0)
	{
		audio_sound_gain(snd_zerwerk_slash,global.volumeEffects,1);
		audio_play_sound(snd_zerwerk_slash,0,false);
		timer2 = 60;
	}
	if (sprite_index != spr_enemy_riftSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_riftSlash;
		sprite_set_speed(sprite_index,12,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	//Cacluate Attack
	damage = 60 + (9 * enemy_lvl);
	EnemyAttackCalculate(spr_enemy_hitbox_riftSlash)

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		instance_destroy();
	}
}
else
{
	speed = 0;
}
}

