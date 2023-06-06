//Collision With Player
with (obj_player)
{
	yellow_special = yellow_special + other.drop_amount;
	if (yellow_special > max_special) yellow_special = max_special;
	blue_special = blue_special + other.drop_amount;
	if (blue_special > max_special) blue_special = max_special;
	purple_special = purple_special + other.drop_amount;
	if (purple_special > max_special) purple_special = max_special;
	red_special = red_special + other.drop_amount;
	if (red_special > max_special) red_special = max_special;
	green_special = green_special + other.drop_amount;
	if (green_special > max_special) green_special = max_special;
	orange_special = orange_special + other.drop_amount;
	if (orange_special > max_special) orange_special = max_special;
}
instance_destroy();
	