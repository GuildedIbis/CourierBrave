if (obj_game.gamePaused = false)
{
	
	depth = -y;
	if (projectile_script != -1)
	{
		script_execute(projectile_script);
	}
}
else speed = 0;
