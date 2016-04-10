package server;


/**
 * ...
 * @author Dmitry Velichkevich
 */
class NetworkHeader {
    private var header: String = null;
    private var value: Dynamic = null;


    public inline function new(header: String, value: Dynamic) {
        this.header = header;
        this.value = value;
    }

    public function getHeader(): String {
        return header;
    }

    public function getValue(): String {
        return value;
    }
}
