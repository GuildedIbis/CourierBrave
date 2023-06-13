//Charge
if (!obj_game.gamePaused)
{
	if (timer1 > 0) timer1 = timer1 - 1;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,16)) and (timer1 <= 0)
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
