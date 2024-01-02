//Camera
//
//
//
//
//Camera Screen Shake
function scr_camera_screen_shake(magnitude,length){
with (global.iCamera)
{
	if (magnitude > shake_rem)
	{
		shake_mag = magnitude;
		shake_rem = shake_mag;
		shake_len = length;
	}
}
}
