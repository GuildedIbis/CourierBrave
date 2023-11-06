//Player Scripts
//
//
//
//
//
//Free State
function xPlayerStateFree(){


//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);


//Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 15;
		audio_sound_gain(walk_snd,global.volumeEffects,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (stamina < max_stamina) //Roll Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (meleeS_timer < max_meleeS_timer) meleeS_timer = meleeS_timer + 1;
if (magicS_timer < max_magicS_timer) magicS_timer = magicS_timer + 1;



//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = run_sprite;
}
else sprite_index = idle_sprite;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
script_execute(melee_main);


//Magic Attack
script_execute(magic_main);

//Roll State
if (key_ability) and (roll_energy >= 50)
{
	audio_sound_gain(snd_player_roll,global.volumeEffects,1);
	audio_play_sound(snd_player_roll,0,false);
	roll_energy = roll_energy - 50;
	state_script = PlayerStateRoll;
	remain_dist = roll_dist;
}

//Recharge Magic State
if (keyboard_check_pressed(ord("R"))) and (magic_count < max_magic_count)
{
	audio_sound_gain(snd_player_crystal,global.volumeEffects,1);
	audio_play_sound(snd_player_crystal,0,false);
	magic_count = max_magic_count;
	state_script = PlayerStateRecharge;
	
}

//Crull Stone State
if (keyboard_check_pressed(ord("C"))) and (crull_stone >= 1)
{
	audio_sound_gain(snd_player_crystal,global.volumeEffects,1);
	audio_play_sound(snd_player_crystal,0,false);
	crull_stone = crull_stone - 1;
	hp = hp + 100;
	if (hp > max_hp) hp = max_hp;
	state_script = PlayerStateCrull;
	
}

}
//
//
//
//
//
//Crull Stone State
function scr_player_crull(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
PlayerAnimation();

if (animation_end)
{
	crull_stone = crull_stone - 1;
	hp = hp + (100 + (25 * receptivity));
	if (hp > max_hp) hp = max_hp;
	state_script = free_state;
	animation_end = false;
}
	
	
	
}
//
//
//
//
//
//Recharge State
function scr_player_recharge(_yellow,_orange,_purple,_blue,_green,_red){
if (_yellow = true) and (yellow_primary < max_charge)
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		yellow_primary = yellow_primary + 1;
	}
}
if (_orange = true) and (orange_primary < max_charge)
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		orange_primary = orange_primary + 1;
	}
}
if (_purple = true) and (purple_primary < max_charge)
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		purple_primary = purple_primary + 1;
	}
}
if (_blue = true) and (blue_primary < max_charge)
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		blue_primary = blue_primary + 1;
	}
}
if (_green = true) and (green_primary < max_charge)
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		green_primary = green_primary + 1;
	}
}
if (_red = true) and (red_primary < max_charge)
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 6;
		red_primary = red_primary + 1;
	}
}
}
//
//
//
//
//
//Roll State
function scr_player_roll(){
//max_stamina = 50 + (3* (might + round(might/15)));
inv_dur_timer = 30;
//Charge Crystal??
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}

hor_spd = lengthdir_x(roll_spd,direction);
ver_spd = lengthdir_y(roll_spd,direction);
remain_dist = max(0, remain_dist - roll_spd);
var _collided = scr_player_collision();

//Update Sprite
sprite_index = roll_sprite;
var _totalFrames = sprite_get_number(sprite_index)/4;
image_index = (_cardinalDir * _totalFrames) + min(((1 - (remain_dist / roll_dist)) * _totalFrames), _totalFrames - 1);


//Free State
if (remain_dist <= 0)
{
	state_script = free_state;
}

