package server;


/**
 * @author Dmitry Velichkevich
 */
interface INetworkDataTransformer<DataType, ResultType> {
    public function transform(data: DataType): ResultType;
}
