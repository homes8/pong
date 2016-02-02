package;
//package game;


import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

import game.GameStage;


/**
 * ...
 * @author vova
 */
class Main extends Sprite
{
	private var Game:GameStage;
	
	public function new()
	{
		super();
		
		initialize ();
		construct ();
		
		//resize (stage.stageWidth, stage.stageHeight);
		//stage.addEventListener (Event.RESIZE, stage_onResize);
	}
	
	private function initialize ():Void {
		
		Game = new GameStage ();
		
	}
	
	private function construct ():Void {
		
		addChild (Game);
		
	}
	
	private function resize (newWidth:Int, newHeight:Int):Void {
		/*
		Background.width = newWidth;
		Background.height = newHeight;
		
		Game.resize (newWidth, newHeight);
		
		Footer.scaleX = Game.currentScale;
		Footer.scaleY = Game.currentScale;
		Footer.x = newWidth / 2 - Footer.width / 2;
		Footer.y = newHeight - Footer.height;
		*/
	}
	
	
	//private function stage_onResize (event:Event):Void {
		//
		//resize (stage.stageWidth, stage.stageHeight);
		//
	//}
}
