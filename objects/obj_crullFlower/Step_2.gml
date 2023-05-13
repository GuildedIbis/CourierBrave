//Crull Flower End Step

// Inherit the parent event
event_inherited();

lit = true;

if (moon = true)
{
	if (obj_inventory.crullM_list[activate_args] = false) and (global.dayPhase = 2)
	{
		image_index = 0;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,12)) 
		{
			if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
			{
				//Audio
				//audio_sound_gain(snd_chest,global.volumeEffects,1);
				//audio_play_sound(snd_chest,0,false);
				obj_inventory.crullM_list[activate_args] = true;
				with (obj_text)
				{
					text_script = CrullFlowerMText;
				}
				obj_game.gamePaused = !obj_game.gamePaused;
				obj_game.textPaused = !obj_game.textPaused;
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
	if (obj_inventory.crullM_list[activate_args] = true) or (global.dayPhase != 2)
	{
		image_index = 1;
	}
}
if (moon = false)
{
	if (obj_inventory.crullS_list[activate_args] = false) and (global.dayPhase != 2)
	{
		image_index = 0;
		if (point_in_circle(obj_player.x,obj_player.y,x,y,12)) 
		{
			if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
			{
				//Audio
				//audio_sound_gain(snd_chest,global.volumeEffects,1);
				//audio_play_sound(snd_chest,0,false);
				obj_inventory.crullS_list[activate_args] = true;
				with (obj_text)
				{
					text_script = CrullFlowerSText;
					
				}
				obj_game.gamePaused = !obj_game.gamePaused;
				obj_game.textPaused = !obj_game.textPaused;
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
	if (obj_inventory.crullS_list[activate_args] = true) or (global.dayPhase = 2)
	{
		image_index = 1;
	}
}