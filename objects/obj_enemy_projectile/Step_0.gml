//Step

//Step Script Set in Room Editor Variable Definitions
script_execute(entity_step);
if (bullet = false)
{
	if (hp <= 0) 
	{
		//bean_array = array_create(3, obj_itemBean);
		//DropObject(x,y,bean_array);
		if (targeted = true) global.aggroCounter = global.aggroCounter - 1;
		script_execute(entity_drop);
		instance_destroy();
	}
}
EnemyEnvironment();
StatusEffects();
