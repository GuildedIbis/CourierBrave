//Kephra Stone Scripts
//
//
//
//
//
//Kephra Stone Main
function KephraStoneList(){
kephra_grid = ds_grid_create(60,3);

kephra_grid[# 0, 0] = KephraStoneIntroA;
kephra_grid[# 0, 1] = false;
kephra_grid[# 0, 2] = "Press C to use a Crull Stone. It heals damage the\nCourier has taken.\nLeft click to use the Courier's magic skill."
kephra_grid[# 1, 0] = KephraStoneIntroB;
kephra_grid[# 1, 1] = false
kephra_grid[# 1, 2] = "Right click to user the Couriers weapon skill.\nPress Space to roll. It grans breif invincibility."
kephra_grid[# 2, 0] = KephraStoneIntroC;
kephra_grid[# 2, 1] = false
kephra_grid[# 2, 2] = "Press Shift to use the Courier's special skill.\nPress R to use a potion (coming soon)"
kephra_grid[# 3, 0] = KephraStoneUpgrades;
kephra_grid[# 3, 1] = false
kephra_grid[# 3, 2] = "The Courier can spend Beans (enemy drops) to level\nstats at alters.\nSkills can be leveled speaking to certain NPC's"
kephra_grid[# 4, 0] = KephraStoneLairs;
kephra_grid[# 4, 1] = false
kephra_grid[# 4, 2] = "Lairs and Dungeons are sub-areas with objectives\nand bosses.\nDefeat the boss to earn a valuable reward."
kephra_grid[# 5, 0] = KephraStoneEscort;
kephra_grid[# 5, 1] = false
kephra_grid[# 5, 2] = "Escort the crystal to the alter and get the key.\nEnemies will search for you and the crystal, and attack\non sight."
kephra_grid[# 6, 0] = KephraStoneCapture;
kephra_grid[# 6, 1] = false
kephra_grid[# 6, 2] = "Escort the crystal to the alter and get the key.\nEnemies will search for you and the crystal, and attack\non sight."
						
}

//
//
//
//
//
//Kephra Stone Main
function KephraStoneMain(){
//Format
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu,3,64,36,192,96);
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);


draw_set_color(c_white);
var _name = "Kephra Stone";
//draw_sprite(spr_dialoguePort_all,speaker,447,391);

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = string(obj_inventory.kephra_grid[# activate_args, 2])
	_SubString = string_copy(text_string,1,letter_counter);
	
	script_execute(obj_inventory.kephra_grid[# activate_args, 0],0,0);
}

if (string_counter >= 1)
{
	//_feeling = 0;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_kephraStone,0,280,164);
}

//
//
//
//
//
//Kephra Stone: Intro A
function KephraStoneIntroA(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,0,64 + _shiftX,36 + _shiftY)


//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"Crull Stone Heal - Heal 100 damage.\nReturn to a camp room to restore\nCrull Stones.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Magic skills use up charge that refills\nover time. Effectiveness determined\n by Grace stat.",.35,.35,0);
//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Roll Dodge - Move faster and become\ninvincible for a breif window.\nAutomatically recharges with time.",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Crull Stone Heal - Heal 100 damage.\nReturn to a camp room to restore\nCrull Stones.",.35,.35,0);
}
//
//
//
//
//
//Kephra Stone: Intro B
function KephraStoneIntroB(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,1,64 + _shiftX,36 + _shiftY)

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"Weapon skills effectiveness\ndetermined by Might stat and\nweapon level.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Rolling Uses stamina which recharges\nwith time. Grants invincibility.",.35,.35,0);

//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Slash - Swing the sword for damage.\ndamage = might + (11 x weapon power)",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Gold Arc - Shot a projectile that",.35,.35,0);
}
//
//
//
//
//
//Kephra Stone: Intro C
function KephraStoneIntroC(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,2,64 + _shiftX,36 + _shiftY)

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"The special skill recharges with time.\nEffectiveness determined by varying\nstats.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Potions can have a variety of\ndiffernt effects, like healing, restoring magic\nand more.",.35,.35,0);
//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Meteor Shot - Damage",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Meteor Slam - Damage",.35,.35,0);
}
//
//
//
//
//
//Kephra Stone: Smiths and Merchants
function KephraStoneUpgrades(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,3,64 + _shiftX,36 + _shiftY)

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"Stats are leveled across all forms.\nNo matter who you are, you're\nthe Courier.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Skills are leveled individuallly.\nOnly Regaliare has the power\nof the Gold Arcs.",.35,.35,0);
//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Meteor Shot - Damage",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Meteor Slam - Damage",.35,.35,0);
}
//
//
//
//
//
//Kephra Stone: Lairs
function KephraStoneLairs(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,4,64 + _shiftX,36 + _shiftY)

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"Lairs and Dungeons have camps at\ntheir entrances where you'll return\nif you die.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Speak with the Browi to reset the lair\nat any time.",.35,.35,0);
//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Meteor Shot - Damage",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Meteor Slam - Damage",.35,.35,0);
}
//
//
//
//
//
//Kephra Stone: Lairs
function KephraStoneEscort(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,5,64 + _shiftX,36 + _shiftY)

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"The crystal will travel along a set\npath when you stand near it.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Escort the crystal from the first\npedestal to the second to unlock the door.",.35,.35,0);
//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Meteor Shot - Damage",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Meteor Slam - Damage",.35,.35,0);
}
//
//
//
//
//
//Kephra Stone: Lairs
function KephraStoneCapture(_shiftX,_shiftY){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);

//Sprite
draw_sprite(spr_kephraStone_infograph,5,64 + _shiftX,36 + _shiftY)

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text_transformed(69 + _shiftX,107 + _shiftY,"The crystal will travel along a set\npath when you stand near it.",.35,.35,0);
draw_text_transformed(164 + _shiftX,107 + _shiftY,"Escort the crystal to the Key Claw\nalter to unlock the alters key.",.35,.35,0);
//draw_set_color(c_white);
//draw_text_transformed(68 + _shiftX,107 + _shiftY,"Meteor Shot - Damage",.35,.35,0);
//draw_text_transformed(163 + _shiftX,107 + _shiftY,"Meteor Slam - Damage",.35,.35,0);
}