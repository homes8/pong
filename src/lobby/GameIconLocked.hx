package lobby;

import flixel.ui.FlxSpriteButton;

/**
 * ...
 * @author vova
 */
class GameIconLocked extends GameIcon
{
	
//	private function _initialize ():Void {
//		_imgPath = "img/gameIconLocked.png";
//	}
	
	override private function _construct ():Void {
		loadGraphic("img/gameIconLocked.png", false, GameIcon.W, GameIcon.H);
		createTextLabel("" + _level, "font/FreebooterUpdated.ttf", _size, 0xff00ff);
	}
}