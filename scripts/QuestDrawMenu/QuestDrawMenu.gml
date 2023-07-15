//Active Quest Draw Scripts
//
//
//
//
//
//Quest 00: The Courier
function scr_menu_quest_selected(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 0, 1] < quest_grid[# 0, 2]) var _headerText = "THE COURIER"
if (quest_grid[# 0, 1] >= quest_grid[# 0, 2]) var _headerText = "THE COURIER (COMPLETE)"
var _activeText = "You play the Courier, a undying\nwarrior sent by the Goddess Kephra\nto destroy the Great Evil."
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = TheCourierActiveDraw;
}
}
//
//
//
//
//
//Quest 01: An Old Mouse
function AnOldMouseMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 1, 1] < quest_grid[# 1, 2]) var _headerText = "AN OLD MOUSE"
if (quest_grid[# 1, 1] >= quest_grid[# 1, 2]) var _headerText = "AN OLD MOUSE (COMPLETE)"
if (quest_grid[# 1, 1] <= 0) var _activeText = "Speak with Nisma"
if (quest_grid[# 1, 1] >= 1) var _activeText = "The Great Evil rules vicariously.\nthrough captains, like Ekthalem in\nthe old tower Southeast of here.\n\nBrowi has found that there are four\ncaptains, each in a place that once held\nan ancient relic.\n\nKill the captain, find what it hides."
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = AnOldMouseActiveDraw;
}

}
//
//
//
//
//
//Quest 02: The Smith
function TheSmithMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 2, 1] < quest_grid[# 2, 2]) var _headerText = "THE SMITH"
if (quest_grid[# 2, 1] >= quest_grid[# 2, 2]) var _headerText = "THE SMITH (COMPLETE)"
var _activeText = "Kovalad the smith will upgrade your\narmor and weapons, but you'll have to\nkeep Lenko free of rats if you want\nhim to chip in.\n\n" + "Kill local the local rats\n" + string(quest_grid[# 2, 1]) + "/" + string(quest_grid[# 2, 2]);
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = TheSmithActiveDraw;
}
}
//
//
//
//
//
//Quest 03: Endire Knight Tnaks
function EndireKnightTnaksMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 3, 1] < quest_grid[# 3, 2]) var _headerText = "ENDIRE KNIGHT: TNAKS"
if (quest_grid[# 3, 1] >= quest_grid[# 3, 2]) var _headerText = "ENDIRE KNIGHT: TNAKS (COMPLETE)"
var _activeText = "Kill Tnaks, the Knight of Endire's\nFlame.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = EndireKnightTnaksActiveDraw;
}
}
//
//
//
//
//
//Quest 04: Endire Knight Obor
function EndireKnightOborMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 4, 1] < quest_grid[# 4, 2]) var _headerText = "ENDIRE KNIGHT: OBOR"
if (quest_grid[# 4, 1] >= quest_grid[# 4, 2]) var _headerText = "ENDIRE KNIGHT: OBOR (COMPLETE)"
var _activeText = "Kill Obor, the Knight of Endire's\nFlame.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = EndireKnightOborActiveDraw;
}
}
//
//
//
//
//
//Quest 05: Endire Knight Ghafate
function EndireKnightGhafateMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 5, 1] < quest_grid[# 5, 2]) var _headerText = "ENDIRE KNIGHT: GHAFATE"
if (quest_grid[# 5, 1] >= quest_grid[# 5, 2]) var _headerText = "ENDIRE KNIGHT: GHAFATE (COMPLETE)"
var _activeText = "Kill Ghafate, the Knight of Endire's\nFlame.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = EndireKnightGhafateActiveDraw;
}
}
//
//
//
//
//
//Quest 06: Moon Over Lenko
function MoonOverLenkoMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 6, 1] < quest_grid[# 6, 2])var _headerText = "MOON OVER LENKO"
if (quest_grid[# 6, 1] >= quest_grid[# 6, 2])var _headerText = "MOON OVER LENKO (COMPLETE)"
var _activeText = "Open the Moon Chest hidden in\nthe grave of the Grand\nRempho Army of old.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = MoonOverLenkoActiveDraw;
}
}
//
//
//
//
//
//Quest 07: Dual Stars Over Lenko
function DualStarsOverLenkoMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 7, 1] < quest_grid[# 7, 2]) var _headerText = "DUAL STARS OVER LENKO"
if (quest_grid[# 7, 1] >= quest_grid[# 7, 2]) var _headerText = "DUAL STARS OVER LENKO (COMPLETE)"
var _activeText = "Speak to the three Solar Sabi...\nin proper order.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = DualStarsOverLenkoActiveDraw;
}
}
//
//
//
//
//
//Quest 08: Lair: Yakflower Path
function LairYakflowerPathMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 8, 1] < quest_grid[# 8, 2]) var _headerText = "LAIR: YAKFLOWER PATH"
if (quest_grid[# 8, 1] >= quest_grid[# 8, 2]) var _headerText = "LAIR: YAKFLOWER PATH (COMPLETE)"
var _activeText = "There is a Form Stone hidden\nsomewhere in Yakflower Path.\nMoths and their worm-like\nlarva protect the glade.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = LairYakflowerPathActiveDraw;
}
}
//
//
//
//
//
//Quest 09: Lair: Lake Habraf
function LairLakeHabrafMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 9, 1] < quest_grid[# 9, 2]) var _headerText = "LAIR: LAKE HABRAF"
if (quest_grid[# 9, 1] >= quest_grid[# 9, 2]) var _headerText = "LAIR: LAKE HABRAF (COMPLETE)"
var _activeText = "There is a Form Stone hidden\nsomewhere in Lake Habraf.\nThere is also rumor of a giant\nlillion called Mother Lily.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = LairLakeHabrafActiveDraw;
}
}
//
//
//
//
//
//Quest 10: Regaliare's Quest
function RegaliareQuestMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 10, 1] < quest_grid[# 10, 2]) var _headerText = "REGALIARE'S QUEST"
if (quest_grid[# 10, 1] >= quest_grid[# 10, 2]) var _headerText = "LAIR: LAKE HABRAF (COMPLETE)"
var _activeText = "As Regaliare, defeat the Elite\nGorog and take his\nalternate magic skill.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = RegaliareQuestActiveDraw;
}
}
//
//
//
//
//
//Quest 11: Adavio's Quest
function AdavioQuestMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 11, 1] < quest_grid[# 11, 2]) var _headerText = "ADAVIO'S QUEST"
if (quest_grid[# 11, 1] >= quest_grid[# 11, 2]) var _headerText = "ADAVIO'S QUEST (COMPLETE)"
var _activeText = "As Adavio, defeat the Enraged\nMoth and take his\nalternate magic skill.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = AdavioQuestActiveDraw;
}
}
//
//
//
//
//
//Quest 12: Ceriver's Quest
function CeriverQuestMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 12, 1] < quest_grid[# 12, 2]) var _headerText = "CERIVER'S QUEST"
if (quest_grid[# 12, 1] >= quest_grid[# 12, 2]) var _headerText = "CERIVER'S QUEST (COMPLETE)"
var _activeText = "As Ceviver, defeat the Lily\nZealot and take her\nalternate magic skill.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = CeriverQuestActiveDraw;
}
}
//
//
//
//
//
//Quest 13: Halofire's Quest
function HalofireQuestMenuDraw(){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_sprite_stretched(spr_menu,3,162,110,32,13);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (quest_grid[# 13, 1] < quest_grid[# 13, 2]) var _headerText = "HALOFIRE'S QUEST"
if (quest_grid[# 13, 1] >= quest_grid[# 13, 2]) var _headerText = "HALOFIRE'S QUEST (COMPLETE)"
var _activeText = "As Halofire, defeat the ???\nenemy and take her\nalternate magic skill.";
draw_set_color(c_black);
draw_text_transformed(162,44,_headerText,.35,.35,0);
draw_text_transformed(162,51,_activeText,.35,.35,0);
draw_text_transformed(169,114,"TRACK",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(161,44,_headerText,.35,.35,0);
draw_text_transformed(161,51,_activeText,.35,.35,0);
draw_text_transformed(168,114,"TRACK",.35,.35,0);

if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
	obj_player.tracking_quest = HalofireQuestActiveDraw;
}
}