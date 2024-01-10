//Status Effect Scripts
//
//
//
//
//
//Status Effect Calculate
function scr_entity_status_effects(){
if (obj_game.gamePaused = false){

//Ablaze
if (ablaze_dur_timer > 0) 
{
	ablaze_dur_timer = ablaze_dur_timer - 1;
	ablaze = true;
}
if (ablaze_dur_timer <= 0) ablaze = false;
if (ablaze = true) 
{
	if (ablaze_damage_timer > 0) ablaze_damage_timer = ablaze_damage_timer - 1;
	if (ablaze_damage_timer <= 0)
	{
		ablaze_damage_timer = 60;
		hp = hp - max(2,round(max_hp/50))
	}
}

//Watervice
if (watervice_dur_timer > 0) 
{
	watervice_dur_timer = watervice_dur_timer - 1;
	watervice = true;
}
if (watervice_dur_timer <= 0) watervice = false;
if (watervice = true) 
{
	if (watervice_flash_timer > 0) watervice_flash_timer = watervice_flash_timer - 1;
	if (watervice_flash_timer <= 0) watervice_flash_timer = 60;
}

//Thundux
thundux = false;
thundux_dur_timer = 0;

//Voidsick
voidsick = false;
voidsick_dur_timer = 0;

//Invincibility
if (inv_dur_timer > 0)
{
	inv_dur_timer = inv_dur_timer - 1;
	invincible = true;
}
if (inv_dur_timer <= 0)
{
	invincible = false;
}

//Heal
if (heal_dur_timer > 0)
{
	heal_dur_timer = heal_dur_timer - 1;
	heal = true;
}
if (heal_dur_timer <= 0)
{
	heal = false;
}
//Knockback
if (knockback_dur > 0)
{
	knockback = true;
	if (knockback_dir != -1)
	{
		var _xDest = x + hor_spd;
		var _yDest = y + ver_spd;
		if (place_meeting(_xDest, _yDest,obj_entity))
		{
			hor_spd = 0;
			ver_spd = 0;
			path_end();
		}
		path = path_add();
		mp_potential_path_object(path, _xDest, _yDest, 1, 2, obj_entity);
		path_start(path, 2.5, 0, 0);
	}
	knockback_dur = knockback_dur - 1;
}
else
{
	if (knockback = true)
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		knockback = false;
	}
}

//Cursed
if (cursed_dur_timer > 0)
{
	cursed = true;
	cursed_dur_timer = cursed_dur_timer - 1;
}
else cursed = false;
}
//Close Pause
}//End Function
//
//
//
//
//
//Draw Status Effects
function scr_entity_status_effects_draw(){
if (status_animate_timer > 0) status_animate_timer = status_animate_timer - 1;
if (status_animate_timer <= 0)
{
	status_animate_timer = 5;
	status_animate_index = irandom_range(0,5);
}
if (ablaze = true) //and (ablaze_damage_timer < 30)
{
	draw_sprite(spr_status_ablaze,irandom_range(status_animate_index,5),x,y-4);
}
if (heal = true)
{
	draw_sprite(spr_status_heal,irandom_range(status_animate_index,5),x,y-4);
}
if (watervice = true) and (watervice_flash_timer < 15)
{
	draw_sprite(spr_status_effects,2,x,y-4);
}

	
}//End Function

