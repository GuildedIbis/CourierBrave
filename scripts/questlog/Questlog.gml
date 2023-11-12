//Questlog
//
//
//
//
//
//Questlog Create
function scr_inventory_questlog_create(){
//Quests
quest_grid = ds_grid_create(100,6);
//farwayRoad_level = array_create(23,0);

//Name
//Accepted (boo)
//Current Counter (int)
//Count to complete (int)
//Completed (boo)
//Active Draw Script
//Menu Draw Script
//Quest Name

//Darkening Lands: The player must kill 10 skirmisher rats.
quest_grid[# 0, 0] = false;
quest_grid[# 0, 1] = 0;
quest_grid[# 0, 2] = 1;
quest_grid[# 0, 3] = false;
quest_grid[# 0, 4] = Idle;
quest_grid[# 0, 5] = scr_inventory_questlog_text_00;
quest_grid[# 1, 0] = false;
quest_grid[# 1, 1] = 0;
quest_grid[# 1, 2] = 1;
quest_grid[# 1, 3] = false;
quest_grid[# 1, 4] = Idle;
quest_grid[# 1, 5] = scr_inventory_questlog_text_01;
quest_grid[# 2, 0] = false;
quest_grid[# 2, 1] = 0;
quest_grid[# 2, 2] = 5;
quest_grid[# 2, 3] = false;
quest_grid[# 2, 4] = Idle;
quest_grid[# 2, 5] = scr_inventory_questlog_text_02; 
quest_grid[# 3, 0] = false;
quest_grid[# 3, 1] = 0;
quest_grid[# 3, 2] = 1; 
quest_grid[# 3, 3] = false;
quest_grid[# 3, 4] = Idle;
quest_grid[# 3, 5] = scr_inventory_questlog_text_03;
quest_grid[# 4, 0] = false;
quest_grid[# 4, 1] = 0;
quest_grid[# 4, 2] = 1;
quest_grid[# 4, 3] = false
quest_grid[# 4, 4] = Idle;
quest_grid[# 4, 5] = scr_inventory_questlog_text_04;
quest_grid[# 5, 0] = false;
quest_grid[# 5, 1] = 0;
quest_grid[# 5, 2] = 1; 
quest_grid[# 5, 3] = false;
quest_grid[# 5, 4] = Idle;
quest_grid[# 5, 5] = scr_inventory_questlog_text_05;
quest_grid[# 6, 0] = false;
quest_grid[# 6, 1] = 0;
quest_grid[# 6, 2] = 2; 
quest_grid[# 6, 3] = false;
quest_grid[# 6, 4] = Idle;
quest_grid[# 6, 5] = scr_inventory_questlog_text_06;
quest_grid[# 7, 0] = false;
quest_grid[# 7, 1] = 0;
quest_grid[# 7, 2] = 3; 
quest_grid[# 7, 3] = false;
quest_grid[# 7, 4] = Idle;
quest_grid[# 7, 5] = scr_inventory_questlog_text_07;
quest_grid[# 8, 0] = false;
quest_grid[# 8, 1] = 0;
quest_grid[# 8, 2] = 2; 
quest_grid[# 8, 3] = false;
quest_grid[# 8, 4] = Idle;
quest_grid[# 8, 5] = scr_inventory_questlog_text_08;
quest_grid[# 9, 0] = false;
quest_grid[# 9, 1] = 0;
quest_grid[# 9, 2] = 5; 
quest_grid[# 9, 3] = false;
quest_grid[# 9, 4] = Idle;
quest_grid[# 9, 5] = scr_inventory_questlog_text_09;
quest_grid[# 10, 0] = false;//Fairez Missing
quest_grid[# 10, 1] = 0;
quest_grid[# 10, 2] = 3;
quest_grid[# 10, 3] = false;
quest_grid[# 10, 4] = Idle;
quest_grid[# 10, 5] = scr_inventory_questlog_text_10;
quest_grid[# 11, 0] = false;//Adavios Alt Magic
quest_grid[# 11, 1] = 0;
quest_grid[# 11, 2] = 1;
quest_grid[# 11, 3] = false;
quest_grid[# 11, 4] = Idle;
quest_grid[# 11, 5] = scr_inventory_questlog_text_11;
quest_grid[# 12, 0] = false;
quest_grid[# 12, 1] = 0;
quest_grid[# 12, 2] = 1;
quest_grid[# 12, 3] = false;
quest_grid[# 12, 4] = Idle;
quest_grid[# 12, 5] = scr_inventory_questlog_text_12;
quest_grid[# 13, 0] = false;
quest_grid[# 13, 1] = 0;
quest_grid[# 13, 2] = 10;
quest_grid[# 13, 3] = false;
quest_grid[# 13, 4] = Idle;
quest_grid[# 13, 5] = scr_inventory_questlog_text_13;
quest_grid[# 14, 0] = false;
quest_grid[# 14, 1] = 0;
quest_grid[# 14, 2] = 12;
quest_grid[# 14, 3] = false;
quest_grid[# 14, 4] = Idle;
quest_grid[# 14, 5] = scr_inventory_questlog_text_14;
quest_grid[# 15, 0] = false;
quest_grid[# 15, 1] = 0;
quest_grid[# 15, 2] = 1;
quest_grid[# 15, 3] = false;
quest_grid[# 15, 4] = Idle;
quest_grid[# 15, 5] = scr_inventory_questlog_text_15;
quest_grid[# 16, 0] = false;
quest_grid[# 16, 1] = 0;
quest_grid[# 16, 2] = 1; 
quest_grid[# 16, 3] = false;
quest_grid[# 16, 4] = Idle;
quest_grid[# 16, 5] = scr_inventory_questlog_text_16;
quest_grid[# 17, 0] = false;
quest_grid[# 17, 1] = 0;
quest_grid[# 17, 2] = 1; 
quest_grid[# 17, 3] = false;
quest_grid[# 17, 4] = Idle;
quest_grid[# 17, 5] = Idle;
quest_grid[# 18, 0] = false;//Yakflower Path Lair
quest_grid[# 18, 1] = 0;
quest_grid[# 18, 2] = 5; // Intro, 2 swarms, capture, and boss
quest_grid[# 18, 3] = false;
quest_grid[# 18, 4] = Idle;
quest_grid[# 18, 5] = Idle;
quest_grid[# 19, 0] = false;//Lake Habraf Lair
quest_grid[# 19, 1] = 0;
quest_grid[# 19, 2] = 5; // Intro, 3 escorts and boss
quest_grid[# 19, 3] = false;
quest_grid[# 19, 4] = Idle;
quest_grid[# 19, 5] = Idle;

//Final Main Quest
quest_grid[# 89, 0] = false;
quest_grid[# 89, 1] = 0;
quest_grid[# 89, 2] = 1; 
quest_grid[# 89, 3] = false;
quest_grid[# 89, 4] = Idle;
quest_grid[# 89, 5] = Idle;
}
//
//
//
//
//
//Quest Reset Days End Script
function scr_inventory_quest_reset_daily(){

}
//
//
//
//
//
//Quest Inventory Text: 00 - Acolyte of Evil
function scr_inventory_questlog_text_00(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Acolyte of Evil";
var _descText = "Stop the Acolyte before he summons\nThe Great Evil.\n\nThe powerful mage Escar Matos has\nseized the Eastern kingdoms with his\narmies, and wages war on the West.\n\nHe has declared himself the Acolyte of\nthe Great Evil, who he will summon to\ngain control over all of Omlio if he\nisn't stopped.";

draw_text_transformed(_midX-1,_descY,_descText,.5,.5,0);
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);

}
//
//
//
//
//
//Quest Inventory Text: 01 - Lavos of Starfire
function scr_inventory_questlog_text_01(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Lavos of Star Fire";
var _text = "Halofire's form stone found.\n\nHalofire is the Courier of Star Fire.\nHis knowledge of the children stars is\nimmense, and he wields their fire as a\nweapon.";

draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 02 - Something From Home
function scr_inventory_questlog_text_02(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Something From Home";
if (obj_inventory.quest_grid[# 2, 1] = 0)
{
	var _text = "Look for something in Mesa and Thurns\nabandoned home.\n\nMany country-side homes like Mesa and\nThurns were burned and destroyed to\ndrive people into towns where they\ncould be more easily controlled.";
}
if (obj_inventory.quest_grid[# 2, 1] = 1)
{
	var _text = "Take the necklace to Mesa.\n\nMany country-side homes like Mesa and\nThurns were burned and destroyed to\ndrive people into towns where they\ncould be more easily controlled.";
}
if (obj_inventory.quest_grid[# 2, 1] = 2)
{
	var _text = "Speak with Kovalad about polish for\nthe necklace.\n\nMany country-side homes like Mesa and\nThurns were burned and destroyed to\ndrive people into towns where they\ncould be more easily controlled.";
}
if (obj_inventory.quest_grid[# 2, 1] = 3) or (obj_inventory.quest_grid[# 2, 1] = 4)
{
	var _text = "Bring Kovalad a Dulen Flower so he\ncan polish the necklace.\n\nMany country-side homes like Mesa and\nThurns were burned and destroyed to\ndrive people into towns where they\ncould be more easily controlled.";
}
if (obj_inventory.quest_grid[# 2, 1] >= 5)
{
	var _text = "Take the polished necklace to Mesa.\n\nMany country-side homes like Mesa and\nThurns were burned and destroyed to\ndrive people into towns where they\ncould be more easily controlled.";
}
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);
}
//
//
//
//
//
//Quest Inventory Text: 03 - King Masgar's Ghost
function scr_inventory_questlog_text_03(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "King Masgar's Ghost";
var _text = "Defeat the ghost of King Masgar\nand collect the Skill Stone.\n\nThe war against the great evil saw the\nend of many lines, including the line\nof the Rempho King Masgar, who was\nentombed with his fallen kingsguard...";

draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 04 - Esecar Matos
function scr_inventory_questlog_text_04(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Esecar Matos";
var _text = "For ages the Acolyte hid, avoiding\ndeath growing in power. He isn't going\nto hand himself over, in spite of his\napparent respect for those who\nsummon him.";

draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 05 - Moros Rift Jumper
function scr_inventory_questlog_text_05(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;


var _headerText = "Moros Rift Jumper";
var _text = "Adavio's form stone found.\n\nIloth Bridge was the first major victory\nof the war against the Great Evil. If not\nfor her jump across the canyon,\nit might have been their last defeat.";

draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 06 - Sleeping Sabi
function scr_inventory_questlog_text_06(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Sleeping Sabi";

switch(obj_inventory.quest_grid[# 6, 1])
{
	case 0:
		var _text = "Learn more about the Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
	case 1:
		var _text = "Wake up the Solar Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
	case 2:
		var _text = "Speak with the Solar Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
	case 3:
		var _text = "Speak with the second Solar Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
	case 4:
		var _text = "Speak with the third Solar Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
	case 5:
		var _text = "Return to the first Solar Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
	case 6:
		var _text = "Return to the first Solar Sabi.\n\nThey might look like a snake, but the\nSabi are as friendly as any other good\ncreature. They are celestial spirits,\nwho turn to stone at certain rotations\nof stars and planets.";
	break;
	
}
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 07 - Ghafate the Endire Knight
function scr_inventory_questlog_text_07(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Ghafate the Endire Knight";
var _text = "Defeat Ghafate the Endire Knight\nand collect the Skill Stone.\n\nThe Endire Knights travel the land doing the bidding\nof the Beetra Throne, no matter who sits upon it.";

draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 08 - Rift Giant Zerwerk
function scr_inventory_questlog_text_08(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Rift Giant Zerwerk";
var _text = "Defeat the Rift Giant.\n\nRift Giants are the thralls of dark mages\nand their minds are not their own.\nA giant using magic with it's own skill\nwould be a rarity, given their general\noafish nature.";
//Rat Lore: The Ranth, or rats as they are\nreferred to with hate,\nwere once a people and nation of Moros.\nThey were destroyed and shunned by the\nother peoples for siding with the Great Evil\nand have been promised redemption\nfrom the Acolyte.
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 09 - Lake Champion Rempho
function scr_inventory_questlog_text_09(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Lake Champion Rempho";
var _text = "Ceriver's form stone found\n\nThe Rempho people are notoriously\npassionate about rivers and lakes, and\nCeriver was no exception. He fell on the\nbanks of Therulil in an impossible\ndefense against the hoards of\nthe Great Evil.";
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 10 - Late for Dinner
function scr_inventory_questlog_text_10(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Late for Dinner";
var _text = "Fairez left for Habraf Lake and never\ncame back... Something about red\ncrystals she saw there.";
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 11 - Matron of the Lake
function scr_inventory_questlog_text_11(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Matron of the Lake";
var _text = "Defeat Mother Lily\n\nMother Lilies often form a colony of\nlesser lilies with a network of\ndeep roots. They are highly territorial,\nand do not shy away from carnivorism.";
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 12 - Enraged Moth
function scr_inventory_questlog_text_12(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Enraged Moth";
var _text = "Defeat the Enraged Moth and\ncollect the Skill Stone.\n\nAn unusual mutation on an already\ndangerous creature. Perhaps the\npowers of the nearby red crystals\nhave given their spawn their\nexplosive nature.";
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 13 - Evergreen Lavos
function scr_inventory_questlog_text_13(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "The Evergreen Lavos";
var _text = "Evarel's form stone found.\n\nThough never seen again by a mortal,\nEvarel stayed in the forests of Lenko\nlong after the end of the war.";
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 14 - Troll Tortoise
function scr_inventory_questlog_text_14(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Troll Tortoise";
var _text = ""
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 15 - Emerald Lock
function scr_inventory_questlog_text_15(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Emerald Lock";
var _text = ""
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 16 - Lily Zealot
function scr_inventory_questlog_text_16(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "Lily Zealot";
var _text = "Defeat the Lily Zealot and\ncollect the Skill Stone."
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 17
function scr_inventory_questlog_text_17(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "";
var _text = ""
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 18
function scr_inventory_questlog_text_18(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "";
var _text = 
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 19
function scr_inventory_questlog_text_19(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "";
var _text = 
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}
//
//
//
//
//
//Quest Inventory Text: 20
function scr_inventory_questlog_text_20(){
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _compY = 111;

var _headerText = "";
var _text = 
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_text,.5,.5,0);

}