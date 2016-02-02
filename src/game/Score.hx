package game;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.filters.BlurFilter;
import openfl.filters.DropShadowFilter;
import openfl.Assets;

/**
 * ...
 * @author vova
 */
class Score extends Sprite
{
	private var Score:TextField;

	private function new()
	{
		super();
		construct();
	}
	
	private function construct ():Void {
		var font = Assets.getFont ("font/FreebooterUpdated.ttf");
		var defaultFormat = new TextFormat (font.fontName, 60, 0xffffff);
		defaultFormat.align = TextFormatAlign.LEFT;
		
		Score = new TextField();
		
		Score.x = 0;
		//width =
		Score.width = 100;
		Score.y = 0;
		Score.selectable = false;
		Score.defaultTextFormat = defaultFormat;
		
		Score.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		
		Score.embedFonts = true;
		Score.text = "";
		addChild (Score);
	}
	
	public function text (text:String):Void {
		Score.text = text;
	}
}