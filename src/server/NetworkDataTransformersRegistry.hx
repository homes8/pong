package server;


import haxe.ds.StringMap;
import haxe.Constraints.IMap;

import server.URL;
import server.INetworkDataTransformer;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class NetworkDataTransformersRegistry {
    private static inline var HEADER_DESCRIPTOR_DELIMITER: String = ";";


    static var instance: NetworkDataTransformersRegistry = null;


    private var requestTransformers: IMap<String, INetworkDataTransformer<Dynamic, Dynamic>>;
    private var responseTransformers: IMap<String, INetworkDataTransformer<Dynamic, Dynamic>>;


    function new() {
        requestTransformers = new StringMap<INetworkDataTransformer<Dynamic, Dynamic>>();
        responseTransformers = new StringMap<INetworkDataTransformer<Dynamic, Dynamic>>();
    }

    public function registerRequestTransformer(id: String, transformer: INetworkDataTransformer<Dynamic, Dynamic>): Void {
        if((null == id) || (null == transformer)) {
            return;
        }
        requestTransformers.set(id, transformer);
    }

    public function registerResponseTransformer(id: String, transformer: INetworkDataTransformer<Dynamic, Dynamic>): Void {
        if((null == id) || (null == transformer)) {
            return;
        }
        responseTransformers.set(id, transformer);
    }

    private function getKey(contentType: String, url: URL, transformers: IMap<String, INetworkDataTransformer<Dynamic, Dynamic>>): String {
        if(((null == contentType) || (0 == contentType.length)) && ((null == url) || (null == url.getService()) || (0 == url.getService().length))) {
            return null;
        }
        if((null == transformers) || (null == transformers.keys) || !transformers.keys().hasNext()) {
            return null;
        }
        var serviceName: String = url.getService();
        if((null != serviceName) && (serviceName.length > 0) && transformers.exists(serviceName)) {
            return serviceName;
        }
        if((null == contentType) || (0 == contentType.length)) {
            return null;
        }
        contentType = contentType.split(HEADER_DESCRIPTOR_DELIMITER).iterator().next();
        if(transformers.exists(contentType)) {
            return contentType;
        }
        return null;
    }

    public function getRequestTransformer(dataParameters: IRequest): INetworkDataTransformer<Dynamic, Dynamic> {
        if(null == dataParameters) {
            return null;
        }

        var key: String = getKey(dataParameters.getContentType(), dataParameters.getUrl(), requestTransformers);
        if(null == key) {
            return null;
        }

        return requestTransformers.get(key);
    }

    public function getResponseTransformer(dataParameters: IResponse): INetworkDataTransformer<Dynamic, Dynamic> {
        if(null == dataParameters) {
            return null;
        }

        var key: String = getKey(dataParameters.getContentType(), dataParameters.getUrl(), responseTransformers);
        if(null == key) {
            return null;
        }

        return responseTransformers.get(key);
    }


    public static function getInstance(): NetworkDataTransformersRegistry {
        if(null == instance) {
            instance = new NetworkDataTransformersRegistry();
        }
        return instance;
    }

    public static function releaseInstance(): Void {
        instance = null;
    }
}
