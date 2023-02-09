//Draw Inventory GUI
if (obj_game.gamePaused = true) and (obj_game.invPaused = true)
{
	depth = obj_player.depth + 1;
	script_execute(InventoryMain);
	if (inv_gui != -1) script_execute(inv_gui);
}

