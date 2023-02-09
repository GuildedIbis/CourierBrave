///Cursor Step

if (global.home = true)
{
	x = mouse_x;
	y = mouse_y;
}
else
{
	if (obj_game.gamePaused = false)
	{
		script_execute(curs_script);
	}
}
