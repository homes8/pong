package game.strategy;

import game.Board;
import game.IReel;
import game.Tile;
import lime.graphics.console.IndexBuffer;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import hxbolts.Task;
import hxbolts.TaskCompletionSource;

/**
 * ...
 * @author vova
 */
class Strategy0 implements IStrategy {
	private var reel: IReel;
	private var _board:Board;
	private var _index:Int;
	private var _lastIndex:Int;


	public function new(reel: IReel, board: Board) {
		this.reel = reel;
		_board = board;
		
		initialize();
	}

	private function initialize():Void {
		_lastIndex = _board.NUM_ROWS - 3;
		_index = _lastIndex;
	}
	
	public function start():Void {
		moveSpinner();
	}
	
	public function spin():Void {
		changeIndex();
		moveSpinner();
	}
	
	private function changeIndex():Void {
		_index --;
		if (_index < 0) {
			_index = _lastIndex;
		}
	}
	
	private function moveSpinner():Void {
		var y:Float = _board.getTilePosition(_index, 0).y;
		reel.moveTo(y);

		animator();
	}
	
	private function hideSpinner(show:Bool = false):Void {
		reel.setVisibility(show);
	}
	

	private function animator():Void {
		
		//var tile:Tile = _board.getTile(68);
		//trace(tile.column + "-" + tile.row);
				
		var steps:Array<Dynamic> = [
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
		
		
		for (x in steps) {
			switch(x.op) {
				case "remove":
					_remove(x.ind);
					break;
					
				case "add":
					break;
					
				case "move":
					break;
			}
		}
	
	}
	
	private function _remove(ids:Array<Int>): Task<Bool> {
		var tcs = new TaskCompletionSource<Bool>();
		
		var list:Array<FlxTween> = [];
		var tween:FlxTween;
		var tile:Tile;
		
		function _completer(tw:FlxTween):Void {
			if(!tcs.task.isCompleted) tcs.setResult(true);
		}
		
		for (i in ids) {
			tile = _board.getTile(i);
			tween = FlxTween.tween(tile, { x: 100.0, y: 100.0 }, 0.5, {
				ease: FlxEase.quadInOut,
				onComplete: _completer
			});
			list.push(tween);
		}
		
		return tcs.task;
	}
	
}

