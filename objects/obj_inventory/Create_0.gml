//Create Inventory

menu_sprite = spr_menu_beveled;
button_sprite = spr_menu;
quick_swap = false;
altar = false;
inv_gui = -1;
item_id = -1;

scr_items_create();
script_execute(scr_crull_list_create);
script_execute(FormCreate);
script_execute(QuestlogCreate);
//script_execute(DungeonlogCreate);
script_execute(CampRooms);
script_execute(MapsCreate);
script_execute(ChestList);
script_execute(KephraStoneList);
script_execute(StarOrbList);


room_ary = farwayRoad_map_ary;







//Some Notes for future implementations
//ds_grid_resize will help me to increase the inventory size after its initial creation.
