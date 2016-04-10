package game.strategy;

/**
 * @author vova
 */
interface IStrategy
{
	public function spin():Void;
	public function start():Void;
	private function changeIndex():Void;
}