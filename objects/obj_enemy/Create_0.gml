//Create Enemy

//Inherit Create Event of obj_entity
event_inherited();


//Run Instance Specific Creation Code: Set in Variable Definitions in Room Editor.
if (entity_create != -1) script_execute(entity_create);
spawn_slot = -1;
dir_switch = -1;
dmg_snd_delay = 0;
return_x = -1;
return_y = -1;
casting = false;
dir_offX = 0;
dir_offY = 0;
ldX = 0;
ldY = 0;


//Status Effects
scr_entity_status_effects();


