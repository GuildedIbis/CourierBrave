///
var _x1 = x - (sprite_width/2) + 4;
var _y1 = y - 8;
var _x2 = x + (sprite_width/2) + 4;
var _y2 = y - 8
var _x3 = x + (sprite_width/2);
var _y3 = y + 2;
var _x4 = x - (sprite_width/2);
var _y4 = y + 2;

gpu_set_fog(true,c_black,0,1);
draw_sprite_pos(sprite_index,image_index,_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4,.5)
gpu_set_fog(false,c_black,0,1);
draw_self();
