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
//0: Draw Card From Deck
//1: Player Hand Selected 
//2: Player Active Selected
//3: Opponent Active Selected
//4: Opponent Playcheck
cg_script_database = array_create(12);
cg_script_database = 
[
	[scr_cg_0000_draw,scr_cg_player_0000_hand_selected,scr_cg_player_0000_active_selected,scr_cg_opp_0000_active_selected,scr_cg_opp_0000_hand_playcheck],
	[scr_cg_0001_draw,scr_cg_player_0001_hand_selected,scr_cg_player_0001_active_selected,scr_cg_opp_0001_active_selected,scr_cg_opp_0001_hand_playcheck],
	[scr_cg_0002_draw,scr_cg_player_0002_hand_selected,scr_cg_player_0002_active_selected,scr_cg_opp_0002_active_selected,scr_cg_opp_0002_hand_playcheck],
	//[scr_cg_player_0003_hand_selectedP,scr_cg_player_0003_hand_selectedS,scr_cg_player_0003_active_selectedS,scr_cg_player_0003_active_selectedP,scr_cg_opp_0003_active_selectedP,scr_cg_opp_0003_active_selectedS],
];
}