/// @description Insert description here
if (global.home = true)
{

	depth = 0;
	draw_sprite(spr_cursor,0,x,y);
}
else
{
	if (obj_game.gamePaused = true)
	{
		var _mouseX = device_mouse_x_to_gui(0);
		var _mouseY = device_mouse_y_to_gui(0);
		draw_sprite_ext(cursMenu_sprite,0,_mouseX,_mouseY,scale_x,scale_y,0,c_white,1);
	}
}