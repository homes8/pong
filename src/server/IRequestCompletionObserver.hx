package server;


/**
 * @author Dmitry Velichkevich
 */
interface IRequestCompletionObserver {
    public function handleCompletion(response: IResponse): Void;
}
