//Load and Save Questlog
//
//
//
//
//
//Load Questlog
//Path: obj_game > event Key Pressed "L"
function scr_load_quests(_loadEntity){
//Load Quest Status
if (variable_struct_exists(_loadEntity,"quest00")) obj_inventory.quest_grid[# 0, 0] = _loadEntity.quest00;
if (variable_struct_exists(_loadEntity,"quest01")) obj_inventory.quest_grid[# 0, 1] = _loadEntity.quest01;
if (variable_struct_exists(_loadEntity,"quest02")) obj_inventory.quest_grid[# 0, 2] = _loadEntity.quest02;
if (variable_struct_exists(_loadEntity,"quest03")) obj_inventory.quest_grid[# 0, 3] = _loadEntity.quest03;
if (variable_struct_exists(_loadEntity,"quest10")) obj_inventory.quest_grid[# 1, 0] = _loadEntity.quest10;
if (variable_struct_exists(_loadEntity,"quest11")) obj_inventory.quest_grid[# 1, 1] = _loadEntity.quest11;
if (variable_struct_exists(_loadEntity,"quest12")) obj_inventory.quest_grid[# 1, 2] = _loadEntity.quest12;
if (variable_struct_exists(_loadEntity,"quest13")) obj_inventory.quest_grid[# 1, 3] = _loadEntity.quest13;
if (variable_struct_exists(_loadEntity,"quest20")) obj_inventory.quest_grid[# 2, 0] = _loadEntity.quest20;
if (variable_struct_exists(_loadEntity,"quest21")) obj_inventory.quest_grid[# 2, 1] = _loadEntity.quest21;
if (variable_struct_exists(_loadEntity,"quest22")) obj_inventory.quest_grid[# 2, 2] = _loadEntity.quest22;
if (variable_struct_exists(_loadEntity,"quest23")) obj_inventory.quest_grid[# 2, 3] = _loadEntity.quest23;
if (variable_struct_exists(_loadEntity,"quest30")) obj_inventory.quest_grid[# 3, 0] = _loadEntity.quest30;
if (variable_struct_exists(_loadEntity,"quest31")) obj_inventory.quest_grid[# 3, 1] = _loadEntity.quest31;
if (variable_struct_exists(_loadEntity,"quest32")) obj_inventory.quest_grid[# 3, 2] = _loadEntity.quest32;
if (variable_struct_exists(_loadEntity,"quest33")) obj_inventory.quest_grid[# 3, 3] = _loadEntity.quest33;
if (variable_struct_exists(_loadEntity,"quest40")) obj_inventory.quest_grid[# 4, 0] = _loadEntity.quest40;
if (variable_struct_exists(_loadEntity,"quest41")) obj_inventory.quest_grid[# 4, 1] = _loadEntity.quest41;
if (variable_struct_exists(_loadEntity,"quest42")) obj_inventory.quest_grid[# 4, 2] = _loadEntity.quest42;
if (variable_struct_exists(_loadEntity,"quest43")) obj_inventory.quest_grid[# 4, 3] = _loadEntity.quest43;
if (variable_struct_exists(_loadEntity,"quest50")) obj_inventory.quest_grid[# 5, 0] = _loadEntity.quest50;
if (variable_struct_exists(_loadEntity,"quest51")) obj_inventory.quest_grid[# 5, 1] = _loadEntity.quest51;
if (variable_struct_exists(_loadEntity,"quest52")) obj_inventory.quest_grid[# 5, 2] = _loadEntity.quest52;
if (variable_struct_exists(_loadEntity,"quest53")) obj_inventory.quest_grid[# 5, 3] = _loadEntity.quest53;
if (variable_struct_exists(_loadEntity,"quest60")) obj_inventory.quest_grid[# 6, 0] = _loadEntity.quest60;
if (variable_struct_exists(_loadEntity,"quest61")) obj_inventory.quest_grid[# 6, 1] = _loadEntity.quest61;
if (variable_struct_exists(_loadEntity,"quest62")) obj_inventory.quest_grid[# 6, 2] = _loadEntity.quest62;
if (variable_struct_exists(_loadEntity,"quest63")) obj_inventory.quest_grid[# 6, 3] = _loadEntity.quest63;
if (variable_struct_exists(_loadEntity,"quest70")) obj_inventory.quest_grid[# 7, 0] = _loadEntity.quest70;
if (variable_struct_exists(_loadEntity,"quest71")) obj_inventory.quest_grid[# 7, 1] = _loadEntity.quest71;
if (variable_struct_exists(_loadEntity,"quest72")) obj_inventory.quest_grid[# 7, 2] = _loadEntity.quest72;
if (variable_struct_exists(_loadEntity,"quest73")) obj_inventory.quest_grid[# 7, 3] = _loadEntity.quest73;
if (variable_struct_exists(_loadEntity,"quest80")) obj_inventory.quest_grid[# 8, 0] = _loadEntity.quest80;
if (variable_struct_exists(_loadEntity,"quest81")) obj_inventory.quest_grid[# 8, 1] = _loadEntity.quest81;
if (variable_struct_exists(_loadEntity,"quest82")) obj_inventory.quest_grid[# 8, 2] = _loadEntity.quest82;
if (variable_struct_exists(_loadEntity,"quest83")) obj_inventory.quest_grid[# 8, 3] = _loadEntity.quest83;
if (variable_struct_exists(_loadEntity,"quest90")) obj_inventory.quest_grid[# 9, 0] = _loadEntity.quest90;
if (variable_struct_exists(_loadEntity,"quest91")) obj_inventory.quest_grid[# 9, 1] = _loadEntity.quest91;
if (variable_struct_exists(_loadEntity,"quest92")) obj_inventory.quest_grid[# 9, 2] = _loadEntity.quest92;
if (variable_struct_exists(_loadEntity,"quest93")) obj_inventory.quest_grid[# 9, 3] = _loadEntity.quest93;
if (variable_struct_exists(_loadEntity,"quest100")) obj_inventory.quest_grid[# 10, 0] = _loadEntity.quest100;
if (variable_struct_exists(_loadEntity,"quest101")) obj_inventory.quest_grid[# 10, 1] = _loadEntity.quest101;
if (variable_struct_exists(_loadEntity,"quest102")) obj_inventory.quest_grid[# 10, 2] = _loadEntity.quest102;
if (variable_struct_exists(_loadEntity,"quest103")) obj_inventory.quest_grid[# 10, 3] = _loadEntity.quest103;
if (variable_struct_exists(_loadEntity,"quest110")) obj_inventory.quest_grid[# 11, 0] = _loadEntity.quest110;
if (variable_struct_exists(_loadEntity,"quest111")) obj_inventory.quest_grid[# 11, 1] = _loadEntity.quest111;
if (variable_struct_exists(_loadEntity,"quest112")) obj_inventory.quest_grid[# 11, 2] = _loadEntity.quest112;
if (variable_struct_exists(_loadEntity,"quest113")) obj_inventory.quest_grid[# 11, 3] = _loadEntity.quest113;
if (variable_struct_exists(_loadEntity,"quest120")) obj_inventory.quest_grid[# 12, 0] = _loadEntity.quest120;
if (variable_struct_exists(_loadEntity,"quest121")) obj_inventory.quest_grid[# 12, 1] = _loadEntity.quest121;
if (variable_struct_exists(_loadEntity,"quest122")) obj_inventory.quest_grid[# 12, 2] = _loadEntity.quest122;
if (variable_struct_exists(_loadEntity,"quest123")) obj_inventory.quest_grid[# 12, 3] = _loadEntity.quest123;
if (variable_struct_exists(_loadEntity,"quest130")) obj_inventory.quest_grid[# 13, 0] = _loadEntity.quest130;
if (variable_struct_exists(_loadEntity,"quest131")) obj_inventory.quest_grid[# 13, 1] = _loadEntity.quest131;
if (variable_struct_exists(_loadEntity,"quest132")) obj_inventory.quest_grid[# 13, 2] = _loadEntity.quest132;
if (variable_struct_exists(_loadEntity,"quest133")) obj_inventory.quest_grid[# 13, 3] = _loadEntity.quest133;
if (variable_struct_exists(_loadEntity,"quest140")) obj_inventory.quest_grid[# 14, 0] = _loadEntity.quest140;
if (variable_struct_exists(_loadEntity,"quest141")) obj_inventory.quest_grid[# 14, 1] = _loadEntity.quest141;
if (variable_struct_exists(_loadEntity,"quest142")) obj_inventory.quest_grid[# 14, 2] = _loadEntity.quest142;
if (variable_struct_exists(_loadEntity,"quest143")) obj_inventory.quest_grid[# 14, 3] = _loadEntity.quest143;
if (variable_struct_exists(_loadEntity,"quest150")) obj_inventory.quest_grid[# 15, 0] = _loadEntity.quest150;
if (variable_struct_exists(_loadEntity,"quest151")) obj_inventory.quest_grid[# 15, 1] = _loadEntity.quest151;
if (variable_struct_exists(_loadEntity,"quest152")) obj_inventory.quest_grid[# 15, 2] = _loadEntity.quest152;
if (variable_struct_exists(_loadEntity,"quest153")) obj_inventory.quest_grid[# 15, 3] = _loadEntity.quest153;
if (variable_struct_exists(_loadEntity,"quest160")) obj_inventory.quest_grid[# 16, 0] = _loadEntity.quest160;
if (variable_struct_exists(_loadEntity,"quest161")) obj_inventory.quest_grid[# 16, 1] = _loadEntity.quest161;
if (variable_struct_exists(_loadEntity,"quest162")) obj_inventory.quest_grid[# 16, 2] = _loadEntity.quest162;
if (variable_struct_exists(_loadEntity,"quest163")) obj_inventory.quest_grid[# 16, 3] = _loadEntity.quest163;
if (variable_struct_exists(_loadEntity,"quest170")) obj_inventory.quest_grid[# 17, 0] = _loadEntity.quest170;
if (variable_struct_exists(_loadEntity,"quest171")) obj_inventory.quest_grid[# 17, 1] = _loadEntity.quest171;
if (variable_struct_exists(_loadEntity,"quest172")) obj_inventory.quest_grid[# 17, 2] = _loadEntity.quest172;
if (variable_struct_exists(_loadEntity,"quest173")) obj_inventory.quest_grid[# 17, 3] = _loadEntity.quest173;
if (variable_struct_exists(_loadEntity,"quest180")) obj_inventory.quest_grid[# 18, 0] = _loadEntity.quest180;
if (variable_struct_exists(_loadEntity,"quest181")) obj_inventory.quest_grid[# 18, 1] = _loadEntity.quest181;
if (variable_struct_exists(_loadEntity,"quest182")) obj_inventory.quest_grid[# 18, 2] = _loadEntity.quest182;
if (variable_struct_exists(_loadEntity,"quest183")) obj_inventory.quest_grid[# 18, 3] = _loadEntity.quest183;
if (variable_struct_exists(_loadEntity,"quest190")) obj_inventory.quest_grid[# 19, 0] = _loadEntity.quest190;
if (variable_struct_exists(_loadEntity,"quest191")) obj_inventory.quest_grid[# 19, 1] = _loadEntity.quest191;
if (variable_struct_exists(_loadEntity,"quest192")) obj_inventory.quest_grid[# 19, 2] = _loadEntity.quest192;
if (variable_struct_exists(_loadEntity,"quest193")) obj_inventory.quest_grid[# 19, 3] = _loadEntity.quest193;
}
//
//
//
//
//
//Save Quest
//Path: obj_game > event Key Pressed "K"
function scr_save_quests(_saveData){
//
//
//What To Save As : What to Save
var _saveQuest = 
{
//Save Quest Status
quest00 : obj_inventory.quest_grid[# 0, 0],
quest01 : obj_inventory.quest_grid[# 0, 1],
quest02 : obj_inventory.quest_grid[# 0, 2],
quest03 : obj_inventory.quest_grid[# 0, 3],
quest10 : obj_inventory.quest_grid[# 1, 0],
quest11 : obj_inventory.quest_grid[# 1, 1],
quest12 : obj_inventory.quest_grid[# 1, 2],
quest13 : obj_inventory.quest_grid[# 1, 3],
quest20 : obj_inventory.quest_grid[# 2, 0],
quest21 : obj_inventory.quest_grid[# 2, 1],
quest22 : obj_inventory.quest_grid[# 2, 2],
quest23 : obj_inventory.quest_grid[# 2, 3],
quest30 : obj_inventory.quest_grid[# 3, 0],
quest31 : obj_inventory.quest_grid[# 3, 1],
quest32 : obj_inventory.quest_grid[# 3, 2],
quest33 : obj_inventory.quest_grid[# 3, 3],
quest40 : obj_inventory.quest_grid[# 4, 0],
quest41 : obj_inventory.quest_grid[# 4, 1],
quest42 : obj_inventory.quest_grid[# 4, 2],
quest43 : obj_inventory.quest_grid[# 4, 3],
quest50 : obj_inventory.quest_grid[# 5, 0],
quest51 : obj_inventory.quest_grid[# 5, 1],
quest52 : obj_inventory.quest_grid[# 5, 2],
quest53 : obj_inventory.quest_grid[# 5, 3],
quest60 : obj_inventory.quest_grid[# 6, 0],
quest61 : obj_inventory.quest_grid[# 6, 1],
quest62 : obj_inventory.quest_grid[# 6, 2],
quest63 : obj_inventory.quest_grid[# 6, 3],
quest70 : obj_inventory.quest_grid[# 7, 0],
quest71 : obj_inventory.quest_grid[# 7, 1],
quest72 : obj_inventory.quest_grid[# 7, 2],
quest73 : obj_inventory.quest_grid[# 7, 3],
quest80 : obj_inventory.quest_grid[# 8, 0],
quest81 : obj_inventory.quest_grid[# 8, 1],
quest82 : obj_inventory.quest_grid[# 8, 2],
quest83 : obj_inventory.quest_grid[# 8, 3],
quest90 : obj_inventory.quest_grid[# 9, 0],
quest91 : obj_inventory.quest_grid[# 9, 1],
quest92 : obj_inventory.quest_grid[# 9, 2],
quest93 : obj_inventory.quest_grid[# 9, 3],
quest100 : obj_inventory.quest_grid[# 10, 0],
quest101 : obj_inventory.quest_grid[# 10, 1],
quest102 : obj_inventory.quest_grid[# 10, 2],
quest103 : obj_inventory.quest_grid[# 10, 3],
quest110 : obj_inventory.quest_grid[# 11, 0],
quest111 : obj_inventory.quest_grid[# 11, 1],
quest112 : obj_inventory.quest_grid[# 11, 2],
quest113 : obj_inventory.quest_grid[# 11, 3],
quest120 : obj_inventory.quest_grid[# 12, 0],
quest121 : obj_inventory.quest_grid[# 12, 1],
quest122 : obj_inventory.quest_grid[# 12, 2],
quest123 : obj_inventory.quest_grid[# 12, 3],
quest130 : obj_inventory.quest_grid[# 13, 0],
quest131 : obj_inventory.quest_grid[# 13, 1],
quest132 : obj_inventory.quest_grid[# 13, 2],
quest133 : obj_inventory.quest_grid[# 13, 3],
quest140 : obj_inventory.quest_grid[# 14, 0],
quest141 : obj_inventory.quest_grid[# 14, 1],
quest142 : obj_inventory.quest_grid[# 14, 2],
quest143 : obj_inventory.quest_grid[# 14, 3],
quest150 : obj_inventory.quest_grid[# 15, 0],
quest151 : obj_inventory.quest_grid[# 15, 1],
quest152 : obj_inventory.quest_grid[# 15, 2],
quest153 : obj_inventory.quest_grid[# 15, 3],
quest160 : obj_inventory.quest_grid[# 16, 0],
quest161 : obj_inventory.quest_grid[# 16, 1],
quest162 : obj_inventory.quest_grid[# 16, 2],
quest163 : obj_inventory.quest_grid[# 16, 3],
quest170 : obj_inventory.quest_grid[# 17, 0],
quest171 : obj_inventory.quest_grid[# 17, 1],
quest172 : obj_inventory.quest_grid[# 17, 2],
quest173 : obj_inventory.quest_grid[# 17, 3],
quest180 : obj_inventory.quest_grid[# 18, 0],
quest181 : obj_inventory.quest_grid[# 18, 1],
quest182 : obj_inventory.quest_grid[# 18, 2],
quest183 : obj_inventory.quest_grid[# 18, 3],
quest190 : obj_inventory.quest_grid[# 19, 0],
quest191 : obj_inventory.quest_grid[# 19, 1],
quest192 : obj_inventory.quest_grid[# 19, 2],
quest193 : obj_inventory.quest_grid[# 19, 3],
}
array_push(_saveData, _saveQuest);
}

