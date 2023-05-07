//End Step

event_inherited();

if (obj_game.gamePaused = false)
{
	image_speed = 1;
	if (escort_end = false)
	{
		if (point_in_circle(obj_player.x, obj_player.y,x,y,escort_rad)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
		{
			//var _xDest = x + (lengthdir_x(1,point_direction(x,y,obj_player.x,obj_player.y)))
			//var _yDest = y + (lengthdir_y(1,point_direction(x,y,obj_player.x,obj_player.y)))
			direction = point_direction(x,y,_destX,_destY);
			speed = escort_spd;
		
		}
		else
		{
			speed = 0;

		}
	}
}
else
{
	speed = 0;
}


//if (point_in_circle(obj_player.x, obj_player.y,x,y,48)) and (!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))
//{
//	if (!point_in_circle(obj_player.x, obj_player.y,x,y,8))
//	{
//		direction = point_direction(x,y,obj_player.x,obj_player.y);
//		speed = escort_spd;
//	}
//}


