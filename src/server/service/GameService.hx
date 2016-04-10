package server.service;


import server.IRequest;
import server.IRequestQueue;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class GameService {
    private var requestQueue: IRequestQueue = null;


    public function new(requestQueue: IRequestQueue) {
        this.requestQueue = requestQueue;
    }

    public function spin(): Void {
        var spinRequest: IRequest = requestQueue.createRequest("http://pong.empty.by/spin.json");
		requestQueue.sendRequest(spinRequest);
    }
}
