//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: Max HP - 4,5,6...
//5: Damage
//
//Card Scripts
//
//
//
//
//
//Cards Create
function scr_card_game_create(){
display_set_gui_size((_resolutionWidth * 6),(_resolutionHeight*6));	

with (instance_create_layer(0,0,"Instances",obj_cardGame))
{
	depth = obj_cursor.depth + 3;
}
	
with (instance_create_layer(0,0,"Instances",obj_player_cg))
{
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	player = 0;
	hand_size = 0;
	deck_array = array_create(8);
	deck_array = 
	[
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
	];
	scr_cg_deck_shuffle();
	//hand_array = array_create(1);
	//hand_array = 
	//[
	//	[0,"KAFFARI GUARD",0,0,4],
	//	[1,"LIGHTRAY KNIGHT",0,1,9],
	//	[2,"CAPTAIN HOLON",0,2,14],
	//	[3,"YELLOW PYLON",10,-1,-1],
	//];
	//active_array = array_create(6);
	//active_array = 
	//[
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1]
	//];
	//back_array = array_create(6);
	//back_array = 
	//[
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1]
	//];
	
	////Create Discard
	//discard_array = array_create(1);
	//discard_array = 
	//[
	//	[-1,-1,-1,-1,-1],
	//];
}

with (instance_create_layer(0,0,"Instances",obj_opponent_cg))
{
	//Copy Database
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	player = 1;
	hand_size = 0;
	deck_array = array_create(8);
	deck_array = 
	[
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
	];
	scr_cg_deck_shuffle();
	
	////Create Hand
	//hand_array = array_create(3);
	//hand_array = 
	//[
	//	[0,"KAFFARI GUARD",0,0,4],
	//	[0,"KAFFARI GUARD",0,0,4],
	//	[0,"KAFFARI GUARD",0,0,4],
	//];
	
	////Create Active Lane
	//active_array = array_create(6);
	//active_array = 
	//[
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[0,"KAFFARI GUARD",0,0,4,0],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1]
	//];
	//back_array = array_create(6);
	//back_array = 
	//[
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1],
	//	[-1,-1,-1,-1,-1,-1]
	//];
	
	////Create Discard
	//discard_array = array_create(1);
	//discard_array = 
	//[
	//	[-1,-1,-1,-1,-1],
	//];
	
}
	
}