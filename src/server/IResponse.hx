package server;


import haxe.io.Bytes;


/**
 * @author Dmitry Velichkevich
 */
interface IResponse {
    public function getUrl(): URL;

    public function getCode(): Int;

    public function getContentType(): String;

    public function getBody(): Dynamic;

    public function getRequest(): IRequest;

    public function getHeaders(): List<NetworkHeader>;

    public function isReady(): Bool;

    public function hasError(): Bool;

    public function getError(): Dynamic;
}
