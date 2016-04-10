package server.http;


import flash.events.Event;
import flash.net.URLLoader;
import openfl.utils.ByteArray;
import flash.events.IOErrorEvent;
import openfl.net.URLRequestHeader;
import flash.events.HTTPStatusEvent;
import flash.events.SecurityErrorEvent;
import server.IRetryPolicy;

import server.URL;
import server.INetwork;
import server.IRequest;
import server.IResponse;
import server.NetworkHeader;
import server.IRequestCompletionObserver;
import server.INetworkDataTransformer;
import server.NetworkDataTransformersRegistry;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class HttpResponse implements IResponse {
    private static inline var REQUEST_INCOMPLETE_CODE: Int = -1;

    private static inline var HTTP_HEADER_CONTENT_TYPE_LOWER_CASE: String = "content-type";


    private var network: INetwork;
    private var request: IRequest = null;

    private var contentType: String = null;

    private var ready: Bool = false;

    private var statusCode: Int = REQUEST_INCOMPLETE_CODE;
    private var error: Dynamic = null;
    private var responseData: Dynamic = null;
    private var cachedTransformedResponseData = null;

    private var headers: List<NetworkHeader> = new List<NetworkHeader>();


    public function new(network: INetwork, request: IRequest) {
        this.network = network;
        this.request = request;
    }

    public function getUrl(): URL {
        return (null != request) ? (request.getUrl()):(null);
    }

    public function getCode(): Int {
        if(!isReady()) {
            return REQUEST_INCOMPLETE_CODE;
        }
        return statusCode;
    }

    public function getContentType(): String {
        if(!isReady()) {
            return null;
        }
        return contentType;
    }

    public function getBody(): Dynamic {
        if(!isReady()) {
            return null;
        }
        if(null == cachedTransformedResponseData) {
            var registry: NetworkDataTransformersRegistry = NetworkDataTransformersRegistry.getInstance();
            var transformer: INetworkDataTransformer<Dynamic, Dynamic> = registry.getResponseTransformer(this);
            cachedTransformedResponseData = (null != transformer) ? (transformer.transform(responseData)):(responseData);
        }

        return cachedTransformedResponseData;
    }

    public function getRequest(): IRequest {
        return request;
    }

    public function getHeaders(): List<NetworkHeader> {
        if(!isReady()) {
            return null;
        }
        return headers;
    }

    public function isReady(): Bool {
        return ready;
    }

    public function hasError(): Bool {
        return null != error;
    }

    public function getError(): Dynamic {
        if(!isReady()) {
            return null;
        }
        return error;
    }

    private function riseReady(): Void {
        ready = true;
        if(request.getRequestCompletedObservers().length > 0) {
            var completionObserver: IRequestCompletionObserver = null;
            for(completionObserver in request.getRequestCompletedObservers()) {
                completionObserver.handleCompletion(this);
            }
        }
        network.release();
    }


    public function handleStatus(status: HTTPStatusEvent): Void {
        statusCode = status.status;
        if((null == status.responseHeaders) || (0 == status.responseHeaders.length)) {
            return;
        }

        headers.clear();
        var header: Dynamic = null;
        for(header in status.responseHeaders) {
            var converted: URLRequestHeader = cast(header, URLRequestHeader);
            headers.add(new NetworkHeader(converted.name, converted.value));
            if((null != converted.name) && (HTTP_HEADER_CONTENT_TYPE_LOWER_CASE == converted.name.toLowerCase())) {
                contentType = converted.value;
            }
        }
    }

    public function handleSecurityError(event: SecurityErrorEvent): Void {
        //error = event;
        //riseReady();
    }

    public function handleOpen(event: Event): Void {
        trace(event.target);
    }

    public function handleError(error: IOErrorEvent): Void {
        var retryPolicy: IRetryPolicy = (null != request) ? (request.getRetryPolicy()):(null);
        if((null != retryPolicy) && retryPolicy.retry()) {
            network.send(request);
            return;
        }
        this.error = error;
        riseReady();
    }

    public function handleLoadingCompleted(event: Event): Void {
        var converted: URLLoader = cast(event.target, URLLoader);
        responseData = converted.data;
        riseReady();
    }
}
