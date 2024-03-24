//Draw

if (obj_game.gamePaused = false) and (global.home = false)
{
	if (interact = false)
	{
		script_execute(curs_draw_script)
	}
	else
	{
		draw_sprite_ext(spr_player_interact,0,x,y,scale_x,scale_y,0,c_white,1);
	}
}




