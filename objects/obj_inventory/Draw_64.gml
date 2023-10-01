//Draw Inventory GUI
if (obj_game.gamePaused = true) and (obj_game.invPaused = true)
{
	depth = obj_player.depth + 1;
	if (quick_swap = false)
	{
		scr_menu_inventory_main();
		if (inv_gui != -1) script_execute(inv_gui);
	}
	if (quick_swap = true)
	{
		scr_inventory_quickswap();
	}
	
}

