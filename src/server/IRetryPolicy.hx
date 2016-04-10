package server;


/**
 * @author Dmitry Velichkevich
 */
interface IRetryPolicy {
    public function retry(): Bool;
}
