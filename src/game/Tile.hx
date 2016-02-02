package game;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author vova
 */
class Tile extends Sprite
{
	public static var W = 56;
	public static var H = 56;
	
	public var type:Int;
	public var column:Int;
	public var row:Int;
	
	
	public function new(imagePath:String)
	{
		super();
		
		construct(imagePath);
	}
	
	public function initialize ():Void {
		
		scaleX = 1;
		scaleY = 1;
		alpha = 1;
		
	}
	
	private function construct (imagePath:String):Void {

		var image = new Bitmap (Assets.getBitmapData (imagePath));
		image.smoothing = true;
		addChild (image);

		mouseChildren = false;
		//buttonMode = false;
		
		graphics.beginFill (0x000000, 0);
		graphics.drawRect (0, 0, W, H);
			
	}
	

}