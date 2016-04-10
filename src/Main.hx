package;


import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.display.Sprite;
//import openfl.Lib;
//import openfl.events.Event;


//import lobby.LobbyStage;
import game.GameState;
import lobby.LobbyState;

//
// For HttpNetwork and IRequestQueue test
//
/*
import server.URL;
import server.IRequest;
import server.IResponse;
import server.NetworkHeader;
import server.IRequestQueue;
import server.http.HttpRequest;
import server.http.HttpNetwork;
import server.RequestQueueRegistry;
import server.IRequestCompletionObserver;
*/

import server.NetworkDataTransformersRegistry;
import server.http.data.JsonToStringTransformer;
import server.http.data.ByteArrayDataToJsonTransformer;


//
// For HttpNetwork and IRequestQueue test
//
/*
class TestObserver implements IRequestCompletionObserver {
	private var number: Int = 0;


	public inline function new(?number: Int = 0) {
		this.number = number;
	}

	public function handleCompletion(response: IResponse): Void {
		trace(">>>>>>>>>>>>>>>>>>>>>> RESPONSE #" + Std.string(number));
		if(response.hasError()) {
			trace("Error occured during requesting '" + response.getRequest().getUrl().getSource() + "' (HTTP Status: " + Std.string(response.getCode()) + "): " + Std.string(response.getError()));
			return;
		}
		trace("Requested URL: " + response.getRequest().getUrl().getSource());
		trace("HTTP Status: " + Std.string(response.getCode()));
		trace("Response Headers:");
		var header: NetworkHeader = null;
		for(header in response.getHeaders()) {
			trace("    " + header.getHeader() + ": " + header.getValue());
		}
		trace("Response Body:");
		var body: Dynamic = response.getBody();
		trace("   Response Body Class Name: " + Type.getClassName(Type.getClass(body)));
		trace("   Content: " + Std.string(body));
	}
}
*/


/**
 * ...
 * @author vova
 */
class Main extends Sprite
{
	//private var Game:GameStage;
	
	public function new()
	{
		super();

        var registry: NetworkDataTransformersRegistry = NetworkDataTransformersRegistry.getInstance();
        registry.registerRequestTransformer("application/json", new JsonToStringTransformer());
        registry.registerResponseTransformer("application/json", new ByteArrayDataToJsonTransformer());
		//
		// For HttpNetwork and IRequestQueue test 
		//
		//registry.registerResponseTransformer("text/plain", new ByteArrayDataToJsonTransformer());

		//
		// HttpRequest test
		//
		//var httpRequest: IRequest = new HttpRequest("http://hC.ind/path/to/the/service?key=fucking&value=haxe", "application/json");
		//httpRequest.addHeader("Content-Type", "application/json;charset=utf-8");
		//httpRequest.setData(new NetworkHeader("Content-Length", "65535"));
		//trace(httpRequest.getUrl().getQuery());
		//trace(httpRequest.getContentType());
		//trace(httpRequest.getData());

		//
		// HttpNetwork and HttpResponse test
		//
		//var network: HttpNetwork = new HttpNetwork();
		//var request: IRequest = new HttpRequest("https://raw.githubusercontent.com/huit/AWS-LoggingAndMonitoring/master/Template_topics.json", "application/json");
		//request.addRequestCompletionObserver(new TestObserver());
		//var response: IResponse = network.send(request);
		
		//
		// RequestQueue and HttpRequestQueue test
		// Set the last parameter in queue.createRequest() to 'true' or 'false' to test sequent and parallel execution respectively
		//
		//var queue: IRequestQueue = RequestQueueRegistry.getInstance().getQueue();
		//var queueRequest: IRequest = queue.createRequest("https://raw.githubusercontent.com/huit/AWS-LoggingAndMonitoring/master/Template_topics.json", "application/json", ERequestMethod.GET, true);
		//queueRequest.addRequestCompletionObserver(new TestObserver(1));
		//queue.sendRequest(queueRequest);
		//var i: Int = 0;
		//for(i in 0...19) {
		//	queueRequest = queue.createRequest("https://raw.githubusercontent.com/huit/AWS-LoggingAndMonitoring/master/Template_topics.json");
		//	queueRequest.addRequestCompletionObserver(new TestObserver(i + 2));
		//	queue.sendRequest(queueRequest);
		//}

		addChild(new FlxGame(800, 600, LobbyState));

		//initialize ();
		//construct ();
		
		//resize (stage.stageWidth, stage.stageHeight);
		//stage.addEventListener (Event.RESIZE, stage_onResize);
	}
	
	//private function initialize ():Void {
	//	Game = new GameStage ();
	//}
	
	//private function construct ():Void {
	//	addChild (Game);
	//}
	
	//private function resize (newWidth:Int, newHeight:Int):Void {
		/*
		Background.width = newWidth;
		Background.height = newHeight;
		
		Game.resize (newWidth, newHeight);
		
		Footer.scaleX = Game.currentScale;
		Footer.scaleY = Game.currentScale;
		Footer.x = newWidth / 2 - Footer.width / 2;
		Footer.y = newHeight - Footer.height;
		*/
	//}
	
	
	//private function stage_onResize (event:Event):Void {
		//
		//resize (stage.stageWidth, stage.stageHeight);
		//
	//}
}
