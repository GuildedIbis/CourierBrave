//Misc. Entity Scripts
//
//
//
//
//
//Item Drop (Used for Fragments and Essence)
function scr_entity_drop_object(_x,_y,_objects){
var _numObjects = array_length(_objects);
if (_numObjects > 1)
{
	var _anglePerItem = 360/_numObjects;
	var _angle = random(360);
	for (var i = 0; i < _numObjects; i = i + 1)
	{
		with (instance_create_layer(_x,_y,"Instances",_objects[i]))
		{
			//item_id = 
			direction = _angle;
			spd = .75 + (_numObjects * .1) + random(0.1);
		}
		_angle = _angle + _anglePerItem;
	}
}
else instance_create_layer(_x,_y,"Instances",_objects[0])
}