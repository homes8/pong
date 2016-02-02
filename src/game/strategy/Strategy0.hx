package game.strategy;
import game.Spinner;
import game.Board;
import lime.graphics.console.IndexBuffer;

/**
 * ...
 * @author vova
 */
class Strategy0 implements IStrategy
{
	private var spinner:Spinner;
	private var board:Board;
	private var index:Int;

	public function new(spinner:Spinner, board:Board)
	{
		this.spinner = spinner;
		this.board = board;
		
		initialize();
	}

	public function initialize ():Void {
		index = board.NUM_ROWS - 1;
	}
	
	public function spin ():Void {
		changeIndex();
		moveSpinner();
	}
	
	// todo: to base class
	private function changeIndex():Void {
		index --;
		if (index < 0) {
			index = board.NUM_ROWS - 1;
		}
	}
	
	private function moveSpinner():Void {
		var y:Float = board.getPosition(index, 0).y;
		spinner.moveTo(null, Std.int(y));
	}
	
	private function hideSpinner(show:Bool = false):Void {
		spinner.visible = show;
	}
	
	//public function spennerXXX(from:Int, to:Int) {
		//
	//}
}