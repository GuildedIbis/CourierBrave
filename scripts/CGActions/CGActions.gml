//CG Basic Actions
//
//
//
//
//
//Deck Shuffle
function scr_cg_deck_shuffle(){
var _size = array_length(pdeck_array);
var _tempDeck = array_create(_size);

//Save Temporary Copy of Deck
for (var j = 0; j < _size; j = j + 1)
{
	_tempDeck[j, 0] = pdeck_array[j, 0];
	_tempDeck[j, 1] = pdeck_array[j, 1];
	_tempDeck[j, 2] = pdeck_array[j, 2];
}

//Reset Deck Randomly
for (var i = 0; i < _size; i = i + 1)
{
	var _shuffleID = irandom_range(0,_size - (1+i));
	pdeck_array[i, 0] = _tempDeck[_shuffleID, 0];
	pdeck_array[i, 1] = _tempDeck[_shuffleID, 1];
	pdeck_array[i, 2] = _tempDeck[_shuffleID, 2];
	array_delete(_tempDeck,_shuffleID,1);
}
}