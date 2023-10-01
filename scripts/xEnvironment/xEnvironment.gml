
//
//
//
//
//
//Enemy Environment
function xscr_player_environment(){
if (place_meeting(x,y,obj_platform))
{
	platform = true;
	walk_snd = snd_walk_regular;
}
else platform = false;
if (place_meeting(x,y,obj_waterDeep)) and (platform = false)
{
	state_script = PlayerDeathFall;
}
}
//
//
//
//
//
//Enemy Environment
function xEnemyEnvironment(){
if (place_meeting(x,y,obj_platform))
{
	platform = true;
	walk_snd = snd_walk_regular;
}
else platform = false;
if (place_meeting(x,y,obj_waterDeep)) and (platform = false)
{
	state_script = EnemyDeathFall;
}
}

