///End Step

// Inherit the parent event
event_inherited();
image_speed = 1;


//Activate Kephra Stone: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		if obj_inventory.kephra_grid[# activate_args, 1] = false 
		{
			obj_inventory.kephra_grid[# activate_args, 1] = true;
		}
		audio_sound_gain(snd_text01,global.volumeEffects,1);
		audio_play_sound(snd_text01,0,false);
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			text_script = KephraStoneMain;
			activate_args = other.activate_args;
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

