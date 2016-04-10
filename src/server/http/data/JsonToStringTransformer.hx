package server.http.data;


import haxe.Json;

import server.INetworkDataTransformer;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class JsonToStringTransformer implements INetworkDataTransformer<Dynamic, String> {
    public function new() {
    }

    public function transform(data: Dynamic): String {
        if((null == data) || !Reflect.isObject(data)) {
            return "";
        }
        return Json.stringify(data);
    }
}
