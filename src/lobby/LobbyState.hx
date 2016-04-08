package lobby;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import game.GameState;
//import openfl.display.Sprite;

/**
 * ...
 * @author vova
 */
class LobbyState extends FlxState
{
	private var _levels:FlxGroup;
	private var _current:Int;
	private var _currentLevel = 3;
	
	
	override public function create():Void
	{
		initialize();
		construct();
		super.create();
	}
	
	private function initialize ():Void {
		_levels = new FlxGroup();
	
	}
	
	private function construct ():Void {
		var bx:Int = 10;
		var by:Int = 10;
		var level:Int = 0;
		var tempLevel:GameIcon;
		
		for (y in 0...3)
		{
			for (x in 0...3)
			{
				++level;
				
				if (level > _currentLevel) {
					tempLevel = new GameIconLocked(bx, by, level);
				} else {
					tempLevel = new GameIcon(bx, by, level, _onLevelClicked.bind(level));
				}
				//tempLevel.makeGraphic(W, H, 0xffd03ad1);
				
				_levels.add(tempLevel);
				bx += GameIcon.W + 10;
			}
			
			bx = 10;
			by += GameIcon.H + 30;
		}
		
		add(_levels);
	}
	
	function _onLevelClicked(level:Int):Void {
		trace(level);
		FlxG.switchState(new GameState());
	}
}