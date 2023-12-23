//Game End Step
if (save_num != -1)
{
	switch(save_num)
	{
		case 0:
			gameplay_timer = gameplay_timer - 1;
			if (gameplay_timer <= 0)
			{
				gameplay_timer = 60;
				time_played = time_played + 1;
			}
		break;
		
		case 1:
			gameplay_timer = gameplay_timer - 1;
			if (gameplay_timer <= 0)
			{
				gameplay_timer = 60;
				time_played2 = time_played2 + 1;
			}
		break;
		
		case 2:
			gameplay_timer = gameplay_timer - 1;
			if (gameplay_timer <= 0)
			{
				gameplay_timer = 60;
				time_played3 = time_played3 + 1;
			}
		break;
	}
}

scr_pause_toggle();
scr_swap_toggle();
scr_quest_toggle();
scr_map_toggle();


