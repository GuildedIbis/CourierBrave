//Enemy States
//
//
//
//
//
//Enemy Aggro
function EnemyAggro(){

if (targeted = false)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,96)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
	{
		EnemyAlert();
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
function EnemyChase(){

if (knockback = false)
{
	//Chase: create and execute a path towards player
	if (place_meeting(x,y,obj_entity))
	{
		if (path_exists(path)) path_delete(path);
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_game);
		path_start(path, enemy_spd, 0, 0);
		image_speed = 1;
		sprite_index = enemy_move;
	}
	else
	{
		if (path_exists(path)) path_delete(path);
		path = path_add();
		mp_potential_path_object(path, obj_player.x, obj_player.y, 1, 2, obj_entity);
		path_start(path, enemy_spd, 0, 0);
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
//Chase Player
function EnemyChaseEscort(){

//Chase: create and execute a path towards player
if (path_exists(path)) path_delete(path);
path = path_add();
mp_potential_path_object(path, obj_escort.x, obj_escort.y, 1, 2, obj_entity);
path_start(path, enemy_spd, 0, 0);
image_speed = 1;
sprite_index = enemy_move;

}
//
//
//
//
//
//Chase Player
function EnemyChaseCustom(){

	//Chase: create and execute a path towards player
	if (path_exists(path)) path_delete(path);
	path = path_add();
	mp_potential_path_object(path, _destX, _destY, 1, 2, obj_entity);
	path_start(path, enemy_spd, 0, 0);
	image_speed = 1;
	sprite_index = enemy_move
}
//
//
//
//
//
//Wander
function EnemyWander(_moveDelay,_moveLength){
	
//Direction
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
//
//Enemy Reposition
function EnemyReposition(){
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
EnemyAnimation();


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
//
//
//
//
//
//Animation 
function EnemyAnimation(){
var _totalFrames = sprite_get_number(sprite_index) / 4;
image_index = local_frame + (_cardinalDir * _totalFrames);
local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
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
//Animation 1 Direction 
function EnemyAnimation1(){
var _totalFrames = sprite_get_number(sprite_index);
image_index = local_frame;
local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
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
//
//
//
//
//
//Enemy Damaged
function EnemyDamaged(){
//sprite_index = enemy_damaged;
script_execute(EnemyAnimation);
if (timer1 > 0) timer1 = timer1 - 1;
if (flash <= 0) entity_step = home_state;
EnemyAlert();

}

//
//
//
//
//
//Enemy Alert
function EnemyAlert(){
with (obj_enemy)
{
	if (bullet = false) and (point_in_circle(x,y,other.x,other.y,64))
	{
		if (targeted = false) 
		{
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			EnemyAggro();
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
function EnemyAttackCalculate(_hitbox){
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
					inv_dur_timer = 15;
					if (dmg_snd_delay <= 0)
					{
						dmg_snd_delay = 15;
						audio_sound_gain(snd_player_hit,global.volumeEffects,1);
						audio_play_sound(snd_player_hit,0,false);
					}
					var _damageTaken = max(1,other.damage - armor);
					hp = hp - _damageTaken;
					flash = .7;
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
function EnemyAttackCalculateAblaze(_hitbox,_duration){
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
					hp = hp - _damageTaken;
					flash = .7;
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
function EnemyHealCalculate(_hitbox){
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
function EnemyCollision(){
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
		if (sign(hor_spd) == -1) _snapX = _entityCheck.bbox_right+1;
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
x += hor_spd;

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
y += ver_spd;

ds_list_destroy(_entityList);

return _collision;
}
//
//
//
//
//
//Enemy Death Fall
function EnemyDeathFall(){
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
//
//
//
//
//
//Wander
function EnemyWanderOld(_moveDelay){
	
//Direction
if (timer2 > 0) timer2 = timer2 - 1;
if (timer2 <= 0)
{
	hor_spd = irandom_range(-1,1);
	ver_spd = irandom_range(-1,1);
	timer2 = _moveDelay;
}

//Animation
var _oldSprite = sprite_index;
if (hor_spd != 0) or (ver_spd != 0) 
{
	direction = point_direction(0,0,hor_spd, ver_spd)
	sprite_index = enemy_move;
}
else sprite_index = enemy_idle;
if (_oldSprite != sprite_index) local_frame = 0;

//Collision
EnemyCollision();

}

