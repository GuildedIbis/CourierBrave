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
enemy_arm = spr_enemy_acolyte_castArm;
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
remain_dist = 64;
timer1 = 0;
timer2 = 0;
timer3 = 0;
magic_counter = 0;
attack_counter = 0;
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
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (flash > 0) entity_step = EnemyDamaged;
	enemy_spd = 1.5;
	
	
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
		script_execute(EnemyChase);
		if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			path_end();
			sprite_index = enemy_idle;
			if (timer1 <= 0)
			{
				walk_snd_delay = 15;
				timer1 = 120;
				attack_counter = irandom_range(1,3);
				entity_step = scr_enemy_acolyte_slash;
			}
		}
		if (!point_in_circle(obj_player.x,obj_player.y,x,y,16))
		{
			if (timer3 <= 0)
			{
				path_end();
				direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
				sprite_index = enemy_idle;
				walk_snd_delay = 15;
				timer3 = 12;
				magic_counter = 0;
				attack_counter = irandom_range(1,2);
				entity_step = scr_enemy_acolyte_special;
			}
			else
			{
				if (timer2 <= 0)
				{
					path_end();
					sprite_index = enemy_idle;
					attack_counter = irandom_range(2,4);
					magic_counter = 4;
					timer2 = 45;
					hor_spd = irandom_range(-1,1);
					ver_spd = irandom_range(-1,1);
					if (hor_spd = 0) and (ver_spd = 0)
					{
						hor_spd = choose(-1,1)
						ver_spd = choose(-1,1)
					}
					entity_step = scr_enemy_acolyte_magic;
					animation_end = false;
				}
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
//Acolyte Slash State
function scr_enemy_acolyte_slash(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_acolyte_slash)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_acolyte_slash;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,false);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 45 + (8 * enemy_lvl);
	//Cacluate Attack
	EnemyAttackCalculate(spr_hitbox_acolyte_slash)

	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer1 = 120;
		attack_counter = attack_counter - 1;
		if (attack_counter <= 0)
		{
			if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
			{
				path_end();
				audio_sound_gain(snd_player_roll,global.volumeEffects,1);
				audio_play_sound(snd_player_roll,0,false);
				direction = 180 + ((round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90);
				entity_step = scr_enemy_acolyte_roll;
				timer1 = 120;
				remain_dist = 64;
			}
			else
			{
				entity_step = scr_enemy_acolyte_free;
				sprite_index = spr_enemy_acolyte_idle;
			}
		}
		else
		{
			direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
			sprite_index = spr_enemy_acolyte_slash;
			local_frame = 0;
			image_index = 0;
			audio_sound_gain(snd_slash01,global.volumeEffects,1);
			audio_play_sound(snd_slash01,0,false);
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
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
//Acolyte Roll State
function scr_enemy_acolyte_roll(){
if (obj_game.gamePaused = false)
{
	inv_dur_timer = 30;
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;

	hor_spd = lengthdir_x(3,direction);
	ver_spd = lengthdir_y(3,direction);
	remain_dist = max(0, remain_dist - 3);
	var _collided = EnemyCollision();

	//Update Sprite
	sprite_index = spr_enemy_acolyte_roll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (_cardinalDir * _totalFrames) + min(((1 - (remain_dist / 64)) * _totalFrames), _totalFrames - 1);


	//Free State
	if (remain_dist <= 0)
	{
		entity_step = home_state;
		sprite_index = spr_enemy_acolyte_idle;
	}

	//Collision
	if (_collided = true)
	{
		entit_step = home_state;
		sprite_index = spr_enemy_acolyte_idle;
	}
}
}
//
//
//
//
//
//Acolyte Magic
function scr_enemy_acolyte_magic(){
if (obj_game.gamePaused = false)
{
	casting = true;
	enemy_spd = 1.2;
	//Timer
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;

	//Set
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation_cast();
	EnemyBulletSpawnPosition();


	//Move
	if (hor_spd != 0) or (ver_spd != 0) 
	{
		var _xDest = x + (hor_spd * (enemy_spd))
		var _yDest = y + (ver_spd * (enemy_spd))
		if (place_meeting(_xDest, _yDest,obj_entity))
		{
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
			//sprite_index = enemy_idle;
		}
		path = path_add();
		mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
		path_start(path, enemy_spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	
	}

	if (timer2 <= 0)
	{
		timer2 = 6;
		magic_counter = magic_counter - 1;
		if (magic_counter = 3)
		{
			with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
			{
				audio_sound_gain(snd_acolyte_nilchrome,global.volumeEffects,1);
				audio_play_sound(snd_acolyte_nilchrome,0,0);
				projectile_sprite = spr_projectile_acolyte_nil;
				home_state = scr_enemy_projectile_nilchrome;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_projectile_acolyte_nil;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 3;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 45 + (8 * other.enemy_lvl);
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = EntityHitDestroy;
				direction = point_direction(x,y,obj_player.x,obj_player.y-4)
				image_angle = direction;
				speed = enemy_spd;
			}
		}
		if (magic_counter < 3)
		{
			with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
			{
				audio_sound_gain(snd_acolyte_antichrome,global.volumeEffects,1);
				audio_play_sound(snd_acolyte_antichrome,0,0);
				projectile_sprite = spr_projectile_acolyte_anti;
				home_state = scr_enemy_projectile_antichrome;
				entity_step = home_state;
				invincible = false;
				inv_dur_timer = 0;
				enemy_move = spr_projectile_acolyte_anti;
				aggro_drop = 300;
				healthbar = false;
				enemy_spd = 2.5;
				local_frame = 0;
				hit_by_attack = -1;
				damage = 25 + (6 * other.enemy_lvl);
				break_object = other.break_object;
				fragment_count = 2;
				fragment = obj_fragPlant;
				bullet = true;
				hit_script = EntityHitDestroy;
				direction = point_direction(x,y,obj_player.x,obj_player.y-4)
				image_angle = direction;
				speed = enemy_spd;
			}
		}
	}
	if (magic_counter <= 0)
	{
		timer2 = 27;
		attack_counter = attack_counter - 1;
		magic_counter = 4;
	}
	//End
	if (attack_counter <= 0)
	{
		casting = false;
		entity_step = scr_enemy_acolyte_free;
		timer2 = 240;
	}
}
}
//
//
//
//
//
//Acolyte Slash State
function scr_enemy_acolyte_special(){
if (obj_game.gamePaused = false)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (timer2 > 0) timer2 = timer2 - 1;
	if (timer3 > 0) timer3 = timer3 - 1;
	if (sprite_index != spr_enemy_acolyte_special)
	{
		//Start Animation From Beginning
		sprite_index = spr_enemy_acolyte_special;
		local_frame = 0;
		image_index = 0;
		audio_sound_gain(snd_acolyte_ilanilCharge,global.volumeEffects,1);
		audio_play_sound(snd_acolyte_ilanilCharge,0,0);
		if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	damage = 95 + (13 * enemy_lvl);
	//Cacluate Attack
	EnemyAttackCalculate(spr_hitbox_acolyte_special);
	scr_acolyte_bulletspawn_special();

	if (timer3 <= 0)
	{
		timer3 = 4;
		magic_counter = magic_counter + 1;
		with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_enemy_projectile))
		{
			audio_sound_gain(snd_acolyte_ilanilFire,global.volumeEffects,1);
			audio_play_sound(snd_acolyte_ilanilFire,0,0);
			projectile_sprite = spr_projectile_acolyte_ilanil;
			sprite_index = spr_projectile_acolyte_ilanil;
			home_state = scr_enemy_projectile_ilanil;
			entity_step = home_state;
			invincible = false;
			inv_dur_timer = 0;
			enemy_move = spr_projectile_acolyte_ilanil;
			aggro_drop = 300;
			healthbar = false;
			enemy_spd = 3;
			local_frame = 0;
			hit_by_attack = -1;
			damage = 65 + (10 * other.enemy_lvl);
			break_object = other.break_object;
			fragment_count = 2;
			fragment = obj_fragPlant;
			bullet = true;
			hit_script = EntityHitDestroy;
			direction = (other.direction + 90) - round(23*other.magic_counter);
			image_angle = direction;
			speed = enemy_spd;
		}
	}
	//Animate
	EnemyAnimation();
	if (animation_end)
	{
		timer3 = 12;
		attack_counter = attack_counter - 1;
		if (attack_counter <= 0)
		{
			magic_counter = 0;
			timer3 = 300;
			entity_step = home_state;
			sprite_index = spr_enemy_acolyte_idle;
		}
		else
		{
			magic_counter = 0;
			direction = (round(point_direction(x,y,obj_player.x,obj_player.y)/90)) * 90;
			sprite_index = spr_enemy_acolyte_special;
			local_frame = 0;
			image_index = 0;
			audio_sound_gain(snd_acolyte_ilanilCharge,global.volumeEffects,1);
			audio_play_sound(snd_acolyte_ilanilCharge,0,0);
			if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
			ds_list_clear(hit_by_attack);
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
//Acolyte Antichrome Projectile
function scr_enemy_projectile_antichrome(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(snd_player_hit,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	instance_destroy();
}
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
//Acolyte Antichrome Projectile
function scr_enemy_projectile_nilchrome(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
image_angle = image_angle + 3;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(snd_player_hit,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	instance_destroy();
}
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
//Acolyte Ilanil Projectile
function scr_enemy_projectile_ilanil(){
if (obj_game.gamePaused = false)
{
sprite_index = enemy_move;
speed = enemy_spd;
image_angle = image_angle + 5;
if (place_meeting(x,y,obj_player))
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	with (obj_player)
	{
		if (invincible = false)
		{
			if (dmg_snd_delay <= 0)
			{
				dmg_snd_delay = 15;
				audio_sound_gain(dmg_snd,global.volumeEffects,1);
				audio_play_sound(snd_player_hit,0,false);
			}
			flash = .35;
			hp = hp - (other.damage - armor);
		}
	}
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	audio_sound_gain(snd_arrow_hit,global.volumeEffects,1);
	audio_play_sound(snd_arrow_hit,0,false);
	instance_destroy();
}
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
//Acolyte Special Bullet Spawn
function scr_acolyte_bulletspawn_special(){
var _aimAngle = direction + 90 - round(23*magic_counter);
var _dirPos = round(_aimAngle/90);
ldX = x + lengthdir_x(6, _aimAngle);
ldY = y + lengthdir_y(6, _aimAngle);
switch(_dirPos)
{
	case 0:
		dir_offX = 0;
		dir_offY = -7;
	break;
		
	case 4:
		dir_offX = 0;
		dir_offY = -7;
	break;
		
	case 1:
		dir_offX = -2;
		dir_offY = -7;
	break;
		
	case 2:
		dir_offX = 0;
		dir_offY = -7;
	break;
		
	case 3:
		dir_offX = 2;
		dir_offY = -7;
	break;	
}
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
//
//
//
//
//
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