//Collision With Player
switch (image_index)
{
	case 0:
		with (obj_player)
		{
			yellow_primary = yellow_primary + other.drop_amount;
			if (yellow_primary > max_charge) yellow_primary = max_charge;
		}
		instance_destroy();
	break;
	
	case 1:
		with (obj_player)
		{
			orange_primary = orange_primary + other.drop_amount;
			if (orange_primary > max_charge) orange_primary = max_charge;
		}
		instance_destroy();
	break;
	
	case 2:
		with (obj_player)
		{
			purple_primary = purple_primary + other.drop_amount;
			if (purple_primary > max_charge) purple_primary = max_charge;
		}
		instance_destroy();
	break;
	
	case 3:
		with (obj_player)
		{
			blue_primary = blue_primary + other.drop_amount;
			if (blue_primary > max_charge) blue_primary = max_charge;
		}
		instance_destroy();
	break;
	
	case 4:
		with (obj_player)
		{
			green_primary = green_primary + other.drop_amount;
			if (green_primary > max_charge) green_primary = max_charge;
		}
		instance_destroy();
	break;
	
	case 5:
		with (obj_player)
		{
			red_primary = red_primary + other.drop_amount;
			if (red_primary > max_charge) red_primary = max_charge;
		}
		instance_destroy();
	break;
	
	case 6:
		with (obj_player)
		{
			hp = hp + other.drop_amount;
			if (hp > max_hp) hp = max_hp;
		}
		instance_destroy();
	break;
}
	