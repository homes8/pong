package server.cache;


/**
 * @author Dmitry Velichkevich
 */
interface ICache<ValueType> {
    public function getValue(var key: String): ValueType;

    public function putValue(var key: String, value: ValueType): void;
}
