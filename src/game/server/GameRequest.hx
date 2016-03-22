package game.server;

//import neko.vm.Loader;
import game.server.model.SpinModel;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import game.server.model.SpinModel;


/**
 * ...
 * @author vova
 */
class GameRequest
{
	private var loader:URLLoader;
	//private var loading:Bool;
	
	
	public function new()
	{
		
	}
	
	public function ss()
	{
		loader = new URLLoader();
		var myRequest:URLRequest = new URLRequest("http://pong.empty.by/spin.json");

		//wait for the load
		loader.addEventListener(Event.COMPLETE, onLoadComplete);
		loader.addEventListener(IOErrorEvent.IO_ERROR, onError);

		loader.load(myRequest);
	}
	
//	function onProgress(e:ProgressEvent):Void {
//		var percenLoaded:Float = loader.bytesLoaded / loader.bytesTotal;
//		trace(percentLoaded);
//	}
	
	function onError(e:IOErrorEvent) {
		trace("ioErrorHandler: " + e);
	}

	function onLoadComplete(e:Event) {
		trace(e);
		var data = new SpinModel(e.target.data);
		trace(data);
		loader.close();
	}
}