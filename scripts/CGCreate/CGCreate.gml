//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//5: Draw/Select Script
//
//Card Scripts
//
//
//
//
//
//Cards Create
function scr_card_game_create(){
	

with (instance_create_layer(0,0,"Instances",obj_cardGame))
{
	depth = obj_cursor.depth + 3;
}
	
with (instance_create_layer(0,0,"Instances",obj_player_cg))
{
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	player = 0;
	deck_array = array_create(12);
	deck_array = 
	[
		[0,"Name",0,0,4],
		[1,"Name",0,1,4],
		[2,"Name",0,2,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[1,"Name",0,1,4],
		[2,"Name",0,2,4],
		[1,"Name",0,1,4],
		[0,"Name",0,0,4],
		[1,"Name",0,1,4],
		[2,"Name",0,2,4],
		[2,"Name",0,2,4],
	];
	scr_cg_deck_shuffle();
	hand_array = array_create(1);
	hand_array = 
	[
		[0,"KAFFARI GUARD",0,0,4],
	];
	active_array = array_create(6);
	active_array = 
	[
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1]
	];
}

with (instance_create_layer(0,0,"Instances",obj_opponent_cg))
{
	//Copy Database
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	player = 1;
	//Create and Shuffle Deck
	deck_array = array_create(12);
	deck_array = 
	[
		[0,"Name",0,0,4],
		[1,"Name",0,1,4],
		[2,"Name",0,2,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[1,"Name",0,1,4],
		[2,"Name",0,2,4],
		[1,"Name",0,1,4],
		[0,"Name",0,0,4],
		[1,"Name",0,1,4],
		[2,"Name",0,2,4],
		[2,"Name",0,2,4],
	];
	scr_cg_deck_shuffle();
	
	//Create Hand
	hand_array = array_create(3);
	hand_array = 
	[
		[0,"KAFFARI GUARD",0,0,4],
		[0,"KAFFARI GUARD",0,0,4],
		[0,"KAFFARI GUARD",0,0,4],
	];
	
	//Create Active Lane
	active_array = array_create(6);
	active_array = 
	[
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[0,"KAFFARI GUARD",0,0,4],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1]
	];
	
}
	
}