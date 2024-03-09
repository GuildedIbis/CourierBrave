//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//5: Draw/Select Script
//
//
function scr_cg_database(){
//Create Database Arrays
scr_cg_database_draw_fd();


//cg_script_database = array_create(12);
//cg_script_database = 
//[
//	[scr_cg_0000_draw_fd,scr_cg_player_0000_hand_selected,scr_cg_player_0000_active_selected,scr_cg_opp_0000_active_selected,scr_cg_opp_0000_hand_playcheck],
//	[scr_cg_0001_draw_fd,scr_cg_player_0001_hand_selected,scr_cg_player_0001_active_selected,scr_cg_opp_0001_active_selected,scr_cg_opp_0001_hand_playcheck],
//	[scr_cg_0002_draw_fd,scr_cg_player_0002_hand_selected,scr_cg_player_0002_active_selected,scr_cg_opp_0002_active_selected,scr_cg_opp_0002_hand_playcheck],
//	[scr_cg_0003_draw_fd,scr_cg_player_0003_hand_selected,scr_cg_player_0003_active_selected,scr_cg_opp_0003_active_selected,scr_cg_opp_0003_hand_playcheck],
//];
}
//
//
//
//
//
//Draw From Deck
function scr_cg_database_draw_fd(){
//Create Array for Draw From Deck Scripts
cgdb_draw_fd = array_create(75,-1);
cgdb_draw_fd[0] = scr_cg_0000_draw_fd;
cgdb_draw_fd[1] = scr_cg_0001_draw_fd;
cgdb_draw_fd[2] = scr_cg_0002_draw_fd;
cgdb_draw_fd[3] = scr_cg_0003_draw_fd;
}