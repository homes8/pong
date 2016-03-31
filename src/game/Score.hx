package game;

//import flixel.FlxSprite;
//import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

//import openfl.text.TextField;
//import openfl.text.TextFormat;
//import openfl.text.TextFormatAlign;
//import openfl.filters.BlurFilter;
//import openfl.filters.DropShadowFilter;
//import openfl.Assets;

/**
 * ...
 * @author vova
 */
class Score extends FlxSpriteGroup
{
	private var _score:FlxText;

	private function new()
	{
		super();
		construct();
	}
	
	private function construct ():Void {
		_score = new FlxText(0, 0, 100, "");
		_score.setFormat("font/FreebooterUpdated.ttf", 30, FlxColor.WHITE, LEFT);
		add(_score);
	}
	
	public function text (text:String):Void {
		_score.text = text;
	}
}