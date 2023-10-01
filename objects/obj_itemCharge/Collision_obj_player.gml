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
			//Add x to Special meters
			yellow_special = yellow_special + other.drop_amount;
			if (yellow_special > max_special) yellow_special = max_special;
			orange_special = orange_special + other.drop_amount;
			if (orange_special > max_special) orange_special = max_special;
			purple_special = purple_special + other.drop_amount;
			if (purple_special > max_special) purple_special = max_special;
			blue_special = blue_special + other.drop_amount;
			if (blue_special > max_special) blue_special = max_special;
			green_special = green_special + other.drop_amount;
			if (green_special > max_special) green_special = max_special;
			red_special = red_special + other.drop_amount;
			if (red_special > max_special) red_special = max_special;
			
			////Add x to magic charge meters
			//yellow_charge = yellow_charge + other.drop_amount;
			//if (yellow_charge > max_charge) yellow_charge = max_charge;
			//blue_charge = blue_charge + other.drop_amount;
			//if (blue_charge > max_charge) blue_charge = max_charge;
			//purple_charge = purple_charge + other.drop_amount;
			//if (purple_charge > max_charge) purple_charge = max_charge;
			//red_charge = red_charge + other.drop_amount;
			//if (red_charge > max_charge) red_charge = max_charge;
			//green_charge = green_charge + other.drop_amount;
			//if (green_charge > max_charge) green_charge = max_charge;
			//orange_charge = orange_charge + other.drop_amount;
			//if (orange_charge > max_charge) orange_charge = max_charge;
		}
		instance_destroy();
	break;
}
	