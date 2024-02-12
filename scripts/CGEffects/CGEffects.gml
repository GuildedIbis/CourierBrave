//Card Game Effects
//Name | Run Object | Object Event
//
//
//
//
//
function scr_cg_effect_reposition(_obj,_ary){
var _cardY = 161;
if (_ary = 0)//Hand
{
	var _handSize = array_length(_obj.hand_array);
	for (var i = 0; i < _handSize; i = i + 1)
	{

		if (_handSize < 11)
		{
			var _leftAlign = 224 - (_handSize * 8);
			var _space = 16;
			var _cardX = _leftAlign + (16 * slot);
		}
		else
		{
			var _leftAlign = 224 - (11 * 8);
			//var _space = max(1,26 - ((_handSize - 11)));
			var _space = max(1,170/_handSize); //It's 185 from one edge to the other, -15 for the width of the card
			var _cardX = _leftAlign + (_space * slot);
		}
	}
}
}
//
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