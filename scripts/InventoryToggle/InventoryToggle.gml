//Inventory Toggle Scripts
//
//
//
//
//
//Inventory Open/Close
function scr_inventory_toggle(){
//Player Inventory - Quick Swap (Weapon Wheel)
if (keyboard_check_pressed(vk_tab))
{
	if (global.home = false) and (global.transition = false)
	{
		if (textPaused = false) and (menuPaused = false)
		{
			switch (invPaused) 
			{
				case true:
					if (obj_inventory.main_menu = true)
					{
						gamePaused = false;
						invPaused = false;
						scr_audio_resume_enemy();
						scr_audio_resume_player();
						with (obj_inventory)
						{
							swap_menu = false;
							main_menu = false;
							//map_menu = false;
							//quest_menu = false;
						}
						with (all)
						{
							image_speed = game_paused_image_speed;
						}
					}
				break;
				
				case false:
					if (obj_inventory.main_menu = false)
					{
						audio_sound_gain(snd_menu,global.volumeMenu,1);
						audio_play_sound(snd_menu,0,false);
						scr_audio_pause_enemy();
						scr_audio_pause_player();
						gamePaused = true;
						invPaused = true;
						with (obj_inventory)
						{
							swap_menu = false;
							main_menu = true;
							//map_menu = false;
							//quest_menu = false;
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
//
//
//
//
//
//Swap Menu Open/Close
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
					if (obj_inventory.swap_menu = true)
					{
						gamePaused = false;
						invPaused = false;
						scr_audio_resume_enemy();
						scr_audio_resume_player();
						with (obj_inventory)
						{
							swap_menu = false;
							//map_menu = false;
							//quest_menu = false;
						}
						with (all)
						{
							image_speed = game_paused_image_speed;
						}
					}
				break;
				
				case false:
					if (obj_inventory.swap_menu = false)
					{
						audio_sound_gain(snd_menu,global.volumeMenu,1);
						audio_play_sound(snd_menu,0,false);
						gamePaused = true;
						invPaused = true;
						scr_audio_pause_enemy();
						scr_audio_pause_player();
						with (obj_inventory)
						{
							swap_menu = true;
							//map_menu = false;
							//quest_menu = false;
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
//
//
//
//
//
//Quest Menu Open/Close
function scr_quest_toggle(){
//Player Inventory - Quest Menu
if (keyboard_check_pressed(ord("Q"))) 
{
	if (global.home = false) and (global.transition = false)
	{
		if (textPaused = false) and (menuPaused = false)
		{
			switch (invPaused) 
			{
				case true:
					if (obj_inventory.main_menu = true)
					{
						gamePaused = false;
						invPaused = false;
						scr_audio_resume_enemy();
						scr_audio_resume_player();
						with (obj_inventory)
						{
							swap_menu = false;
							main_menu = false;
							inv_gui = -1;
						}
						with (all)
						{
							image_speed = game_paused_image_speed;
						}
					}
				break;
				
				case false:
					if (obj_inventory.main_menu = false)
					{
						audio_sound_gain(snd_menu,global.volumeMenu,1);
						audio_play_sound(snd_menu,0,false);
						gamePaused = true;
						invPaused = true;
						scr_audio_pause_enemy();
						scr_audio_pause_player();
						with (obj_inventory)
						{
							swap_menu = false;
							main_menu = true;
							inv_gui = scr_menu_inventory_quest;
							page = 0;
							slot = -1;
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
//
//
//
//
//
//Map Menu Open/Close
function scr_map_toggle(){
//Player Inventory - Map Menu
if (keyboard_check_pressed(ord("M"))) 
{
	if (global.home = false) and (global.transition = false)
	{
		if (textPaused = false) and (menuPaused = false)
		{
			switch (invPaused) 
			{
				case true:
					if (obj_inventory.main_menu = true)
					{
						gamePaused = false;
						invPaused = false;
						scr_audio_resume_enemy();
						scr_audio_resume_player();
						with (obj_inventory)
						{
							swap_menu = false;
							main_menu = false;
							inv_gui = -1;
						}
						with (all)
						{
							image_speed = game_paused_image_speed;
						}
					}
				break;
				
				case false:
					if (obj_inventory.main_menu = false)
					{
						audio_sound_gain(snd_menu,global.volumeMenu,1);
						audio_play_sound(snd_menu,0,false);
						gamePaused = true;
						invPaused = true;
						scr_audio_pause_enemy();
						scr_audio_pause_player();
						with (obj_inventory)
						{
							swap_menu = false;
							main_menu = true;
							inv_gui = scr_menu_inventory_map;
							page = 0;
							item_id = -1;
							slot = obj_game.level_num;
							map_selected = map_grid[# obj_game.level_num, 2];
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
