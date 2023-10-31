//Collision With Player
obj_inventory.ps_array[image_index] = obj_inventory.ps_array[image_index] + 1; 
scr_game_activity_feed_add(sprite_index,image_index);
instance_destroy();