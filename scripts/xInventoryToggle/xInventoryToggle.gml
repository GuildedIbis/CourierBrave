//
//
//
//
//
//Inventory Open/Close
function xscr_inventory_toggle(){
//Player Inventory - Main

//Adventure Mode
if (global.gameMode = 0)
{
	if (keyboard_check_pressed(vk_tab)) and (obj_inventory.swap_menu = false)
	{
		if (global.home = false) and (global.transition = false)
		{
			if (textPaused = false) and (menuPaused = false)
			{
				if (invPaused = false) 
				{
					obj_inventory.inv_gui = -1;
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
}