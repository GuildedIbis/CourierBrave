//Chest Scripts
//
//
//
//
//Standard Chest
function scr_chest_standard(){
if (moon = true)
{
	if (global.dayPhase = 2)
	{
		sprite_index = spr_chestMoon;
		image_alpha = 1;
		if (obj_inventory.chest_list[activate_args] = false)
		{
			image_index = 0;
			if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
			{
				if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
				{
					//Audio
					audio_sound_gain(snd_chest,global.volumeEffects,1);
					audio_play_sound(snd_chest,0,false);
			
					with (obj_text)
					{
						text_script = other.activate_script;
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
	}
	else
	{
		sprite_index = spr_chestMoon_stone;
		image_alpha = 1;
	}
}
if (moon = false)
{
//Activate Chest: sprite index, text script, game pause
if (obj_inventory.chest_list[activate_args] = false)
{
	image_index = 0;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
	{
		if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
		{
			//Audio
			audio_sound_gain(snd_chest,global.volumeEffects,1);
			audio_play_sound(snd_chest,0,false);
			
			with (obj_text)
			{
				text_script = other.activate_script;
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
}
if (obj_inventory.chest_list[activate_args] = true)
{
	image_index = 1;
}
}
