//Step

//Step Script Set in Room Editor Variable Definitions
script_execute(entity_step);
if (bullet = false)
{
	if (hp > max_hp) hp = max_hp;
	if (hp <= 0) 
	{
		//bean_array = array_create(3, obj_itemBean);
		//DropObject(x,y,bean_array);
		if (targeted = true) global.aggroCounter = global.aggroCounter - 1;
		script_execute(entity_drop);
		instance_destroy();
		if (spawn_slot != -1)
		{
			switch (spawn_slot)
			{
				case 1:
					with (obj_spawner)
					{
						spawn_status = false;
					}
				break;
				case 2:
					with (obj_spawner)
					{
						spawn_status2 = false;
					}
				break;
				case 3:
					with (obj_spawner)
					{
						spawn_status3 = false;
					}
				break;
			}
		}
				
	}
}
EnemyEnvironment();
StatusEffects();
