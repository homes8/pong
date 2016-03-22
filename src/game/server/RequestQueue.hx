package game.server;

import game.cache.MemoryCache;

/**
 * ...
 * @author vova
 */
class RequestQueue
{
	var mCache:MemoryCache
	var mNetwork:Network;

	public function new(cache:MemoryCache, network:Network)
	{
		mCache = cache;
		mNetwork = network;
	}
	
	public function add()
	{
		
	}
}