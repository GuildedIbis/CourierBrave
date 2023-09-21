//Toggle Menus Off/On
//
//
//
//
//
//Inventory Open/Close
function scr_inventory_toggle(){
//Player Inventory - Main
if (keyboard_check_pressed(vk_tab)) and (obj_inventory.quick_swap = false)
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
}
//
//
//
//
//
//Pause Open/Close
function scr_pause_toggle(){
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
			scr_game_save_settings();
			with (all)
			{
				image_speed = game_paused_image_speed;
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
// Quickswap Open/Close
function scr_swap_toggle(){
	
//Player Inventory - Quick Swap (Weapon Wheel)
if (keyboard_check_pressed(ord("R"))) 
{
	if (global.home = false) and (global.transition = false)
	{
		if (textPaused = false) and (menuPaused = false)
		{
			switch (invPaused) 
			{
				case true:
					if (obj_inventory.quick_swap = true)
					{
						gamePaused = false;
						invPaused = false;
						with (obj_inventory)
						{
							quick_swap = false;
						}
						with (all)
						{
							image_speed = game_paused_image_speed;
						}
					}
				break;
				
				case false:
					if (obj_inventory.quick_swap = false)
					{
						audio_sound_gain(snd_menu,global.volumeMenu,1);
						audio_play_sound(snd_menu,0,false);
						gamePaused = true;
						invPaused = true;
						with (obj_inventory)
						{
							quick_swap = true;
						}
						with (all)
						{
							game_paused_image_speed = image_speed;
							image_speed = 0;
						}
					}
				break;

			}
		
		}
	}
}
}