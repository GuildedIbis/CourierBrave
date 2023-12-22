//Arcade Level Spawners
//
//
//
//
//
//Acrade Level 0 Spawner Create
function scr_spawner_arcade_00_create(){
wave_started = false;
wave_num = 0;
spawn_timer = 15;
spawn_counter = 0;
spawn_total = 15;
}
//
//
//
//
//
//Arcade Level 0 Spawner
function scr_spawner_arcade_00(){

if (spawn_timer > 0) 
{
	spawn_timer = spawn_timer -1;
	if (spawn_timer <= 0)
	{
			
		//Decide Spawn Position
		if (point_in_rectangle(obj_player.x,obj_player.y,0,0,319,179))
		{
			x_spawn1 = 380;
			y_spawn1 = 112;

		}
		else
		{
			var _choose = irandom_range(0,1)
			if (_choose = 0)
			{
				x_spawn1 = 380;
				y_spawn1 = 112;
			}
			else
			{
				x_spawn1 = 380;
				y_spawn1 = 112;
			}
		}
			
		//Spawn, Tally, Reset
		with (instance_create_layer(x_spawn1,y_spawn1,"Instances",obj_enemy))
		{
			image_alpha = 1;
			scr_enemy_balurne_skirmisher_create();
			enemy_lvl = 0;
			global.aggroCounter = global.aggroCounter + 1;
			targeted = true;
			break_object = obj_break;
		}
		spawn_timer = 300;
		spawn_counter = spawn_counter + 1;
	}
}

}