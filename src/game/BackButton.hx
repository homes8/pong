package game;

import flixel.ui.FlxButton;

/**
 * ...
 * @author vova
 */
class BackButton extends FlxButton
{
	public static var W = 178;
	public static var H = 48;
	
	private function new(X:Float = 0, Y:Float = 0, ?OnClick:Void->Void)
	{
		super(X, Y, "", OnClick);
		construct();
	}
	
	private function construct ():Void {
		loadGraphic("img/backButton.png");
	}

}