package lobby;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxSpriteButton;

/**
 * ...
 * @author vova
 */
class GameIcon extends FlxSpriteButton
{
	public static var W = 100;
	public static var H = 100;
	private var _level:Int;
	private var _size:Int = 60;
	
	
	public function new(X:Float = 0, Y:Float = 0, Level:Int, ?OnClick:Void->Void)
	{
		_level = Level;
		super(X, Y, null, OnClick);
		_construct();
	}

	private function _construct ():Void {
		loadGraphic("img/gameIcon.png", true, GameIcon.W, GameIcon.H);
		createTextLabel("" + _level, "font/FreebooterUpdated.ttf", _size, 0xff00ff);
	}
	
				/*
        // Add a text with filter
        var myFilterText = new FlxText(300,250,150,text,12,false);
        myFilterText.addFilter(new flash.filters.BlurFilter());
        add(myFilterText);
				 */
}