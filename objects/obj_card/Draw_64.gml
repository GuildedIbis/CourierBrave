//Draw Card GUI
if (selected = true)
{
	switch(card_place)
	{
		case 0:
			card_script = card_hand;
		break;
		
		case 1:
			card_script = card_active;
		break;
		
		case 2:
			card_script = card_back;
		break;
	}
	if (card_script != -1)
	{
		script_execute(card_script);
	}
}
