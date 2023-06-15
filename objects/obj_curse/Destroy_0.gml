//Destroy
// Inherit the parent event
event_inherited();

if (level_unlock != -1) and (camp_unlock != -1)
{
	with (obj_inventory) 
	{
		level_ary[other.level_unlock] = true;
		camp_grid[# other.camp_unlock, 3] = true;
	}
}
with (obj_inventory)
{
	quest_grid[# other.activate_args, 0] = true;
	quest_grid[# other.activate_args, 1] = quest_grid[# other.activate_args, 1];
	quest_grid[# other.activate_args, 3] = true;
	
}
audio_sound_gain(snd_curseStone_break,global.volumeEffects,1);
audio_play_sound(snd_curseStone_break,0,false);
//with (obj_wall)
//{
//	if (place_meeting(x,y,other))
//	{
//		instance_destroy(self);
//	}
//}
//with (break_object)
//{
//	if (place_meeting(x,y,other))
//	{
//		instance_destroy(self);
//	}
//}