//Collision with Escort
if (escort_end = true)
{
	with (other)
	{
		path_end();
	}
}
else
{
	other._destX = destination2_x;
	other._destY = destination2_y;
}


