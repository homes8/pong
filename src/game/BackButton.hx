package game;

import flixel.ui.FlxButton;

/**
 * ...
 * @author vova
 */
class BackButton extends FlxButton
{
	public static var W = 122;
	public static var H = 50;
	
	private function new(X:Float = 0, Y:Float = 0, ?OnClick:Void->Void)
	{
		super(X, Y, "", OnClick);
		construct();
	}
	
	private function construct ():Void {
		loadGraphic("img/backButton.png");
	}

}