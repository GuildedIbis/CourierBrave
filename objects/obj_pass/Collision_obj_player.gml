//Collision With Player
if (global.aggroCounter = 0) and (keyboard_check_pressed(ord("E")))
{
	if (obj_game.gamePaused = false)
	{
		obj_player.x = target_x;
		obj_player.y = target_y;
	}
		
	//	audio_play_sound(obj_game.songArray[| global.roomNumber],0,1);
	//}

}
