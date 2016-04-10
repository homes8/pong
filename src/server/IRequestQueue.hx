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
    public function sendRequest(request: IRequest): IResponse;

    public function createRequest(url: String, method: ERequestMethod = ERequestMethod.GET): IRequest;
}
