//Questlog
//
//
//
//
//
//Questlog Create
function QuestlogCreate(){
//Quests
quest_grid = ds_grid_create(100,7);

//Name
//Accepted (boo)
//Current Counter (int)
//Count to complete (int)
//Completed (boo)
//Active Draw Script
//Menu Draw Script
//Quest Name

//Darkening Lands: The player must kill 10 skirmisher rats.
quest_grid[# 0, 0] = false;//Main Quest
quest_grid[# 0, 1] = 0;
quest_grid[# 0, 2] = 6;//Conversation Parts
quest_grid[# 0, 3] = false;
quest_grid[# 0, 4] = TheCourierActiveDraw;
quest_grid[# 0, 5] = TheCourierMenuDraw;
quest_grid[# 0, 6] = "The Courier";
quest_grid[# 1, 0] = false;//Speak with Nisma
quest_grid[# 1, 1] = 0;
quest_grid[# 1, 2] = 10;//Conversation Parts
quest_grid[# 1, 3] = false;
quest_grid[# 1, 4] = AnOldMouseActiveDraw;
quest_grid[# 1, 5] = AnOldMouseMenuDraw;
quest_grid[# 1, 6] = "The Sage";
quest_grid[# 2, 0] = false;//Speak with Kovalad
quest_grid[# 2, 1] = 0;
quest_grid[# 2, 2] = 100;//Repeatable Quest, gives a rare item every 100 rat kills
quest_grid[# 2, 3] = false;
quest_grid[# 2, 4] = TheSmithActiveDraw;
quest_grid[# 2, 5] = TheSmithMenuDraw;
quest_grid[# 2, 6] = "The Smith";
quest_grid[# 3, 0] = false;//Kill Flare Crow Tnaks
quest_grid[# 3, 1] = 0;
quest_grid[# 3, 2] = 1; //Kill to complete
quest_grid[# 3, 3] = false;
quest_grid[# 3, 4] = EndireKnightTnaksActiveDraw;
quest_grid[# 3, 5] = EndireKnightTnaksMenuDraw;
quest_grid[# 3, 6] = "Endire Knight: Tnaks";
quest_grid[# 4, 0] = false;//Kill Flare Crow Obor
quest_grid[# 4, 1] = 0;
quest_grid[# 4, 2] = 1; //Kill to complete
quest_grid[# 4, 3] = false
quest_grid[# 4, 4] = EndireKnightOborActiveDraw;
quest_grid[# 4, 5] = EndireKnightOborMenuDraw;
quest_grid[# 4, 6] = "Endire Knight: Obor";
quest_grid[# 5, 0] = false;//Kill Flare Crow Rooshii
quest_grid[# 5, 1] = 0;
quest_grid[# 5, 2] = 1; //Kill to complete
quest_grid[# 5, 3] = false;
quest_grid[# 5, 4] = EndireKnightGhafateActiveDraw;
quest_grid[# 5, 5] = EndireKnightGhafateMenuDraw;
quest_grid[# 5, 6] = "Endire Knight: Ghafate";
quest_grid[# 6, 0] = false;//Speak to Nisma to Start?
quest_grid[# 6, 1] = 0;
quest_grid[# 6, 2] = 1; //Open Chest to Complete
quest_grid[# 6, 3] = false;
quest_grid[# 6, 4] = MoonOverLenkoActiveDraw;
quest_grid[# 6, 5] = MoonOverLenkoMenuDraw;
quest_grid[# 6, 6] = "Moon Over Lekno";
quest_grid[# 7, 0] = false;//Speak to the first to start
quest_grid[# 7, 1] = 0;
quest_grid[# 7, 2] = 3; //Get all 3 to complete
quest_grid[# 7, 3] = false;
quest_grid[# 7, 4] = DualStarsOverLenkoActiveDraw;
quest_grid[# 7, 5] = DualStarsOverLenkoMenuDraw;
quest_grid[# 7, 6] = "Dual Star Over Lenko";
quest_grid[# 8, 0] = false;//Yakflower Path Lair
quest_grid[# 8, 1] = 0;
quest_grid[# 8, 2] = 5; // Intro, 2 swarms, capture, and boss
quest_grid[# 8, 3] = false;
quest_grid[# 8, 4] = Idle;
quest_grid[# 8, 5] = Idle;
quest_grid[# 8, 6] = "Lair: Yakflower Path";
quest_grid[# 9, 0] = false;//Lake Habraf Lair
quest_grid[# 9, 1] = 0;
quest_grid[# 9, 2] = 5; // Intro, 3 escorts and boss
quest_grid[# 9, 3] = false;
quest_grid[# 9, 4] = LairLakeHabrafActiveDraw;
quest_grid[# 9, 5] = LairLakeHabrafMenuDraw;
quest_grid[# 9, 6] = "Lair: Habraf Lake";
}
//
//
//
//
//
//Quest Reset Days End Script
function QuestResetDaysEnd(){
if (obj_inventory.quest_grid[# 7, 1] < obj_inventory.quest_grid[# 7, 2]) obj_inventory.quest_grid[# 7, 1] = 0;
}