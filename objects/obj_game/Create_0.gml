//Create Background Game Stuff

//Randomize... and other random things
randomize();
script_execute(AllItems);
script_execute(RoomEnemies);
scr_resource_grid_create();


version = "Version: 0.3.0.0"
menu_sprite = spr_menu;
pause_menu = scr_menu_game_pause;
home_menu = scr_menu_game_home;
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
save_num = -1;
gameplay_timer = 60;
time_played = 0;
time_played2 = 0;
time_played3 = 0;
day_timer = 0;
night_fade = 0;
max_day_timer = 18000;
transition_timer = 0;
level_num = 0;
room_num = 0;
room_name = -1;
room_name_timer = 0;
level_name_timer = 0;
game_paused_image_speed = 0;
//home_song = snd_theme_main;

//audio_play_sound(home_song,0,true);
//Globals
global.current_save = -1;
global.home = false;
global.textSpeed = .75;
global.iCamera = instance_create_layer(0,0,layer,obj_camera)
global.lastCampX = 88;
global.lastCampY = 90;
global.lastCamp = rm_lenko_farwayRoad_00;
global.targetCamp = true;
global.targetX = 88;
global.targetY = 90;
global.targetRoom = rm_lenko_farwayRoad_00;
global.transition = false;
global.fadeOut = false;
global.aggroCounter = 0;
global.bossCounter = 0;
global.dayPhase = 0;
global.volumeMusic = .75;
global.volumeMenu = .30;
global.volumeEffects = .6;
global.fnt_main_white = font_add_sprite_ext(spr_font_main_white," !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~",true,1);
global.fnt_main_gold = font_add_sprite_ext(spr_font_main_gold," !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~",true,1);
script_execute(LoadGameSettings);

display_set_gui_size(_resolutionWidth,_resolutionHeight);

room_goto(_roomStart)
show_debug_message(string(instance_number(obj_inventory)));
show_debug_message(string(instance_number(obj_text)));
global.home = true;


