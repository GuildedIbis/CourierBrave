//Enemy Acolyte
//
//
//
//
//
//Acolyte Create
function scr_enemy_acolyte_create(){

sound = snd_npc_mouse;
timer1 = 40;
idle_sprite = spr_enemy_acolyte_idle;
scene = false;
sprite_index = idle_sprite;
image_speed = 0;


//
home_state = scr_enemy_acolyte_free;
entity_step = scr_enemy_acolyte_scene_step;
entity_drop = scr_enemy_acolyte_drop;
bullet = false;
healthbar = true;
enemy_idle = spr_enemy_acolyte_idle;
enemy_move = spr_enemy_acolyte_run;
enemy_damaged = spr_enemy_skirmisher_damaged;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = true;
shadow_size = 1;
lit = false;
light_size = 32;
targeted = false;
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
sprite_index = enemy_idle;
image_speed = 0;
direction = 180;
form_type = 0;
max_hp = 900 + (105 * enemy_lvl);
hp = max_hp;
enemy_spd = 1.5;
local_frame = 0;
hit_by_attack = -1;
timer1 = 0;
timer2 = 0;
timer3 = 0;
walk_snd_delay = 0;
path = -1;

if (obj_inventory.quest_grid[# 1, 3] = true)
{
	instance_destroy();
}
}
//
//
//
//
//
//Acolyte Scene 1 Step
function scr_enemy_acolyte_scene_step(){
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	if (obj_game.gamePaused = false)
	{
		entity_step = scr_enemy_acolyte_free;
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_index = _cardinalDir;
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			if (other.activate_script != -1) text_script = other.activate_script;
			if (other.activate_args != -1) quest_num = other.activate_args;
		}
		if (activate_script != -1)
		{
			obj_game.gamePaused = true;
			obj_game.textPaused = true;
			if (obj_game.gamePaused)
			{
				with (all)
				{
					game_paused_image_speed = image_speed;
					image_speed = 0;
				}
			}
			else
			{
				with (all)
				{
					image_speed = game_paused_image_speed;
				}
			}
		}
	}
}

}
//
//
//
//
//
//
//Acolyte Scene
function scr_enemy_acolyte_free(){
if (obj_game.gamePaused = false)
{
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	
	
	//Toggle Aggro 
	if (targeted = false)
	{
		lit = false;
		if (point_in_rectangle(obj_player.x, obj_player.y,x-64,y-64,x+64,y+64)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			EnemyAlert();
			aggro_drop = 300;
			targeted = true;
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
		lit = true;
		if (timer1 <= 0) script_execute(EnemyChase);
		if (point_in_rectangle(obj_player.x,obj_player.y,x-12,y-12,x+12,y+12))
		{
			path_end();
			walk_snd_delay = 15;
			sprite_index = enemy_idle;
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
//Gorog Captain Drop
function scr_enemy_acolyte_drop(){

var _objects = 7;
//var _dropBean = 150;
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
if (_drop1 < 40)//Form Specific Rog Stone
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
if (_drop1 >= 40) and (_drop1 < 80)//Random Rog Stone
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
if (_drop2 <= 5)
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
if (_drop2 > 5) and (_drop2 < 25)
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

//Complete Quest
obj_inventory.quest_grid[# 1, 0] = true;
obj_inventory.quest_grid[# 1, 1] = obj_inventory.quest_grid[# 1, 2];
obj_inventory.quest_grid[# 1, 3] = true;
	//with (obj_text)
	//{
	//	text_script = ZerwerkVictoryText;
	//}
	//obj_game.gamePaused = !obj_game.gamePaused;
	//obj_game.textPaused = !obj_game.textPaused;


}



//Text
//
//
//
//
//
//Necromancer Scene 1 Text
function scr_text_acolyte_scene(){


draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "The Acolyte"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Greetings Courier." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "It is truly an honor to meet you, Captain of\nOmlio Couriers."
	_SubString = string_copy(text_string,1,letter_counter);
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	//DrawAlterMenu(obj_player.magic_id,obj_inventory);
	//DrawSellMenu(obj_inventory);
	//DrawBuyMenu();
	//DrawSelectedMenu(obj_inventory);
}
if (string_counter = 2)
{
	speaker = 1;
	text_string = "If you are here it is to bring me to justice...\nI am sorry for the destruction I have caused here,\nbut I cannot abandon my mission."
	_SubString = string_copy(text_string,1,letter_counter);
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	//DrawAlterMenu(obj_player.magic_id,obj_inventory);
	//DrawSellMenu(obj_inventory);
	//DrawBuyMenu();
	//DrawSelectedMenu(obj_inventory);
}
if (string_counter = 3)
{
	speaker = 1;
	text_string = "Soon I will fulfill my purpose\nand I cannot let you stand in my way."
	_SubString = string_copy(text_string,1,letter_counter);
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	//DrawAlterMenu(obj_player.magic_id,obj_inventory);
	//DrawSellMenu(obj_inventory);
	//DrawBuyMenu();
	//DrawSelectedMenu(obj_inventory);
}
if (string_counter = 4)
{
	speaker = 1;
	text_string = "With deepest respect Courier. . ."
	_SubString = string_copy(text_string,1,letter_counter);
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	//DrawAlterMenu(obj_player.magic_id,obj_inventory);
	//DrawSellMenu(obj_inventory);
	//DrawBuyMenu();
	//DrawSelectedMenu(obj_inventory);
}
if (string_counter >= 5)
{
	//text_script = NismaMenu;
	obj_inventory.quest_grid[# 1, 0] = true;
	obj_inventory.quest_grid[# 1, 1] = 1;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Reset Buy/Sell Menu
	text_gui = 0
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
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_nisma36,0,258+6,136+6);

}