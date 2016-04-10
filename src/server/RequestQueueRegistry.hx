package server;


import server.cache.ICache;


/**
 * ...
 * @author vova
 */
class RequestQueueRegistry
{
	var mCache: MemoryCache
	var mNetwork: INetwork;

	public function new(cache: ICache, network: INetwork) {
		mCache = cache;
		mNetwork = network;
	}
	
	public function add() {
		
	}
}