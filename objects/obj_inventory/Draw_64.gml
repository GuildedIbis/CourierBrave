//Draw Inventory GUI
if (obj_game.gamePaused = true) and (obj_game.invPaused = true)
{
	depth = obj_player.depth + 1;
	if (quick_swap = false)
	{
		script_execute(InventoryMain);
	}
	if (quick_swap = true)
	{
		script_execute(InventoryQuickSwap);
	}
	if (inv_gui != -1) script_execute(inv_gui);
}

