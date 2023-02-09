//Fragement Step

if (!obj_game.gamePaused)
{
	//Bounce
	if (bounce_count != 0)
	{
		bounce = bounce + (pi * bounce_spd);
		if (bounce > pi)
		{
			bounce = bounce - pi;
			bounce_height = bounce_height * 0.6;
			bounce_count = bounce_count - 1;
		}
		z = sin(bounce) * bounce_height;
	}
	else z = 0;
	
	//Deteriorate
	deteriorate = deteriorate + 1;
	if (deteriorate > deteriorate_after)
	{
		image_alpha = image_alpha - 1/deteriorate_time;
		if (image_alpha <= 0) instance_destroy();
	}
	
	//Friction
	fric = .05;
	if (z == 0) fric = .1;
	
	
	//Move

	x = x + lengthdir_x(spd,direction);
	y = y + lengthdir_y(spd,direction);
	if (place_meeting(x,y,obj_wall)) spd = 0;
	spd = max(spd-fric,0);

}
