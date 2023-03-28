//Zerwerk Scripts
//
//
//
//
//
//Zerwerk Create
function BossZerwerkCreate(){
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = BossZerwerkFree;
entity_step = home_state;
entity_drop = BossZerwerkDrop;
enemy_idle = spr_enemy_bossZerwerk_idle;
enemy_move = spr_enemy_bossZerwerk_run;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = 2;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 870;
hp = max_hp;
boss = true;
name = "Zerwerk";
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
function BossZerwerkFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;

	//Toggle Aggro 
	if (targeted = false)
	{
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
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			walk_snd_delay = 15;
			path_end();
			sprite_index = enemy_idle;
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{
			walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					path_end();
					sprite_index = enemy_idle;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_zerwerk_slash,global.volumeEffects,1);
						audio_play_sound(snd_zerwerk_slash,0,false);
						timer1 = 7;
						attack_counter = attack_counter + 1;
						if (attack_counter >= 2)
						{
							attack_counter = 0;
							timer1 = 60;
						}
						timer2 = 23;
						entity_step = BossZerwerkTailLash;
					}
				break;
				
				case 1:
					path_end();
					sprite_index = enemy_idle;
					image_index = 0;
					if (timer1 <= 0)
					{
						audio_sound_gain(snd_zerwerk_slash,global.volumeEffects,1);
						audio_play_sound(snd_zerwerk_slash,0,false);
						timer1 = 7;
						attack_counter = attack_counter + 1;
						if (attack_counter >= 2)
						{
							attack_counter = 0;
							timer1 = 60;
						}
						timer2 = 23;
						entity_step = BossZerwerkVoidBlade;
					}
				break;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,128)) and (timer1 <= 0)
		{
			walk_snd_delay = 15;
			attack_chose = irandom_range(0,1)
			switch (attack_chose)
			{
				case 0:
					audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
					audio_play_sound(snd_zerwerk_voidRift,0,false);
					path_end();
					sprite_index = enemy_idle;
					timer1 = 120;
					timer2 = 23;
					attack_counter = 0;
					entity_step = BossZerwerkRiftSlash;
				break;
				
				case 1:
					audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
					audio_play_sound(snd_zerwerk_voidRift,0,false);
					path_end();
					sprite_index = enemy_idle;
					timer1 = 180;
					timer2 = 23;
					attack_counter = 0;
					entity_step = BossZerwerkRiftSlamUp;
				break;
			}
		}
		if (walk_snd_delay <= 0)
		{
			walk_snd_delay = 15;
			audio_sound_gain(walk_snd,global.volumeEffects,1);
			audio_play_sound(walk_snd,1,0);
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
//Zerwerk Tail Lash
function BossZerwerkTailLash(){
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
	damage = 65;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_tailLash)

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
//Zerwerk Tail Lash
function BossZerwerkVoidBlade(){
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
	damage = 65;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_voidBlade)

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
//Zerwerk Rift Slash
function BossZerwerkRiftSlash(){
if (obj_game.gamePaused = false)
{
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
	damage = 45;

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
		audio_play_sound(snd_zerwerk_voidRift,0,false);
		with (instance_create_layer(x,y,"Instances",obj_enemy))
		{
			script_execute(RiftSlashTailCreate);
			x = obj_player.x;
			y = obj_player.y;
			speed = enemy_spd;
			fragment_count = 0;
			fragment = obj_fragFlesh;
			sprite_index = spr_enemy_shadow;
			bullet = false;
			hit_script = EntityHitNPC;
		}
		attack_counter = attack_counter + 1;
		if (attack_counter >= 3)
		{
			attack_counter = 0;
			entity_step = home_state;
			animation_end = false;
		}
	}
}
}
//
//
//
//
//
//Zerwerk Rift Slam Up
function BossZerwerkRiftSlamUp(){
if (obj_game.gamePaused = false)
{
	//if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_bossZerwerk_riftSlamUp)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_bossZerwerk_riftSlamUp;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		attack_chose = irandom_range(0,1)
		if (attack_chose = 0) 
		{
			snd_timer = 48;
			entity_step = BossZerwerkRiftSlamDownA;
		}
		else
		{
			timer1 = 60;
			snd_timer = 48;
			entity_step = BossZerwerkRiftSlamDownB;
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
function BossZerwerkRiftSlamDownA(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) //Following the Player (init 23)
	{
		x = obj_player.x;
		y = obj_player.y;
		timer2 = timer2 - 1;
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
	damage = 115;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_riftSlamDownA)

	//Animate
	EnemyAnimation1();
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
//Zerwerk Rift Slam (Down A)
function BossZerwerkRiftSlamDownB(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) 
	{
		x = obj_player.x;
		y = obj_player.y;
		timer2 = timer2 - 1;
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
	damage = 60;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_hitbox_riftSlamDownB)
	if (timer1 <= 0)
	{
		timer1 = 90;
		for (var i = 0; i < 3; i = i + 1)
		{
			with (instance_create_layer(x,y+8,"Instances",obj_enemy_projectile))
			{
				VoidCastCreate(75);
				direction = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-22,22);
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
//Zerwerk Drop
function BossZerwerkDrop(){
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
		item_id = 1;
		amount = 5;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 0) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 3;
		amount = 3;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop3 > 0) 
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
obj_inventory.yakflower_lair[4] = 1;
if (obj_inventory.quest_grid[# 8, 3] = false)
{
	obj_inventory.quest_grid[# 8, 0] = true;
	obj_inventory.quest_grid[# 8, 1] = obj_inventory.quest_grid[# 8, 2];
	obj_inventory.quest_grid[# 8, 3] = true;
	with (obj_text)
	{
		text_script = ZerwerkVictoryText;
	}
	obj_game.gamePaused = !obj_game.gamePaused;
	obj_game.textPaused = !obj_game.textPaused;
}

	
}
//
//
//
//
//
//Zerwerk Victory Text
function ZerwerkVictoryText(){

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






