package lobby;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;

/**
 * ...
 * @author vova
 */
class GameIcon extends FlxButton
{

//	public function new(?X:Float=0, ?Y:Float=0)
//	{
//		super(X, Y, "img/spinButton.png");
//	}
	public static var W = 100;
	public static var H = 100;
	
	private function new(X:Float = 0, Y:Float = 0, Level:Int, ?OnClick:Void->Void)
	{
		super(X, Y, "" + Level, OnClick);
		construct();
	}
	
	private function construct ():Void {
		loadGraphic("img/gameIcon.png", false, W, H);
	}

				/*
        // Add a text with filter
        var myFilterText = new FlxText(300,250,150,text,12,false);
        myFilterText.addFilter(new flash.filters.BlurFilter());
        add(myFilterText);
				 */
}