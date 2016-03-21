package game.server.model;

//import game.server.model.IModel;

typedef SpinResponse = {
	public var data:Array < Array < Int >> ;
}


/**
 * ...
 * @author vova
 */
class SpinModel //implements IModel
{
	var response:SpinResponse;

	public function new(json:String)
	{
		//super();
		
		response = parse(json);
		
	}
	
	private function parse(json:String): SpinResponse
	{
		return haxe.Json.parse(json);
	}
	
}