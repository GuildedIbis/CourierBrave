//Enemy States
//
//
//
//
//
//Enemy Timers
function scr_enemy_timer_countdown(){
if (timer1 > 0) timer1 = timer1 - 1;
if (timer2 > 0) timer2 = timer2 - 1;
if (timer3 > 0) timer3 = timer3 - 1;
if (timer4 > 0) timer4 = timer4 - 1;
if (timer5 > 0) timer5 = timer5 - 1;
if (timer6 > 0) timer6 = timer6 - 1;
if (timer7 > 0) timer7 = timer7 - 1;
if (timer8 > 0) timer8 = timer8 - 1;
if (timer9 > 0) timer9 = timer9 - 1;
if (timerC > 0) timerC = timerC - 1;
if (timerS > 0) timerS = timerS - 1;
if (timerW > 0) timerW = timerW - 1;

}//
//
//
//
//
//Enemy Aggro
function scr_enemy_aggro(){

if (targeted = false)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
	{
		scr_enemy_alert();
		aggro_drop = 300;
		targeted = true;
		//global.aggroCounter = global.aggroCounter + 1;
	}
}
if (targeted = true)
{
	if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) and (aggro_drop > 0)
	{
		aggro_drop = aggro_drop - 1;
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
}
//
//
//
//
//
//Chase Player
function scr_enemy_chase(){
if (knockback = false)
{
	//Chase: create and execute a path towards player
	if (path_exists(path)) path_delete(path);
	path = path_add();
	mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 4, obj_entity);
	path_start(path, enemy_spd, 0, 0);
	image_speed = 1;
	sprite_index = enemy_move;
}
else path_end(); 
}
//
//
//
//
//
//Chase Player
function scr_enemy_chase_unstick(){
if (knockback = false)
{
	//Chase: create and execute a path towards player
	if (path_exists(path)) path_delete(path);
	path = path_add();
	mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 4, obj_interactable);
	path_start(path, enemy_spd, 0, 0);
	image_speed = 1;
	sprite_index = enemy_move;
}
else path_end(); 
}
//
//
//
//
//
//Chase Player
function scr_enemy_chase_escort(){

//Chase: create and execute a path towards player
if (path_exists(path)) path_delete(path);
path = path_add();
mp_potential_path_object(path, obj_escort.x, obj_escort.y, 1, 4, obj_entity);
path_start(path, enemy_spd, 0, 0);
image_speed = 1;
sprite_index = enemy_move;

}
//
//
//
//
//
//Chase Cast
function scr_enemy_chase_cast(){
var _spd = enemy_spd * .75
if (knockback = false)
{
	//Chase: create and execute a path towards player
	if (place_meeting(x,y,obj_entity))
	{
		if (path_exists(path)) path_delete(path);
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 4, obj_wall);
		path_start(path, _spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	}
	else
	{
		if (path_exists(path)) path_delete(path);
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 4, obj_entity);
		path_start(path, _spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	}
}
else path_end(); 
}
//
//
//
//
//
//Wander
function scr_enemy_wander(_moveDelay,_moveLength){
	
//Direction
if (timer2 > 0) timer2 = timer2 - 1;
if (timer2 <= 0)
{
	hor_spd = irandom_range(-1,1);
	ver_spd = irandom_range(-1,1);
	timer2 = _moveLength + irandom_range(-15,15);
	timer1 = _moveDelay + irandom_range(-15,15);
}

//Animation
if (hor_spd != 0) or (ver_spd != 0) 
{
	if (path_exists(path)) path_delete(path);
	var _xDest = x + (hor_spd * (enemy_spd/2))
	var _yDest = y + (ver_spd * (enemy_spd/2))
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


}
//
//
//
//
//Wander Home with Collision
function scr_enemy_wander_home(_moveDelay,_moveLength,_homeX,_homeY){
var _collision = false;
var _entityList = ds_list_create();

//Direction
if (timerW <= 0)
{
	hor_spd = irandom_range(-1,1) * (enemy_spd/2);
	ver_spd = irandom_range(-1,1) * (enemy_spd/2);
	timerW = _moveLength + irandom_range(-15,15);
	timerC = _moveDelay + irandom_range(-15,15);
}

//Movement and Animation
if (timerC > 0)
{
	//Movement
	if (hor_spd != 0) or (ver_spd != 0) 
	{
		var _xDest = x + (hor_spd * (enemy_spd/2))
		var _yDest = y + (ver_spd * (enemy_spd/2))
		if (place_meeting(_xDest, _yDest,obj_entity))
		{
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
		}
		if (!point_in_circle(_xDest,_yDest,_homeX,_homeY,64))
		{
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
		}
		path = path_add();
		mp_potential_path_object(path, _xDest, _yDest, 1, 4, obj_entity);
		path_start(path, enemy_spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	}
}
else 
{
	local_frame = 0;
	sprite_index = enemy_idle;
}

ds_list_destroy(_entityList);

return _collision;
}
//
//
//
//
//
//Wander Path (Has Memory Leak)
function scr_enemy_wander_home_path(_moveDelay,_moveLength,_homeX,_homeY){
	
//Direction
if (path_exists(path)) path_delete(path);
if (timer2 > 0) timer2 = timer2 - 1;
if (timer2 <= 0)
{
	hor_spd = irandom_range(-1,1);
	ver_spd = irandom_range(-1,1);
	timer2 = _moveLength + irandom_range(-15,15);
	timer1 = _moveDelay + irandom_range(-15,15);
}

//Audio

//if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
//{
//	walk_snd_delay = walk_snd_delay - 1;
//	if (walk_snd_delay <= 0)
//	{
//		walk_snd_delay = 15;
//		audio_play_sound(snd_walk_regular,1,0);
//	}
//}
//Animation
if (hor_spd != 0) or (ver_spd != 0) 
{
	var _xDest = x + (hor_spd * (enemy_spd/2))
	var _yDest = y + (ver_spd * (enemy_spd/2))
	if (place_meeting(_xDest, _yDest,obj_entity)) or (!point_in_circle(_xDest,_yDest,_homeX,_homeY,64))
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
	if (!point_in_circle(_xDest,_yDest,_homeX,_homeY,64))
	{
	
		path = path_add();
		mp_potential_path_object(path, home_x, home_y, 1, 2, obj_entity);
		path_start(path, enemy_spd, 0, 0);
	}
	
}


}
//
//
//
//
//
//Enemy Reposition
function scr_enemy_reposition(){
if (obj_game.gamePaused = false)
{
	//Timer
	scr_enemy_timer_countdown();

	//Setup
	if (sprite_index != enemy_move)
	{
		//Start Animation From Beginning
		sprite_index = enemy_move;
		local_frame = 0;
		image_index = 0;
	}

	//Animate
	scr_enemy_animation();

	//Move
	if (point_in_circle(obj_player.x,obj_player.y,x,y,64))
	{
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
	}
	else sprite_index = enemy_idle;

	//End
	if (timer1 <= 0)
	{
		timer1 = 0;
		entity_step = home_state;
		sprite_index = enemy_idle;
	}
}
else speed = 0;
}
//
//
//
//
//
//Animation 
function scr_enemy_animation(){

var _totalFrames = sprite_get_number(sprite_index) / 4;
if (knockback = false)
{
	image_index = local_frame + (_cardinalDir * _totalFrames);
	local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
}

//Cuts the degree by 90 to give you a number between 0 and 3
//The 0-3 is multiplied by the 1/4 frame number because all four sprites are within a single sprite.
//Local frame then increments in the speed of the animation
if (local_frame >= _totalFrames)
{
	animation_end = true;
	local_frame = local_frame - _totalFrames;
}
else animation_end = false;

}
//
//
//
//
//
//Animation 
function scr_enemy_animation_cast(){
if (knockback = false)
{
	var _aimDir = round(point_direction(x + dir_offX,y + dir_offY,obj_player.x,obj_player.y-4)/90);
	//direction = _aimDir * 90;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	if (knockback = false)
	{
		image_index = local_frame + (_aimDir * _totalFrames);
		local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
	}
	//Cuts the degree by 90 to give you a number between 0 and 3
	//The 0-3 is multiplied by the 1/4 frame number because all four sprites are within a single sprite.
	//Local frame then increments in the speed of the animation
	if (local_frame >= _totalFrames)
	{
		animation_end = true;
		local_frame = local_frame - _totalFrames;
	}
	else animation_end = false;
}
else
{
	image_speed = 0;

}
}
//
//
//
//
//
//Animation 1 Direction 
function scr_enemy_animation_one(){
if (knockback = false)
{
	var _totalFrames = sprite_get_number(sprite_index);
	image_index = local_frame;
	if (knockback = false)
	{
		local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
	}
	//Cuts the degree by 90 to give you a number between 0 and 3
	//The 0-3 is multiplied by the 1/4 frame number because all four sprites are within a single sprite.
	//Local frame then increments in the speed of the animation
	if (local_frame >= _totalFrames)
	{
		animation_end = true;
		local_frame = local_frame - _totalFrames
	}
	else animation_end = false;
}
else
{
	image_speed = 0;
}
}
//
//
//
//
//
//Enemy Damaged
function scr_enemy_damaged(){
//sprite_index = enemy_damaged;
scr_enemy_animation();
if (timer1 > 0) timer1 = timer1 - 1;
if (flash <= 0) entity_step = home_state;
scr_enemy_alert();

}
//
//
//
//
//
//Enemy Alert
function scr_enemy_alert(){
with (obj_enemy)
{
	if (bullet = false) and (point_in_circle(x,y,other.x,other.y,96))
	{
		if (targeted = false) 
		{
			global.aggroCounter = global.aggroCounter + 1;
			if (boss = true) global.bossCounter = global.bossCounter + 1;
			targeted = true;
			scr_enemy_aggro();
		}
	}
}
}
//
//
//
//
//
//Attack Calculate
function xscr_enemy_attack_calculate(_hitbox){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_player,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				if (invincible = false) and (dead = false)
				{
					scr_camera_screen_shake(1,5);
					inv_dur_timer = 15;
					damaged_timer = 300;
					if (dmg_snd_delay <= 0)
					{
						dmg_snd_delay = 15;
						audio_sound_gain(snd_player_hit,global.volumeEffects,1);
						audio_play_sound(snd_player_hit,0,false);
					}
					var _damageTaken = max(1,other.damage - armor);
					if (overshield <= 0)
					{
						hp = hp - _damageTaken;
						flash = .7;
					}
					if (overshield > 0)
					{
						if (_damageTaken > overshield)
						{
							overshield = 0;
							hp = hp - (_damageTaken - overshield);
							flash = .7;
						}
						if (_damageTaken <= overshield)
						{
							overshield = overshield - _damageTaken;
							flash = .7;
						}
					}
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = enemy_idle;
}
//
//
//
//
//
//Attack Calculate Status
function scr_enemy_attack_calculate(_hitbox,_hitBy,_kbDur,_azDur,_txDur,_vsDur,_wvDur,_drainPerc){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_player,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				if (invincible = false) and (dead = false)
				{
					scr_camera_screen_shake(1,5);
					inv_dur_timer = 15;
					damaged_timer = 300;
					if (_azDur != -1) ablaze_dur_timer = _azDur;
					if (_txDur != -1) thundux_dur_timer = _txDur;
					if (_vsDur != -1) voidsick_dur_timer = _vsDur;
					if (_wvDur != -1) watervice_dur_timer = _wvDur;
					if (_drainPerc != -1) 
					{
						//obj_player.heal = true;
						//obj_player.heal_dur_timer = 60;
						//obj_player.hp = min(obj_player.max_hp,obj_player.hp + round(other.damage * _drainPerc));
					}
					if (_kbDur != -1) 
					{
						knockback_dir = point_direction(x,y,_hitBy.x,_hitBy.y) + 180;
						knockback_dur = _kbDur
					}
					if (dmg_snd_delay <= 0)
					{
						dmg_snd_delay = 15;
						audio_sound_gain(snd_player_hit,global.volumeEffects,1);
						audio_play_sound(snd_player_hit,0,false);
					}
					var _damageTaken = max(1,other.damage - armor);
					if (overshield <= 0)
					{
						hp = hp - _damageTaken;
						flash = .7;
					}
					if (overshield > 0)
					{
						if (_damageTaken > overshield)
						{
							overshield = 0;
							hp = hp - (_damageTaken - overshield);
							flash = .7;
						}
						if (_damageTaken <= overshield)
						{
							overshield = overshield - _damageTaken;
							flash = .7;
						}
					}
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = enemy_idle;
}
//
//
//
//
//
//Attack Calculate Status (Projectile)
function scr_enemy_attack_calculate_projectile(_hitbox,_hitBy,_kbDur,_azDur,_txDur,_vsDur,_wvDur,_drainPerc){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_player,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				if (invincible = false) and (dead = false)
				{
					scr_camera_screen_shake(1,5);
					inv_dur_timer = 15;
					damaged_timer = 300;
					if (_azDur != -1) ablaze_dur_timer = _azDur;
					if (_txDur != -1) thundux_dur_timer = _txDur;
					if (_vsDur != -1) voidsick_dur_timer = _vsDur;
					if (_wvDur != -1) watervice_dur_timer = _wvDur;
					if (_drainPerc != -1) 
					{
						//obj_player.heal = true;
						//obj_player.heal_dur_timer = 60;
						//obj_player.hp = min(obj_player.max_hp,obj_player.hp + round(other.damage * _drainPerc));
					}
					if (_kbDur != -1) 
					{
						knockback_dir = point_direction(x,y,_hitBy.x,_hitBy.y) + 180;
						knockback_dur = _kbDur
					}
					if (dmg_snd_delay <= 0)
					{
						dmg_snd_delay = 15;
						audio_sound_gain(snd_player_hit,global.volumeEffects,1);
						audio_play_sound(snd_player_hit,0,false);
					}
					var _damageTaken = max(1,other.damage - armor);
					if (overshield <= 0)
					{
						hp = hp - _damageTaken;
						flash = .7;
					}
					if (overshield > 0)
					{
						if (_damageTaken > overshield)
						{
							overshield = 0;
							hp = hp - (_damageTaken - overshield);
							flash = .7;
						}
						if (_damageTaken <= overshield)
						{
							overshield = overshield - _damageTaken;
							flash = .7;
						}
					}
					with (other) 
					{
						if (bullet = true) and (invincible = false)
						{
							instance_destroy();
						}
					}
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = enemy_idle;
}
//
//
//
//
//
//Attack Calculate
function scr_enemy_attack_calculate_friendly(_hitbox,_hitBy,_kbDur,_azDur,_txDur,_vsDur,_wvDur,_drainPerc){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_enemy,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				if (passable = false) and (break_object == other.break_object)
				{
					//image_blend = c_red;
					if (hit_script != -1) and (bullet = false)
					{
						//script_execute(hit_script); 
						if (invincible = false) and (npc = false)
						{
							if (_azDur != -1) ablaze_dur_timer = _azDur;
							if (_txDur != -1) thundux_dur_timer = _txDur;
							if (_vsDur != -1) voidsick_dur_timer = _vsDur;
							if (_wvDur != -1) watervice_dur_timer = _wvDur;
							if (_drainPerc != -1) 
							{
								//obj_player.heal = true;
								//obj_player.heal_dur_timer = 60;
								//obj_player.hp = min(obj_player.max_hp,obj_player.hp + round(other.damage * _drainPerc));
							}
							if (boss = false) and (_kbDur != -1) 
							{
								knockback_dir = point_direction(x,y,_hitBy.x,_hitBy.y) + 180;
								knockback_dur = _kbDur
							}
						}
						with (other) 
						{
							//if (destructable = true) instance_destroy();
						}
					}
				}
			}
		}
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = enemy_idle;
}

//
//
//
//
//
//Attack Calculate
function scr_enemy_attack_calculate_ablaze(_hitbox,_duration){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_player,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				if (invincible = false) and (dead = false)
				{
					audio_sound_gain(snd_player_hit,global.volumeEffects,1);
					audio_play_sound(snd_player_hit,0,false);
					ablaze_dur_timer = (_duration * 60);
					var _damageTaken = max(0,other.damage - armor);
					if (overshield <= 0)
					{
						hp = hp - _damageTaken;
						flash = .7;
					}
					if (overshield > 0)
					{
						if (_damageTaken > overshield)
						{
							overshield = 0;
							hp = hp - (_damageTaken - overshield)
						}
						if (_damageTaken <= overshield)
						{
							overshield = overshield - _damageTaken;
						}
					}
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = enemy_idle;
}
//
//
//
//
//
//Heal Calculate
function scr_enemy_attack_calculate_heal(_hitbox){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_enemy,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				var _healGiven = other.damage;
				heal = true;
				heal_dur_timer = 60;
				hp = hp + _healGiven;
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = sprite_index;
}//
//
//
//
//
//Collision
function scr_enemy_collision(){
var _collision = false;
var _entityList = ds_list_create();


//Horizontal Entities
var _entityCount = instance_position_list(x+hor_spd, y, obj_entity, _entityList,false);
var _snapX;
while (_entityCount > 0)
{
	var _entityCheck = _entityList[| 0];
	if (_entityCheck.collision == true)
	{
		if (sign(hor_spd) == -1) _snapX = _entityCheck.bbox_right + 1;
		else _snapX = _entityCheck.bbox_left - 1;
		x = _snapX;
		hor_spd = 0;
		_collision = true;
		_entityCount = 0;
	}
	ds_list_delete(_entityList,0);
	_entityCount = _entityCount - 1;
}


//Horizontal Move
if (knockback = false) x += hor_spd;

//Clear List Between Axis
ds_list_clear(_entityList);


//Vertical Entity Collision
var _entityCount = instance_position_list(x, y + ver_spd, obj_entity, _entityList,false);
var _snapY;
while (_entityCount > 0)
{
	var _entityCheck = _entityList[| 0];
	if (_entityCheck.collision == true)
	{
		if (sign(ver_spd) == -1) _snapY = _entityCheck.bbox_bottom+1;
		else _snapY = _entityCheck.bbox_top - 1;
		y = _snapY;
		ver_spd = 0;
		_collision = true;
		_entityCount = 0;
	}
	ds_list_delete(_entityList,0);
	_entityCount = _entityCount - 1;
}

//Vertical Move
if (knockback = false) y += ver_spd;

ds_list_destroy(_entityList);

return _collision;
}
//
//
//
//
//
function scr_enemy_projectile_spawn(_len = 6){
var _aimAngle = point_direction(x + dir_offX,y + dir_offY,obj_player.x,obj_player.y-4);
var _dirPos = round(_aimAngle/90);
ldX = x + lengthdir_x(_len, _aimAngle);
ldY = y + lengthdir_y(_len, _aimAngle);
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
//Enemy Death Fall
function scr_enemy_death_fall(){
image_xscale = image_xscale - .01;
image_yscale = image_yscale - .01;
if (image_xscale <= 0) or (image_yscale <= 0)
{
	if (targeted = true)
	{
		global.aggroCounter = global.aggroCounter - 1;
	}	
	instance_destroy();
}
}
