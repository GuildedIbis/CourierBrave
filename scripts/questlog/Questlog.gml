//Questlog
//
//
//
//
//
//Questlog Create
function scr_inventory_questlog_create(){
//Quests
quest_grid = ds_grid_create(100,7);
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
quest_grid[# 0, 5] = "Stop the Acolyte before he summons\nThe Great Evil.\n\nThe powerful mage Escar Matos has seized the Eastern kingdoms with his armies, and wages war on the West.\nHe has declared himself the Acolyte of the Great Evil, who\nhe will summon to gain control over all of Omlio if he\nisn't stopped.";
quest_grid[# 0, 6] = "Acolyte of Evil";
quest_grid[# 1, 0] = false;
quest_grid[# 1, 1] = 0;
quest_grid[# 1, 2] = 1;
quest_grid[# 1, 3] = false;
quest_grid[# 1, 4] = Idle;
quest_grid[# 1, 5] = "Halofire's Form Stone found.\n\nHalofire is the Courier of Star Fire.\nHis knowledge of the children stars is\nimmense, and he wields their fire as a weapon.";
quest_grid[# 1, 6] = "Lavos of Star Fire";
quest_grid[# 2, 0] = false;
quest_grid[# 2, 1] = 0;
quest_grid[# 2, 2] = 1;
quest_grid[# 2, 3] = false;
quest_grid[# 2, 4] = Idle;
quest_grid[# 2, 5] = "Mesa and Thurn were driven from their home by rats.\nIf you happen to find anything in the abandoned rubble\nMesa might have something useful to offer in return.";
quest_grid[# 2, 6] = "Something From Home";
quest_grid[# 3, 0] = false;
quest_grid[# 3, 1] = 0;
quest_grid[# 3, 2] = 1; 
quest_grid[# 3, 3] = false;
quest_grid[# 3, 4] = Idle;
quest_grid[# 3, 5] = "Defeat the ghost of King Masgar.\n\nThe war against the great evil saw the end\nof many lines, including the line of the\nRempho King Masgar, who was entombed\nwith his fallen kingsguard...";
quest_grid[# 3, 6] = "The Ghost of King Masgar";
quest_grid[# 4, 0] = false;
quest_grid[# 4, 1] = 0;
quest_grid[# 4, 2] = 1;
quest_grid[# 4, 3] = false
quest_grid[# 4, 4] = Idle;
quest_grid[# 4, 5] = "For ages the Acolyte hid, avoiding death growing in power.\ He isn't going to hand himself over, in spite\nof his apparent respect for those who summon him.";
quest_grid[# 4, 6] = "Esecar Matos";
quest_grid[# 5, 0] = false;
quest_grid[# 5, 1] = 0;
quest_grid[# 5, 2] = 1; 
quest_grid[# 5, 3] = false;
quest_grid[# 5, 4] = Idle;
quest_grid[# 5, 5] = "";
quest_grid[# 5, 6] = "Yakflower Path";
quest_grid[# 6, 0] = false;//Speak to Nisma to Start?
quest_grid[# 6, 1] = 0;
quest_grid[# 6, 2] = 1; //Open Chest to Complete
quest_grid[# 6, 3] = false;
quest_grid[# 6, 4] = Idle;
quest_grid[# 6, 5] = "";
quest_grid[# 6, 6] = "Defeat Zerwerk the Giant";
quest_grid[# 7, 0] = false;//Speak to the first to start
quest_grid[# 7, 1] = 0;
quest_grid[# 7, 2] = 3; //Get all 3 to complete
quest_grid[# 7, 3] = false;
quest_grid[# 7, 4] = Idle;
quest_grid[# 7, 5] = "";
quest_grid[# 7, 6] = "Defeat Ghafate the Knight of Endire";
quest_grid[# 8, 0] = false;//Yakflower Path Lair
quest_grid[# 8, 1] = 0;
quest_grid[# 8, 2] = 2; // Intro, 2 swarms, capture, and boss
quest_grid[# 8, 3] = false;
quest_grid[# 8, 4] = Idle;
quest_grid[# 8, 5] = "";
quest_grid[# 8, 6] = "Charge the totems in Yakflower Path.";
quest_grid[# 9, 0] = false;//Lake Habraf Lair
quest_grid[# 9, 1] = 0;
quest_grid[# 9, 2] = 5; // Intro, 3 escorts and boss
quest_grid[# 9, 3] = false;
quest_grid[# 9, 4] = Idle;
quest_grid[# 9, 5] = "";
quest_grid[# 9, 6] = "Yakflower Path NPC";
quest_grid[# 10, 0] = false;//Location: Greyrock 1
quest_grid[# 10, 1] = 0;
quest_grid[# 10, 2] = 1;//Regaliare's Alt Magic Skill
quest_grid[# 10, 3] = false;
quest_grid[# 10, 4] = Idle;
quest_grid[# 10, 5] = "";
quest_grid[# 10, 6] = "Habraf Lake";
quest_grid[# 11, 0] = false;//Location:
quest_grid[# 11, 1] = 0;
quest_grid[# 11, 2] = 1;//Adavio's Alt Magic Skill
quest_grid[# 11, 3] = false;
quest_grid[# 11, 4] = Idle;
quest_grid[# 11, 5] = "";
quest_grid[# 11, 6] = "Defeat Mother Lily";
quest_grid[# 12, 0] = false;//Location
quest_grid[# 12, 1] = 0;
quest_grid[# 12, 2] = 1;//Ceriver's Alt Magic Skill
quest_grid[# 12, 3] = false;
quest_grid[# 12, 4] = Idle;
quest_grid[# 12, 5] = "";
quest_grid[# 12, 6] = "Defeat the Enraged Moth";
quest_grid[# 13, 0] = false;//Location
quest_grid[# 13, 1] = 0;
quest_grid[# 13, 2] = 1;//Halofire's Alt Magic Skill
quest_grid[# 13, 3] = false;
quest_grid[# 13, 4] = Idle;
quest_grid[# 13, 5] = "";
quest_grid[# 13, 6] = "Escort the crystal in Habraf Lake.";
quest_grid[# 14, 0] = false;//Beaowire Dungeon
quest_grid[# 14, 1] = 0;
quest_grid[# 14, 2] = 12; //Kill to complete
quest_grid[# 14, 3] = false;
quest_grid[# 14, 4] = Idle;
quest_grid[# 14, 5] = "";
quest_grid[# 14, 6] = "Habraf Lake NPC";
quest_grid[# 15, 0] = false;//Kill Flare Crow Rooshii
quest_grid[# 15, 1] = 0;
quest_grid[# 15, 2] = 1; //Kill to complete
quest_grid[# 15, 3] = false;
quest_grid[# 15, 4] = Idle;
quest_grid[# 15, 5] = "";
quest_grid[# 15, 6] = "Beaowire Fortress";
quest_grid[# 16, 0] = false;//Speak to Nisma to Start?
quest_grid[# 16, 1] = 0;
quest_grid[# 16, 2] = 1; //Open Chest to Complete
quest_grid[# 16, 3] = false;
quest_grid[# 16, 4] = Idle;
quest_grid[# 16, 5] = "";
quest_grid[# 16, 6] = "Defeat the Tortoise Troll";
quest_grid[# 17, 0] = false;//Speak to the first to start
quest_grid[# 17, 1] = 0;
quest_grid[# 17, 2] = 3; //Get all 3 to complete
quest_grid[# 17, 3] = false;
quest_grid[# 17, 4] = Idle;
quest_grid[# 17, 5] = "";
quest_grid[# 17, 6] = "Defeat the Lily Acolyte";
quest_grid[# 18, 0] = false;//Yakflower Path Lair
quest_grid[# 18, 1] = 0;
quest_grid[# 18, 2] = 5; // Intro, 2 swarms, capture, and boss
quest_grid[# 18, 3] = false;
quest_grid[# 18, 4] = Idle;
quest_grid[# 18, 5] = "";
quest_grid[# 18, 6] = "Escort the Pedestal in Beaowire Fortress";
quest_grid[# 19, 0] = false;//Lake Habraf Lair
quest_grid[# 19, 1] = 0;
quest_grid[# 19, 2] = 5; // Intro, 3 escorts and boss
quest_grid[# 19, 3] = false;
quest_grid[# 19, 4] = Idle;
quest_grid[# 19, 5] = "";
quest_grid[# 19, 6] = "Beaowire Fortress NPC";

//Final Main Quest
quest_grid[# 89, 0] = false;
quest_grid[# 89, 1] = 0;
quest_grid[# 89, 2] = 1; 
quest_grid[# 89, 3] = false;
quest_grid[# 89, 4] = Idle;
quest_grid[# 89, 5] = "Stop the Necromancer from restoring the Great Evil.";
quest_grid[# 89, 6] = "The Necromancer";
}
//
//
//
//
//
//Quest Reset Days End Script
function scr_inventory_quest_reset_daily(){

}