//Create Background Game Stuff

//Randomize... and other random things
randomize();
script_execute(AllItems);

version = "Version: 0.2.3.4"
menu_sprite = spr_menu;
pause_menu = GamePauseMenu;
timer1 = 300;
timer2 = 5;
sub_menu = -1;
page = -1;
scene = false;
gamePaused = false; //Game Paused Controls All other objects, actually pauses game.
menuPaused = false; //This and invPaused control what the menu object draws.
invPaused = false;
textPaused = false;
event_live = false;
day_timer = 0;
max_day_timer = 18000;
transition_timer = 0;
room_name = -1;
room_name_timer = 0;
game_paused_image_speed = 0;
//home_song = snd_theme_main;

//audio_play_sound(home_song,0,true);
//Globals
global.current_save = -1;
global.home = false;
global.textSpeed = .75;
global.iCamera = instance_create_layer(0,0,layer,obj_camera)
global.lastCampX = 160;
global.lastCampY = 32;
global.lastCamp = rm_lenko_farwayCamp;
global.targetCamp = true;
global.targetX = 160;
global.targetY = 32;
global.targetRoom = rm_lenko_farwayCamp;
global.transition = false;
global.fadeOut = false;
global.aggroCounter = 0;
global.dayPhase = 0;
global.volumeMusic = .75;
global.volumeMenu = .30;
global.volumeEffects = .6;
script_execute(LoadGameSettings);

display_set_gui_size(_resolutionWidth,_resolutionHeight);

room_goto(_roomStart)
show_debug_message(string(instance_number(obj_inventory)));
show_debug_message(string(instance_number(obj_text)));
global.home = true;


