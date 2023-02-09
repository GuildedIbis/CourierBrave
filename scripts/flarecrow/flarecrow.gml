//Flare Crow
//
//
//
//
//
//Flare Crow Tnaks Create
function FlareCrowTnaksCreate(){
home_state = FlareCrowFree;
entity_step = home_state;
entity_drop = FlareCrowTnaksDrop;
enemy_idle = spr_enemy_flareCrow_idle;
enemy_move = spr_enemy_flareCrow_run;
enemy_damaged = spr_enemy_flareCrow_damaged;
damaged_snd = snd_rat_damaged;
shadow = 1;
targeted = false;
invincible = false;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 400;
hp = max_hp;
boss = true;
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
//Flare Crow Obor Create
function FlareCrowOborCreate(){
home_state = FlareCrowFree;
entity_step = home_state;
entity_drop = FlareCrowOborDrop;
enemy_idle = spr_enemy_flareCrow_idle;
enemy_move = spr_enemy_flareCrow_run;
enemy_damaged = spr_enemy_flareCrow_damaged;
damaged_snd = snd_rat_damaged;
shadow = 1;
targeted = false;
invincible = false;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 400;
hp = max_hp;
boss = true;
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
//Flare Crow Create
function FlareCrowRooshiiCreate(){
home_state = FlareCrowFree;
entity_step = home_state;
entity_drop = FlareCrowRooshiiDrop;
enemy_idle = spr_enemy_flareCrow_idle;
enemy_move = spr_enemy_flareCrow_run;
enemy_damaged = spr_enemy_flareCrow_damaged;
damaged_snd = snd_rat_damaged;
shadow = 1;
targeted = false;
invincible = false;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 400;
hp = max_hp;
boss = true;
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
//Flare Crow Free State
function FlareCrowFree(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			aggro_drop = 300;
			targeted = true;
			global.aggroCounter = global.aggroCounter + 1;
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
	}
	
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
				audio_play_sound(snd_slash01,0,false);
				timer1 = 180;
				timer2 = 23;
				entity_step = FlareCrowFireStrike;
				
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
			if (timer1 <= 0) 
			{
				audio_play_sound(snd_slash01,0,false);
				direction =  point_direction(x,y,obj_player.x,obj_player.y);
				timer1 = 180;
				timer2 = 23;
				entity_step = FlareCrowCinderDash;
				
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
//Flare Crow Fire Strike State
function FlareCrowFireStrike(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_flareCrow_fireStrike)
	{
		//Start Animation From Beginning
		direction =  point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_flareCrow_fireStrike;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 80;
	//Cacluate Attack
	EnemyAttackCalculateAblaze(spr_enemy_flareCrow_fireStrike_hitbox,7)

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
//Flare Crow Cinder Dash
function FlareCrowCinderDash(){
if (obj_game.gamePaused = false)
{
	
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer2 <= 0)	speed = 2.5;
	if (sprite_index != spr_enemy_flareCrow_cinderDash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_flareCrow_cinderDash;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 70;
	//Cacluate Attack
	EnemyAttackCalculateAblaze(spr_enemy_flareCrow_cinderDash_hitbox,7);
	
	//Check for entities
	if (place_meeting(x + speed, y, obj_entity)) or (place_meeting(x - speed, y, obj_entity))
	{speed = 0}
	if (place_meeting(x, y + speed, obj_entity)) or (place_meeting(x, y - speed, obj_entity))
	{speed = 0}
	
	
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
//Tnaks Drop
function FlareCrowTnaksDrop(){
if (obj_inventory.quest_grid[# 3, 3] = false)
{
	obj_inventory.quest_grid[# 3, 0] = true;
	obj_inventory.quest_grid[# 3, 1] = 1;
	obj_inventory.quest_grid[# 3, 3] = true;
	obj_inventory.map_grid[# 0, 1] = true;
}
var _objects = 2;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)
var _angle = random(360);


if (_drop1 > 25) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 1;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects;
		spd = .75 + (.3) + random(0.1);
	}
	
}
if (_drop2 > 25) 
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = 3;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 2;
		spd = .75 + (.3) + random(0.1);
	}
	
}
//else instance_create_layer(x,y,"Instances",_objects[0])
obj_inventory.weapon_grid[# 1 ,3] = true;
with (obj_text)
{
	text_script = FlameCrowTnaksVictoryText;
}
obj_game.gamePaused = !obj_game.gamePaused;
obj_game.textPaused = !obj_game.textPaused;

}
//
//
//
//
//
//Obor Drop
function FlareCrowOborDrop(){
if (obj_inventory.quest_grid[# 4, 3] = false)
{
	obj_inventory.quest_grid[# 4, 0] = true;
	obj_inventory.quest_grid[# 4, 1] = 1;
	obj_inventory.quest_grid[# 4, 3] = true;
	obj_player.max_crull_stone = obj_player.max_crull_stone + 1;
	obj_player.crull_stone = obj_player.crull_stone + 1;
}
var _objects = 3;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)
var _drop3 = irandom_range(0,99)
var _angle = random(360);


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
//else instance_create_layer(x,y,"Instances",_objects[0])
obj_inventory.weapon_grid[# 1 ,3] = true;
with (obj_text)
{
	text_script = FlameCrowOborVictoryText;
}
obj_game.gamePaused = !obj_game.gamePaused;
obj_game.textPaused = !obj_game.textPaused;

}
//
//
//
//
//
//Rooshii Drop
function FlareCrowRooshiiDrop(){
if (obj_inventory.quest_grid[# 5, 3] = false)
{
	obj_inventory.quest_grid[# 5, 0] = true;
	obj_inventory.quest_grid[# 5, 1] = 1;
	obj_inventory.quest_grid[# 5, 3] = true;
	//flame weapon
}
var _objects = 3;
var _drop1 = irandom_range(0,99)	
var _drop2 = irandom_range(0,99)
var _drop3 = irandom_range(0,99)
var _angle = random(360);


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
//else instance_create_layer(x,y,"Instances",_objects[0])
obj_inventory.weapon_grid[# 1 ,3] = true;
with (obj_text)
{
	text_script = FlameCrowRooshiiVictoryText;
}
obj_game.gamePaused = !obj_game.gamePaused;
obj_game.textPaused = !obj_game.textPaused;

}
//
//
//
//
//
//Tnaks Victory Text
function FlameCrowTnaksVictoryText(){

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
	text_string = "Flare Crow Tnaks Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "REWARD:\n250 Beans\nLenko Map Unlocked"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 2)
{

	obj_player.beans = obj_player.beans + 250;
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
//Obor Victory Text
function FlameCrowOborVictoryText(){

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
	text_string = "Flare Crow Obor Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "REWARD:\n250 Beans\n1x Crull Stone"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 2)
{

	obj_player.beans = obj_player.beans + 250;
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
//Obor Victory Text
function FlameCrowRooshiiVictoryText(){

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
	text_string = "Flare Crow Obor Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "REWARD:\n250 Beans\nBelurne Flame Unlocked"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 2)
{

	obj_player.beans = obj_player.beans + 250;
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






