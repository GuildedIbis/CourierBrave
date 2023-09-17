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
	script_execute(home_menu)
}

//Day Cycle
scr_day_cycle();

//Room Transistion
scr_game_room_transition();

//Room Name
scr_game_room_name();
