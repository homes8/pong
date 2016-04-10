package server.http;


import flash.net.URLLoader;
import openfl.errors.Error;
import openfl.events.Event;
import openfl.net.URLRequest;
import flash.events.IOErrorEvent;
import openfl.net.URLRequestHeader;
import openfl.events.HTTPStatusEvent;
import openfl.net.URLLoaderDataFormat;
import flash.events.SecurityErrorEvent;

import server.INetwork;
import server.IRequest;
import server.IResponse;
import server.NetworkHeader;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class HttpNetwork implements INetwork {
    private var urlRequest: URLRequest = null;
    private var urlLoader: URLLoader = null;

    private var loaderReleased = false;


    public function new() {
        
    }

    public function send(request: IRequest): IResponse {
        if((null != urlRequest) && (request.getUrl().getSource() != urlRequest.url)) {
            throw new Error("Invalid request! HttpNetwork was initialized with URL = '" + urlRequest.url + "', current request URL = '" + request.getUrl().getSource() + "'. Create another HttpNetwork for the new URL!");
        }

        var result: HttpResponse = null;
        if((null == urlRequest) || (null == urlLoader)) {
            urlLoader = new URLLoader();
            urlRequest = new URLRequest(request.getUrl().getSource());
            var header: NetworkHeader = null;
            for(header in request.getHeaders()) {
                urlRequest.requestHeaders.push(new URLRequestHeader(header.getHeader(), Std.string(header.getValue())));
            }
            urlRequest.method = request.getMethod();
            urlRequest.contentType = request.getContentType();
            urlRequest.data = request.getData();

            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;

            result = new HttpResponse(this, request);
            urlLoader.addEventListener(Event.OPEN, result.handleOpen);
            urlLoader.addEventListener(Event.COMPLETE, result.handleLoadingCompleted);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR, result.handleError);
            urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, result.handleStatus);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, result.handleSecurityError);
        } else {
            release();
        }

        loaderReleased = false;
        urlLoader.load(urlRequest);

        return result;
    }

    public function release(): Void {
        if(loaderReleased) {
            return;
        }
        loaderReleased = true;
        urlLoader.close();
    }
}
