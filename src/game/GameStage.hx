package game;

import game.Board.BoardData;
import game.strategy.IStrategy;
import game.strategy.Strategy0;
import openfl.display.Sprite;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.filters.BlurFilter;
import openfl.filters.DropShadowFilter;
import openfl.events.MouseEvent;
import openfl.Assets;

// for test
import game.server.GameRequest;

/**
 * ...
 * @author vova
 */
class GameStage extends Sprite
{
	private var board:Board;
	private var spinButton:SpinButton;
	private var score:Score;
	private var spinner:Spinner;
	
	private var strategy:IStrategy;

	public function new()
	{
		super();
		
		initialize();
		construct();
	}
		
	private function initialize ():Void {
		board = new Board();
		spinButton = new SpinButton();
		score = new Score();
		spinner = new Spinner(board.NUM_COLUMNS);
		
		strategy = new Strategy0(spinner, board);
	}
		
	private function construct ():Void {
		board.x = 100;
		board.loadBoard(new BoardData());
		addChild(board);
		
		var xOffset = board.x + board.width;
		var yOffset = board.y + board.height;
		
		spinButton.x = xOffset + 10;
		spinButton.y = yOffset - spinButton.height;
		addChild(spinButton);
		
		score.x = xOffset + 10;
		score.y = 20;
		score.text ("1234567890");
		addChild(score);

		spinner.x = board.x;
		spinner.y = board.y2 - spinner.height;
		addChild(spinner);
		
		
		spinButton.addEventListener (MouseEvent.CLICK, onSpinClicked);
	}
	
	function onSpinClicked(e:MouseEvent) {

		strategy.spin();
		
		trace("rrrrrrrrrrrrrrrrrr");
		
		var request = new GameRequest();
		request.ss();
		
	}

}
