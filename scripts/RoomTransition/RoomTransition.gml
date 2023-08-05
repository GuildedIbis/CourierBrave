// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_transition(xPos,yPos,targetRoom,roomNum,levelNum,roomArray,enemyGrid,camp,campNum){
obj_inventory.room_num = roomNum;
obj_inventory.room_ary = roomArray;
obj_game.room_num = roomNum;
obj_game.room_name = obj_inventory.room_ary[roomNum][0];
obj_game.room_name_timer = 180;
obj_game.room_enemy_grid = enemyGrid;
obj_game.level_num = levelNum;
obj_game.level_name = obj_inventory.level_name[levelNum];
obj_game.level_name_timer = 180;
obj_inventory.level_ary[levelNum] = true;
global.targetX = xPos;
global.targetY = yPos;
global.targetRoom = targetRoom;

if (camp = true)
{
	global.targetCamp = true;
	global.lastCamp = targetRoom;
	global.lastCampX = xPos;
	global.lastCampY = yPos;
	obj_inventory.camp_grid[# campNum, 3] = true;
}

script_execute(RoomEnemiesReset);
global.transition = true;
global.fadeOut = true;
}