//NPC General Scripts
//
//
//
//
//
//NPC Timers
function scr_npc_timer_countdown(){
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
}
//
//
//
//
//Interact with NPCs
function scr_npc_interact(radius){
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,radius)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
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
//Interact with NPCs
function scr_npc_interact_chest(radius){
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,radius)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		if (locked = false)
		{
			audio_sound_gain(sound,global.volumeEffects,1);
			audio_play_sound(sound,0,false);
		}
		direction = point_direction(x,y,obj_player.x,obj_player.y);
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
//Interact with Skill Stone Pedestals
function scr_npc_interact_skill_pedestal(radius){
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,radius)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			if (other.activate_script != -1) text_script = other.activate_script;
			if (other.activate_args != -1) quest_num = other.activate_args;
		}
		if (activate_args != -1)
		{
			obj_inventory.skill_stone_list[activate_args] = true;
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
//Interact with Skill Stone Pedestals
function scr_npc_interact_form_pedestal(radius){
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,radius)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			if (other.activate_script != -1) text_script = other.activate_script;
			if (other.activate_args != -1) quest_num = other.activate_args;
		}
		if (activate_args != -1)
		{
			obj_inventory.form_stone_list[activate_args] = true;
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
//Interact with Skill Stone Pedestals
function scr_npc_interact_starorb_pedestal(radius){
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,radius)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			if (other.activate_script != -1) text_script = other.activate_script;
			if (other.activate_args != -1) quest_num = other.activate_args;
		}
		if (activate_args != -1)
		{
			obj_inventory.starOrb_pedestal_list[activate_args] = true;

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
//NPC Animation
function scr_npc_animation(){
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
//Wander Near Home Location with Collision
function scr_npc_wander_home_range(_moveDelay,_moveLength,_homeX,_homeY,_range){
var _collision = false;
var _entityList = ds_list_create();

//Direction
if (timerW <= 0)
{
	hor_spd = irandom_range(-1,1) * (npc_spd/2);
	ver_spd = irandom_range(-1,1) * (npc_spd/2);
	timerW = _moveLength + irandom_range(-15,15);
	timerC = _moveDelay + irandom_range(-15,15);
}

//Movement and Animation
if (timerC > 0)
{
	//Movement
	if (hor_spd != 0) or (ver_spd != 0) 
	{
		var _xDest = x + (hor_spd * (npc_spd/2))
		var _yDest = y + (ver_spd * (npc_spd/2))
		if (!point_in_circle(_xDest,_yDest,_homeX,_homeY,_range))
		{
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
		}
		direction = point_direction(x,y,_xDest,_yDest);
		image_speed = 1;
		sprite_index = npc_move;
	}
	//else 
	//{
	//	sprite_index = npc_idle;
	//}


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
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
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
			hor_spd = -hor_spd;
			ver_spd = -ver_spd;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList,0);
		_entityCount = _entityCount - 1;
	}

	//Vertical Move
	y += ver_spd;
}
else 
{
	local_frame = 0;
	//image_index = 0;
	sprite_index = npc_idle;
	//var _totalFrames = sprite_get_number(sprite_index) / 4;
	//image_index = (_cardinalDir * _totalFrames);
	//hor_spd = 0;
	//ver_spd = 0;
}

ds_list_destroy(_entityList);

return _collision;
}
//
//
//
//
//NPC Move Towards Exit
function scr_npc_exit(_exitX,_exitY){
if (path_exists(path)) path_delete(path);
path = path_add();
mp_potential_path_object(path, _exitX, _exitY, 1, 2, obj_wall);
path_start(path, npc_spd, 0, 0);
image_speed = 1;
sprite_index = npc_move;
}