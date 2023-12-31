//NPC General Scripts
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