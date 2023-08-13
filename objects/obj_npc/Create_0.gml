//Create NPC

//Event Inherited from obj_entity
event_inherited();

//All NPCs animate
image_speed = 1;
image_index = 0;
local_frame = 0;

//Set in room editor Variable Definitions: sets step script and sound
if (entity_create != -1) script_execute(entity_create);
shadow_sprite = -1;
//shadow = false;