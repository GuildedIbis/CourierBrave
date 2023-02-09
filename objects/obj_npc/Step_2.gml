///End Step

// Inherit the parent event
event_inherited();

//Regular Step Script
if (entity_step != -1) script_execute(entity_step);

//Animate: Same As Player- Loop based on Direction


//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		//show_debug_message(string(instance_number(obj_inventory)));
		//show_debug_message(string(instance_number(obj_text)));
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		//direction = 270;
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			text_script = other.activate_script;
			if (other.activate_args != -1) quest_num = other.activate_args;
		}
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

