//Charge
if (!obj_game.gamePaused)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y-4);
		speed = 1;
		image_speed = 0;
	}
	else
	{
		speed = 0; 
		event_inherited();
	}
}
