//Step

//Keep variables set to player XY
if (instance_exists(follow))
{
	x_toward = follow.x;
	y_toward = follow.y;
}

//Move toward variables set to player XY
x = x + (x_toward - x) / 15;
y = y + (y_toward - y) / 15;

//Clamp camera in room
x = clamp(x,view_width_half, room_width - view_width_half);
y = clamp(y,view_height_half, room_height - view_height_half);

//Screenshake
x = x + random_range(-shake_rem, shake_rem);
y = y + random_range(-shake_rem, shake_rem);
shake_rem = max(0, shake_rem - ((1/shake_len) * shake_mag));

camera_set_view_pos(cam, x - view_width_half, y - view_height_half);