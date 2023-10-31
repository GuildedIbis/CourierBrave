//Collision With Player
obj_inventory.resource_array[item_id] = obj_inventory.resource_array[item_id] + amount;
scr_game_activity_feed_add(sprite_index,image_index);
instance_destroy();