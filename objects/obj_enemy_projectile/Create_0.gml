//Create Enemy

//Inherit Create Event of obj_entity
event_inherited();


//Run Instance Specific Creation Code: Set in Variable Definitions in Room Editor.
if (entity_create != -1) script_execute(entity_create);
shadow_sprite = -1;
shadow = false;


//Status Effects
scr_entity_status_effects();
