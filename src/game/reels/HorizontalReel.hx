package game.reels;


import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import game.Board.BoardData;
import game.Tile;

import game.reels.HorizontalReel;

//import openfl.filters.BlurFilter;
//import motion.easing.Expo;
//import motion.Actuate;


/**
 * ...
 * @author vova
 * @author Dmitry Velichkevich
 */
class HorizontalReel extends FlxSprite implements IReel {
	@final
	private static inline var MOVING_TILES_AMOUNT: Int = 50;


    public var _moving:Bool;

    private var background: FlxSprite;
    private var moveToDuration: Float;

    private var columnsAmount: Int;
    private var tween: FlxTween;

    private var tiles: Array<Tile>;


    public function new(columnsAmount: Int, initialLeftShift: Float) {
		super();
		x = initialLeftShift;
        this.columnsAmount = columnsAmount;
        initialize();
        construct();
    }

    public function initialize(): Void {
        moveToDuration = 0.5;
        immovable = true;
        //_background = new FlxSprite(0, 0);
    }

    private function construct(): Void {
        //_background.y = 0;
        //_background.graphics.beginFill (0xFFFFFF, 0.4);
        //_background.graphics.drawRect (0, 0, columns * Tile.W, Tile.H);
        
        //_background.filters = [ new BlurFilter (10, 10) ];
        //_background.makeGraphic(columns * Tile.W, Tile.H, FlxColor.GRAY);

        //add(_background);
        var data: BoardData = new BoardData();
        tiles = new Array<Tile>();
        var i: Int = 0;
        for(i in 0...data.tileImages.length) {
            tiles.push(new Tile(data.tileImages[i]));
        }
        makeGraphic(columnsAmount * Tile.W, Tile.H, FlxColor.GRAY);
    }

    public function moveToPosition(targetX: Float, targetY: Float): Void {
        //velocity.y = velocity.y == 10 ? 0 : 10;
        alpha = 1.0;

        if (tween != null) tween.cancel();
        tween = FlxTween.tween(this, { x: targetX, y: targetY }, moveToDuration, { ease: FlxEase.quadInOut, onComplete: onMoveToComplete });
        //acceleration.set(0, 0.5);
        //velocity.set( -0.1, -0.1, 0.1, 0.1);
    }

    public function moveTo(targetY: Float): Void {
        moveToPosition(x, targetY);
    }

	public function start(duration: Float): Void {
		
	}

	public function stop(): Void {
		
	}

	public function generateTiles(spinResult: List<Tile>): Void {
		
	}

	public function setVisibility(visible: Bool): Void {
		this.visible = visible;
	}

    private function onMoveToComplete(Tween: FlxTween): Void {
        tween = null;
        alpha = 0.5;
    }
}
