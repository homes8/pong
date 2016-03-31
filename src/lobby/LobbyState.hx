package lobby;

import flixel.FlxState;
//import openfl.display.Sprite;

/**
 * ...
 * @author vova
 */
class LobbyState extends FlxState
{

	public function new()
	{
		super.create();
		
		initialize();
		construct();
	}
	
	private function initialize ():Void {
		
		// read send request on server
		// when received data than call construct
	}
	
	private function construct ():Void {
		
	}
}