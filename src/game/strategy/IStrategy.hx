package game.strategy;

/**
 * @author vova
 */
interface IStrategy
{
	public function spin ():Void;
	private function changeIndex():Void;
}