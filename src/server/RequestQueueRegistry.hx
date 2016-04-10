package server;


import haxe.ds.StringMap;
import haxe.Constraints.IMap;

import server.cache.ICache;
import server.http.HttpRequestQueue;


/**
 * ...
 * @author vova
 * @author Dmitry Velichkevich
 */
class RequestQueueRegistry {
    public static inline var PROTOCOL_DEFAULT: String = "http";


    var requestQueues: IMap<String, IRequestQueue> = new StringMap<IRequestQueue>();


    private static var instance: RequestQueueRegistry = null;


    inline function new() {
        requestQueues.set(PROTOCOL_DEFAULT, new HttpRequestQueue());
    }

    public function getQueue(protocol: String = PROTOCOL_DEFAULT) {
        if((null == protocol) || !requestQueues.exists(protocol.toLowerCase())) {
            return null;
        }
        return requestQueues.get(protocol.toLowerCase());
    }

    private function release(): Void {
        if(!requestQueues.iterator().hasNext()) {
            return;
        }
        var key: String = null;
        for(key in requestQueues.keys()) {
            cast(requestQueues.get(key), IRequestQueue).release();
        }
    }


    public static function getInstance(): RequestQueueRegistry {
        if(null == instance) {
            instance = new RequestQueueRegistry();
        }
        return instance;
    }

    public static function releaseInstance(): Void {
        if(null != instance) {
            instance.release();
        }
        instance = null;
    }
}
