package server.cache;


/**
 * @author Dmitry Velichkevich
 */
interface ICache<ValueType> {
    public function getValue(key: String): ValueType;

    public function putValue(key: String, value: ValueType): Void;
}
