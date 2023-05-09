//Endire Knight Inimar
//
//
//
//
//
//Endire Inimar Create
function EndireKnightInimarCreate(){
home_state = EndireKnightInimarFree;
entity_step = home_state;
entity_drop = EndireKnightInimarDrop;
enemy_idle = spr_enemy_endireKnight_idle;
enemy_move = spr_enemy_endireKnight_run;
enemy_damaged = spr_enemy_endireKnight_damaged;
damaged_snd = snd_endireKnight_damaged;
walk_snd = snd_walk_regular;
shadow = 1;
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
aggro_drop = 400;
sprite_index = enemy_idle;
image_speed = 0;
var _startDir = irandom_range(0,3);
direction = _startDir * 90;
max_hp = 700;
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
}
	//
//
//
//
//
//Endire Knight Free State
function EndireKnightInimarFree(){
if (obj_game.gamePaused = false)
{
	//Timers and counters
	if (timer1 > 0) timer1 = timer1 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	if (attack_counter > 2)
	{ 
		timer1 = 180;
		attack_counter = 0;
	}
	
	
	//Toggle Aggro On
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
		
		script_execute(EnemyChase);
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) path_end();
		walk_snd_delay = walk_snd_delay - 1;
		if (timer1 <= 0) and (attack_counter <= 2)
		{
			if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) //Heatwave
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				direction =  point_direction(x,y,obj_player.x,obj_player.y);
				timer2 = 40;
				attack_counter = attack_counter + 1;
				entity_step = EndireKnightHeatwave;
			}
			if (point_in_circle(obj_player.x,obj_player.y,x,y,48)) //Cinder Dash
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				direction =  point_direction(x,y,obj_player.x,obj_player.y);
				timer2 = 23;
				entity_step = EndireKnightCinderDash;
			}
			if (point_in_circle(obj_player.x,obj_player.y,x,y,24)) //Firestrike
			{
				path_end();
				walk_snd_delay = 15;
				sprite_index = enemy_idle;
				audio_sound_gain(snd_slash01,global.volumeEffects,1);
				audio_play_sound(snd_slash01,0,false);
				timer2 = 23;
				entity_step = EndireKnightInimarFireStrike;
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
	script_execute(EnemyAnimation);
}
else path_end();
}
//
//
//
//
//
//Endire Knight Inimar Fire Strike State
function EndireKnightInimarFireStrike(){
if (obj_game.gamePaused = false)
{
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_enemy_endireKnight_fireStrike)
	{
		//Start Animation From Beginning
		direction =  point_direction(x,y,obj_player.x,obj_player.y);
		sprite_index = spr_enemy_endireKnight_fireStrike;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_endireKnight_fireStrike,global.volumeEffects,1);
		audio_play_sound(snd_endireKnight_fireStrike,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 90;
	//Cacluate Attack
	EnemyAttackCalculateAblaze(spr_enemy_endireKnight_fireStrike_hitbox,7)

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
//Inimar Victory Text
function EndireKnightInimarVictoryText(){

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
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);

}