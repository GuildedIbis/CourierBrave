//Draw GUI

//Pause Menu - Contains: Resume, Settings, Save/Quite
if (gamePaused = true) and (menuPaused = true)
{
	script_execute(pause_menu);
}

//Home Menu 
if (global.home = true)
{
	depth = 1;
	scr_menu_game_home();
}

//Day Cycle
scr_day_cycle();

//Room Transistion
GameRoomTransition();

//Room Name
GameRoomName();
