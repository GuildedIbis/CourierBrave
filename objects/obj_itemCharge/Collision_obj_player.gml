//Collision With Player
with (obj_player)
{
	yellow_charge = yellow_charge + other.drop_amount;
	if (yellow_charge > max_yellow_charge) yellow_charge = max_yellow_charge;
	blue_charge = blue_charge + other.drop_amount;
	if (blue_charge > max_blue_charge) blue_charge = max_blue_charge;
	purple_charge = purple_charge + other.drop_amount;
	if (purple_charge > max_purple_charge) purple_charge = max_purple_charge;
	red_charge = red_charge + other.drop_amount;
	if (red_charge > max_red_charge) red_charge = max_red_charge;
	green_charge = green_charge + other.drop_amount;
	if (green_charge > max_green_charge) green_charge = max_green_charge;
	orange_charge = orange_charge + other.drop_amount;
	if (orange_charge > max_orange_charge) orange_charge = max_orange_charge;
}
instance_destroy();
	