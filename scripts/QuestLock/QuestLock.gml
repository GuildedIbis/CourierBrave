//Quest Locks
//
//
//
//
//
//Habraf Entry Quest Lock
function HabrafEntryQuestLock(){
if (obj_inventory.quest_grid[# 8, 0] = true) locked = false;
}
//
//
//
//
//
//Beaowire Entry Quest Lock
function BeaowireEntryQuestLock(){
if (obj_inventory.beaowire_dungeon[12] < 2) locked = true;
else locked = false;
}