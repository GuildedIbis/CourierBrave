// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cg_database(){
//0: Player Hand Selected (Primary)
//1: Player Hand Selected (Secondary)
//2: Player Active Selected (Primary)
//3: Player Active Selected (Secondary)
//4: Opponenet Active Selected (Primary)
//5: Opponenet Active Selected (Secondary)
cg_select_database = array_create(12);
cg_select_database = 
[
	[scr_cg_player_0000_hand_selectedP,scr_cg_player_0000_hand_selectedS,scr_cg_player_0000_active_selectedS,scr_cg_player_0000_active_selectedP,scr_cg_opp_0000_active_selectedP,scr_cg_opp_0000_active_selectedS],
	[scr_cg_player_0001_hand_selectedP,scr_cg_player_0001_hand_selectedS,scr_cg_player_0001_active_selectedS,scr_cg_player_0001_active_selectedP,scr_cg_opp_0001_active_selectedP,scr_cg_opp_0001_active_selectedS],
	[scr_cg_player_0002_hand_selectedP,scr_cg_player_0002_hand_selectedS,scr_cg_player_0002_active_selectedS,scr_cg_player_0002_active_selectedP,scr_cg_opp_0002_active_selectedP,scr_cg_opp_0002_active_selectedS],
];
}