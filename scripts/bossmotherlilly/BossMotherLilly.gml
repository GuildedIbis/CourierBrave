//Mother Lily Scripts
//
//
//
//
//
//MOther Lily Create
function BossMotherLilyCreate(){
name = "Mother Lily"
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = BossMotherLilyFree;
entity_step = home_state;
entity_drop = BossMotherLilyDrop;
enemy_idle = spr_enemy_motherLily;
enemy_move = spr_enemy_motherLily_move;
damaged_snd = snd_motherLily_damaged;
walk_snd = snd_walk_water;
shadow = 2;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 950;
hp = max_hp;
boss = true;
enemy_spd = 1.1;
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
//Mother Lily Free
function BossMotherLilyFree(){
if (obj_game.gamePaused = false)
{
	
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;

	//While Aggro if off
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
		}
	}
	
	//When Aggro is switched off
	if (aggro_drop <= 0)
	{
		image_speed = 0;
		sprite_index = enemy_idle;
		path_end();
		aggro_drop = 300;
		targeted = false;
		global.aggroCounter = global.aggroCounter - 1;
	}
	
	//Vulnerable State after 3 attacks
	if (attack_counter >= 3)
	{
		entity_step = BossMotherLilyExposed;
	}
	
	//While Aggro is on
	if (targeted = true) and (attack_counter < 3)
	{
		script_execute(EnemyChase);
		walk_snd_delay = walk_snd_delay - 1;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			walk_snd_delay = 45;
			path_end();
			sprite_index = enemy_idle;
		}
		
		//Slash Attack
		if (point_in_circle(obj_player.x,obj_player.y,x,y,32)) and (timer1 <= 0)
		{
			walk_snd_delay = 15;
			path_end();
			sprite_index = enemy_idle;
			audio_sound_gain(snd_motherLily_leafSlash,global.volumeEffects,1);
			audio_play_sound(snd_motherLily_leafSlash,0,false);
			attack_counter = attack_counter + 1;
			timer1 = 23;
			entity_step = BossMotherLilyLeafSlash;
		}
		
		//Razer Sprout: Circle of Green Projectiles
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (timer1 <= 0)
		{
			walk_snd_delay = 15;
			path_end();
			sprite_index = enemy_idle;
			attack_counter = attack_counter + 1;
			timer1 = 23;
			entity_step = BossMotherLilyRazerSprout;
		}
		
		//Vice Bomb: Large Fast Bubble that inflicts Watervice
		if (point_in_circle(obj_player.x,obj_player.y,x,y,128)) and (timer1 <= 0)
		{
			walk_snd_delay = 15;
			attack_counter = attack_counter + 1;
			audio_sound_gain(snd_motherLily_viceBomb,global.volumeEffects,1);
			audio_play_sound(snd_motherLily_viceBomb,0,false);
			path_end();
			sprite_index = enemy_idle;
			timer1 = 23;
			entity_step = BossMotherLilyViceBomb;
		}
		
		//Walk Sound
		if (walk_snd_delay <= 0)
		{
			walk_snd_delay = 60;
			audio_play_sound(walk_snd,1,0);
			with (instance_create_layer(x,y,"Instances",obj_effect))
			{
				sprite_index = spr_enemy_motherLily_viceEffect;
				effect_script = EffectWaterVice;
				image_xscale = choose(-1,1);
				image_yscale = choose(-1,1);
				image_angle = irandom_range(0,360);
				image_speed = 1;
			}
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
//Mother Lily Right Slash 
function BossMotherLilyLeafSlash(){
if (obj_game.gamePaused = false)
{
	invincible = false;
	if (timer1 > 0) timer1 = timer1 - 1;
	if (sprite_index != spr_enemy_motherLily_leafSlash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_leafSlash;
		sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 55;
	//Cacluate Attack
	EnemyAttackCalculate(spr_enemy_motherLily_leafSlash_hitbox)

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
//Mother Lily Left Slash 
function BossMotherLilyRazerSprout(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (sprite_index != spr_enemy_motherLily_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_cast;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 40;
	

	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		var _dir = irandom_range(0,359);
		audio_sound_gain(snd_motherLily_razerSprout,global.volumeEffects,1);
		audio_play_sound(snd_motherLily_razerSprout,0,false);
		for (var i = 0; i < 8; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				script_execute(RazerSproutCreate);
				break_object = other.break_object;
				fragment_count = 3;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = EntityHitDestroy;
				speed = enemy_spd;
				direction = _dir + (45 * i)
				if (i > 3) image_xscale = -1;
				speed = enemy_spd;
			}
		}
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
//Mother Lily Vice Bomb 
function BossMotherLilyViceBomb(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (sprite_index != spr_enemy_motherLily_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_cast;
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
		audio_play_sound(snd_viceBubble,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = ViceBombFree;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_enemy_trapLily_viceBubble32;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 4.0
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWater;
			bullet = true;
			hit_script = EntityHitDestroy;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
		}
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
//Trap Lily Exposed
function BossMotherLilyExposed(){
attack_counter = 0;
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	invincible = false;
	if (sprite_index != spr_enemy_motherLily_exposed)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_exposed;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	//Animate
	EnemyAnimation1();
	if (animation_end)
	{
		timer1 = 120;
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
//Effect Water Vice
function EffectWaterVice(){
damage = 5 + obj_player.might;
if (sprite_index != spr_enemy_motherLily_viceEffect)
{
	sprite_index = spr_enemy_motherLily_viceEffect;
	image_speed = 1;
	image_index = 0;
}
if (place_meeting(x,y,obj_player))
{
	audio_play_sound(snd_viceBubble_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			watervice_dur_timer = 120;
			audio_play_sound(snd_player_hit,0,false);
			flash = .35;
			hp = hp - other.damage;
			with (other) instance_destroy();
		}
	}
}
}
//
//
//
//
//
//Mother Lily Drop
function BossMotherLilyDrop(){
var _objects = 3;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)
var _drop3 = irandom_range(0,99)
var _angle = random(360);


if (_drop1 > 0) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 2;
		amount = 1;
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
		item_id = 4;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop3 > 50) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 16;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 3;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])
if (obj_inventory.quest_grid[# 8, 3] = false)
{
	obj_player.beans = obj_player.beans + 1000;
	obj_inventory.habraf_lair[4] = 1;
	obj_inventory.quest_grid[# 8, 0] = true;
	obj_inventory.quest_grid[# 8, 1] = 3;
	obj_inventory.quest_grid[# 8, 3] = true;
	//obj_inventory.form_grid[# 1, 4] = true;
	//with (obj_text)
	//{
	//	text_script = MotherLilyVictoryText;
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
//MotherLily Victory Text
function MotherLilyVictoryText(){

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
	text_string = "Mother Lily Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "REWARD:\n1000 Beans"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 2)
{

	obj_player.beans = obj_player.beans + 1000;
	obj_inventory.habraf_lair[4] = 1;
	obj_inventory.quest_grid[# 8, 1] = 4;
	obj_inventory.quest_grid[# 8, 3] = true;
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






