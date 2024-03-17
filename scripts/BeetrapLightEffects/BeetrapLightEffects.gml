//Beetrap Light Effects
//
//
//
//
//
//Effect Beetra City Lantern Create
function scr_effect_beetraCity_lantern_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_lantern;
}
//
//
//
//
//
//Effect Beetra City Lantern Step
function scr_effect_beetraCity_lantern(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_lantern;
}
}
//
//
//
//
//
//Effect Beetra City House Window Create
function scr_effect_beetraCity_window_house_create(){ 
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_window_beetraCity_house;
}
//
//
//
//
//
//Effect Beetra City House Window
function scr_effect_beetraCity_window_house(){
if (obj_game.gamePaused = false)
{
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_window_beetraCity_house;
if (global.dayPhase = 2) image_index = 0;
else image_index = 1;
}
}