//Draw

if (obj_game.gamePaused = false) and (global.home = false)
{
	if (collision_circle(obj_player.x,obj_player.y,12,obj_interactable,false,true))
	{
		interact = true;
	}
	else interact = false;
	if (interact = false)
	{
		script_execute(curs_draw_script)
	}
	else
	{
		draw_sprite_ext(spr_player_interact,0,x,y,1,1,0,c_white,1);
	}
}




