//Endire Knight Inimar
//
//
//
//
//
//Endire Inimar Create
function scr_enemy_endire_inimar_create(){
home_state = scr_enemy_endire_inimar_free;
entity_step = home_state;
entity_drop = scr_enemy_endire_inimar_drop;
enemy_idle = spr_enemy_endireKnight_inimar_idle;
enemy_move = spr_enemy_endireKnight_inimar_run;
enemy_damaged = spr_enemy_endireKnight_inimar_damaged;
damaged_snd = snd_endireKnight_damaged;
walk_snd = snd_walk_regular;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
aggro_drop = 400;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
form_type = 3;
max_hp = 550 + (280 * enemy_lvl);
hp = max_hp;
boss = true;
name = "Endire Knight Inimar";
enemy_spd = 1.2;
local_frame = 0;
hit_by_attack = -1
attack_counter = 0;
timer1 = 0;
timer2 = 0;
timer3 = 0;
walk_snd_delay = 0;
path = -1;
target_x = 0;
target_y = 0;
projectile_dir = 0;
}
	//
//
//
//
//
//Endire Knight Free State
function scr_enemy_endire_inimar_free(){
if (obj_game.gamePaused = false)
{
	//Timers and counters
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = scr_enemy_damaged;
	if (attack_counter > 2)
	{ 
		timer1 = 180;
		attack_counter = 0;
	}
	
	
	//Toggle Aggro On
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
	
	//Toggle Aggro Off
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
		scr_enemy_chase();
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) path_end();
		walk_snd_delay = walk_snd_delay - 1;
		if (timer1 <= 0) and (attack_counter <= 2)
		{
			if (point_in_circle(obj_player.x,obj_player.y,x,y,24))
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				timer2 = 48;
				entity_step = scr_enemy_endire_inimar_fireStrike;
			}
			if (!point_in_circle(obj_player.x,obj_player.y,x,y,24))
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				target_x = obj_player.x;
				target_y = obj_player.y;
				direction =  point_direction(x,y,target_x,target_y);
				projectile_dir = irandom_range(0,360);
				timer2 = 24;
				timer3 = 24;
				entity_step = scr_enemy_endire_inimar_heatacer;
			}
			if (!point_in_circle(obj_player.x,obj_player.y,x,y,64))
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				direction =  point_direction(x,y,obj_player.x,obj_player.y);
				timer2 = 23;
				entity_step = scr_enemy_endire_inimar_cinderDash;
			}
				
		}
		if (walk_snd_delay <= 0)
		{
			walk_snd_delay = 15;
			audio_play_sound(walk_snd,1,0);
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
//Endire Knight Inimar Fire Strike State
function scr_enemy_endire_inimar_fireStrike(){
if (obj_game.gamePaused = false)
{
	speed = 0;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_endireKnight_inimar_fireStrike)
	{
		//Start Animation From Beginning
		direction =  point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_endireKnight_inimar_fireStrike;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_fireStrike,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_fireStrike,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 70 + (12 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_fireStrike_hitbox,7)

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		timer1 = 0;
		attack_counter = attack_counter + 1;
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
//Endire Knight Cinder Dash
function scr_enemy_endire_inimar_cinderDash(){
if (obj_game.gamePaused = false)
{
	
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer2 <= 0) speed = 3;
	if (sprite_index != spr_enemy_endireKnight_inimar_cinderDash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_endireKnight_inimar_cinderDash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_cinderDash,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_cinderDash,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80 + (12 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_cinderDash_hitbox,7);
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	
	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		timer1 = 0;
		attack_counter = attack_counter + 1;
		entity_step = home_state;
		animation_end = false;
	}
}
else{
	speed = 0;
}
}
//
//
//
//
//
//Endire Knight Heatwave
function scr_enemy_endire_inimar_heatwave(){
if (obj_game.gamePaused = false)
{
	
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_endireKnight_inimar_heatwave)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_endireKnight_inimar_heatwave;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_heatwave,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_heatwave,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 60 + (10 * enemy_lvl);
	if (timer2 <= 0)
	{
		timer2 = 60;
		for (var i = 0; i < 3; i = i + 1)
		{
			audio_sound_gain(snd_endireKnight_heatwave_proj,global.volumeEffects,1);
			audio_play_sound(snd_endireKnight_heatwave_proj,0,false);
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				enemy_lvl = other.enemy_lvl;
				scr_projectile_heatwave_create();
				direction = point_direction(x,y,obj_player.x,obj_player.y) + (20 * i);
				image_angle = direction
				speed = 1.1;
				damage = 40;
				break_object = other.break_object;
				fragment_count = 3;
				fragment = obj_fragPlant;
				lit = true;
				light_size = 16;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
			}
		}
	}
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_heatwave_hitbox,7);
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	
	//Animate
	scr_enemy_animation_one();
	if (animation_end)
	{
		attack_counter = attack_counter + 1;
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
//Endire Knight Heatwave
function scr_enemy_endire_inimar_heatacer(){
if (obj_game.gamePaused = false)
{
	
	if (timer2 > 0)
	{
		timer2 = timer2 - 1;
		//speed = 2;
	}
	if (timer3 > 0)
	{
		timer3 = timer3 - 1;
	}
	if (sprite_index != spr_enemy_endireKnight_inimar_heatwave)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_endireKnight_inimar_heatwave;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_heatwave,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_heatwave,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 65 + (11 * enemy_lvl);
	if (timer2 <= 0) 
	{
		speed = 0;
		timer2 = 12;
		audio_sound_gain(snd_endireKnight_heatwave_proj,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_heatwave_proj,0,false);
		for (var i = 0; i < 4; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				enemy_lvl = other.enemy_lvl;
				scr_projectile_heatwave_create();
				direction = other.projectile_dir + (90 * i);
				image_angle = direction;
				speed = 1.1;
				timer1 = irandom_range(0,29);
				break_object = other.break_object;
				lit = true;
				light_size = 16;
				fragment_count = 3;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = scr_entity_hit_destroy();
			}
			
		}
	}
	if (timer3 <= 0)
	{
		timer3 = 12
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			enemy_lvl = other.enemy_lvl;
			scr_projectile_heatacer_create();
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = 1.1;
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragPlant;
			lit = true;
			light_size = 16;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
		}
	}
	//Cacluate Attack
	scr_enemy_attack_calculate_ablaze(spr_enemy_endireKnight_heatwave_hitbox,7);
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	//Stop at center
	if (point_distance(x,y,target_x,target_y) <= 8) speed = 0;
	
	//Animate
	scr_enemy_animation_one();
	if (animation_end)
	{
		speed = 0;
		timer1 = 60;
		attack_counter = attack_counter + 1;
		entity_step = home_state;
		animation_end = false;
	}
}
else{
	speed = 0;
}
}
//
//
//
//
//
//Inimar Drop
function scr_enemy_endire_inimar_drop(){

var _objects = 7;
//var _dropBean = 400;
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
if (_drop1 < 25)//Form Specific Rog Stone
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
if (_drop1 >= 25) and (_drop1 < 50)//Random Rog Stone
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
if (_drop2 < 50)
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
//else instance_create_layer(x,y,"Instances",_objects[0])
if (obj_inventory.form_grid[# 13, 3] = false)
{
	obj_inventory.quest_grid[# 13, 0] = true;
	obj_inventory.quest_grid[# 13, 1] = 1;
	obj_inventory.quest_grid[# 13, 3] = true;
	//with (obj_text)
	//{
	//	text_script = EndireKnightGhafateVictoryText;
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
//Inimar Victory Text
function xEndireKnightInimarVictoryText(){

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
	text_string = "Endire Knight Inimar Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "REWARD:\n250 Beans\nEndire's Flame Unlocked"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 2)
{

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