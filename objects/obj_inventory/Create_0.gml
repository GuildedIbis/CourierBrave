//Create Inventory

menu_sprite = spr_menu_beveled;
button_sprite = spr_menu;
quick_swap = false;
altar = false;
inv_gui = -1;
item_id = -1;

scr_inventory_items_create();
scr_inventory_crull_create();
scr_inventory_questlog_create();
scr_inventory_form_create();
//script_execute(DungeonlogCreate);
script_execute(CampRooms);
script_execute(MapsCreate);
script_execute(ChestList);
script_execute(KephraStoneList);
script_execute(StarOrbList);


room_ary = farwayRoad_map_ary;







//Some Notes for future implementations
//ds_grid_resize will help me to increase the inventory size after its initial creation.
