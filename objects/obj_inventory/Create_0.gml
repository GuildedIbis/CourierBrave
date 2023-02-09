//Create Inventory

menu_sprite = spr_menu_beveled;
button_sprite = spr_menu;
inv_gui = -1;
item_id = -1;

script_execute(ItemSlotsCreate);
script_execute(FormCreate);
script_execute(QuestlogCreate);
script_execute(DungeonlogCreate);
script_execute(CampRooms);
script_execute(MapsCreate);
script_execute(ChestList);
script_execute(KephraStoneList);
script_execute(CrullList);









//Some Notes for future implementations
//ds_grid_resize will help me to increase the inventory size after its initial creation.
//Damage Multiplyer in gear could also be an armor multiplier if ever implemented armor.