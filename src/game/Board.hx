package game;

import openfl.display.Sprite;
import openfl.geom.Point;

/**
 * ...
 * @author vova
 */
class Board extends Sprite
{
	public var NUM_COLUMNS:Int = 5;
	public var NUM_ROWS:Int = 9;
	
	private var tiles:Array < Array < Tile >> ;
	private var data:BoardData;
	
	public var x2 (get, null):Float;
	public var y2 (get, null):Float;
	
	private function new()
	{
		super();
		
		initialize();
		construct();
		
	}
	
	private function initialize ():Void {
		
		tiles = new Array <Array <Tile>> ();
		
		for (row in 0...NUM_ROWS) {
			
			tiles[row] = new Array <Tile> ();
			
			for (column in 0...NUM_COLUMNS) {
				
				tiles[row][column] = null;
			}
		}
	}
	
	public function get_x2():Float {
		return x + width;
	}
	
	public function get_y2():Float {
		return y + height;
	}
	
	private function construct ():Void {
			
	}
	
	public function loadBoard (boardData: BoardData):Void {
		data = boardData;
		
		for (row in 0...NUM_ROWS) {
			for (column in 0...NUM_COLUMNS) {
				
				addTile (row, column, data.data[row][column]);
			}
		}
	}
	
	private function addTile (row:Int, column:Int, type:Int):Void {
		
		var tile = new Tile (data.tileImages[type]);
		
		tile.initialize ();
	
		tile.type = type;
		tile.row = row;
		tile.column = column;
		
		tiles[row][column] = tile;
		
		var position = getPosition (row, column);
		tile.x = position.x;
		tile.y = position.y;
		
		addChild (tile);
	}
	
	public function getPosition (row:Int, column:Int):Point {
		return new Point (column * Tile.W, row * Tile.H);
	}
}

class BoardData {
	public static var NUM_COLUMNS = 5;
	public static var NUM_ROWS = 9;
	
	public var data:Array < Array < Int >> ;

	public var tileImages = [ "img/themes/0/game_0.png", "img/themes/0/game_1.png", "img/themes/0/game_2.png", "img/themes/0/game_3.png", "img/themes/0/game_4.png", "img/themes/0/game_5.png" ];

	
	public function new()
	{
		data = [
		[1, 2, 3, 4, 1],
		[2, 2, 1, 1, 2],
		[1, 1, 3, 4, 1],
		
		[1, 2, 2, 4, 1],
		[2, 1, 3, 3, 3],
		[1, 1, 2, 4, 3],
		
		[2, 1, 1, 4, 1],
		[1, 2, 3, 4, 4],
		[2, 1, 1, 4, 1]
		];
	}
}

class SpinData {
	public var data:Array < Array < Int >> ;
	
}