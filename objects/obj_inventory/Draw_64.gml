//Draw Inventory GUI
if (obj_game.gamePaused = true) and (obj_game.invPaused = true)
{
	depth = obj_player.depth + 1;
	if (swap_menu = true)
	{
		scr_inventory_quickswap();
	}
	if (quest_menu = true)
	{
		scr_inventory_quest();
	}
	if (map_menu = true)
	{
		scr_inventory_map();
	}
	
}

