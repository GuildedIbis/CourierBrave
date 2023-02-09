//End Step
//
//
//
//Depth Sort
if (!obj_game.gamePaused)
{
	if (place_meeting(x,y,obj_player))
	{
		if (depth < obj_player.depth)
		{
			if (image_alpha > .5) image_alpha = image_alpha - .05
		}
		else
		{
			if (image_alpha < 1) image_alpha = image_alpha + .05;
		}
	}
	else 
	{
		if (image_alpha < 1) image_alpha = image_alpha + .05;
	}
	depth = -y;
}



