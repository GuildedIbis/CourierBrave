//Create Game Camera
game_paused_image_speed = 0;
cam = view_camera[0];
follow = obj_player;
view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;
x_toward = xstart;
y_toward = ystart;
shake_len = 0;
shake_mag = 0;
shake_rem = 0;