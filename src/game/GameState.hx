package game;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseButton.FlxMouseButtonID;
import game.Board.BoardData;
import game.reels.HorizontalReel;
import game.strategy.IStrategy;
import game.strategy.Strategy0;
import lobby.LobbyState;
//import openfl.display.Sprite;

//import openfl.text.TextField;
//import openfl.text.TextFormat;
//import openfl.text.TextFormatAlign;
//import openfl.filters.BlurFilter;
//import openfl.filters.DropShadowFilter;
//import openfl.events.MouseEvent;
//import openfl.Assets;

// for test
//import game.server.GameRequest;


/**
 * ...
 * @author vova
 * @author Dmitry Velichkevich
 */
class GameState extends FlxState {
	private var _board:Board;
	private var _spinButton:SpinButton;
	private var _backButton:BackButton;
	private var _score:Score;
	private var reel:IReel;

	private var _strategy:IStrategy;


	override public function create(): Void {
		initialize();
		construct();
		super.create();
	}

	private function initialize ():Void {
		_board = new Board();
		_spinButton = new SpinButton(_onSpinClicked);
		_backButton = new BackButton(_onBackClicked);
		_score = new Score();
	}

	private function construct ():Void {
		_board.x = 100;
		_board.loadBoard(new BoardData());
		add(_board);

		reel = new HorizontalReel((_board.NUM_COLUMNS - 2), _board.x);

		_strategy = new Strategy0(reel, _board);

		var xOffset = _board.x + _board.w;
		var yOffset = _board.y + _board.h;

		_spinButton.x = xOffset + 10;
		_spinButton.y = yOffset - _spinButton.height;
		add(_spinButton);
	
		_backButton.x = xOffset + 10;
		_backButton.y = 50;
		add(_backButton);
		
		_score.x = xOffset + 10;
		_score.y = 20;
		_score.text ("1234567890");
		add(_score);

		//_spinner.y = _board.y2 - _spinner.height;
		add(cast(reel, FlxSprite));
		
		_strategy.start();
	}
	
	function _onSpinClicked():Void {
		_strategy.spin();
		
		//var request = new GameRequest();
		//request.ss();
	}

	function _onBackClicked():Void {
		FlxG.switchState(new LobbyState());
	}

}