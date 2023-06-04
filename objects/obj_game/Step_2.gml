//Game End Step

//Pause Game
if (keyboard_check_pressed(vk_escape)) and (global.home = false)
{
	if (textPaused = false) and (invPaused = false)
	{
		if (menuPaused = false) 
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
		}
		gamePaused = !gamePaused;
		menuPaused = !menuPaused;
		//global.gamePaused = !global.gamePaused;
		//global.menuPaused = !global.menuPaused;
		if (gamePaused)
		{
			
			with (all)
			{
				game_paused_image_speed = image_speed;
				image_speed = 0;
			}
		}
		else
		{
			//global.gamePaused = false;
			//global.menuPaused = false;
			script_execute(SaveGameSettings);
			with (all)
			{
				image_speed = game_paused_image_speed;
			}
		}
	}
}

//Player Inventory - Main
if (keyboard_check_pressed(vk_tab))
{
	if (global.home = false) and (global.transition = false)
	{
		if (textPaused = false) and (menuPaused = false)
		{
			if (invPaused = false) 
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
			}
			gamePaused = !gamePaused;
			invPaused = !invPaused;
			if (gamePaused)
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

//Player Inventory - Quick Swap (Weapon Wheel)
if (keyboard_check_pressed(ord("R")))
{
	if (global.home = false) and (global.transition = false)
	{
		if (textPaused = false) and (menuPaused = false)
		{
			if (invPaused = false) 
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
			}
			gamePaused = !gamePaused;
			invPaused = !invPaused;
			with (obj_inventory)
			{
				quick_swap = !quick_swap;
			}
			if (gamePaused)
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


