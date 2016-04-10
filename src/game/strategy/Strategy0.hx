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

	private function initialize():Void {
		index = board.NUM_ROWS - 1;
	}
	
	public function start():Void {
		moveSpinner();
	}
	
	public function spin():Void {
		changeIndex();
		moveSpinner();
	}
	
	private function changeIndex():Void {
		index --;
		if (index < 0) {
			index = board.NUM_ROWS - 1;
		}
	}
	
	private function moveSpinner():Void {
		var y:Float = board.getTilePosition(index, 0).y;
		spinner.moveToY(y);
		
		
	}
	
	private function hideSpinner(show:Bool = false):Void {
		spinner.visible = show;
	}
	

	private function animator():Void {
		/*
		var steps = [
			{ op: "remove", ind: [8,11] },
			{ op: "add", ind: [71,73], data:[3,1] },
			{ op: "move", inds: [
					[15,22,29,36,43,50,57,64,71],
					[18,25,32,39,46,53,60,67,74]
				], inde: [
					[8,15,22,29,36,43,50,57,64],
					[11,18,25,32,39,46,53,60,67]
				]
			}
		];
		
		for (x in 0..steps.length) {
			
		}
		*/
	}
	
	
	
}