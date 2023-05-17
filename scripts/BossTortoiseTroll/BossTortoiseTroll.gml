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
entity_step = home_state;
entity_drop = BossTortoiseTrollDrop;
enemy_idle = spr_enemy_tortoiseTroll_idle;
enemy_move = spr_enemy_tortoiseTroll_run;
damaged_snd = snd_rat_damaged;
walk_snd = snd_walk_regular;
shadow = 2;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
max_hp = 1250;
hp = max_hp;
boss = true;
name = "Tortoise Troll";
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
						entity_step = BossTortoiseTrollHammerSlam;
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
						entity_step = BossTortoiseTrollHammerSlam;
					}
				break;
			}
		}
		if (point_in_circle(obj_player.x,obj_player.y,x,y,128)) and (timer1 <= 0)
		{
			//walk_snd_delay = 15;
			//attack_chose = irandom_range(0,1)
			//switch (attack_chose)
			//{
			//	case 0:
			//		audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
			//		audio_play_sound(snd_zerwerk_voidRift,0,false);
			//		path_end();
			//		sprite_index = enemy_idle;
			//		timer1 = 120;
			//		timer2 = 23;
			//		attack_counter = 0;
			//		entity_step = BossTortoiseTrollHammerSlam;
			//	break;
				
			//	case 1:
			//		audio_sound_gain(snd_zerwerk_voidRift,global.volumeEffects,1);
			//		audio_play_sound(snd_zerwerk_voidRift,0,false);
			//		path_end();
			//		sprite_index = enemy_idle;
			//		timer1 = 180;
			//		timer2 = 23;
			//		attack_counter = 0;
			//		entity_step = BossTortoiseTrollHammerSlam;
			//	break;
			//}
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
	EnemyAttackCalculate(spr_enemy_tortoiseTroll_hammerLunge_hitbox)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		entity_step = BossTortoiseTrollHammerLunge;
		animation_end = false;
		timer2 = 12;
		hor_spd = 0;
		ver_spd = 0;
		direction = (point_direction(x,y,obj_player.x,obj_player.y));
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
		hor_spd = lengthdir_x(3,direction);
		ver_spd = lengthdir_y(3,direction);
	}
	
	var _collided = EnemyCollision();

	//Animate
	EnemyAnimation();
	if (animation_end) or (_collided = true)
	{
		speed = 0;
		timer1 = 120;
		timer2 = 120;
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






