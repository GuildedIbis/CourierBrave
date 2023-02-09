//Create Fragment
bounce = 0;
deteriorate = 0;
z = 0;
spd = 0;
fric = 0;
game_paused_image_speed = 0;
image_speed = 0;
image_index = irandom(image_number - 1);
//collision_map = layer_tilemap_get_id(layer_get_id("Collision"));
image_xscale = choose(-1,1);
image_yscale = choose(-1,1);

spd = 2;
direction = random(360);