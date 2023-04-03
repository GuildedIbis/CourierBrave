//Create Effect

event_inherited();
image_speed = 0;
depth = -y;
if (pos != -1)
{
	switch(pos)
	{
		case 0:
			sprite_index = spr_lenkoFortress_pillarBack;
			image_index = 1;
		break;
		
		case 1:
			sprite_index = spr_lenkoFortress_pillarFront;
			image_index = 1;
		break;
		
		case 2:
			sprite_index = spr_lenkoFortress_pillarFront;
			image_index = 0;
		break;
		
		case 3:
			sprite_index = spr_lenkoFortress_pillarBack;
			image_index = 0;
		break;
	}
}