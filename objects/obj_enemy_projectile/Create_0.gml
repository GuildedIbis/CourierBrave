//Create Enemy

//Inherit Create Event of obj_entity
event_inherited();


//Run Instance Specific Creation Code: Set in Variable Definitions in Room Editor.
if (entity_create != -1) script_execute(entity_create);


//Status Effects
StatusEffects();
