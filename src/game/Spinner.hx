package game;

import flixel.FlxSprite;
import flixel.util.FlxColor;

import openfl.filters.BlurFilter;
import motion.easing.Expo;
import motion.Actuate;

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
	

	private function new(columns:Int)
	{
		this.columns = columns;
		
		super();
		
		initialize();
		construct();
	}
	
	public function initialize ():Void {
		_moving = false;
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
		_moving = true;
		
		x = targetX;
		y = targetY;
		//velocity.y = 10;
		
		//Actuate.tween (this, _moveToDuration, { x: targetX, y: targetY } ).ease (Expo.easeOut).onComplete (this_onMoveToComplete);
	}
	
	public function moveToY(targetY:Float): Void {
		moveTo (x, targetY);
	}
	
	private function this_onMoveToComplete ():Void {
		_moving = false;
	}
}