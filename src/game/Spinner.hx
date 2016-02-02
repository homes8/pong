package game;

import openfl.display.Sprite;
import openfl.filters.BlurFilter;
import motion.easing.Expo;
import motion.Actuate;

/**
 * ...
 * @author vova
 */
class Spinner extends Sprite
{
	public var moving:Bool;

	private var Background:Sprite;
	private var moveToDuration:Float;
	
	private var columns:Int;
	

	private function new(columns:Int)
	{
		this.columns = columns;
		
		super();
		
		initialize();
		construct();
	}
	
	public function initialize ():Void {
		moving = false;
		moveToDuration = 0.5;
		Background = new Sprite ();
	}
	
	private function construct ():Void {
		Background.y = 0;
		Background.graphics.beginFill (0xFFFFFF, 0.4);
		Background.graphics.drawRect (0, 0, columns * Tile.W, Tile.H);
		
		Background.filters = [ new BlurFilter (10, 10) ];
		addChild (Background);
	}

	public function moveTo(targetX:Float, targetY:Float): Void {
		moving = true;
		
		if (targetX == null) targetX = x;
		
		Actuate.tween (this, moveToDuration, { x: targetX, y: targetY } ).ease (Expo.easeOut).onComplete (this_onMoveToComplete);
	}
	
	private function this_onMoveToComplete ():Void {
		moving = false;
	}
}