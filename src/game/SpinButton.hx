package game;

//import flixel.FlxSprite;
//import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
//import openfl.display.Bitmap;
//import openfl.events.Event;
//import openfl.events.MouseEvent;
//import openfl.Assets;

/**
 * ...
 * @author vova
 */
class SpinButton extends FlxButton
{
	public static var W = 96;
	public static var H = 49;
	
	private function new(X:Float = 0, Y:Float = 0, ?OnClick:Void->Void)
	{
		super(X, Y, "", OnClick);
		construct();
	}
	
	private function construct ():Void {

		//add(new FlxSprite(0, 0, "img/spinButton.png"));

		//mouseChildren = false;
		//buttonMode = true;
		
		//graphics.beginFill (0x000000, 0);
		//graphics.drawRect (0, 0, W, H);

		loadGraphic("img/spinButton.png");
	}

}