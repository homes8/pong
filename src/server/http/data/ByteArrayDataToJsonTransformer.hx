package server.http.data;


import haxe.Json;
//import openfl.utils.ByteArrayData;

import server.INetworkDataTransformer;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class ByteArrayDataToJsonTransformer implements INetworkDataTransformer<Dynamic, Dynamic> {
    public function new() {
    }

    public function transform(data: Dynamic): Dynamic {
        if((null == data)) { //  || (0 == data.)
            return null;
        }
        return Json.parse(Std.string(data));
    }
}
