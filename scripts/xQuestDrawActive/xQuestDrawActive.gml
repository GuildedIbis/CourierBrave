//Active Quest Draw Scripts
//
//
//
//
//
//Quest 00: The Courier
function xTheCourierActiveDraw(){
if (obj_inventory.quest_grid[# 0, 1] < obj_inventory.quest_grid[# 0, 2]) var _activeText = "Destroy the Great Evil."
draw_set_color(c_black);
draw_text_transformed(302,6,_activeText,.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 01: An Old Mouse
function xAnOldMouseActiveDraw(){
	if (obj_inventory.quest_grid[# 1, 1] <= 0) var _activeText = "Speak with Nisma."
	if (obj_inventory.quest_grid[# 1, 1] >= 1) var _activeText = "Find and kill Ekthalem."
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 02: The Smith
function xTheSmithActiveDraw(){
	var _activeText = "Kill rats in Lenko.\n" + string(obj_inventory.quest_grid[# 2, 1]) + "/" + string(obj_inventory.quest_grid[# 2, 2]);
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 03: Endire Knight Tnaks
function xEndireKnightTnaksActiveDraw(){
	var _activeText = "Kill Endire Knight Tnaks"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 04: Endire Knight Obor
function xEndireKnightOborActiveDraw(){
	var _activeText = "Kill Endire Knight Obor"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 05: Endire Knight Ghafate
function xEndireKnightGhafateActiveDraw(){
	var _activeText = "Kill Endire Knight Ghafate"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 06: Moon Over Lenko
function xMoonOverLenkoActiveDraw(){
	var _activeText = "Find the hidden Moon Chest."
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 07: Dual Stars Over Lenko
function xDualStarsOverLenkoActiveDraw(){
	var _activeText = "Speak to the 3 Solar Sabi in order."
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 08: Lair: Lake Habraf
function xLairYakflowerPathActiveDraw(){
var _activeText = "Retreive the Form Stone in Yakflower Path"
draw_set_color(c_black);
draw_text_transformed(302,6,_activeText,.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 09: Lair: Lake Habraf
function xLairLakeHabrafActiveDraw(){
	var _activeText = "Retreive the Form Stone in Lake Habraf"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 10: Regaliare's Quest
function xRegaliareQuestActiveDraw(){
	var _activeText = "Find Regaliare's Alternate Magic Skill"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 11: Adavio's Quest
function xAdavioQuestActiveDraw(){
	var _activeText = "Find Adavio's Alternate Magic Skill"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 12: Ceriver's Quest
function xCeriverQuestActiveDraw(){
	var _activeText = "Find Ceriver's Alternate Magic Skill"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}
//
//
//
//
//
//Quest 13: Halofire's Quest
function xHalofireQuestActiveDraw(){
	var _activeText = "Find Halofire's Alternate Magic Skill"
	draw_set_color(c_black);
	draw_text_transformed(302,6,_activeText,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(301,6,_activeText,.35,.35,0);
}