package game;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

//import openfl.filters.BlurFilter;
//import motion.easing.Expo;
//import motion.Actuate;

/**
 * ...
 * @author vova
 */
class Spinner extends FlxSprite
{
	public var _moving:Bool;

	private var _background:FlxSprite;
	private var _moveToDuration:Float;
	
	private var columns:Int;
	private var _tween:FlxTween;
	

	private function new(columns:Int)
	{
		this.columns = columns;
		
		super();
		
		initialize();
		construct();
	}
	
	public function initialize ():Void {
		_moveToDuration = 0.5;
		immovable = true;
		//_background = new FlxSprite(0, 0);
	}
	
	private function construct ():Void {
		//_background.y = 0;
		//_background.graphics.beginFill (0xFFFFFF, 0.4);
		//_background.graphics.drawRect (0, 0, columns * Tile.W, Tile.H);
		
		//_background.filters = [ new BlurFilter (10, 10) ];
		//_background.makeGraphic(columns * Tile.W, Tile.H, FlxColor.GRAY);

		//add(_background);
		makeGraphic(columns * Tile.W, Tile.H, FlxColor.GRAY);

	}

	public function moveTo(targetX:Float, targetY:Float): Void {
		//velocity.y = velocity.y == 10 ? 0 : 10;
		alpha = 1.0;
		
		if (_tween != null) _tween.cancel();
		_tween = FlxTween.tween(this, { x: targetX, y: targetY }, _moveToDuration, { ease: FlxEase.quadInOut, onComplete: _onMoveToComplete });
		//acceleration.set(0, 0.5);
		//velocity.set( -0.1, -0.1, 0.1, 0.1);
	}
	
	public function moveToY(targetY:Float): Void {
		moveTo (x, targetY);
	}
	
	private function _onMoveToComplete (Tween:FlxTween):Void {
		_tween = null;
		alpha = 0.5;
	}
}