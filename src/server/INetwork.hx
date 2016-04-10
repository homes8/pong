package server;


/**
 * ...
 * @author vova
 * @author Dmitry Velichkevich
 */
interface INetwork {
    public function release(): Void;

    public function send(request: IRequest): IResponse;
}
