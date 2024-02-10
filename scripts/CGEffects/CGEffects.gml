//Card Game Effects
//Name | Run Object | Object Event
//
//
//
//Card Game Effect | obj_cg_effect | Draw GUI
function scr_cg_effect_selected(){
var _totalFrames = sprite_get_number(spr_card_effect_selected);
if (anim_timer > 0) anim_timer = anim_timer - 1;
if (anim_timer <= 0) 
{
	anim_timer = 4;
	local_frame = local_frame + 1;
	if (local_frame >= _totalFrames)
	{
		animation_end = true;
		local_frame = local_frame - _totalFrames
	}
	else animation_end = false;
}

draw_sprite_ext(spr_card_effect_selected,local_frame,x,y,1,1,0,c_white,1);

}