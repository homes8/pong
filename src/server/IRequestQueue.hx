package server;


import haxe.ds.StringMap;


enum ERequestMethod {
    GET;
    PUT;
    HEAD;
    POST;
    DELETE;
}


/**
 * @author Dmitry Velichkevich
 */
interface IRequestQueue {
    public function sendRequest(request: IRequest): Void;

    public function createRequest(url: String, ?contentType: String, ?method: ERequestMethod, ?parallel: Bool = true): IRequest;

    public function release(): Void;
}