//Collision
if (_collided = true)
{
	state_script = free_state;
	scr_camera_screen_shake(4,15);
}
}
//
//
//
//
//
//Player State Attack 
function scr_player_attack(){
//Timers
//if (keyboard_check_pressed(ord("Q"))) or (keyboard_check_pressed(ord("F")))
//{
//	if (magic_primary = true)
//	{
//		magic_primary = false;
//		attack_script = magicA_script;
//	}
//	else
//	{
//		magic_primary = true;
//		attack_script = magicP_script;
//	}
//}
//Weapon State
script_execute(attack_script);
}
//
//
//
//
//
//Animation 
function scr_player_animation(){
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
//Animation 
function scr_player_animation_cast(){
var _aimDir = round(point_direction(x + dir_offX,y + dir_offY,mouse_x,mouse_y)/90);
direction = _aimDir * 90
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
//Animation 
function scr_player_animation_one(){
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
//Animation 
function scr_player_animation_fixed(){
var _totalFrames = sprite_get_number(sprite_index) / 4;
image_index = local_frame + (fixed_dir * _totalFrames);
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
//Player Collision
function scr_player_collision(){
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
function scr_player_projectile_spawn(){
var _aimAngle = point_direction(x + dir_offX,y + dir_offY,mouse_x,mouse_y);
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
//Player Cursor
function scr_cursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 0;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_game.gamePaused = false)
{
	var _xClampF = clamp(window_mouse_get_x(),16,window_get_width()-32);
	var _yClampF = clamp(window_mouse_get_y(),16,window_get_height()-32);
	window_mouse_set(_xClampF,_yClampF)
	if (point_distance(x,y,obj_player.x,obj_player.y) > 48)
	{
		curs_width = 8 + (point_distance(x,y,obj_player.x,obj_player.y) - 48);
		curs_height = 8 + (point_distance(x,y,obj_player.x,obj_player.y) - 48);
	}
	else
	{
		curs_width = 8;
		curs_height = 8;
	}
}


depth = -5000;
}
//
//
//
//
//
//Player Cursor Draw
function scr_cursor_draw(){
var xOff = ((curs_width/2))
var yOff = ((curs_height/2))
//if (obj_player.selected_crystal != -1) and (curs_meter = true)
//{
//	draw_pie_healthbar(x + xOff,y + yOff,obj_player.selected_crystal,obj_player.max_charge,c_yellow,3,1);
//}
draw_sprite_stretched(spr_cursor_play,curs_form,x-4,y-4,8,8);
draw_sprite_stretched(spr_cursor_play,curs_form,x-xOff,y-yOff,curs_width,curs_height);


}
//
//
//
//
//
//Player Death
function scr_player_death(){
dead = true;
iAlpha = iAlpha - .01;
image_alpha = iAlpha;
if (iAlpha <= 0)
{
	//Player
	audio_stop_all();
	walk_snd = snd_walk_regular;
	ablaze_dur_timer = 0;
	thundux_dur_timer = 0;
	watervice_dur_timer = 0;
	scr_game_room_enemy_reset();
	scr_player_reset();
	dead = false;
	
	
	//Room
	room_goto(global.lastAltar);
	iAlpha = 1;
	image_alpha = 1;
	image_xscale = 1;
	image_yscale = 1;
	x = global.lastAltarX;
	y = global.lastAltarY;
	global.aggroCounter = 0;
	obj_game.event_live = false;
	state_script = free_state;
	attacking = false;
}
	
}
//
///
//
//
//
//Player Reset
function scr_player_reset(){
with (obj_player)
{
	hp = max_hp;
	yellow_primary = max_charge;
	orange_primary  = max_charge;
	purple_primary  = max_charge;
	blue_primary  = max_charge;
	green_primary = max_charge
	red_primary  = max_charge;
	yellow_special = max_charge;
	orange_special = max_charge;
	purple_special = max_charge;
	blue_special = max_charge;
	green_special = max_charge;
	red_special = max_charge;
	for (var i = 0; i < 11; i = i + 1)
	{
		crystal_use[i] = false;
	}
}	
}
//
//
//
//
//
//Player Death Fall
function scr_player_death_fall(){
dead = true;
image_alpha = image_alpha - .01;
image_xscale = image_xscale - .01;
image_yscale = image_yscale - .01;
if (image_xscale <= 0) or (image_yscale <= 0)
{
	audio_stop_all();
	walk_snd = snd_walk_regular;
	ablaze_dur_timer = 0;
	thundux_dur_timer = 0;
	watervice_dur_timer = 0;
	hp = max_hp;
	for (var i = 0; i < 11; i = i + 1)
	{
		crull_use[i] = false;
	}
	dead = false;
	//Room
	(room_goto(global.lastCamp));
	image_xscale = 1;
	image_yscale = 1;
	image_alpha = 1;
	x = global.lastCampX;
	y = global.lastCampY;
	global.aggroCounter = 0;
	global.bossCounter = 0;
	state_script = free_state;
	attacking = false;
	obj_inventory.depth = depth + 1;
}
	
}