package server.http;


import server.IRequestCompletionObserver;
import server.IRetryPolicy;
import haxe.ds.StringMap;
import haxe.Constraints.IMap;
import server.NetworkDataTransformersRegistry;

import server.URL;
import server.IRequest;
import server.NetworkHeader;
import server.IRequestQueue;
import server.INetworkDataTransformer;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class HttpRequest implements IRequest {
    private static inline var HTTP_HEADER_CONTENT_TYPE_LOWER_CASE: String = "content-type";

    private static inline var HTTP_METHOD_DEFAULT: String = "GET";

    private static inline function HTTP_METHOD_ENUM_TO_STRING_MAPPING(): Map<ERequestMethod, String> {
        return [ERequestMethod.GET => HTTP_METHOD_DEFAULT, ERequestMethod.PUT => "PUT", ERequestMethod.POST => "POST", ERequestMethod.HEAD => "HEAD", ERequestMethod.DELETE => "DELETE"];
    }


    private var url: URL = null;
    private var method: ERequestMethod = ERequestMethod.GET;
    private var contentType: String;
    private var requestData: Dynamic;
    private var cachedTransformedData: Dynamic = null;
    private var retryPolicy: IRetryPolicy = null;
    private var headers: List<NetworkHeader> = new List<NetworkHeader>();
    private var completionObservers: List<IRequestCompletionObserver> = new List<IRequestCompletionObserver>();

    private var requestQueue: IRequestQueue = null;


    public function new(url: String, contentType: String, ?method: ERequestMethod) {
        this.url = new URL(url);
        this.method = method;
        this.contentType = contentType;
        addHeader("Access-Control-Allow-Origin", "*");
    }

    @override
    public function setRequestQueue(requestQueue: IRequestQueue): Void {
        this.requestQueue = requestQueue;
    }

    @override
    public function setRetryPolicy(retryPolicy: IRetryPolicy): Void {
        this.retryPolicy = retryPolicy;
    }

    @override
    public function getRetryPolicy(): IRetryPolicy {
        if(null == retryPolicy) {
            retryPolicy = new DefaultRetryPolicy();
        }
        return retryPolicy;
    }

    @override
    public function getUrl(): URL {
        return url;
    }

    @override
    public function getCacheKey(): String {
        return (null != url) ? (url.getSource()):(null);
    }

    @override
    public function setCacheEntry(): Void {
        
    }

    @override
    public function addHeader(header: String, value: String): Void {
        if((null == header) || (0 == header.length)) {
            return;
        }

        if(HTTP_HEADER_CONTENT_TYPE_LOWER_CASE == header.toLowerCase()) {
            contentType = value;
        }

        headers.add(new NetworkHeader(header, value));
    }

    @override
    public function setHeaders(headers: List<NetworkHeader>): Void {
        this.headers = headers;
    }

    @override
    public function getHeaders(): List<NetworkHeader> {
        return headers;
    }

    @override
    public inline function getMethod(): String {
        return (null != method) ? (HTTP_METHOD_ENUM_TO_STRING_MAPPING()[method]):(HTTP_METHOD_DEFAULT);
    }

    @override
    public function getContentType(): String {
        return contentType;
    }

    @override
    public function getData(): Dynamic {
        if(null == cachedTransformedData) {
            var registry: NetworkDataTransformersRegistry = NetworkDataTransformersRegistry.getInstance();
            var transformer: INetworkDataTransformer<Dynamic, Dynamic> = registry.getRequestTransformer(this);
            cachedTransformedData = (null != transformer) ? (transformer.transform(requestData)):(requestData);
        }

        return cachedTransformedData;
    }

    @override
    public function setData(data: Dynamic): Void {
        requestData = data;
    }

    @override
    public function addRequestCompletionObserver(observer: IRequestCompletionObserver): Void {
		if(null != observer) {
			completionObservers.add(observer);
		}
    }

    @override
    public function getRequestCompletedObservers(): List<IRequestCompletionObserver> {
        return completionObservers;
    }
}
