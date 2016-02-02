package game;

import openfl.display.Sprite;
import openfl.display.Bitmap;
//import openfl.events.Event;
//import openfl.events.MouseEvent;
import openfl.Assets;

/**
 * ...
 * @author vova
 */
class SpinButton extends Sprite
{
	public static var W = 96;
	public static var H = 49;
	
	private function new()
	{
		super();
		construct();
	}
	
	private function construct ():Void {

		var image = new Bitmap (Assets.getBitmapData ("img/spinButton.png"));
		image.smoothing = true;
		addChild (image);

		mouseChildren = false;
		buttonMode = true;
		
		graphics.beginFill (0x000000, 0);
		graphics.drawRect (0, 0, W, H);

	}

}