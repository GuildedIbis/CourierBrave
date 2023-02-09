//On Destruction

//All entities fragment on destruction
if (fragment_count > 0)
{
	fragment_array = array_create(fragment_count, fragment);
	DropObject(x,y,fragment_array);
}