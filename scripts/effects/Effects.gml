//Status Effect Scripts
//
//
//
//
//
//Status Effect Calculate
function StatusEffects(){
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
		hp = hp - round(max_hp/50)
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

if (knockback_dur > 0)
{
	knockback = true;
	var xx = lengthdir_x(knockback_dur,knockback_dir);
	var yy = lengthdir_y(knockback_dur,knockback_dir);
	if (!place_meeting(x+xx,y+yy,obj_entity))
	{
		x = x + xx;
		y = y + yy;
	}
	knockback_dur = knockback_dur - 1/10;
}
else knockback = false;

}//Close Pause
}//End Function
//
//
//
//
//
//Draw Status Effects
function StatusEffectsDraw(){
if (ablaze = true) and (ablaze_damage_timer < 15)
{
	draw_sprite(spr_status_effects,0,x,y-4);
}
if (watervice = true) and (watervice_flash_timer < 15)
{
	draw_sprite(spr_status_effects,2,x,y-4);
}

	
}//End Function
