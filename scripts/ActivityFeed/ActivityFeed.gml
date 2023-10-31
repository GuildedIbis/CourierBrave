//
//
//
//
//
//Game Activity Feed Create
function scr_game_activity_feed_create(){
feed_sprite = array_create(50, -1)
feed_index = array_create(50, -1)
}
//
//
//
//
//
//Game Activity Feed Main
function scr_game_activity_feed(){
if (feed_timer > 0)
{
	feed_timer = feed_timer - 1;
	for (var j = 0; j < 5; j = j + 1)
	{
		if (feed_sprite[j] != -1)
		{
			draw_sprite_stretched_ext(spr_menu_beveled,3,302,24 + (18 * j),16,16,c_white,min(1,feed_timer/60));
			draw_sprite_ext(feed_sprite[j],feed_index[j],310,32 + (18 * j),1,1,0,c_white,min(1,feed_timer/60));
		}
	}
}
if (feed_timer <= 0)
{
	if (feed_sprite[6] != -1) feed_timer = 120;
	for (var i = 0; i < 45; i = i + 1)
	{
		feed_sprite[i] = feed_sprite[i+5];
		feed_index[i] = feed_index[i+5];
	}
}
}
//
//
//
//
//
//Search for empty slot in Inventory. 
function scr_game_activity_feed_search(){
for (var i = 0; i < 50 ; i += 1)
{ 
	if (obj_game.feed_sprite[i] == -1)
	{
		return(i);
	}
}
return (-1);
}
//
//
//
//
//
//Activity Feed Add
function scr_game_activity_feed_add(sprite,index) {
var _slot = scr_game_activity_feed_search();
if (_slot != -1) 
{
	with (obj_game)
	{
		if (feed_timer <= 0) feed_timer = 120;
		feed_sprite[_slot] = sprite;
		feed_index[_slot] = index;
	}
	return true;
}
}