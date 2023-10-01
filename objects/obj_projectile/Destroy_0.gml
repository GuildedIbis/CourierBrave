//Player Projectile Destroy Event
if (fragment_count > 0)
{
	fragment_array = array_create(fragment_count, fragment);
	scr_entity_drop_object(x,y,fragment_array);
}



