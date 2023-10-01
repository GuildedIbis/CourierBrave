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
scr_inventory_room_create();
scr_inventory_maps_create();
//script_execute(ChestList);
scr_inventory_kephraStone_create();
scr_inventory_starOrb_create();



room_ary = farwayRoad_map_ary;







//Some Notes for future implementations
//ds_grid_resize will help me to increase the inventory size after its initial creation.
