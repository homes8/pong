package game;

import flixel.FlxSprite;
import openfl.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author vova
 */
class Tile extends FlxSprite
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
	
	private function construct (imagePath:String):Void {

		loadGraphic(imagePath, true);
		
		//graphics.beginFill(0x000000, 0);
		//graphics.drawRect(0, 0, W, H);
			
	}
	

}