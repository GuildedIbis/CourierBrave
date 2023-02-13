//STep - Inherited from obj_fragment
if (!obj_game.gamePaused)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		speed = 1;
		image_speed = 0;
	}
	else
	{
		path_end(); 
		event_inherited();
	}
}
