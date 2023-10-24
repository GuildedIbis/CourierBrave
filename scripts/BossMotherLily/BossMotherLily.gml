//Mother Lily Scripts
//
//
//
//
//
//Mother Lily Create
function scr_enemy_mother_lily_create(){
name = "Mother Lily"
targeted = false;
invincible = false;
bullet = false;
healthbar = true;
inv_dur_timer = 0;
home_state = scr_enemy_mother_lily_free;
entity_step = home_state;
entity_drop = scr_enemy_mother_lily_drop;
enemy_idle = spr_enemy_motherLily;
enemy_move = spr_enemy_motherLily_move;
damaged_snd = snd_motherLily_damaged;
shadow = false;
shadow_size = 3;
lit = false;
light_size = 48;
aggro_drop = 300;
attack_counter = 0;
sprite_index = enemy_idle;
image_speed = 0;
image_index = 3;
form_type = 1;
max_hp = 1450 + (725 * enemy_lvl);
hp = max_hp;
boss = true;
enemy_spd = 1.1;
local_frame = 0;
hit_by_attack = -1;
timer1 = 30;
timer2 = 30;
timer3 = 30;
timer4 = 30;
walk_snd_delay = 0;
path = -1;
}
//
//
//
//
//
//Mother Lily Free
function scr_enemy_mother_lily_free(){
if (obj_game.gamePaused = false)
{
	
	//Timers
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	
	
	//While Aggro if off
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
	//if (attack_counter >= 3)
	//{
	//	entity_step = BossMotherLilyExposed;
	//}
	
	//While Aggro is on
	if (targeted = true) //and (attack_counter < 3)
	{
		lit = true;
		scr_enemy_chase_special(obj_game,obj_entity);
		walk_snd_delay = walk_snd_delay - 1;
		
		//Slash Attack
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			walk_snd_delay = 45;
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				audio_sound_gain(snd_motherLily_leafSlash,global.volumeEffects,1);
				audio_play_sound(snd_motherLily_leafSlash,0,false);
				timer1 = 23;
				entity_step = scr_enemy_mother_lily_leafSlash;
			}
		}

		//Mid Range Attacks - Razer Sprouts and Scissor Leaf
		if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer2 <= 0)
		{
			var _atkChoose = irandom_range(0,1);
			switch(_atkChoose)
			{
				case 0:
					walk_snd_delay = 15;
					path_end();
					sprite_index = enemy_idle;
					timer2 = 23;
					entity_step = scr_enemy_mother_lily_razerSprout;
					break;
					
				case 1:
					walk_snd_delay = 15;
					//audio_sound_gain(snd_motherLily_viceBomb,global.volumeEffects,1);
					//audio_play_sound(snd_motherLily_viceBomb,0,false);
					path_end();
					direction = point_direction(x,y,obj_player.x,obj_player.y);
					sprite_index = enemy_idle;
					timer2 = 30;
					hor_spd = 0;
					ver_spd = 0;
					entity_step = scr_enemy_mother_lily_scissorLeaf;
					with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
					{
						home_state = scr_projectile_scissorLeaf;
						enemy_lvl = other.enemy_lvl;
						timer1 = 30;
						timer2 = 10;
						entity_step = home_state;
						invincible = false;
						inv_dur_timer = 0;
						enemy_move = spr_motherLily_scissorLeaf;
						aggro_drop = 300;
						healthbar = false;
						enemy_spd = 4.0;
						local_frame = 0;
						hit_by_attack = -1;
						damage = 65 + (10 * enemy_lvl);
						break_object = other.break_object;
						parent = other;
						fragment_count = 3;
						fragment = obj_fragPlant;
						bullet = true;
						hit_script = scr_entity_hit_damage;
						image_angle = other.direction;
					}
				break;
			}
		}
		
		//Long Ragne Attack - Vice Bomb:
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (timer3 <= 0)
		{
			walk_snd_delay = 15;
			audio_sound_gain(snd_motherLily_viceBomb,global.volumeEffects,1);
			audio_play_sound(snd_motherLily_viceBomb,0,false);
			path_end();
			sprite_index = enemy_idle;
			timer1 = 23;
			entity_step =scr_enemy_mother_lily_viceBomb;
		}
		
		//Drop Lily Pods
		if (timer4 <= 0)
		{
			timer4 = 600;
			with (instance_create_layer(x,y,"Instances",obj_enemy))
			{
				image_alpha = 1;
				scr_enemy_lily_pod_create();
				timer1 = 30;
				timer2 = 30;
				timer3 = 300;
				enemy_lvl = 1;
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				break_object = obj_break;
			}
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
//Mother Lily Right Slash 
function scr_enemy_mother_lily_leafSlash(){
if (obj_game.gamePaused = false)
{
	invincible = false;
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
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
	damage = 55 = (9 * enemy_lvl);
	//Cacluate Attack
	scr_enemy_attack_calculate(spr_enemy_motherLily_leafSlash_hitbox);

	//Animate
	scr_enemy_animation();
	if (animation_end)
	{
		timer1 = 90;
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
//Mother Lily Scissor Leaf 
function scr_enemy_mother_lily_scissorLeaf(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	if (sprite_index != spr_enemy_motherLily_move)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_move;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 50 + (9 * enemy_lvl);
	scr_enemy_attack_calculate(spr_motherLily_scissorLeaf);
	
	
	var _collided = scr_enemy_collision();
	if (_collided = false)
	{
		//speed = enemy_spd * 1.5;
		hor_spd = lengthdir_x(2.25,direction);
		ver_spd = lengthdir_y(2.25,direction);
	}
	if (_collided = true)
	{
		hor_spd = 0;
		ver_spd = 0;
	}


	//Animate
	scr_enemy_animation();
	if (timer2 <= 0)
	{
		//audio_play_sound(snd_viceBubble,0,false);
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
//Scissor Leaf Free
function scr_projectile_scissorLeaf(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (sprite_index != spr_motherLily_scissorLeaf)
	{
		//Start Animation From Beginning
		sprite_index = spr_motherLily_scissorLeaf;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	//damage = 60;
	
	x = parent.x;
	y = parent.y - 8;
	
	scr_enemy_animation_one();
	//Animate
	if (timer2 <= 0)
	{
		timer2 = 60;
		audio_sound_gain(snd_motherLily_leafSlash,global.volumeEffects,1);
		audio_play_sound(snd_motherLily_leafSlash,0,false);
	}
	if (timer1 <= 0)
	{
		instance_destroy();
	}
}
}
//
//
//
//
//
//Mother Lily Left Slash 
function scr_enemy_mother_lily_razerSprout(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	if (sprite_index != spr_enemy_motherLily_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_cast;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 40 + (6 * enemy_lvl);
	

	//Animate
	scr_enemy_animation_one();
	if (animation_end)
	{
		var _dir = irandom_range(0,359);
		audio_sound_gain(snd_motherLily_razerSprout,global.volumeEffects,1);
		audio_play_sound(snd_motherLily_razerSprout,0,false);
		for (var i = 0; i < 8; i = i + 1)
		{
			with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
			{
				script_execute(scr_projectile_razorSprout_create);
				enemy_lvl = other.enemy_lvl;
				timer1 = 0;
				break_object = other.break_object;
				fragment_count = 3;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = scr_entity_hit_destroy;
				speed = enemy_spd;
				direction = _dir + (45 * i)
				if (i > 3) image_xscale = -1;
				speed = enemy_spd;
			}
		}
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
//Mother Lily Vice Bomb 
function scr_enemy_mother_lily_viceBomb(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
	if (sprite_index != spr_enemy_motherLily_cast)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_motherLily_cast;
		local_frame = 0;
		image_index = 0;
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 45 + (8 * enemy_lvl);
	

	//Animate
	scr_enemy_animation_one();
	if (animation_end)
	{
		audio_play_sound(snd_enemy_lily_viceBubble,0,false);
		with (instance_create_layer(x,y-8,"Instances",obj_enemy_projectile))
		{
			home_state = scr_projectile_viceBomb_free;
			enemy_lvl = other.enemy_lvl;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_projectile_viceBubble32;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 4.0
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65 + (10 * enemy_lvl);
			break_object = other.break_object;
			fragment_count = 3;
			fragment = obj_fragWater;
			bullet = true;
			hit_script = scr_entity_hit_destroy;
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			image_angle = direction;
			speed = enemy_spd;
		}
		timer3 = 30;
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
function scr_enemy_mother_lily_exposed(){
attack_counter = 0;
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (timer4 > 0) timer4 = timer4 - 1;
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
	scr_enemy_animation_one();
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
function xscr_effect_waterVice(){
damage = 5 + obj_player.might;
timer1 = timer1 - 1;
if (timer1 <= 0) instance_destroy();
if (sprite_index != spr_enemy_motherLily_viceEffect)
{
	sprite_index = spr_enemy_motherLily_viceEffect;
	image_speed = 1;
	image_index = 0;
}
if (place_meeting(x,y,obj_player))
{
	audio_play_sound(snd_enemy_lily_viceBubble_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			watervice_dur_timer = 120;
			audio_play_sound(snd_player_hit,0,false);
			flash = .35;
			hp = hp - other.damage;
		}
	}
	instance_destroy();
}
}
//
//
//
//
//
//Mother Lily Drop
function scr_enemy_mother_lily_drop(){
var _objects = 6;
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
if (_drop2 < 100)
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
//obj_inventory.habraf_lair[4] = 2;
if (obj_inventory.quest_grid[# 12, 3] = false)
{
	obj_inventory.quest_grid[# 12, 0] = true;
	obj_inventory.quest_grid[# 12, 1] = obj_inventory.quest_grid[# 12, 2];
	obj_inventory.quest_grid[# 12, 3] = true;
}
	
}
//
//
//
//
//
//MotherLily Victory Text
function scr_text_mother_lily_victory(){

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
	text_string = "Mother Lily Defeated." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter = 1)
{
	speaker = 1;
	text_string = "Quest Complete - Lair: Habraf Lake\nREWARD: 1000 Beans"
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
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);

}






