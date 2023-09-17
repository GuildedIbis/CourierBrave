//Quest Locks
//
//
//
//
//
//Habraf Entry Quest Lock
function xHabrafEntryQuestLock(){
if (obj_inventory.quest_grid[# 8, 0] = true) locked = false;
}
//
//
//
//
//
//Beaowire Entry Quest Lock
function xBeaowireEntryQuestLock(){
if (obj_inventory.beaowire_dungeon[12] < 2) locked = true;
else locked = false;
}